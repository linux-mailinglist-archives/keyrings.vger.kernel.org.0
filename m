Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1062D41E9
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgLIMQo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:16:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731415AbgLIMQi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2hCEY4/SQPzDg3IIM7GlZ/Meflenf1/Y7AL3ZB5FbPk=;
        b=iNoWeHg0uKAzSZdH7gftwIkBTArR8GzCVacyGTXFLyj5dCzzSf76JKs1cnbjFw/QJldjVS
        ECXH66NP4CpcZ707Xb8a9c0Y6wDy6V/SJ2ftLJE7XyOkUAOMXOmBXRNrlO/NWd+r5JHNFz
        yyGl6+aQlnzVZCNtEGmVWfY9cuR2jjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-eJsGjwiCOGCpuaN_U1OShA-1; Wed, 09 Dec 2020 07:15:07 -0500
X-MC-Unique: eJsGjwiCOGCpuaN_U1OShA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E560801AE6;
        Wed,  9 Dec 2020 12:15:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8C55C1D0;
        Wed,  9 Dec 2020 12:15:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 05/18] KEYS: asymmetric: Fix kerneldoc
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ben Boeckel <mathstuf@gmail.com>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:15:03 +0000
Message-ID: <160751610385.1238376.13063844632857670423.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Fix W=1 compile warnings (invalid kerneldoc):

    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_1' description in 'asymmetric_key_id_same'
    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_2' description in 'asymmetric_key_id_same'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Ben Boeckel <mathstuf@gmail.com>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
---

 crypto/asymmetric_keys/asymmetric_type.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 33e77d846caa..ad8af3d70ac0 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -152,7 +152,8 @@ EXPORT_SYMBOL_GPL(asymmetric_key_generate_id);
 
 /**
  * asymmetric_key_id_same - Return true if two asymmetric keys IDs are the same.
- * @kid_1, @kid_2: The key IDs to compare
+ * @kid1: The key ID to compare
+ * @kid2: The key ID to compare
  */
 bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
 			    const struct asymmetric_key_id *kid2)
@@ -168,7 +169,8 @@ EXPORT_SYMBOL_GPL(asymmetric_key_id_same);
 /**
  * asymmetric_key_id_partial - Return true if two asymmetric keys IDs
  * partially match
- * @kid_1, @kid_2: The key IDs to compare
+ * @kid1: The key ID to compare
+ * @kid2: The key ID to compare
  */
 bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
 			       const struct asymmetric_key_id *kid2)


