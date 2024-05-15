Return-Path: <keyrings+bounces-1230-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5528C6AB7
	for <lists+keyrings@lfdr.de>; Wed, 15 May 2024 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9292831F9
	for <lists+keyrings@lfdr.de>; Wed, 15 May 2024 16:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24602577B;
	Wed, 15 May 2024 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjbN3xZn"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683D22F03;
	Wed, 15 May 2024 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715790908; cv=none; b=h3GtanB5dF/SjjPrPymQRS66p19Ap9yw/unThQ0XviZuTIMMrh4AkwvIAxmt/R2WEB4zRWcIXFut3nudw9u+kWTWtScexZTX47Igrt3zy3kzlcwPxVIEkdnhpc18kts7TJFSZ91oWZy+wDmQT+TTrnCnjnPzQi0ONILvf70dZ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715790908; c=relaxed/simple;
	bh=nSEdk46XFZkgCNkeugff7e4E3cc9kb1cfjk3Mnel1CU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F5mdtgbRKNEPck3h7pwCAz+MG0wMxfY5EK+7TzR2Leva7nN67cA6+za2xNnGkaJJngSejuoMqsTJFUgz8riarN48DO6gObJNB+c1FNt4JarUFtOmW5Nh7L36hPNx4PozY7aCb52q5bico6crcaBMGKHO93tWS7GAS+vMMF15joA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjbN3xZn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73CB7C116B1;
	Wed, 15 May 2024 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715790908;
	bh=nSEdk46XFZkgCNkeugff7e4E3cc9kb1cfjk3Mnel1CU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QjbN3xZntB/jet76rwfcY9+FZbMJLrhCglEbFHUowx9CWUBRwPSNbVy9+ci8xkOR7
	 /JL34tb0Tjf4SHH6q0ly85/I0geeL0uQceKuscMZRU0KJM9Oz7OurbWwACu7nDjFK7
	 sPSj6GDp7TX2JYY+/iYALEit2DZt6ClXhDjAyw1q+yOkbUcxan4ZNrf26+SKvRx3yT
	 gPnXZ9EzuAw3Q/Lr/qdEgKbGYKoAiDdzpIOosDPFHYDpiunpN7xCNnSUNITTXzwSQv
	 XP705dTcnlb7gzwT65TZzTKx2Ehi0OMGCkI3mLJj1SAV1OCzVh1kaNleuKUr2ZOyMn
	 sPgBBRxR43uyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D117C43332;
	Wed, 15 May 2024 16:35:08 +0000 (UTC)
Subject: Re: [GIT PULL] ASYMMETRIC KEYS: asymmetric-keys-next-6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <D1909NYKXM11.3VLXHOO4NA7RA@kernel.org>
References: <D1909NYKXM11.3VLXHOO4NA7RA@kernel.org>
X-PR-Tracked-List-Id: <linux-crypto.vger.kernel.org>
X-PR-Tracked-Message-Id: <D1909NYKXM11.3VLXHOO4NA7RA@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags/asymmetric-keys-next-6.10-rc1
X-PR-Tracked-Commit-Id: 747ae81883d21595b162cc40523a982024700fed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46c6d2b186915176be5acc5d4b6f9793eb32a0c7
Message-Id: <171579090844.28973.97804562965046429.pr-tracker-bot@kernel.org>
Date: Wed, 15 May 2024 16:35:08 +0000
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 14 May 2024 05:18:25 +0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags/asymmetric-keys-next-6.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46c6d2b186915176be5acc5d4b6f9793eb32a0c7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

