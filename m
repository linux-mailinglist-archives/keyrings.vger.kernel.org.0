Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89948CCA99
	for <lists+keyrings@lfdr.de>; Sat,  5 Oct 2019 16:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfJEOpb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 5 Oct 2019 10:45:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38927 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfJEOpb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 5 Oct 2019 10:45:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id y3so9359197ljj.6;
        Sat, 05 Oct 2019 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:subject:to:cc:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=gbURxtDrrjP0AwdJI4nwyz0CJiDVeD038YdBdaoNhDI=;
        b=QwQO2IoLMbcDpkuevrdUuF1l8yjvyhoHNDJEwvhFmUmDIXltjaG6UtOh0CzkXTgLIq
         /4ga9S/TwVXDmdpBKlQJnzwkO3e1zxHSzqyYXsy/kOfI7cAX7uFfpCxopxDdjpcVSLzV
         G1+/p8uEO3nbCkC+0kiroPaInaG7Bgnur6M/7ULhbn9W7wo8+QqAF0icQ+sEBwuufhiC
         d2lRtAGA+GCCo6pUy6HQ6Ac55AyE7GMG5RMlSn89qrNX/nZB2DDKOMMaw4NTqb5sE2pZ
         rrjpjmQyQn0ru9D5lUsNJIhcKkDklhRR/jQGhXJtdFTyvZmysGoYuKpIaH300zCREaRC
         8gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:subject:to:cc:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:content-transfer-encoding
         :content-language;
        bh=gbURxtDrrjP0AwdJI4nwyz0CJiDVeD038YdBdaoNhDI=;
        b=llbG765EZzHUZErHiJ1/eb3jtFZFRiYZldiBp67TClA5KTlaaLlqx8vjH83Knp9eRC
         FERz2ZAlXPJAwyGbOHdZfXPjxsVJrvH799bTFLonWUTvRFdrt3HEJzh5EFCtIwxa84kF
         YiSyLYKOBr/nuUxmR9ELjggHPLWNwQhxsXlkgk+uskMBOUSSvmjDq2tlpMQfjZx0bHlK
         fXOi64WA21ufU+29KViIqpGP9s4uoE8e2fMdnZNBKPvXlfy9VboHneqV6QT5pdDoUpRG
         PNVcL6lWqofOKT/9Xl38i/upcH95K3hTpKvGGFgQMeN7JIidsinpYfvwifk+EW4gpazv
         BDwg==
X-Gm-Message-State: APjAAAXXL6tgFU/aDDVmx0iyVfT+EvSY1fI1epm3VGi1v8pllNpVL5Np
        HJKLQ+gaT4ocKcaYsd6ZNohCBofN/bw=
X-Google-Smtp-Source: APXvYqzfu/yBugB+mdcLyGT4Abi6LDj3G0X/prKHsz17ruqf7WpHGXoTFyHOo1uxqURo1/Ui/aEF9Q==
X-Received: by 2002:a2e:2c02:: with SMTP id s2mr13208815ljs.156.1570286728287;
        Sat, 05 Oct 2019 07:45:28 -0700 (PDT)
Received: from [10.14.234.161] (c83-253-121-161.bredband.comhem.se. [83.253.121.161])
        by smtp.gmail.com with ESMTPSA id x30sm1919945ljd.39.2019.10.05.07.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 07:45:27 -0700 (PDT)
From:   klondike <klondike@klondike.es>
Subject: [PATCH] init: Make SYSTEM_DATA_VERIFICATION a visible symbol
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Openpgp: preference=signencrypt
Autocrypt: addr=klondike@klondike.es; prefer-encrypt=mutual; keydata=
 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
 06YGsklPt1crzrnXeclT3uA=
Message-ID: <7f9abb2b-0825-b4e3-db4a-6f2e7ca129f2@klondike.es>
Date:   Sat, 5 Oct 2019 16:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: sv-FI
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

PKCS7_TEST_KEY and SIGNED_PE_FILE_VERIFICATION both depend on
SYSTEM_DATA_VERIFICATION which is non-visibile. As result these symbols
can not be chosen unless another symbol selecting
SYSTEM_DATA_VERIFICATION is already chosen.

Make SYSTEM_DATA_VERIFICATION visible so that PKCS7_TEST_KEY and
SIGNED_PE_FILE_VERIFICATION can be chosen by users when other symbols
selecting SYSTEM_DATA_VERIFICATION are not selected.

Also complete the help section so that this becomes clear to users.

Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
Cc: David Howells <dhowells@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>

diff --git a/init/Kconfig b/init/Kconfig
index b4daad2bac23..6e2efdff8cf7 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1921,7 +1921,8 @@ config MMAP_ALLOW_UNINITIALIZED
See Documentation/nommu-mmap.txt for more information.
config SYSTEM_DATA_VERIFICATION
- def_bool n
+ bool "Support signed data verification"
+ default n
select SYSTEM_TRUSTED_KEYRING
select KEYS
select CRYPTO
@@ -1938,6 +1939,9 @@ config SYSTEM_DATA_VERIFICATION
module verification, kexec image verification and firmware blob
verification.
+ If you want to be able to verify the signatures of images sent to
+ kexec, you must enable this option.
+
config PROFILING
bool "Profiling support"
help

