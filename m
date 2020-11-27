Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAA62C6A14
	for <lists+keyrings@lfdr.de>; Fri, 27 Nov 2020 17:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgK0Qqa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 27 Nov 2020 11:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731803AbgK0Qqa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 27 Nov 2020 11:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606495589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aHzSkHSzjoS+gFz+yV6eFCrIuBgpftRSDaDJB/PyNOc=;
        b=DxTaEryNZqlAUkD5SmXr0GpGJuG0eD8rqzpPbzFDlxezsTri2uxDKWqoANIVSrA0dplWCr
        jtq9upw8P0O+JSVuo8whRESMoAyAlfcL7JeeibRuWsJsJdFsnDvkBGgWibjw6w1bVmNqZM
        tis7iF102sGme3maE6q7AK5PlsU2cUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-8Kax5rUkP7uqKzhcCSVRvg-1; Fri, 27 Nov 2020 11:46:26 -0500
X-MC-Unique: 8Kax5rUkP7uqKzhcCSVRvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D6E107ACF9;
        Fri, 27 Nov 2020 16:46:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-159.rdu2.redhat.com [10.10.112.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C07E89CA0;
        Fri, 27 Nov 2020 16:46:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 8/9] crypto: asymmetric_keys: fix some comments in
 pkcs7_parser.h
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 27 Nov 2020 16:46:23 +0000
Message-ID: <160649558391.2744658.6652084516839724811.stgit@warthog.procyon.org.uk>
In-Reply-To: <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
References: <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop the doubled word "the" in a comment.
Change "THis" to "This".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
---

 crypto/asymmetric_keys/pkcs7_parser.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_parser.h b/crypto/asymmetric_keys/pkcs7_parser.h
index 6565fdc2d4ca..e17f7ce4fb43 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.h
+++ b/crypto/asymmetric_keys/pkcs7_parser.h
@@ -41,10 +41,9 @@ struct pkcs7_signed_info {
 	 *
 	 * This contains the generated digest of _either_ the Content Data or
 	 * the Authenticated Attributes [RFC2315 9.3].  If the latter, one of
-	 * the attributes contains the digest of the the Content Data within
-	 * it.
+	 * the attributes contains the digest of the Content Data within it.
 	 *
-	 * THis also contains the issuing cert serial number and issuer's name
+	 * This also contains the issuing cert serial number and issuer's name
 	 * [PKCS#7 or CMS ver 1] or issuing cert's SKID [CMS ver 3].
 	 */
 	struct public_key_signature *sig;


