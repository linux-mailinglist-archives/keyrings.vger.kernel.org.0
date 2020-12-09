Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDAA2D41F2
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731475AbgLIMRZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58650 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731534AbgLIMRY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vewwtXxJtD28dxpSxT0QfL5oq5dwmyIjTJHGwncoaiU=;
        b=Eb2mQMnkdblxzkZu9pNpyAg/SZnHP+6NMHUiU3nutjNdiFqMgYtNxZ4u63iCi6MEfcltUP
        FDhl3WwXU+UDemhQnCYFV84Dixhhh8rRZd0Qu8yunYxUAV1+Kyiaag1pnZum6xQUPDHq9o
        Nmllfmd2F782ApRwtfHDGD5bfzw3/IU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-3jflfmXYOai4h_rnOWIOsg-1; Wed, 09 Dec 2020 07:15:53 -0500
X-MC-Unique: 3jflfmXYOai4h_rnOWIOsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F6A31800D42;
        Wed,  9 Dec 2020 12:15:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6CE4071CA7;
        Wed,  9 Dec 2020 12:15:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 11/18] crypto: pkcs7: Use match_string() helper to simplify
 the code
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     YueHaibing <yuehaibing@huawei.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:15:48 +0000
Message-ID: <160751614848.1238376.4757193989177203825.stgit@warthog.procyon.org.uk>
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

From: YueHaibing <yuehaibing@huawei.com>

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 crypto/asymmetric_keys/pkcs7_verify.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index ce49820caa97..0b4d07aa8811 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -141,11 +141,10 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	*buf = sinfo->sig->digest;
 	*len = sinfo->sig->digest_size;
 
-	for (i = 0; i < HASH_ALGO__LAST; i++)
-		if (!strcmp(hash_algo_name[i], sinfo->sig->hash_algo)) {
-			*hash_algo = i;
-			break;
-		}
+	i = match_string(hash_algo_name, HASH_ALGO__LAST,
+			 sinfo->sig->hash_algo);
+	if (i >= 0)
+		*hash_algo = i;
 
 	return 0;
 }


