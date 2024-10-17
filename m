Return-Path: <keyrings+bounces-2214-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 355B59A1D5B
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2024 10:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D4101C218B8
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2024 08:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE2A1D434F;
	Thu, 17 Oct 2024 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqzYWZqW"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406891D416B;
	Thu, 17 Oct 2024 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154359; cv=none; b=ime/kK/RhLQnFX9tmCKrE6ZwQDjSwnFkDiN0F5ojMn/aisvUxB5EhZh6F5u5PG55qwUNM4qXuxwhKYpQvoWp9l2YuE5dFxdxCeAsH6a+gejS2eKRUmFPbQ9e156JM3KWrBPQCE2I0t82/KnU7qn9npnupI6e3jcTpTcivr/nNI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154359; c=relaxed/simple;
	bh=pKo5ONgjvNZBTGzwv84u0xks3ESeJL8REZLtj89Qmh4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mb6dVDtVIdmfZSPzMpGjb1bXjRA3Hvn+lxcl13V3brSmIhrrDlLdrxAcVAxLwbOl6DlMSsiZK2DNmV+xLV3V+d8JaP5MMKmS2cIW/mWqoCcBBFu5qjq78H/yodMsY1pTV0YuEcnmjf9vyia+UzS7XsXzPNQgkBmvnfevHivwL5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqzYWZqW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2BDC4CEC3;
	Thu, 17 Oct 2024 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729154358;
	bh=pKo5ONgjvNZBTGzwv84u0xks3ESeJL8REZLtj89Qmh4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KqzYWZqWKAFkShlIpR7aQ9FFfCNzsuv5bObN3oWJEr8Rk5bh4u4SihmDuoKQw1wyY
	 hckCkbB26H+5jBPGdR3R70uqhHr5uYRfHwdq8Dl79HB+k79mOVCLXKLAV9HE1VsNhA
	 5Io0sxb05ZbLIBQhVys1CO6KN6/9WcgEEpEZsmz7WvXlEwzKvzgxD3PCx9i09iQGYx
	 Jy8aR+YaRNTn1IJ95hlQbsnOjimOjth12xynZBSxtrSzRknB9U0zAcgsuPdUKqB7MQ
	 CJzvbV60S87jvm3iHzymtWmJnnppD+E4of/NoIwJI0OGFRe0M2QHUP7LrCA+4jy+HE
	 7lZMYdePMtytg==
Message-ID: <cf01c9be92e9c5f4bbb970a37d38c7f3d1c29623.camel@kernel.org>
Subject: Re: [PATCH v2] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>, dhowells@redhat.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 17 Oct 2024 11:39:14 +0300
In-Reply-To: <912228e4-ca24-4ff1-9b18-af314b53835a@huaweicloud.com>
References: <20241008124639.70000-1-chenridong@huaweicloud.com>
	 <d3fb6263-b1f3-4bcd-b28e-abd81fbbd711@huaweicloud.com>
	 <021c2dffc7ced6030213a9cfa7939a34193a3cd4.camel@kernel.org>
	 <fe310437ce19ed5aa17f5c37d010c88d1ef84a14.camel@kernel.org>
	 <912228e4-ca24-4ff1-9b18-af314b53835a@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-10-17 at 09:19 +0800, Chen Ridong wrote:
>=20
>=20
> On 2024/10/16 13:14, Jarkko Sakkinen wrote:
> > On Wed, 2024-10-16 at 08:08 +0300, Jarkko Sakkinen wrote:
> > > > Friendly ping.
> > >=20
> > > Thanks for pinging because I actually accidentally missed the
> > > original
> > > email!
> > >=20
> > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > >=20
> > > I'll pick this up.
> >=20
> > I tuned the commit message just a bit (see my comment
> > embedded):
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/=
commit/?id=3D9bb3ba75c1c8fd8c9f6a0b1fd6409b725583a3e0
> >=20
> > BR, Jarkko
>=20
> Thanks you very much.

Thanks to you for patience with my earlier shitty reviews ;-) That was=20
tbh the main issue with this bug fix getting through...

> Best regards,
> Ridong

BR, Jarkko

