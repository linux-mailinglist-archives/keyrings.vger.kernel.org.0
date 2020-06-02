Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A753A1EBFF7
	for <lists+keyrings@lfdr.de>; Tue,  2 Jun 2020 18:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgFBQ2O (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 2 Jun 2020 12:28:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40612 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727113AbgFBQ2N (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 2 Jun 2020 12:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591115291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=tyM2BxulV0HOmx/+JvhObFxHlx66m4jLAl+vy1rTPos=;
        b=AvW55yhUADscI8R2bGnGrPB7LJI+B+SGFHQ+UVFPpEJ8+Lzo26IaHTOu50JDqKM9vNXO8G
        VKrWG92ICsCl8btb9PX/K6CI8HW2TiurDWlr+HhP+rjHfosmmGbTXIlpq9kd6lmsYGmfun
        e9k40hCpqkyQJGcfzUxWw3Z7rr5EgWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-kG2CUa-4OCCPoUv3zDEIHA-1; Tue, 02 Jun 2020 12:28:06 -0400
X-MC-Unique: kG2CUa-4OCCPoUv3zDEIHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C599800053;
        Tue,  2 Jun 2020 16:28:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5C71D6116F;
        Tue,  2 Jun 2020 16:28:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        mathstuf@gmail.com, gustavoars@kernel.org, Jason@zx2c4.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [GIT PULL] keys: Changes for 5.8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1509350.1591115280.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 02 Jun 2020 17:28:00 +0100
Message-ID: <1509351.1591115280@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Linus,

Could you pull these keyrings fixes please?

 (1) Fix a documentation warning.

 (2) Replace a [0] array with [].

 (3) Make the big_key key type use ChaCha20Poly1305 and use the crypto
     algorithm directly rather than going through the crypto layer.

 (4) Implement the update op for the big_key type.

Thanks,
David
---
The following changes since commit 6a8b55ed4056ea5559ebe4f6a4b247f627870d4=
c:

  Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags=
/keys-next-20200602

for you to fetch changes up to b6f61c31464940513ef4eccb3a030a405b4256d6:

  keys: Implement update for the big_key type (2020-06-02 17:22:31 +0100)

----------------------------------------------------------------
Keyrings changes

----------------------------------------------------------------
Ben Boeckel (1):
      Documentation: security: core.rst: add missing argument

David Howells (1):
      keys: Implement update for the big_key type

Gustavo A. R. Silva (1):
      KEYS: Replace zero-length array with flexible-array

Jason A. Donenfeld (1):
      security/keys: rewrite big_key crypto to use library interface

 Documentation/security/keys/core.rst |   8 +-
 include/keys/big_key-type.h          |   1 +
 include/keys/user-type.h             |   2 +-
 security/keys/Kconfig                |   4 +-
 security/keys/big_key.c              | 257 +++++++-----------------------=
-----
 5 files changed, 60 insertions(+), 212 deletions(-)

