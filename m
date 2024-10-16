Return-Path: <keyrings+bounces-2212-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A175C9A007C
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 07:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F521F2618A
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 05:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3585518B467;
	Wed, 16 Oct 2024 05:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEooucRk"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD318A95E;
	Wed, 16 Oct 2024 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729055665; cv=none; b=Mv9kWCMsoDY4shSxlUArCGVu7X9J4p50uKl376oACpZJe9y3/M4M2UdPLGF8yVe4LodCjzDLrg2qXbsR7pow2Rv5wmmMOYlNCLyKkny4GPEUbDlf28BMM0YZG134j/BiOyvIbhLbTRqgIb7fH7/q9sRn/TasZSkFdeD4GVZhDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729055665; c=relaxed/simple;
	bh=x7POI4Sg2IM0ffZvQ7y8JUFLFpyuzg09SgBW6+4OGqo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HDrCHnoCaxbGHmwDRlREGL24QynqQWNuTT/mGrXaNt0gVbGEgCJfdoNrMcaux2AcUpodKzi6FyOdesRpTTqfxjW8VM+1r4xvmegCvVOlXXbxxWkKbyJdH/U7/FGkFEyeyx4mpGKX84SUWRk5oTNlpvW3QSr5PbqoyODYeMwuSSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEooucRk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCB1C4CEC5;
	Wed, 16 Oct 2024 05:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729055664;
	bh=x7POI4Sg2IM0ffZvQ7y8JUFLFpyuzg09SgBW6+4OGqo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JEooucRkPZc9meLXMM4r3Bo2NXc+Cfnj9m8UgJn6Mripd1mQ2WTihZYwyTtJ8K3aO
	 ozSPPA0+Sh1/T/ZU34x9C7V6LpVthiXb8iB+YoAQv8cvDEVFEz+Z11Rskc4oYKIxNj
	 7Vu9li4AjeztX/K/O+Xx8nTMzXTgr2NV3P1WKRILn1R3SWJDBaRzNgXLHGOQF9N8Be
	 O96sxwds1rtjYTFVvHlweOnZvmLuvNvYIMA5hxlbiBwLNzwE06FPxNJG3CDjau4xMt
	 HGcp0mTcyOfcj+Hng576X77VxZUEvnJu6lB0wHmmEQOuoH5gZfyil7NgjmhzIA4boY
	 aWUIG9A54zXKQ==
Message-ID: <fe310437ce19ed5aa17f5c37d010c88d1ef84a14.camel@kernel.org>
Subject: Re: [PATCH v2] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>, dhowells@redhat.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 16 Oct 2024 08:14:20 +0300
In-Reply-To: <021c2dffc7ced6030213a9cfa7939a34193a3cd4.camel@kernel.org>
References: <20241008124639.70000-1-chenridong@huaweicloud.com>
	 <d3fb6263-b1f3-4bcd-b28e-abd81fbbd711@huaweicloud.com>
	 <021c2dffc7ced6030213a9cfa7939a34193a3cd4.camel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-16 at 08:08 +0300, Jarkko Sakkinen wrote:
> > Friendly ping.
>=20
> Thanks for pinging because I actually accidentally missed the
> original
> email!
>=20
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>=20
> I'll pick this up.

I tuned the commit message just a bit (see my comment
embedded):

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/comm=
it/?id=3D9bb3ba75c1c8fd8c9f6a0b1fd6409b725583a3e0

BR, Jarkko

