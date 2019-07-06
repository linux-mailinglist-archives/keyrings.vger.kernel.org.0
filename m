Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D5460EA0
	for <lists+keyrings@lfdr.de>; Sat,  6 Jul 2019 05:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGFDo2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Jul 2019 23:44:28 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:39620 "EHLO
        omr2.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725917AbfGFDo2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Jul 2019 23:44:28 -0400
Received: from mr4.cc.vt.edu (mr4.cc.ipv6.vt.edu [IPv6:2607:b400:92:8300:0:7b:e2b1:6a29])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x663iQFI010210
        for <keyrings@vger.kernel.org>; Fri, 5 Jul 2019 23:44:26 -0400
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
        by mr4.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x663iLT3019822
        for <keyrings@vger.kernel.org>; Fri, 5 Jul 2019 23:44:26 -0400
Received: by mail-qk1-f198.google.com with SMTP id d9so3794737qko.8
        for <keyrings@vger.kernel.org>; Fri, 05 Jul 2019 20:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version
         :content-transfer-encoding:date:message-id;
        bh=8fXsS/qCFMlK3IfJe0o+L9zW5hwu1Njz/pHhxSynS10=;
        b=Fjd0hyLKP/PCuprThh145zwf0sba/g+ZZLMKrLVJVQpVKHN7v7Iatc61W8c6i5otXn
         dIHXjwT+X/FAd3jI6W/uEvFWqFoN72KE7o4QfOI5j3VpcyUaEb1+9usu0GbtCg9hrXEG
         3T69PsVSOAYphcsG6qrVqFuLADGJFTnCTt8oJXmGTasUv2zN21Z5KSNczjTc1DXdlYYP
         /UhAF1Qggr80Bng/l0j1jez0aFxaREDdboa0/5MiBfFEI46D/yPRUmKRVvC0MsbZMdaI
         edF4DuDUdaVQEw2wXE02S+Zm5/ztAs0aVXKdNacK9JswE7aEtrw9Z3IASGx+/S4Q/HQY
         DxAQ==
X-Gm-Message-State: APjAAAWj0IrJUH8uYUdm9BBrTpCnVdNutyWx/JZFCtN1EefWfcT8FHcJ
        xJnHod//n3EbQrfzfqz2SrHXH4LntZw00GCba0EZdHeEIWwfnHIx3emXZ8BZsSbbzY8YohVv6IZ
        91YxeQ4T6PD8Dqoz5sK5ih+iRQesYBA==
X-Received: by 2002:a37:47d1:: with SMTP id u200mr5455028qka.21.1562384661386;
        Fri, 05 Jul 2019 20:44:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx77CAOwb57kHTbH+rwRZca8Ng8B9IqTqMLwAaJTBXpsHS9IRbrpNxlEUt0uLu50+3hRR3OtQ==
X-Received: by 2002:a37:47d1:: with SMTP id u200mr5455020qka.21.1562384661140;
        Fri, 05 Jul 2019 20:44:21 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:4341::7ca])
        by smtp.gmail.com with ESMTPSA id w9sm2251091qts.25.2019.07.05.20.44.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 20:44:19 -0700 (PDT)
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: next-20190705 - problems generating certs/x509_certificate_list
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1562384658_2389P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Jul 2019 23:44:18 -0400
Message-ID: <27671.1562384658@turing-police>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--==_Exmh_1562384658_2389P
Content-Type: text/plain; charset=us-ascii

This worked fine in next-20190618, but in next-20190701 I'm seeing dmesg
entries at boot:

dmesg | grep -i x.509
[    8.345699] Loading compiled-in X.509 certificates
[    8.366137] Problem loading in-kernel X.509 certificate (-13)
[    8.507348] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    8.526556] cfg80211: Problem loading in-kernel X.509 certificate (-13)

I start debugging, and discover that certs/x509_certificate_list is a zero-length file.
I rm it, and 'make V=1 certs/system_certificates.o', which tells me:

(....)
make -f ./scripts/Makefile.headersinst obj=include/uapi
make -f ./scripts/Makefile.headersinst obj=arch/x86/include/uapi
make -f ./scripts/Makefile.build obj=certs certs/system_certificates.o
---- smoking gun alert
  scripts/extract-cert "" certs/x509_certificate_list
----
  gcc -Wp,-MD,certs/.system_certificates.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-redhat-linux/9/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -m64 -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_AVX512=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -Wa,-gdwarf-2 -DCC_USING_FENTRY -I.   -c -o certs/system_certificates.o certs/system_certificates.S

I go look at extract-cert.c, and sure enough, if the first parameter is a null string
it just goes and creates an empty file.

The Makefile says:

quiet_cmd_extract_certs  = EXTRACT_CERTS   $(patsubst "%",%,$(2))
      cmd_extract_certs  = scripts/extract-cert $(2) $@

and damned if I know why $(2) is "". Diffed the config files from -0618 and -0705,
not seeing anything relevant difference.

Any ideas?


--==_Exmh_1562384658_2389P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXSAZEgdmEQWDXROgAQJdfBAAh0OK5AXK+UV3PLU7Zf5MEVbiRWdArkQl
/Mq2xWj7D7T/cNw5C6rkF+15mZr/Jrn7hQS2pdAXf2bBJ1yt+09dDr5+fCMkIzCv
+XKxE876Cd6CnrmyKHprKeitoRxs2Lgre1WPamzWwDKcq3HYgEl1mKrNEnk+bYhp
h/U7qQgpxxRKx+rZU0ZwejwpJw4wgtiYELHUP5ibaGjLwzqZhzQ6prfIW/ow9zRi
m08yxe1THhXs/3ZBAZsXx/LeoUZQhhb7H6WfKYMMU+mwnUSw0rw6fUI0VkOVHV6P
VRcaDpWOV8gAgO6rZffunApCZrRPlTMa+wZwh1vCXApEn1vCtgul6jLKBh9H0XSR
+TS5z90I2BBx9TpmjR2aP04DqATir2CBeXRm1KubQUKPeXJUnjxJF2y/uURUsK52
Uvb5lYRcdPWoYwDsi9eikPKPda8y7H+TQGuygzV9VQAbYyffHfXR3cQMnAVltxko
ZZqtxIBG+/7WtfmTUqN8hzKThHieF92yF1bGgJk8mIjppvUAsoReZgSKqGKePvHX
F3NZoKtMW4A78Yc6PYl9rVADMj0wtapdo8Y7hAjogaf27M/Qu7g94nITro2p8lVx
rJLj61K7Q644ChMjWodkFxNnI4UiiBR5ut+bwVb5IQE/8TSU/eRC1wuuEJk76gQD
MCKeD0Nx+bI=
=etAO
-----END PGP SIGNATURE-----

--==_Exmh_1562384658_2389P--
