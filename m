Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB472D41FA
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731595AbgLIMSR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54653 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731583AbgLIMSK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MDkz6Y28a4vIF46tWhYsBBkipwfVp+4fWxmrdykPSRI=;
        b=deibfM8UPrfRY41yzlnl8LvfAccGaK8xhyRb/bqOuFMrwv/LY5E/PS+QvpPLmdkoIM8Ot1
        oiReEhrpkHYaPCDtiPkgbsEpoKHOl2lIv8D1VZcpGdwSBkejxxAQmrLQ1RHvOBot0esIeB
        6P/EA2FU8bX7LfsFL2DGIxjXIvbSLd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-I0y9m8RhNdek7Uv8Gu22FA-1; Wed, 09 Dec 2020 07:16:40 -0500
X-MC-Unique: I0y9m8RhNdek7Uv8Gu22FA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578868BB3FF;
        Wed,  9 Dec 2020 12:16:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3311A5DA98;
        Wed,  9 Dec 2020 12:16:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 15/18] certs: Fix blacklisted hexadecimal hash string check
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:16:21 +0000
Message-ID: <160751618139.1238376.15173994145507633358.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

When looking for a blacklisted hash, bin2hex() is used to transform a
binary hash to an ascii (lowercase) hexadecimal string.  This string is
then search for in the description of the keys from the blacklist
keyring.  When adding a key to the blacklist keyring,
blacklist_vet_description() checks the hash prefix and the hexadecimal
string, but not that this string is lowercase.  It is then valid to set
hashes with uppercase hexadecimal, which will be silently ignored by the
kernel.

Add an additional check to blacklist_vet_description() to check that
hexadecimal strings are in lowercase.

Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---

 certs/blacklist.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 2719fb2fbc1c..a888b934a1cd 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -37,7 +37,7 @@ static int blacklist_vet_description(const char *desc)
 found_colon:
 	desc++;
 	for (; *desc; desc++) {
-		if (!isxdigit(*desc))
+		if (!isxdigit(*desc) || isupper(*desc))
 			return -EINVAL;
 		n++;
 	}


