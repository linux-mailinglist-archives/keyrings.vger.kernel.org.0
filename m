Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614B42BB348
	for <lists+keyrings@lfdr.de>; Fri, 20 Nov 2020 19:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbgKTScQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 20 Nov 2020 13:32:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:51354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730672AbgKTScP (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 20 Nov 2020 13:32:15 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6619E2415B;
        Fri, 20 Nov 2020 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897135;
        bh=1LAVetlu7/DoDuj4EupAJxDLxzgWcayGBo/n+klWpis=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QOf0/sj6JF2ntImYXMfUidJDKesx/LrS4voEFH4J0mbMtpJICBZPYFgS19LUpLmrO
         I8azen3eSM+Fbq0qCDjsGkQzb3XcWhgOzkzKrnRcqEOiPGm44UmEbdSG1P61JrXY2n
         HmiNHE56Hi7Aq5iG225IaTidmidJQ59MK+kt3g1U=
Date:   Fri, 20 Nov 2020 12:32:20 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 052/141] security: keys: Fix fall-through warnings for Clang
Message-ID: <412e11590b667712c03c1e4d4c7573fda3a4b1cb.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 security/keys/process_keys.c | 1 +
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
-- 
2.27.0

