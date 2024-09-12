Return-Path: <keyrings+bounces-2039-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0B9775C8
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 01:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16223285CD1
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 23:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EF51C2DC2;
	Thu, 12 Sep 2024 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB5QJf12"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E53019F425;
	Thu, 12 Sep 2024 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726185444; cv=none; b=OBnMj3sd5cAE5wRjYMaOAE/2cODPpzgyn8NCqVgtwcemyULwYOX5KGJg269d3sgO/2F/8VEWILu1b/3jaoMGjFTMBpU3Gkwe4SlxmF2/DHa5y52SsVbvf3ZxWiIK5uUmFXSFCn1URl07rtjWeUqrlEtcNlf9CjVed0r04OyFr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726185444; c=relaxed/simple;
	bh=AsfRcrtObUzG0G02vJhdYtWyZnOhJwTlNYYrFWc+CCg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=t+w6Ife6yazdgoq+BnGWBkARSSo39/qvknF0RJf6+qbJ/F5Lpu9HYKVUjmjLRGHYivg9XI1RlkBzbQoPTaLj1Op+miXl8kALOjh89bVwzS38OC7qoifJT/i/FnMS0mUM/DqHDnjbMXI4UCzVU3pPiOZQS0JLvF8nO0fvIFLPAVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB5QJf12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48FDC4CEC3;
	Thu, 12 Sep 2024 23:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726185444;
	bh=AsfRcrtObUzG0G02vJhdYtWyZnOhJwTlNYYrFWc+CCg=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=DB5QJf121WmloINNRr9CXjIgZovlOpNsyCUdEDkRtBvHlpbjiOg+OLyfS4aN7OJLM
	 uZyVKHNHSiTKIG85yxti+1Oc+bdYYzDWVnglbPFWJm7wtlYUH/I8cdiX28mpcC711l
	 LKesPT/n/vJiP1zbHGp/y86uMjT42cJihoFOtOKLkUKT6u4/p5EbOKagxW+XF9YRy3
	 vhY/iCfDkarlUXIaaqLXYoy7xbjXXo5+2Z+x7HsAb+N/cRxva7cAxRT35j8V8j//L4
	 MWZdSfiCdOEi1G63TwuWlEh1fnbUedVmOjolwTZfw/3oAWZU6k/NBZKoNppwO+ZxtB
	 YakCukUmSRc6A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Sep 2024 02:57:20 +0300
Message-Id: <D44PO3WW3R6S.1VSJQ4AYFJW04@kernel.org>
To: "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Roman Smirnov"
 <r.smirnov@omp.ru>, "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.18.2
References: <20240910111806.65945-1-r.smirnov@omp.ru>
 <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
 <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
 <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
 <8774f6a2-9bec-b699-6b68-63a26019c5b3@omp.ru>
 <D44DK087Y80R.25CNND6WHJ7EE@kernel.org>
 <dbc7249a-7bf5-7e5f-7204-d368c052023c@omp.ru>
In-Reply-To: <dbc7249a-7bf5-7e5f-7204-d368c052023c@omp.ru>

On Thu Sep 12, 2024 at 8:36 PM EEST, Sergey Shtylyov wrote:
> On 9/12/24 5:27 PM, Jarkko Sakkinen wrote:
> [...]
>
> >>>>>> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} pa=
rameters
> >>>>>> the kernel will first emit WARN and then have an oops because id_2=
 gets
> >>>>>> dereferenced anyway.
> >>>>>>
> >>>>>> Found by Linux Verification Center (linuxtesting.org) with Svace s=
tatic
> >>>>>> analysis tool.
> >>>>>
> >>>>> Weird, I recall that I've either sent a patch to address the same s=
ite
> >>>>> OR have commented a patch with similar reasoning. Well, it does not
> >>>>> matter, I think it this makes sense to me.
> >>>>>
> >>>>> You could further add to the motivation that given the panic_on_war=
n
> >>>>> kernel command-line parameter, it is for the best limit the scope a=
nd
> >>>>> use of the WARN-macro.
> >>>>
> >>>>    I don't understand what you mean -- this version of the patch kee=
ps
> >>>> the WARN_ON() call, it just moves that call, so that the duplicate i=
d_{0,1,2}
> >>>> checks are avoided...
> >>>
> >>> I overlooked the code change (my bad sorry). Here's a better version =
of
> >>> the first paragraph:
> >>>
> >>> "find_asymmetric_keys() has nullity checks of id_0 and id_1 but ignor=
es
> >>> validation for id_2. Check nullity also for id_2."
> >>
> >>    Hm, what about WARN_ON(!id_0 && !id_1 && !id_2) -- it used to check=
 all
> >> the pointers, right? I think our variant was closer to reality... :-)
> >=20
> > Right (lazy validation, first null ignores rest)
>
>    No, contrariwise: since we use && and !, first non-NULL would ignore t=
he rest.

Oops correct :-/

BR, Jarkko

