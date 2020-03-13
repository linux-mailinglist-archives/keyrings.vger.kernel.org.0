Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500A6184A79
	for <lists+keyrings@lfdr.de>; Fri, 13 Mar 2020 16:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgCMPV3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 13 Mar 2020 11:21:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46432 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726534AbgCMPV3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 13 Mar 2020 11:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584112888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=PNyjHm+IZ1fvNEx5HMZqidw/J156+wuo7jGfMRKY4Vs=;
        b=WF8FLIJKWv/vKm+YOyfldSYv9aXAViQKDgagKONhRdA/BRoZWDl5NlRARGlkDIUXuj5HXk
        bV1isMtDqzhshadAlfm9BU8ej4YO6u+7riYgd37e00bk+Y3ciDjJRAo7NxIy83iKquxILw
        nog94lM4NEifVPkqKMG3V380Aw6IjKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-7lRX4n-MPCaBRrVDLTE9Ag-1; Fri, 13 Mar 2020 11:21:25 -0400
X-MC-Unique: 7lRX4n-MPCaBRrVDLTE9Ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 879888026B1;
        Fri, 13 Mar 2020 15:21:23 +0000 (UTC)
Received: from llong.com (ovpn-125-21.rdu2.redhat.com [10.10.125.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B39A91D61;
        Fri, 13 Mar 2020 15:21:18 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        Sumit Garg <sumit.garg@linaro.org>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Eric Biggers <ebiggers@google.com>,
        Chris von Recklinghausen <crecklin@redhat.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v3 0/3] KEYS: Read keys to internal buffer & then copy to userspace
Date:   Fri, 13 Mar 2020 11:20:59 -0400
Message-Id: <20200313152102.1707-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

v3:
 - Reorganize the keyctl_read_key() code to make it more readable as
   suggested by Jarkko Sakkinen.
 - Add patch 3 to use kvmalloc() for safer large buffer allocation as
   suggested by David Howells.

v2:
 - Handle NULL buffer and buflen properly in patch 1.
 - Fix a bug in big_key.c.
 - Add patch 2 to handle arbitrary large user-supplied buflen.

The current security key read methods are called with the key semaphore
held.  The methods then copy out the key data to userspace which is
subjected to page fault and may acquire the mmap semaphore. That can
result in circular lock dependency and hence a chance to get into
deadlock.

To avoid such a deadlock, an internal buffer is now allocated for getting
out the necessary data first. After releasing the key semaphore, the
key data are then copied out to userspace sidestepping the circular
lock dependency.

The keyutils test suite was run and the test passed with these patchset
applied without any falure.

Waiman Long (3):
  KEYS: Don't write out to userspace while holding key semaphore
  KEYS: Avoid false positive ENOMEM error on key read
  KEYS: Use kvmalloc() to better handle large buffer allocation

 include/linux/key-type.h                  |  2 +-
 security/keys/big_key.c                   | 11 ++-
 security/keys/encrypted-keys/encrypted.c  |  7 +-
 security/keys/internal.h                  | 14 ++++
 security/keys/keyctl.c                    | 87 ++++++++++++++++++++---
 security/keys/keyring.c                   |  6 +-
 security/keys/request_key_auth.c          |  7 +-
 security/keys/trusted-keys/trusted_tpm1.c | 14 +---
 security/keys/user_defined.c              |  5 +-
 9 files changed, 107 insertions(+), 46 deletions(-)

-- 
2.18.1

