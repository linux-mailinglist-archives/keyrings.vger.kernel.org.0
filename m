Return-Path: <keyrings+bounces-2010-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25D97538B
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 15:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6151C22860
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 13:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4E61AB6E3;
	Wed, 11 Sep 2024 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzG/QFrH"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BBE1AB6CB;
	Wed, 11 Sep 2024 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060688; cv=none; b=pyF3kA6E7sNHj+iN3mv/v6eY2nl8GDLpojNpOmeLOmQWwQ/UUxnTMwx5CGFVAjR1s+RbMet+t4rKnb7+Z1XpuqAp15KXROS0p6Wmpu5WmGJJzik/g2siz7AG+SjLAAkpzpI3/ED78fHCF6BxDiaMjMX7JnSIKwGL3fr5ZWmREVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060688; c=relaxed/simple;
	bh=/BcOlfsTNy3q9Ezx1F31k2kwS+FPzT/Ivyoxq9WYK1g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PU4t5uoujaQWll7c4vNc3OIUZyJKOrZATkVg70Wd1l6GNte7uJ5+peLim9JY7oK/DVoLHtM+dwC4jlEzqk2oHfct0sY9Q1Qo7Errq4m5OZ9az9iTgaEGjC85USOY4cerRriMsw6fQBk+pDTiMRdhC0OyUZQMPBoBtWreYY+ue/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzG/QFrH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D666C4CEC7;
	Wed, 11 Sep 2024 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726060687;
	bh=/BcOlfsTNy3q9Ezx1F31k2kwS+FPzT/Ivyoxq9WYK1g=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=QzG/QFrHPrzbLvNocCmWE6SzfiYTNUWzfjdUahpWef9dP1OdxRtkTzB2m9PLd8mj9
	 vRvGjuI0CVJMK4M7S7/eksoIxAdLK4/xeVAZ9xXjtneaHnove1YennkyO0XVSYTEO0
	 Lr55ftaRCsRHnX2o1xjQflOcp4KWn6hC3pK+C6W5WyXkzKrrL9zramtABU3AM/eRjs
	 yes9nBX1BIBU5TrzpnfchrYmg5gK0XuVdRmxorU9HEayKINYaxgU3m17CBs8lqtl6G
	 PWgZ9fXb0zGGi9Wg7LqTDtEwvWIHQpDDvLeSLEDdTBEfyB/HT6gnCEvmQKCf7K5EaF
	 wzkrul+5nak/g==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 16:18:04 +0300
Message-Id: <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Roman Smirnov"
 <r.smirnov@omp.ru>, "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>
X-Mailer: aerc 0.18.2
References: <20240910111806.65945-1-r.smirnov@omp.ru>
 <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
 <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
In-Reply-To: <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>

On Tue Sep 10, 2024 at 8:38 PM EEST, Sergey Shtylyov wrote:
> On 9/10/24 4:38 PM, Jarkko Sakkinen wrote:
> [...]
>
> >> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} parame=
ters
> >> the kernel will first emit WARN and then have an oops because id_2 get=
s
> >> dereferenced anyway.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with Svace stati=
c
> >> analysis tool.
> >=20
> > Weird, I recall that I've either sent a patch to address the same site
> > OR have commented a patch with similar reasoning. Well, it does not
> > matter, I think it this makes sense to me.
> >=20
> > You could further add to the motivation that given the panic_on_warn
> > kernel command-line parameter, it is for the best limit the scope and
> > use of the WARN-macro.
>
>    I don't understand what you mean -- this version of the patch keeps
> the WARN_ON() call, it just moves that call, so that the duplicate id_{0,=
1,2}
> checks are avoided...

I overlooked the code change (my bad sorry). Here's a better version of
the first paragraph:

"find_asymmetric_keys() has nullity checks of id_0 and id_1 but ignores
validation for id_2. Check nullity also for id_2."

Yep, and it changes no situation with WARN_ON() macro for better or
worse. It would logically separate issue to discuss and address so
as far as I'm concerned, with this clarification I think the change
makes sense to me.

BR, Jarkko


