Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C429E426BE1
	for <lists+keyrings@lfdr.de>; Fri,  8 Oct 2021 15:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhJHNrt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 8 Oct 2021 09:47:49 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:45017 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJHNrs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 8 Oct 2021 09:47:48 -0400
Received: by mail-ed1-f48.google.com with SMTP id v18so37051492edc.11;
        Fri, 08 Oct 2021 06:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=luBjB0diaV7IF28zzOGexlalQDrb9YbQxwTKXiuDEbU=;
        b=ee2x44r6ShWwnt/szSGa9bHUtY0dWubYMUNNN4ToPvVCgadtJrbuR+CZXcIXgiXM08
         2ISk9fx7P6Jd8cgDpH5u+1sxpdCyrSUGkeykHgfHO+8bqzxXO8jXaroiSZW+vx8HtEb4
         8U4kmxyby9WbA8KXegpiAwhsDr4NErKYI6eM1awPT7H/RCLjthFCW++9ZAZbxu4//h5l
         ZBjweETYAsLiOrvh59mXwGfrmWoT6vm/Sw6rENqM6mMact6zlhYfDq8p891Lu6dplx21
         YER8OBRORNrCuqe7IMvJ5dN2xg/4II3EjyccG1pxLsjk5zgszcWY/armR67R+uBYW/UO
         Ozdg==
X-Gm-Message-State: AOAM531xJsHUk0lJW8ut2KZ+3H+uApdKuv51Vgrgc1xLHuAJ15SLYT6T
        QJxdtAidWXLVA6GBjdedYv8=
X-Google-Smtp-Source: ABdhPJxZgG7D5n38JvfLY+IrhAINtQcZZKx7fsMAUWpKrEz4/qPRPe99rhhu//oNQ4a2Q9xs+3pnJQ==
X-Received: by 2002:a05:6402:51c9:: with SMTP id r9mr15197941edd.48.1633700751136;
        Fri, 08 Oct 2021 06:45:51 -0700 (PDT)
Received: from msft-t490s.teknoraver.net (net-2-34-36-22.cust.vodafonedsl.it. [2.34.36.22])
        by smtp.gmail.com with ESMTPSA id r22sm940314ejd.109.2021.10.08.06.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 06:45:50 -0700 (PDT)
From:   Matteo Croce <mcroce@linux.microsoft.com>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] sign-file: refactor help output
Date:   Fri,  8 Oct 2021 15:45:47 +0200
Message-Id: <20211008134547.32281-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Matteo Croce <mcroce@microsoft.com>

Tidy up the error output, and document the undocumented
flags -k and -s.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 scripts/sign-file.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f57..fad6563b2127 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -67,12 +67,19 @@ struct module_signature {
 static char magic_number[] = "~Module signature appended~\n";
 
 static __attribute__((noreturn))
-void format(void)
+void format(char *argv0)
 {
 	fprintf(stderr,
-		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
-	fprintf(stderr,
-		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
+		"Usage:	%s [-dp] <hash algo> <key> <x509> <module> [<dest>]\n"
+		"	%s -s <raw sig> <hash algo> <x509> <module> [<dest>]\n"
+		"\n"
+		"	-d only generate signature (implies -p)\n"
+#ifndef USE_PKCS7
+		"	-k use subject key identifier\n"
+#endif
+		"	-p keep signature file\n"
+		"	-s use raw signature\n",
+		argv0, argv0);
 	exit(2);
 }
 
@@ -245,20 +252,20 @@ int main(int argc, char **argv)
 		opt = getopt(argc, argv, "sdpk");
 		switch (opt) {
 		case 's': raw_sig = true; break;
+		case 'd': sign_only = true;
 		case 'p': save_sig = true; break;
-		case 'd': sign_only = true; save_sig = true; break;
 #ifndef USE_PKCS7
 		case 'k': use_keyid = CMS_USE_KEYID; break;
 #endif
 		case -1: break;
-		default: format();
+		default: format(basename(argv[0]));
 		}
 	} while (opt != -1);
 
 	argc -= optind;
-	argv += optind;
 	if (argc < 4 || argc > 5)
-		format();
+		format(basename(argv[0]));
+	argv += optind;
 
 	if (raw_sig) {
 		raw_sig_name = argv[0];
-- 
2.33.0

