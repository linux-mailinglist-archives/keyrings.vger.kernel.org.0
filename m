Return-Path: <keyrings+bounces-383-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F08822F38
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 15:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C12F1F24499
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 14:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDF91A293;
	Wed,  3 Jan 2024 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUW+dOJd"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B41A28F
	for <keyrings@vger.kernel.org>; Wed,  3 Jan 2024 14:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40BAC433C7;
	Wed,  3 Jan 2024 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704291130;
	bh=blag6nNOEjE0iw0cGlp4hPbVBAHS0HeJvFVm+2MZZe0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=VUW+dOJd3u6qt0sqv4Vvmk5zMxQLewZnbdLVM1UJ5rn0sZyIEi2wrlan7wHtkPOO5
	 rhzYhz/j6spV4X6hEV0SMdYtj9HlRSIfQMdcwMIboJPG50gjTUNdMavqVnN/aR6f1Y
	 Dc6IC0lTQwzuoQdtYwAPB1OiRfOEbvENNV1Y36XZ/aBJ9AYsxXXgiE8GloWO8Fgs9N
	 Lzh3SJCGumLGaVhncvOMeHVy36Zo8LkMB+3lRO+4B/kzOYUsODWtBelGygIImZA4kG
	 Pimxl2d16EXLcmWrYQpc+D1Bc97CdDKdghqt+dFFU+Sc2cHvbD7YBjQtsddEDQmOQt
	 aACCtCICFotzA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jan 2024 16:12:08 +0200
Message-Id: <CY54S7MB53ZC.1RD8JLZDE1MKF@suppilovahvero>
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nicholas Vinson" <nvinson234@gmail.com>, <keyrings@vger.kernel.org>,
 <dhowells@redhat.com>
X-Mailer: aerc 0.15.2
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
In-Reply-To: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>

On Wed Dec 27, 2023 at 11:35 PM EET, Nicholas Vinson wrote:
> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
> nodefined. Their inclusion in version.lds causes clang/llvm LTO

What does "nodefined" mean?

> optimizations to fail with error messages similar to
>
>     error: version script assignment of KEYUTILS_1.7 to symbol
>     keyctl_restrict failed: symbol not defined
>
> This patch fixes the issue by removing the symbol names from
> version.lds.
>
> Fixes Gentoo bug 914637 (https://bugs.gentoo.org/914637)

I wonder if we can uses here "Closes: <url>" similarly as with
kernel bugzilla (question to more broad audience)?

>
> Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
> ---
>  version.lds | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/version.lds b/version.lds
> index 6c34adf..6186fb6 100644
> --- a/version.lds
> +++ b/version.lds
> @@ -76,9 +76,7 @@ KEYUTILS_1.6 {
> =20
>  KEYUTILS_1.7 {
>  	/* management functions */
> -	keyctl_restrict;
>  	keyctl_dh_compute_kdf;
> -	keyctl_dh_compute_kdf_alloc;
> =20
>  } KEYUTILS_1.6;
> =20

BR, Jarkko

