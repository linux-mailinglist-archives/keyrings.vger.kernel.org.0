Return-Path: <keyrings+bounces-2011-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CD9753C1
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 15:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB341C21C6B
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6218219343E;
	Wed, 11 Sep 2024 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sH72bwQ6"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5A18C91D;
	Wed, 11 Sep 2024 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060767; cv=none; b=GalDCCAe7gnFpL7PTSNm547dVNzRIJu7rFMhf9mz/r11lZHVfPnGNEh/Al69KObZNiYhr6BXrn0pn9kqfNnapxh1KcZdW7NGr9cDlACRq6YUxXKiWS+un+rLT1+sgD/RkpjsrRNYySufVXcBxOXxgsIyPfQDsJ9icGbJ2LZ7Tcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060767; c=relaxed/simple;
	bh=lavV9FaaiUvu/xALUC7Mr5fWr8C4KHtDSFEP/FMrShM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qeBEOMkLBJoUAiUCj3t8w8qDWMXpyClFrT+vV4dP+hkw1PURH/tiVDZOKpc2WyIGoohglVatePG81uXArDo8dS6MlXuH6oVUfBLfHXrAx23ftyOLkF5lp9kuzxfGvKy2xh4tk9JVM1vfgrhEHZcd1kpyU8WY9RzkQv/nzfT7jF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sH72bwQ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD2AC4CEC5;
	Wed, 11 Sep 2024 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726060766;
	bh=lavV9FaaiUvu/xALUC7Mr5fWr8C4KHtDSFEP/FMrShM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=sH72bwQ6X1lsfF3UgwsXip0Nq25fbhLD+7I8Fja3MSD5QhWE5b3CWc4P2+h1uzf3K
	 DrX1iu57CkDAKENyv3lxQOObsg732udBE7bnQzL8zb8tPs3I41ENwU2n6qa6tA7Zw3
	 kBTF9IPMbq9McCeLFrf2kqN5td54RiiaIR4XBI6DFaBhASK0IyhFQoUOBTVtf9VdhX
	 7ZUkzOohlA8j6GY/P5nwa+Ap28kFwxMZUdQNQcIpB+MjJbpMJ/PonYY/cWPRtfBeRS
	 PMXmgOpX+9xMcY1SLEwURJUxZ2f1xYyS+vTVqIByJ9sBMQfFLNrlv6vaNWMa9roGTK
	 tF55/GtZ2wDKQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 16:19:23 +0300
Message-Id: <D43HH3XOAXFO.2MX7FA48VOLE9@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Sergey Shtylyov"
 <s.shtylyov@omp.ru>, "Roman Smirnov" <r.smirnov@omp.ru>, "David Howells"
 <dhowells@redhat.com>, "Herbert Xu" <herbert@gondor.apana.org.au>, "David
 S. Miller" <davem@davemloft.net>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>
X-Mailer: aerc 0.18.2
References: <20240910111806.65945-1-r.smirnov@omp.ru>
 <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
 <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
 <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
In-Reply-To: <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>

On Wed Sep 11, 2024 at 4:18 PM EEST, Jarkko Sakkinen wrote:
> On Tue Sep 10, 2024 at 8:38 PM EEST, Sergey Shtylyov wrote:
> > On 9/10/24 4:38 PM, Jarkko Sakkinen wrote:
> > [...]
> >
> > >> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} para=
meters
> > >> the kernel will first emit WARN and then have an oops because id_2 g=
ets
> > >> dereferenced anyway.
> > >>
> > >> Found by Linux Verification Center (linuxtesting.org) with Svace sta=
tic
> > >> analysis tool.
> > >=20
> > > Weird, I recall that I've either sent a patch to address the same sit=
e
> > > OR have commented a patch with similar reasoning. Well, it does not
> > > matter, I think it this makes sense to me.
> > >=20
> > > You could further add to the motivation that given the panic_on_warn
> > > kernel command-line parameter, it is for the best limit the scope and
> > > use of the WARN-macro.
> >
> >    I don't understand what you mean -- this version of the patch keeps
> > the WARN_ON() call, it just moves that call, so that the duplicate id_{=
0,1,2}
> > checks are avoided...
>
> I overlooked the code change (my bad sorry). Here's a better version of
> the first paragraph:
>
> "find_asymmetric_keys() has nullity checks of id_0 and id_1 but ignores
> validation for id_2. Check nullity also for id_2."
>
> Yep, and it changes no situation with WARN_ON() macro for better or
> worse. It would logically separate issue to discuss and address so
> as far as I'm concerned, with this clarification I think the change
> makes sense to me.

Actually explicitly stating that call paths leading to WARN_ON()
invocation are intact by the commit (as a reminder for future).

BR, Jarkko

