Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1ED32D41DE
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgLIMQO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48748 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728637AbgLIMQO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2LpJE5rOdV4hMtk26RhHDvVV+1Wfjn8DBqwcbIRmPfk=;
        b=aRj7iWhJZ9IScNVJ2UJ/dR7EUXdMxFmI2JcWXWbpRbtbXU6GJdu5ht5ijnWpLIPdaJv18l
        bVOseYnVAb2bWlrcKr0enI9j6Eo+BpxCVlPc5YQxLlBvXPkfTuDWhaZ2Gz5Ck+OeUfLR5K
        UsIysQYl373qapjD1RlG/JrP0OhEkvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-hEOsSayFOHSUkrLNq_OsJw-1; Wed, 09 Dec 2020 07:14:42 -0500
X-MC-Unique: hEOsSayFOHSUkrLNq_OsJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C739A873155;
        Wed,  9 Dec 2020 12:14:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AD6CF6E41C;
        Wed,  9 Dec 2020 12:14:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 01/18] security: keys: Fix fall-through warnings for Clang
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:14:35 +0000
Message-ID: <160751607579.1238376.13809756676182520888.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Gustavo A. R. Silva <gustavoars@kernel.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---

 security/keys/process_keys.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index 1fe8b934f656..e3d79a7b6db6 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -783,6 +783,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 				if (need_perm != KEY_AUTHTOKEN_OVERRIDE &&
 				    need_perm != KEY_DEFER_PERM_CHECK)
 					goto invalid_key;
+				break;
 			case 0:
 				break;
 			}


