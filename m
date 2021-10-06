Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657C5424614
	for <lists+keyrings@lfdr.de>; Wed,  6 Oct 2021 20:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbhJFSaT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Oct 2021 14:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238130AbhJFSaS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Oct 2021 14:30:18 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E532C061746
        for <keyrings@vger.kernel.org>; Wed,  6 Oct 2021 11:28:26 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k23-20020a17090a591700b001976d2db364so3078338pji.2
        for <keyrings@vger.kernel.org>; Wed, 06 Oct 2021 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=mfMvoR5M60UyKlwNvv1SHxgGWg/yiyFYDDxvXrr4gK0=;
        b=FnGuXVZmEG93cx7avQERfT5Mcx/D2uU7/1KB/GWGGcyLuheTSz7toEX7SRqDkem446
         SvYTgTMU1aLKbkiysxL2DvvvjTbGqha3D3eClTKawCJtmdJUI362vr6A4pDD1RdqpWuA
         YT0lYPPqCFI3+iZZZDU6aTVjY6okOEQwbG5kLj7rAgoCE628qFQvtHWc98KRjMU9ZoO+
         yXEISrGtwnBCzt6gkg0B+N1JgcNfa94yvQBr0uLiKUGalIFUHLviTre2adj3MI6vq6dU
         01U4D2ewnTZnvqfCuTyPMivWwgffhavSM7AVI4s4amuRLTCZC9L1Tl31MFgsuue2+YcX
         CTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=mfMvoR5M60UyKlwNvv1SHxgGWg/yiyFYDDxvXrr4gK0=;
        b=kxl6xMbIi0jjaWshFvLzsYVT3ZpytI/OAozP9IFstL/4jx5u6EzQC+HgwzmSrS49lh
         ROXLkgg2O7XC9gEg85q25XvIu4HYuIhAnzzGmJ7ikKnDP/lpmEZtJLodpmW415jgMWbi
         lo3i0LlICwdmUryiXHMBfPl8+vciLraRvvVfQ/gTnEB4ZKRpinlnN2wZWiaqwHiSXn1n
         +0+z3NI0fr5XZhTNswgh0256VbEG9u8II8vba87IsEq99SHR2vIQv7fKzTqb7YEyzIVC
         +T6Yce+7xc1GsRL6zYdt1C8Ieuo++oMxjrEgObGHW8cF4UgvRdgQRzWjr1hnQLEHqic4
         86wQ==
X-Gm-Message-State: AOAM532b/0d9IvMbjbS+tKQLeQaJzw/xJaYdL1zHILAEXUBtJ7yTnLFP
        BeyaLGTGHfaqmAeHlr5VUdECFZXHoz3BnA==
X-Google-Smtp-Source: ABdhPJwj5Opm9lHnJPI7yQ/WDxmM6y0OzO7QwfDaSKcG+PcQamCFBpJd+rLcm+i3jMXLuBNg9IoUpQ==
X-Received: by 2002:a17:90a:a386:: with SMTP id x6mr202106pjp.56.1633544905792;
        Wed, 06 Oct 2021 11:28:25 -0700 (PDT)
Received: from devvm312.ftw0.facebook.com ([2620:10d:c090:400::5:3a14])
        by smtp.gmail.com with ESMTPSA id y9sm21294025pfm.129.2021.10.06.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:28:25 -0700 (PDT)
Date:   Wed, 6 Oct 2021 11:28:22 -0700
From:   Sergei Iudin <tsipa740@gmail.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org,
        kernel-team@fb.com
Subject: [PATCH] MODSIGN: Fix handling CMS_final return code
Message-ID: <YV3qxiznqGoOyIUQ@devvm312.ftw0.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

CMS finalisation for signing kernel modules may fail without reporting a
real error which will lead to appending an empty signature [0]
which could end up with unbootable or barely bootable kernel if
CONFIG_MODULE_SIG_FORCE is set, and this would not be detected by build
scripts or other automation as exit code of sign-file would be 0.

Check the return code of CMS_final() with regards to documentation [1]
which says that cmd_final always returns 0 or 1 where 0 is failure,
while current code expecting it to return -1 in case of error.

[0] https://pastebin.com/DY7SP7b8
[1] https://www.openssl.org/docs/man1.1.0/man3/CMS_final.html

Fixes: bc1c373dd2a5 ("MODSIGN: Provide a utility to append a PKCS#7 signature to a module")
Signed-off-by: Sergei Iudin <tsipa740@gmail.com>
---
 scripts/sign-file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f57..2dbfc6e630f4 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -315,7 +315,8 @@ int main(int argc, char **argv)
 				     CMS_NOSMIMECAP | use_keyid |
 				     use_signed_attrs),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) < 0,
+		/* CMS_final() returns 1 for success or 0 for failure. */
+		ERR(!CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY),
 		    "CMS_final");
 
 #else
-- 
2.30.2

