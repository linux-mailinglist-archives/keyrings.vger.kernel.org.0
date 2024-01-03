Return-Path: <keyrings+bounces-385-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55174822F3D
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 15:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6BDB1F23364
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01211A29F;
	Wed,  3 Jan 2024 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV8cpc5f"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DD91A293
	for <keyrings@vger.kernel.org>; Wed,  3 Jan 2024 14:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A351C433C9;
	Wed,  3 Jan 2024 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704291366;
	bh=tD6azCgMEIYE/KQU9Mn8eMBOJOH45Id5PrJPPVH/9XQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qV8cpc5fxYJ9AdnV0DJEYHVs+9TLqQj3KU6y/nTjTg0DVhafQXC6yjx3nlZCgO5Jt
	 whKww5FceoBLWMm3aNjPv2lGgvrBSBUK7q+rJNSXZWg/de6emUZjpmq8qcA7MGXgQW
	 msaP+UpsNjfmIiZR8bR+raya8kMxbKptTb9WoAqXNhJy4pCz7s8jA2w2vs8WlsC9uF
	 fQyY57M0whz9jKHeMi0fnTJu6sano/fS1N9JOBq0PEA/1lstvsj71x96XB23Gdfrah
	 s16Ik1Yt6s1sdFkw1OcEvT0E1uf+WktCuPTXGC6/TzAlyS45EmW+XDjXhj2vjaFDuZ
	 PfQ/0E7dnCckQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jan 2024 16:16:03 +0200
Message-Id: <CY54V7V3PMDV.1CO4FJ2XDA44L@suppilovahvero>
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nicholas Vinson" <nvinson234@gmail.com>, "Ben Boeckel"
 <me@benboeckel.net>
Cc: <keyrings@vger.kernel.org>, <dhowells@redhat.com>
X-Mailer: aerc 0.15.2
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com> <ZYzVtdviEYQ6AN-6@farprobe> <fe5c7770-7fbc-4332-aa85-80e281cda8c2@gmail.com>
In-Reply-To: <fe5c7770-7fbc-4332-aa85-80e281cda8c2@gmail.com>

On Thu Dec 28, 2023 at 4:20 AM EET, Nicholas Vinson wrote:
>
> On 12/27/23 20:56, Ben Boeckel wrote:
> > On Wed, Dec 27, 2023 at 16:35:16 -0500, Nicholas Vinson wrote:
> >> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
> >> nodefined. Their inclusion in version.lds causes clang/llvm LTO
> >> optimizations to fail with error messages similar to
> >>
> >>      error: version script assignment of KEYUTILS_1.7 to symbol
> >>      keyctl_restrict failed: symbol not defined
> >>
> >> This patch fixes the issue by removing the symbol names from
> >> version.lds.
> > FYI, there is also a GitLab repo here if you want to submit an MR:
> >
> >      https://gitlab.com/linux-afs/keyutils
> >
> > I believe it has yet to be seen if this is preferred or GitLab. Or
> > whether the ML will get GitLab MR notifications.
>
> Thanks for the information. Would it be possible to add the information=
=20
> to the SUBMITTING_PATCHES file?

This Gitlab migration is recent and we have not yet made any decisions
on how to deal with merge requests, or block them entirely. It came just
before holidays.

BR, Jarkko

