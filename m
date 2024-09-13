Return-Path: <keyrings+bounces-2048-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB597891D
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 21:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7C31C22A29
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 19:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB64146D6E;
	Fri, 13 Sep 2024 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTWlhpV0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3B13CAA5;
	Fri, 13 Sep 2024 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257070; cv=none; b=aCsVV8XhqJJgnGvvfgSAyCSuQhbAOhx1lplD1VLr3vqPm0NdARU1jR6nWDKl/lrUaaqAL1zFR4NBbIU3XWBdUHi46qoDR92rAED8DUyQCB3e7vZQByWmCxk5cL64yqKBRgaL4/YTEfiymHCcZjIpiLEleSgf29KSLeX0dQKHRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257070; c=relaxed/simple;
	bh=W2r+kS904i1eF8SnmU6ynsgUgAqTin0VQq7IlkO2umU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gFPv8y6LNhpnoR3CV0dvlOSRjpJytDkYZwlMGW1eJKJt/HaBbfuleLRVeYDwceZ2GfuZtO/ARjECRnnZ/oHlqn44sjrpiQpgTiphEspM/B1j+hnlH8JRNlr007EXhCfNSzgLTwJLb4wn8MT3Mws6tG7PobbUTAuYPfy03zzxJjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTWlhpV0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F91C4CEC0;
	Fri, 13 Sep 2024 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726257069;
	bh=W2r+kS904i1eF8SnmU6ynsgUgAqTin0VQq7IlkO2umU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=XTWlhpV0GW6n8Q0Y46b6EcDU34hs45fEGQJLJGqwssA0KF91mvCmAgMPv/ZVxDD/o
	 21rNvfs4sFftS1IPadMy1LpstLfVsRXLICQJVZPs1H5KFZG6g91GoTTxvvGx15eWZU
	 ZkVjwxnFu7e0lTE03QIRoA7vcvU10T4XUy4ZMIPsx/Dr14ym9syQfhEd68sXngddbK
	 BzJxkzvkK87z4sctn3NVyD5+u6kRy5XD3dQ6xMAVVd0QAi55RpDKJ4JqURfCx90N7c
	 afnIzGTgmrit/dzA46aPrZhLxCQnHWvGbpIUIP0mqe0SOiSqSLLbrW0D572JpmQq5l
	 ut64rM77w5GYw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Sep 2024 22:51:04 +0300
Message-Id: <D45F23O3EX54.1NDMXAY5G7AL3@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Roman Smirnov"
 <r.smirnov@omp.ru>, "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>
X-Mailer: aerc 0.17.0
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

I think we can keep them.

BR, Jarkko

