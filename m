Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA7F2D420E
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731275AbgLIMQc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:16:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51741 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731391AbgLIMQ2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YwmNy2yecVSpA3zuuQKT7O6PCaKtPmRiW5EIYH3QEW8=;
        b=K6oG+T0a926j2IErMtTuz1pIiPlQGzuxdlDaZLkSF7n6qAUCvAvIx2DoX/aZJg63dCzQGI
        5dWgJxoTgHAA+7Kg1sTT8Bsp887Zl56gPLwPdGOFW82VmkOHeXDzB0ignl3VKbagyPIolS
        jKAtmbatQXc1CHxQdovH/kwgRUcAwRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-GeElnHFXPGuvzElqb4d5IA-1; Wed, 09 Dec 2020 07:14:59 -0500
X-MC-Unique: GeElnHFXPGuvzElqb4d5IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A136C801ABA;
        Wed,  9 Dec 2020 12:14:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9EEE60BF3;
        Wed,  9 Dec 2020 12:14:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 04/18] security/keys: use kvfree_sensitive()
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Denis Efremov <efremov@linux.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:14:57 +0000
Message-ID: <160751609699.1238376.10901466590541653794.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Denis Efremov <efremov@linux.com>

Use kvfree_sensitive() instead of open-coding it.

Signed-off-by: Denis Efremov <efremov@linux.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---

 security/keys/big_key.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 691347dea3c1..d17e5f09eeb8 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -121,8 +121,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 		*path = file->f_path;
 		path_get(path);
 		fput(file);
-		memzero_explicit(buf, enclen);
-		kvfree(buf);
+		kvfree_sensitive(buf, enclen);
 	} else {
 		/* Just store the data in a buffer */
 		void *data = kmalloc(datalen, GFP_KERNEL);
@@ -140,8 +139,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 err_enckey:
 	kfree_sensitive(enckey);
 error:
-	memzero_explicit(buf, enclen);
-	kvfree(buf);
+	kvfree_sensitive(buf, enclen);
 	return ret;
 }
 
@@ -273,8 +271,7 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
 err_fput:
 		fput(file);
 error:
-		memzero_explicit(buf, enclen);
-		kvfree(buf);
+		kvfree_sensitive(buf, enclen);
 	} else {
 		ret = datalen;
 		memcpy(buffer, key->payload.data[big_key_data], datalen);


