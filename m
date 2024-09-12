Return-Path: <keyrings+bounces-2028-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6574976BA3
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 16:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150D41C204FB
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 14:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990231B12C2;
	Thu, 12 Sep 2024 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5mUpJ3O"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4581A76D7;
	Thu, 12 Sep 2024 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150352; cv=none; b=s0twI77Vy9Wb5yLZu+QCLc6BQ0YewfE9BMwDoQEAgO9FVDQ2Nh4qvIYHF91h9rCXPzBdIuKR9eq4iKnatFZ3AQ2YOxOtasCVgneobnWKRfqJ6HRkRTWJoeEiCzxt67T1DsYzYGXPfpvymJ+9pI5mRL+DGtA/vzoDwQL2/gEFv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150352; c=relaxed/simple;
	bh=kqayeH9yAU6QmO2yJDv3m4IZj5gcg/omaai2guG9iog=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hDC7recWJVcPJEUgFKkGk05a+3PaUOTYfvCwwIoGEZMqFQ/ylIRGqH8VAdWMQ+Qqawn8LgE741SGSAgOFaGHTdOWPU5lMR1vhrwFlFN+5MeQWAJCKXnwLlEjZM675L5FNKRuaNUm9eNptEoHaKit/GYyiZ2As2ESc8aYYWI45aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5mUpJ3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F218C4CEC3;
	Thu, 12 Sep 2024 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726150350;
	bh=kqayeH9yAU6QmO2yJDv3m4IZj5gcg/omaai2guG9iog=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=D5mUpJ3O1koF7JP47t4FWgVsCAm+0OjzbMXhK60BjQNyg/HSbhR/HjeFHf68N3gRx
	 IFievAqRBQu+G+UT9XXLzrN4+jjP+zaWe5wrSzNPkfMMRDOQ3lrkFKip0a/yH/qj66
	 GXh5ML58ydTnX/DpLlYqmxZVSCTvlFprCwZhwsHhWAWimj2RDd4HBG1l7riY3nc8fy
	 /R3LdsbUG4FuIS0JsMK6lRolM6q8Xzc+NXfP4UOeVHJg+J1Nir1Ux5uIq9AJwM6X7a
	 8dCWrFZZhXmcv7IawZyzYDfT9NCWfnn3IT+pcDfrpyhsuF610pkN1k7htfpOiDb3CX
	 wUEPif5hjSgLw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Sep 2024 17:12:26 +0300
Message-Id: <D44D89US0PW6.3HVNXUTP0CMFZ@kernel.org>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Roman Smirnov"
 <r.smirnov@omp.ru>, "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
X-Mailer: aerc 0.18.2
References: <20240910111806.65945-1-r.smirnov@omp.ru>
 <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
 <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
 <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
 <D43HH3XOAXFO.2MX7FA48VOLE9@kernel.org>
 <85607ea7-a42a-1c7b-0722-e4b63a814385@omp.ru>
In-Reply-To: <85607ea7-a42a-1c7b-0722-e4b63a814385@omp.ru>

On Wed Sep 11, 2024 at 5:45 PM EEST, Sergey Shtylyov wrote:
> On 9/11/24 4:19 PM, Jarkko Sakkinen wrote:
>
> [...]
>
> >>>>> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} par=
ameters
> >>>>> the kernel will first emit WARN and then have an oops because id_2 =
gets
> >>>>> dereferenced anyway.
> >>>>>
> >>>>> Found by Linux Verification Center (linuxtesting.org) with Svace st=
atic
> >>>>> analysis tool.
> >>>>
> >>>> Weird, I recall that I've either sent a patch to address the same si=
te
> >>>> OR have commented a patch with similar reasoning. Well, it does not
> >>>> matter, I think it this makes sense to me.
> >>>>
> >>>> You could further add to the motivation that given the panic_on_warn
> >>>> kernel command-line parameter, it is for the best limit the scope an=
d
> >>>> use of the WARN-macro.
> >>>
> >>>    I don't understand what you mean -- this version of the patch keep=
s
> >>> the WARN_ON() call, it just moves that call, so that the duplicate id=
_{0,1,2}
> >>> checks are avoided...
> >>
> >> I overlooked the code change (my bad sorry). Here's a better version o=
f
> >> the first paragraph:
> >>
> >> "find_asymmetric_keys() has nullity checks of id_0 and id_1 but ignore=
s
> >> validation for id_2. Check nullity also for id_2."
> >>
> >> Yep, and it changes no situation with WARN_ON() macro for better or
> >> worse. It would logically separate issue to discuss and address so
> >> as far as I'm concerned, with this clarification I think the change
> >> makes sense to me.
> >=20
> > Actually explicitly stating that call paths leading to WARN_ON()
> > invocation are intact by the commit (as a reminder for future).
>
>    OK...
>    Do you still think the Fixes tag should be dropped (and thus the
> Reported-by tag would become unnecessary?)?

Good question but I think we should keep them (spent 15 minutes thinking
about this).

It's a glitch at least and would not do harm for stable series to have
it like that :-) So if you polish the message, send a new version I'll
pick it, and put to my next PR.

Thanks for the patience with this.

>
> > BR, Jarkko
>
> MBR, Sergey

BR, Jarkko

