Return-Path: <keyrings+bounces-3412-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC04C778EB
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 07:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 89833333FD
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 06:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0766C305E14;
	Fri, 21 Nov 2025 06:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAtN777A"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6930597E;
	Fri, 21 Nov 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705892; cv=none; b=eV1iuTblXlp+k3uvuakzvDr67zG+aS8CllB5Y4jPdmLMfLqkGPxSv5+ulsweOF+S5AEdrjQsRkyYCN0Z8Kt/onS7sdd8lNCm+W2bK9vFpe5huhqBg6YL7GQUkqAsVZPwh1zl2dJ5iaSl4RzpFn3TCCEjHjY75p06Lwds+H5IDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705892; c=relaxed/simple;
	bh=HO4na2m6whVvr7y4Ia0nxGjnaVEn4flWXUAZOQAc90Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiR8Oz80xQV/m3+lVFc/utYoHZxTbQ+yMXe0frOOUGqId8bltfxFukcYQeVuNRUHLdQ2WptPvQZcFwGvSb3XySxjBkpf5YtEuEzfVsy1hMbpK1H7RScYhSDNAQXBoO/lUmJsjQMHRqrOYn22NEka1hnZdvP7B2WuGrcRz9rUIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAtN777A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D818C4CEF1;
	Fri, 21 Nov 2025 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763705891;
	bh=HO4na2m6whVvr7y4Ia0nxGjnaVEn4flWXUAZOQAc90Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAtN777Ad4o/ydmQ4JtcOfmYqUYJRaGZ/xWJrYztDooL6GEHOAfa6BL1cw8npVENw
	 O1EtPqUpmlxj2/5HWrhBPV0HjOw0mE8I3tz/30PdK3xTm17N9y4NchuEg1hRgHeahe
	 wofu8Fe7N72hj+OvAAQtDzvex8jhwF0dTIUiVAZufFa15rr/ab6yPXiROEDQQUXqDi
	 VZjlmGYbBRsDAljcwnqu5mxoBT1F/u/Rbq1TH1CcPih80ql8xKY8HplNg8KzgV5eCY
	 BwY8ZpjSCIhbcDS2aLYveVOfVQd16IQKDC0moULDaEeFZwL3vkebqIg+RGgrhys2mg
	 XXwB9lQG0D/sw==
Date: Thu, 20 Nov 2025 22:16:25 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] lib/crypto: ML-DSA verification support
Message-ID: <20251121061625.GA1855@sol>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <2528923.1763626276@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2528923.1763626276@warthog.procyon.org.uk>

On Thu, Nov 20, 2025 at 08:11:16AM +0000, David Howells wrote:
> Note that your emailed patches seem corrupt somehow, but I can fetch the git
> branch.

Works for me:

git checkout -d 10a1140107e0b98bd67d37ae7af72989dd7df00b
b4 am 20251120003653.335863-1-ebiggers@kernel.org
git am ./20251119_ebiggers_lib_crypto_ml_dsa_verification_support.mbx

10a1140107e0b98bd67d37ae7af72989dd7df00b is the base-commit listed in
the cover letter, via the --base option to 'git format-patch'.  It's the
current head of libcrypto-next and is also in linux-next.  Maybe you
tried applying the series to a different commit.

Anyway, using the git repo is fine too.  This sort of stuff is exactly
why I usually provide a git link too.

- Eric

