Return-Path: <keyrings+bounces-3682-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA8CCAA15
	for <lists+keyrings@lfdr.de>; Thu, 18 Dec 2025 08:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 266763064BFC
	for <lists+keyrings@lfdr.de>; Thu, 18 Dec 2025 07:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00DB331223;
	Thu, 18 Dec 2025 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFvxQjnf"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9D330D24
	for <keyrings@vger.kernel.org>; Thu, 18 Dec 2025 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042505; cv=none; b=ZW0P2lUnrIFWrXfPUfNMYHet/ZGf2fbewBFATnxBpU6JnyEkNL/qPvjaDNcmIEVPpAd5rRjTQW8PQWEkgQZFJcjY5MD15qDp6jlJVAT12szila74hlOg10bFbXZnrTrmbZqsbh3rW8kS/pfMaS5HpH74v5wyDzaCV41xZ/8EQ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042505; c=relaxed/simple;
	bh=oRDVeoSH7AN/+1EKf418Edx8/qjw/FEB71Hmt8IhBro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJIgjNSkw0GtzsmS9npIIzbqR8oui5jz8TiEx4oxdpltIm0jWJjiAp8qZwDci1J0cH8nKC36Gln1hyvOlsPnKS6gYxZq7hi2esqB0RdpfiJj/Ry3gkgMB0fWHg5nS1VCPW1XnxpVlXEFOS4RgtNLwJ2oNvwDDyh2mlsQ++JAzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFvxQjnf; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c6da42fbd4so121249a34.1
        for <keyrings@vger.kernel.org>; Wed, 17 Dec 2025 23:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042501; x=1766647301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=;
        b=hFvxQjnfCf2CUAqy40N2AHyq5MIDA0GgC5LKgr2+oJWxzVnQ/H2BlDj/PRT3fjn6YS
         6uoMn7+YEL0+8O2LkRt30f+/2R5PDahttu121Fq4t7CeI0ECWbcDX44yZNP52rNK3/eA
         fPojzuLnONspq5CUtSTCNO3/tkNye7HZkr84BB+Y/ocSOeYeJ03l/SmFCJB5qTJptZdQ
         RbLfAkSfM0ummJWRnc7E8aYHqgmwBJNI/c/pFs/M401mDi2bS0euznuCTV9DcKpXnQ1t
         H/xEDBrHcjuX6fA2f9gHgqEpAJVqBMy72GfMnDPZoRbg6fOFBpJbmBiSpijWbwGJ9Uu8
         +Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042501; x=1766647301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u95c9TyT1XdaOnIyGBwMeLSiKMNJeuqg+7XxBfANtKE=;
        b=HkFNAvQne8s2R4otHBnYdl+C17zPi8w4BoTe9NA22sSHpYncq+qOR/gZ+CSINvF5J9
         hpAAzbfcz77cmmqHihpTbXdfvEFe3zGLF8ozX8UGbjB44/RrHG9ZPEKedhxvvmAad18z
         XNidOhwwOXZ2MEvaDxpR0jfBtSNziKmlFRCQO4sDfSUX4mfI9VVfru6PCponKJ+sxM4D
         5xhz2hqZE5+2+IrKcUy4tBc2JreNYzZjC54vsVSUvyVib7mjkwIokBaisuwyl4YQ9eta
         6kS+lrhZjRWt09Zblu8Mz81XmnuM10i8nfDaHA5suQY7WpRMqHuNVAZhuvGgXP8f2uSU
         4weg==
X-Forwarded-Encrypted: i=1; AJvYcCV4yna1Yde5+GAvOwxr6Vj0IDUz1NRcYuNAE/mhKiNL8X29DYeXcMRxAXS1nDz7ZPS/30c4Pfhxkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxreEnYk3iEmQcuUnpZJBFkkgjbBtXfO0//vgOa4mToXyOkdJhC
	xozYxE0smf6y/x3ySjaMhsI3vZrvc/HQbq4UNOyQpqBWTmi29iO5zSUNL9GQa/51JnUVtQVrSAW
	IlcqqiNsM7p6qvywsFqf9vwGANLfTJ+B64HzrnODHsg==
X-Gm-Gg: AY/fxX6TfcXZ3CIDP2Yytmt6Jg2n+iSZPKjfkYuMi3KeVunMa5YjNiqlfspESOySUIa
	2m1tcv4fP2QOYpTibOFL+qPOJOORH7ojnR+4LG9xMpYnhDVgIAc12isojOW3jsQsgfxULFSp7fv
	7PSRwurVlEG/PlnMq8CCP2pH2KReM1JW5IoLR2QbJYqdEGiKoKemujX5Uk4RwOLLr2VRSU1hW2h
	wZQqARplc+GIM3JJ2JKESD7u1gCuoqrwaR/TieJgZeJOxihlIjoC5QF77t3AoLzgzBfOYGRo81T
	rmPNy4Z5X6W1DrF3O8GRGOO0bQ==
X-Google-Smtp-Source: AGHT+IHdzsrnh67Z+uk7sg0iAMocZMySikku48EGz5g7L5MG+hq7iSRlseyY2l5vM8LHePwozU/hD6rMNUuAq73AgFc=
X-Received: by 2002:a05:6820:828:b0:65c:f41b:7119 with SMTP id
 006d021491bc7-65cf41b750emr1784992eaf.5.1766042500598; Wed, 17 Dec 2025
 23:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 18 Dec 2025 08:21:27 +0100
X-Gm-Features: AQt7F2r_j21Nqcv1IzhOT6jk9UPtvnwA1D3etXiTv5WveGJRYXXMC9qqoGF_Yc4
Message-ID: <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 15, 2025 at 3:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> the objective of this series is to make tee driver stop using callbacks
> in struct device_driver. These were superseded by bus methods in 2006
> (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> methods.")) but nobody cared to convert all subsystems accordingly.
>
> Here the tee drivers are converted. The first commit is somewhat
> unrelated, but simplifies the conversion (and the drivers). It
> introduces driver registration helpers that care about setting the bus
> and owner. (The latter is missing in all drivers, so by using these
> helpers the drivers become more correct.)
>
> v1 of this series is available at
> https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@baylibre=
.com
>
> Changes since v1:
>
>  - rebase to v6.19-rc1 (no conflicts)
>  - add tags received so far
>  - fix whitespace issues pointed out by Sumit Garg
>  - fix shutdown callback to shutdown and not remove
>
> As already noted in v1's cover letter, this series should go in during a
> single merge window as there are runtime warnings when the series is
> only applied partially. Sumit Garg suggested to apply the whole series
> via Jens Wiklander's tree.
> If this is done the dependencies in this series are honored, in case the
> plan changes: Patches #4 - #17 depend on the first two.
>
> Note this series is only build tested.
>
> Uwe Kleine-K=C3=B6nig (17):
>   tee: Add some helpers to reduce boilerplate for tee client drivers
>   tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
>   tee: Adapt documentation to cover recent additions
>   hwrng: optee - Make use of module_tee_client_driver()
>   hwrng: optee - Make use of tee bus methods
>   rtc: optee: Migrate to use tee specific driver registration function
>   rtc: optee: Make use of tee bus methods
>   efi: stmm: Make use of module_tee_client_driver()
>   efi: stmm: Make use of tee bus methods
>   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
>   firmware: arm_scmi: Make use of tee bus methods
>   firmware: tee_bnxt: Make use of module_tee_client_driver()
>   firmware: tee_bnxt: Make use of tee bus methods
>   KEYS: trusted: Migrate to use tee specific driver registration
>     function
>   KEYS: trusted: Make use of tee bus methods
>   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
>   tpm/tpm_ftpm_tee: Make use of tee bus methods
>
>  Documentation/driver-api/tee.rst             | 18 +----
>  drivers/char/hw_random/optee-rng.c           | 26 ++----
>  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
>  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
>  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
>  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
>  drivers/rtc/rtc-optee.c                      | 27 ++-----
>  drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++
>  include/linux/tee_drv.h                      | 12 +++
>  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
>  10 files changed, 164 insertions(+), 138 deletions(-)
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.47.3
>

Thank you for the nice cleanup, Uwe.

I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in my
tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.gi=
t/

The branch is based on v6.19-rc1, and I'll try to keep it stable for
others to depend on, if needed. Let's see if we can agree on taking
the remaining patches via that branch.

Cheers,
Jens

