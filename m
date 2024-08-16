Return-Path: <keyrings+bounces-1877-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666EE954662
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 12:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85CEB1C20AB8
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 10:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B7F170A1F;
	Fri, 16 Aug 2024 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWbVKXNS"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300DB85270
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723802423; cv=none; b=YxWf6rBtB/8/WsSOjkoqSqe2Ru0c/ShHnWFZwkYQE4dZpowugXtSy2bn8oVBhVvXidO5D308nawMoJETFI31oK0EMEdniE0c+KOQhiqpvAhfcjJGBwPurqZvJM6DdQOrqDBry5/z8bOuxfCRVeWciA5ZEhBX+ilJcsGhaLRGcQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723802423; c=relaxed/simple;
	bh=02nFjr3Q2cbuxsF+MgJ9H0pnhGEWbKjew9cIcKVj+8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hfLpsmc6Euy0/BTe0EovF+WoTtwtNagfTdHFUQSvj7FarfsDrBgWadlcFtEzdAHpWIBZKgxLlDfd6U9MQo0Cu3WCjkGTJqMYOoPNErKM8zLv3GXxD1ZGyoTHasMWQ6GVUZ5pZyuSCw64ElhpXebnLYdsVXxj0OEvzSdaUKvsmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWbVKXNS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64169C32782;
	Fri, 16 Aug 2024 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723802422;
	bh=02nFjr3Q2cbuxsF+MgJ9H0pnhGEWbKjew9cIcKVj+8k=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZWbVKXNSbwGAt3z+HUvIHwSIwY7Tvi+AjQKj4EzyUp/grC+eBdnxi/Ujnm5HAuTCg
	 ZBO37PzXH4MzLkCnmRPRMZJCWLGTXkC7l8V/NGDuS3mNN6h/Na04fl47n0+T4RyoK8
	 zRbdHJuKKIsqeumnF6NyVMPZsiZ2WcNjTHqOxxRrjfNA5ObdYE3r/0QUybYg1gwr6I
	 q+8rVbHfUcB6nKMl4A/bAmxKF7g+ol8WPhfRjm+DaVq+amSwBlb6LG4loLN2awgLoi
	 hJMgqa4GrTufEJ5eU5jrhMBR8ogw8wxUWATAaBqsjdb51YxAhN5B5SZQ8qgpNSg2EV
	 6dzLdhFsxcEmw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 13:00:18 +0300
Message-Id: <D3H8YIUZJ1ZV.2OM1ZTSQVJRXY@kernel.org>
Cc: <keyrings@vger.kernel.org>
Subject: Re: PGP signature patches
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>, "Roberto Sassu"
 <roberto.sassu@huaweicloud.com>
X-Mailer: aerc 0.17.0
References: <2493611.1723748374@warthog.procyon.org.uk>
In-Reply-To: <2493611.1723748374@warthog.procyon.org.uk>

On Thu Aug 15, 2024 at 9:59 PM EEST, David Howells wrote:
> Hi Roberto,
>
> I've found another use for the PGP patches: modern Lenovo laptops have an=
 EFI
> variable containing a list of allowed keys - but they're in PGP form, not
> X.509.  So we're going to need a PGP parser to cope with that.
>
> I would like to look at getting the patches into linux-next at least, aim=
ing
> at the next merge window.  Do you still have a reasonably up-to-dateish b=
ranch
> with them on?

Is this possible to emulate with QEMU?

>
> David

BR, Jarkko

