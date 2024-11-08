Return-Path: <keyrings+bounces-2290-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DEA9C25CD
	for <lists+keyrings@lfdr.de>; Fri,  8 Nov 2024 20:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 197861F21287
	for <lists+keyrings@lfdr.de>; Fri,  8 Nov 2024 19:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E772206E99;
	Fri,  8 Nov 2024 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB43rwTI"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5F201270
	for <keyrings@vger.kernel.org>; Fri,  8 Nov 2024 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731095054; cv=none; b=NCDw+nDmhJn95N1Dp/n/jBYCl7jTbFOsTlejqqadiM1BLp3MbaVs8CdaKNyrMpw1fD/neLcHOuxXI8BmFxdtx/7k322LFPtf9W+NWCcB3yW+WQGsfTFGlXM/hAxijLcwgxkNkRs1xTYt0zo4+NJI5ChtCxNejM6rtNbeNm+cCzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731095054; c=relaxed/simple;
	bh=ztvm9CW59XK4LFY0I4G5FK9CgMFsdwiEcnJljb5cdfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hFMGzoirq5q4Qf8Z4YEX/paAWc1YXlXUAqh4NtHcBdTjSHaKcIdGUskmjX46/bEsEtbjjDlKuNZqVdGrgIWzmtrfx6/b0Uk27lXPll556eLpHwsmcnxAmhZ6Vwjhca7H4ABvDYjP6STlbvw150P2P+vSPlWIb1bFJVPuoeuqLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CB43rwTI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D06EC4CECD;
	Fri,  8 Nov 2024 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731095053;
	bh=ztvm9CW59XK4LFY0I4G5FK9CgMFsdwiEcnJljb5cdfE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=CB43rwTI2D5DZk0u1p2dELZBhTgY29lUxAe2+9+X5fBuNvGRZuC1P9zhdu3wcyUse
	 SSEJJ6AS6S9uoxQzFwFQ9fwJ7HP4w9MLbvAUyn92DdDUjFcpWLvkZgYF7ocZDx0MyO
	 MwXOWNSJXZEHS/hyWGVwSZbecMV/RBzQz00Jk89+poquJ2SPryO0PrzUWgqi9RW0rv
	 3qAohDyBYwZttFspB3m6NsCTatI8AR06DeEubANZmkXjnySHHBOv/3FIFbc1gTD667
	 WLf9ioJW9e9IgT2CrS7lfjPPKzUk4kueXctQXCPWBPz1cPzr4q/DwZmyEbYFbnGD6a
	 Un48be52UJaMg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Nov 2024 21:44:09 +0200
Message-Id: <D5H1ZB95VC60.1XLLYFS3CLRIZ@kernel.org>
Subject: Re: Reading public key portion of asymmetric keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "James Prestwood" <prestwoj@gmail.com>, <keyrings@vger.kernel.org>
Cc: <dhowells@redhat.com>
X-Mailer: aerc 0.18.2
References: <eb52cc47-0e42-4f1a-984d-27d3470da92e@gmail.com>
In-Reply-To: <eb52cc47-0e42-4f1a-984d-27d3470da92e@gmail.com>

On Mon Sep 30, 2024 at 9:40 PM EEST, James Prestwood wrote:
> Hi,
>
> Unless I'm missing something it does not seem possible to read back the=
=20
> public key portion of an asymmetric key to userspace once added to the=20
> kernel. I have a use case where two separate applications need to=20
> perform crypto operations using the same private/public key pair and for=
=20
> added security it would be convenient to add the key (or load from TPM)=
=20
> once and pass around a key ID rather than the keys themselves.
>
> One of the things I need is to create and sign a CSR. To create the CSR=
=20
> I need the public key contents which can't be obtained from the key ID.
>
> To solve this problem I would propose adding a "read" operation to the=20
> asymmetric key type, but limiting it to only reading the public key=20
> portion of the key (if it exists). Alternatively a entirely new=20
> "read_public" keyctl API could be added as well, but re-using the=20
> existing read seemed more straight forward. Adding this seems easy=20
> enough, but I wanted to get an idea if this is something that would be=20
> accepted upstream or if others had better suggestions.
>
> Thanks,
>
> James

Missed earlier (CC to dhowells).

BR, Jarkko

