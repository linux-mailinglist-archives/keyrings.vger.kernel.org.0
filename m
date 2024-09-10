Return-Path: <keyrings+bounces-1941-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74697370D
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 14:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072C71C212B2
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 12:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14FE190667;
	Tue, 10 Sep 2024 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIQcaa87"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848BD190492;
	Tue, 10 Sep 2024 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725970819; cv=none; b=bfa0JVM2AKiaxqm1xdZPHwrB8tilG/iXb5Cr7nMiUNtf2opYzjTZb7/4wYn/XK5LM2Ylz90uLnMOq/xCVHb9YbHRrEz1EnzD5dzPaXwdyNmLOPIKhqb4zqwEoDm3ODJ9JmmFSQGEOV4St58bVsZZTnhST3BHt0epxeq3Hc7+m1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725970819; c=relaxed/simple;
	bh=OUBlup+5e9RE6/kJGTunFrmwMNYnhS6O7GXvfiuUjrU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=he6wRBAp3AHGTc7LKt1cn/k0Nt4cbYC5TzwBZ5zSX3Kl4sl3lm0bv9g4WE7IZmqxqoHsEOGVStZydkh6CFmKK1ss4edKoIA87oeAL4AzdwUwXI6fQtxLNG2myNi1w+psUzSVmpFEFcy0AAJewwX7/O9rONaAvC3Pli8eq730mCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIQcaa87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F5CC4CECD;
	Tue, 10 Sep 2024 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725970819;
	bh=OUBlup+5e9RE6/kJGTunFrmwMNYnhS6O7GXvfiuUjrU=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=kIQcaa87CzWIEC6oOcvYoZoNjBOq3EA/Gpv+tEfkmmAUV4GCSghXz4za4WfardBmp
	 cQYjKOYFO0978EvJXcyYR90bxpiCsSRUt3E/ng2/07VAF0WxKYZxlPk1cpAfe51BcF
	 pZgDCiwA/aDbwVyWagFi+JU5qPKJtJ08EFq2tf236nkoQzpSW68fXKCK5F6dip0JMP
	 y1DfqZzNCk9YQMzpMViNxjmupxOsHWsMZfz3pS9wEZK4/+Q2/ADWpThzQB1JWrtews
	 uhZhIT0SVrKFCy3r8qii/zqnDl3L3e1Xb0NXTfM2LpALj131l/Uy33fVgGOmRvm27i
	 pWVVFXuku/Qgw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Sep 2024 15:20:15 +0300
Message-Id: <D42LLAG1FKOD.2YY4RR8WXSDXO@kernel.org>
To: "Sergey Shtylyov" <s.shtylyov@omp.ru>, "Roman Smirnov"
 <r.smirnov@omp.ru>, "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>
Cc: "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.18.2
References: <20240315103320.18754-1-r.smirnov@omp.ru>
 <CZX9T3TU6YU0.3JE9M7M3ENUE0@kernel.org>
 <b5f21d1175c142efb52e68a24bc4165a@omp.ru>
 <CZY02YNBTGYQ.3KG8NLH8X3RQE@kernel.org>
 <7fd0f2a8252d4a6aa295adc1e76bc0e2@omp.ru>
 <CZZK77BY3FK4.2WMP1X5H9GTL1@kernel.org>
 <2ba02cfc-b866-bda4-4996-f7f95148832c@omp.ru>
In-Reply-To: <2ba02cfc-b866-bda4-4996-f7f95148832c@omp.ru>

On Mon Sep 9, 2024 at 9:25 PM EEST, Sergey Shtylyov wrote:
> Hello!
>
>    Sorry for (so long!) delay -- we're trying to finalize the status
> of our yet unmerged patches...
>
> On 3/21/24 7:12 PM, Jarkko Sakkinen wrote:
> [...]
>
> >>>>>> Found by Linux Verification Center (linuxtesting.org) with Svace.
> >>>>>
> >>>>> I'm not sure if this should be part of the commit message.
> >>>>
> >>>> I have already submitted patches with this line, some have been
> >>>> accepted. It is important for the Linux Verification Center to mark
> >>>> patches as closing issues found with Svace.
> >>>>
> >>>>>>
> >>>>>> Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without=
 AKID")
> >>>>>> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >>>>>
> >>>>> Should be reported-by.
> >>>>
> >>>> The suggested-by tag belongs to Sergey because he suggested the fix,
> >>>> subject/description of the patch. The tag reported-by belongs to
> >>>> Svace tool.
> >>>
> >>> 1. I did not see any reported-by tags in this which is requirement.
> >>> 2. Who did find the issue using that tool? I don't put reported-by to
> >>>    GDB even if I use that find the bug.
> >>
> >> Svace is an automated bug finding tool. This error was found during
> >> source code analysis by the program, so the tag reported-by does not
q >> belong to any person. I don't know what to do in such a situation,
> >> but write something like:
> >>
> >>     Reported-by: Svace
> >>
> >> would be weird. I think that the line "Found by Linux ... with Svace"
> >> could be a substitute for the tag.
> >=20
> > I'd prefer a person here that used the tool as it is not korg hosted
> > automated tool.
>
>    It's a long ago established practice with the Linux Verification Cente=
r (http://linuxtesting.org): you can find 700+ merged patches with a simila=
r
> line (mentioning the LVC's website) and without the Reported-by tag:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?q=
t=3Dgrep&q=3Dlinuxtesting.org

I see examples alike of=20

"Found by Linux Verification Center (linuxtesting.org) with Syzkaller."

It neither has an email address, meaning that reported-by tag even has
incorrect format.

NAK, because "Svace" means nothing to me as it is in the tag.

BR, Jarkko

