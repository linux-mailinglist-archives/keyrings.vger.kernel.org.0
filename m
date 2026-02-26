Return-Path: <keyrings+bounces-4081-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C/JIHS5GoGkuhwQAu9opvQ
	(envelope-from <keyrings+bounces-4081-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 14:10:06 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF41A61EF
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 14:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54355305E380
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 13:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDD52DECBF;
	Thu, 26 Feb 2026 13:10:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE2930ACEE
	for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111401; cv=none; b=gCdVnIvFcY+H1FCjLsFLeyn++SkQO6L8tOzRibgPRZTUG4CXrDLQcfAtVCLh0c6vwsbD6EVV8TKme+9P5mdH775YMItCFkfg4RoTQue0iWHM68JTiAyN41Ifry+XeA92jiuapxzzWtb59ZZWyG9irH7vEeuHiNxZqFmzQWmG2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111401; c=relaxed/simple;
	bh=a1p1msLbl85XGiJLc5pnzixV/EAE95C8WZQeXpg7yPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oI9pAJ/j4O48Ro8Gk3yklKdgBBMoiIBRvszVKZOcH4u4d+0PP92Ebs+MSZYaqKgtkbFOU9zI3FVoJZnrxVew4+r5yM5w4mUlQOTapg8EvKUw8beJq54ia42A1NyiDWPmOuYWBaaK4IqszZzsediqt/5FU/M2yvCNJEMJqyCGxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ff14dd9be4so584731137.1
        for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 05:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111399; x=1772716199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFo4C5bqe5c13AwLxjM1MlDIBZrqfqokVA35lsfZfy0=;
        b=KfYPwyU3OVEn4HIbj4RsCmSLbJy+s+3Kz+NPa5MLnKdWzjcUROmPJZsEmL29A1JQnu
         NYm2WPaUP+ARiN01MhNS/4B3p2xHkbzCDZLW0NoeVKX5+fRAJwGJE55e1nYHCdiMH8lW
         jbO6syk4clYK3ygs8S3KAI62v10eSADqUv6vnL9q3jyX0f1DQzgO5hZFwMIduDOGBqvR
         QdFkcdJPGvcogxEoeXIaVWVJM8YMQXXRa573Xvo5K3eJ0lWnG32ozRlCQLpeopJzgsgs
         3l6IC0HgXWSbwZRY0VZddWtF2P5EBs3vI91UQPpD6UxE6TPAgeKlRLtyYxql3b2fB2bO
         WMIg==
X-Forwarded-Encrypted: i=1; AJvYcCW1Pzp8PmTkOMlnSb8eigNHVCXw1+0dfgD8hVqj1anSI59rdKgvhnTBdZgibLWIqagOlKCVI6PLMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DYeia4T79alxyYDYcqunTIsX4BqXsp+Ylu4jxRRf6kiiaqUp
	HVnJ09mQbvnyw0nme/TgI9H7qiuXKguC+0e4kL1tMYVPc3povGtFtJRqgVSF0fS3
X-Gm-Gg: ATEYQzwlgF+/9CjmAcAVNhsjs/nAKfQk2qyQ4uiMhX9d1YGaE3cf/qLfpAbAt03tWnY
	RsjMNO45lnCUs0RcaBZQODCazCc5P6u4xLR1jf1/vO6GmjInh9ra7ifyIs+HaMR9x3zSrp8AErI
	QnglECP4SMb0Tm5DIN9akvMmBhQhnvMQ1k8DT1SGUGklxfoDl6w87h2zuVWhRCVTwRGUCDv7v6q
	jUiZWI40OPTsDzvMNuX5EdF83lGdGZ0fQY9zVW3zbyxsNXnC1CyIfaGCsWQ2JK1yQyp6sVlSdV7
	8C8H4dc2aV4h5muzyF9SpkkNZG1rVZzPOLLWs9SGJrFy6iRbGx0smVdek+sN8KFJ9jfMB523g4x
	+AIMvNcqBQ6JLnyl0fVs+9zlVnP+jOSk1sV8uK09sDJyjVqyscxkQFTWMgaMc1zh+44j5knv4z7
	KJlQxw1P7fZMDuP2FgPTBeQw3nufwBqGS9gVwyOEVhWgw27j472RG8ZFtKp9Nh
X-Received: by 2002:a05:6102:2ac7:b0:5f8:e4c1:7bd2 with SMTP id ada2fe7eead31-5ff20a57882mr1136805137.16.1772111399479;
        Thu, 26 Feb 2026 05:09:59 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea15925sm2166158137.8.2026.02.26.05.09.58
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:09:58 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94a231b285dso523371241.1
        for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 05:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhhmaz0SCLIa/zBECZ7JcUdRFynOcJJCak4RZN7UfpB4LD71ymDBFapQhAlhLaAfx1lYINijOe3g==@vger.kernel.org
X-Received: by 2002:a05:6102:5112:b0:5dd:c3ec:b66 with SMTP id
 ada2fe7eead31-5ff20c30021mr989167137.30.1772111398038; Thu, 26 Feb 2026
 05:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214181712.29132-1-ebiggers@kernel.org> <20251214181712.29132-3-ebiggers@kernel.org>
In-Reply-To: <20251214181712.29132-3-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:09:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULzMdxuTVfg8_4jdgzbzjfx-PHkcgbGSthcUx_sHRNMg@mail.gmail.com>
X-Gm-Features: AaiRm51PaPKg5xcCQeCnUb9vy0Lr9tZrrIwLkmaSIGSq-OyO54vQniCM8N9qQps
Message-ID: <CAMuHMdULzMdxuTVfg8_4jdgzbzjfx-PHkcgbGSthcUx_sHRNMg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA verification
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4081-lists,keyrings=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,keyrings@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CCCF41A61EF
X-Rspamd-Action: no action

Hi Eric,

CC kunit

On Sun, 14 Dec 2025 at 19:18, Eric Biggers <ebiggers@kernel.org> wrote:
> Add a KUnit test suite for ML-DSA verification, including the following
> for each ML-DSA parameter set (ML-DSA-44, ML-DSA-65, and ML-DSA-87):
>
> - Positive test (valid signature), using vector imported from leancrypto
> - Various negative tests:
>     - Wrong length for signature, message, or public key
>     - Out-of-range coefficients in z vector
>     - Invalid encoded hint vector
>     - Any bit flipped in signature, message, or public key
> - Unit test for the internal function use_hint()
> - A benchmark
>
> ML-DSA inputs and outputs are very large.  To keep the size of the tests
> down, use just one valid test vector per parameter set, and generate the
> negative tests at runtime by mutating the valid test vector.
>
> I also considered importing the test vectors from Wycheproof.  I've
> tested that mldsa_verify() indeed passes all of Wycheproof's ML-DSA test
> vectors that use an empty context string.  However, importing these
> permanently would add over 6 MB of source.  That's too much to be a
> reasonable addition to the Linux kernel tree for one algorithm.  It also
> wouldn't actually provide much better test coverage than this commit.
> Another potential issue is that Wycheproof uses the Apache license.
>
> Similarly, this also differs from the earlier proposal to import a long
> list of test vectors from leancrypto.  I retained only one valid
> signature for each algorithm, and I also added (runtime-generated)
> negative tests which were missing.  I think this is a better tradeoff.
>
> Reviewed-by: David Howells <dhowells@redhat.com>
> Tested-by: David Howells <dhowells@redhat.com>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Thanks for your patch, which is now commit ed894faccb8de55c
("lib/crypto: tests: Add KUnit tests for ML-DSA verification")
in v7.0-rc1.

> --- a/lib/crypto/tests/Kconfig
> +++ b/lib/crypto/tests/Kconfig
> @@ -36,10 +36,19 @@ config CRYPTO_LIB_MD5_KUNIT_TEST
>         select CRYPTO_LIB_MD5
>         help
>           KUnit tests for the MD5 cryptographic hash function and its
>           corresponding HMAC.
>
> +config CRYPTO_LIB_MLDSA_KUNIT_TEST
> +       tristate "KUnit tests for ML-DSA" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
> +       select CRYPTO_LIB_BENCHMARK_VISIBLE
> +       select CRYPTO_LIB_MLDSA

These two selects mean that enabling KUNIT_ALL_TESTS also enables
extra functionality, which may not be desirable in a production system.
Fortunately CRYPTO_LIB_MLDSA is tristate, so in the modular case
the extra functionality is a module, too, and not part of the running system
by default.  Unfortunately CRYPTO_LIB_MLDSA is invisible, so this cannot
just be changed from "select" to "depends on". But as CRYPTO_MLDSA
also selects it, perhaps the test can be made dependent on CRYPTO_MLDSA?

> +       help
> +         KUnit tests for the ML-DSA digital signature algorithm.
> +
>  config CRYPTO_LIB_POLY1305_KUNIT_TEST
>         tristate "KUnit tests for Poly1305" if !KUNIT_ALL_TESTS
>         depends on KUNIT
>         default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
>         select CRYPTO_LIB_BENCHMARK_VISIBLE

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

