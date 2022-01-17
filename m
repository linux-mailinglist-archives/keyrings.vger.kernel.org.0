Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9801D490CE9
	for <lists+keyrings@lfdr.de>; Mon, 17 Jan 2022 18:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbiAQRAA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 Jan 2022 12:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241418AbiAQQ7j (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 17 Jan 2022 11:59:39 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B1AC06175C
        for <keyrings@vger.kernel.org>; Mon, 17 Jan 2022 08:59:36 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id 14so12350800qty.2
        for <keyrings@vger.kernel.org>; Mon, 17 Jan 2022 08:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M6FC+MGdL30gAj9EdPhED9cNHVQ32Hj7K3pOskYfkaQ=;
        b=gFC9j7I+OFnRVrRKCqdjsZRVySxXC8NTHW8t3V9aTuiWzqpJznj15MWSJnC3BQJ5yi
         DsjJAa3U/00tZlBlvC+ZG1Tq9QC05bJBvmG3irLwRsAOEmrhHo5Wcn89IW7rJu1+4V9z
         MQodtJLk2SFX/ksqr0nvFOLHX7S8PEVe4Tass=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M6FC+MGdL30gAj9EdPhED9cNHVQ32Hj7K3pOskYfkaQ=;
        b=j1yIBXdR+yACBwOVQHg4k55JxVhrpn/Ht7mh6fUN4KkxNa6WSEAA57AsgLJ3mKIChL
         JkHyM3gl6gW8aJpNL1isnY0t0I2krHaeBXX/6fSJgHWz3FC7MC6YB0M0FLW9J/URwcOJ
         IcXBBjif4g9lZDv6ehhDGp4cuE6UaTq6GnI+Q2vFslpEejQmbMXjhFW601+Ntn8/ZHXl
         5pgAgIKUKuHzqx73d5SxxJgpEO7Bxsu62denC0bY1GXuuXu9XOOErgasm2SRbMIhm4EU
         jZ9LCgJUENSCfqPPPA83az/jo8p4GwkhLCUNtqrDcf4wcwLMBXqRczUnLD6TlhYaLdPq
         PCmQ==
X-Gm-Message-State: AOAM5312yn11ELcUk+iX0zYwDfauWoMhfoYQy6NTe77k/ympp8ft26xF
        Wky0A0BIQ3yJea8xPZI2w6ReVQ==
X-Google-Smtp-Source: ABdhPJx/CVKfryDFmfdtXhpNB2rqUDRRelC/Mxp8ZUOQ+Sc2eRFkvkGtFT2jZ9Qq5aQk/5WlzY+R3w==
X-Received: by 2002:ac8:5c4b:: with SMTP id j11mr18035483qtj.490.1642438775873;
        Mon, 17 Jan 2022 08:59:35 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bs34sm9118306qkb.57.2022.01.17.08.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 08:59:35 -0800 (PST)
Date:   Mon, 17 Jan 2022 11:59:33 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Roberto Sassu <roberto.sassu@huawei.com>, dhowells@redhat.com,
        dwmw2@infradead.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
        zohar@linux.ibm.com, ebiggers@kernel.org
Subject: Re: [PATCH 00/14] KEYS: Add support for PGP keys and signatures
Message-ID: <20220117165933.l3762ppcbj5jxicc@meerkat.local>
References: <20220111180318.591029-1-roberto.sassu@huawei.com>
 <YeV+jkGg6mpQdRID@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YeV+jkGg6mpQdRID@zx2c4.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jan 17, 2022 at 03:34:54PM +0100, Jason A. Donenfeld wrote:
> If you're looking for a simple signature mechanism to replace the use of
> X.509 and all of that infrastructure, may I suggest just coming up with
> something simple using ed25519, similar to signify or minisign? Very
> minimal code in the kernel, in userspace, and very few moving parts to
> break.

I am concerned that ed25519 private key management is very rudimentary -- more
often than not it is just kept somewhere on disk, often without any passphrase
encryption.

With all its legacy warts, GnuPG at least has decent support for hardware
off-load via OpenPGP smartcards or TPM integration in GnuPG 2.3, but the best
we have with ed25519 is passhprase protection as implemented in minisign (and
even that is rudimentary -- if you need to sign 10 things, you will need to
type in your passphrase 10 times, as there is no passphrase agent of any
kind).

The most promising non-PGP development of PKI signatures that I've seen lately
is the openssh FIDO2 integration (the -sk keys) and support for
signing/verifying arbitrary external content using `ssh-keygen -n`. It even
does fairly sane things with identity/revocation/expiration via its
allowed_signers implementation, even if I'm less excited about it all being in
a single file.

Everything else is just treating key management as something out of scope, and
I'm worried that it's going to result in a net loss in overall security.

-K
