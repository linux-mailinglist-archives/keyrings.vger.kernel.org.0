Return-Path: <keyrings+bounces-384-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B07E822F3B
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 15:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8C01C21431
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 14:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13931A293;
	Wed,  3 Jan 2024 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD7qBpjb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450A1A28F
	for <keyrings@vger.kernel.org>; Wed,  3 Jan 2024 14:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A75C433C8;
	Wed,  3 Jan 2024 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704291306;
	bh=BjtQKdOBUqAhXPyN3D2F0IiTLyfd1QWbATMfzsL8VL0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=SD7qBpjbf3CYV3+GCt5qSbOzy3Bk3aFZZOnJ3YwyamhRFRtI3dH3fcsad2zOY48Bv
	 3UE+Fx6me85eX8fPQjXpPafT4yQ6gj2BbqA4wpvjd4uHtmJ6ZuRPiaKULXyNLnwvLh
	 XbzmcQxKgxDc4wq8vnZYn7TQJQQvKFd9DofPFfrJvar/Lt09SuIKaZb555Yj9Xkw7f
	 meLuvG6isQ5NXF26bd2u4JLx9+Sq03OLNUGsOKP6LwU+aD7dkLZR4WmJjiWEP84S6b
	 WMtv9UJR/M/U2LzC0uHHMC0zd4tHrdBZQkkHgDef7/9uJ5AfjB4222I6WzcQ1VCqfn
	 kkmykdfOfL50g==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jan 2024 16:15:03 +0200
Message-Id: <CY54UG7DS8J4.335VSDKYD51X6@suppilovahvero>
Cc: <keyrings@vger.kernel.org>, <dhowells@redhat.com>
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Ben Boeckel" <me@benboeckel.net>, "Nicholas Vinson"
 <nvinson234@gmail.com>
X-Mailer: aerc 0.15.2
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com> <ZYzVtdviEYQ6AN-6@farprobe>
In-Reply-To: <ZYzVtdviEYQ6AN-6@farprobe>

On Thu Dec 28, 2023 at 3:56 AM EET, Ben Boeckel wrote:
> On Wed, Dec 27, 2023 at 16:35:16 -0500, Nicholas Vinson wrote:
> > Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
> > nodefined. Their inclusion in version.lds causes clang/llvm LTO
> > optimizations to fail with error messages similar to
> >=20
> >     error: version script assignment of KEYUTILS_1.7 to symbol
> >     keyctl_restrict failed: symbol not defined
> >=20
> > This patch fixes the issue by removing the symbol names from
> > version.lds.
>
> FYI, there is also a GitLab repo here if you want to submit an MR:
>
>     https://gitlab.com/linux-afs/keyutils
>
> I believe it has yet to be seen if this is preferred or GitLab. Or
> whether the ML will get GitLab MR notifications.

David what is your take on Gitlab MR's? Do we accept them or not?

I've been working on CI test for keyutils (was unfinished before
holiday season came, have to backtrack where I left off), which
builds a small BuildRoot image and runs keyutils test suite inside
it (running it in runner directly is not really a great idea). So
I'm thinking once I get it finished, should I use the list or is
MR cool?

BR, Jarkko

