Return-Path: <keyrings+bounces-2034-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042D7976C10
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366AA1C23E60
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 14:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6078F1AD25F;
	Thu, 12 Sep 2024 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doL6O8Zu"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1D15D5D9;
	Thu, 12 Sep 2024 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151270; cv=none; b=dtcRnfDTLe4JNtgrjHeJKgj8rCShX82M2OlZkezAYLZH+oPRsaFDTFL1FzRSvuQzmPzGwHf7OsRU2Z4gbOg227FEBUBJ0aTnovXvNqh4yEIvlyWrzc1z3B0bhVT8BjGMwhuPFknpWsbp0VScaKHnHE+wrvH/dHgvBDm7p6KUshU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151270; c=relaxed/simple;
	bh=R9iNhmLdXJrD0HXJ+V9I+UW/8WxZygjTlvhQcx+VNh8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=i/2Tt43uXJDjpIJfjStK6+4TslYIqhf45PwUbLGQ1Pk1OUZjyB1NDyysIvhuOQfET0qZQOXhAhBlmZ6kopB7U2RAf9aUyhj8IHTSvzQfTMFH6O6Ga+bc/d+gU8QOJlChxbEidwSkgK1Wo3FerFD18Ij6OHO/Nq0rWO6ujKdplLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doL6O8Zu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE64C4CEC3;
	Thu, 12 Sep 2024 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726151269;
	bh=R9iNhmLdXJrD0HXJ+V9I+UW/8WxZygjTlvhQcx+VNh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doL6O8Zua35rWE3YInz4yJsiZIQP37eMOlxYBt7UPYKJMSfqhlGJGK6QA7ChHomld
	 SffZVF6mGJqCf8LfEdL7YgdhLGLAwDRH+s5HeBURtWF8BAc4VSEwJbKRIrEnwDHTw3
	 +VwNobzfIibnQnsC43cXGDYYE7Q0yNFnFJmsFgnZnVy4ulUDaUl99ngq3iR6ogB2SO
	 lUVcd7+LTW00J3nZsmMfVAo+aXc2/c1mH5mcdyXYGdXuTNsnd6wb9c69kRsjgfkPr9
	 QVe5mF29qWEfBjY3OQbjUIj0tzhdhH7utyhVXJTRBLVbl3boUz99XPbTqbNgM/OHuX
	 6gfwb91cixAYg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Sep 2024 17:27:45 +0300
Message-Id: <D44DK087Y80R.25CNND6WHJ7EE@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Roman Smirnov"
 <r.smirnov@omp.ru>, "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
X-Mailer: aerc 0.18.2
References: <20240910111806.65945-1-r.smirnov@omp.ru>
 <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
 <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
 <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
 <8774f6a2-9bec-b699-6b68-63a26019c5b3@omp.ru>
In-Reply-To: <8774f6a2-9bec-b699-6b68-63a26019c5b3@omp.ru>

On Thu Sep 12, 2024 at 4:51 PM EEST, Sergey Shtylyov wrote:
> On 9/11/24 4:18 PM, Jarkko Sakkinen wrote:
> [...]
>
> >>>> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} para=
meters
> >>>> the kernel will first emit WARN and then have an oops because id_2 g=
ets
> >>>> dereferenced anyway.
> >>>>
> >>>> Found by Linux Verification Center (linuxtesting.org) with Svace sta=
tic
> >>>> analysis tool.
> >>>
> >>> Weird, I recall that I've either sent a patch to address the same sit=
e
> >>> OR have commented a patch with similar reasoning. Well, it does not
> >>> matter, I think it this makes sense to me.
> >>>
> >>> You could further add to the motivation that given the panic_on_warn
> >>> kernel command-line parameter, it is for the best limit the scope and
> >>> use of the WARN-macro.
> >>
> >>    I don't understand what you mean -- this version of the patch keeps
> >> the WARN_ON() call, it just moves that call, so that the duplicate id_=
{0,1,2}
> >> checks are avoided...
> >=20
> > I overlooked the code change (my bad sorry). Here's a better version of
> > the first paragraph:
> >=20
> > "find_asymmetric_keys() has nullity checks of id_0 and id_1 but ignores
> > validation for id_2. Check nullity also for id_2."
>
>    Hm, what about WARN_ON(!id_0 && !id_1 && !id_2) -- it used to check al=
l
> the pointers, right? I think our variant was closer to reality... :-)

Right (lazy validation, first null ignores rest)

BR, Jarkko

