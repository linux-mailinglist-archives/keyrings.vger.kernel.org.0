Return-Path: <keyrings+bounces-4-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773BC7DC693
	for <lists+keyrings@lfdr.de>; Tue, 31 Oct 2023 07:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 702981C20B72
	for <lists+keyrings@lfdr.de>; Tue, 31 Oct 2023 06:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C145A107B1;
	Tue, 31 Oct 2023 06:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlSJ4HKm"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309110793
	for <keyrings@vger.kernel.org>; Tue, 31 Oct 2023 06:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC54C433C8;
	Tue, 31 Oct 2023 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698733884;
	bh=OwuTtx0ItHxe3rWs/AoMoxVp7i1xEfACsLHLApddvJk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QlSJ4HKmB62jTMfMLg5jnQcpInkVrQ/ab0Mspmexn+2DGWlG3fgFa2hfohePF60qe
	 4bRlSEzFqibC6daVk9ZO/g3bGHfJHzGcegnYYKP7Yl+ms0fT5lrJNX5aig4gQeA6DH
	 biyLRBSw8hOKwNKApzTblA9pMAYMyN2Q8bW397e672LICgUjSrye0Tx1UBhnC3wWGN
	 7FPMqHHbWbfzBgn7JTlb3N30DkFpd5WCZ/Aml27A3Cv2SlJbPhmPMVRlD4OjpashN0
	 bgSYLhgtWAvok1HgpHkyQXNAbKvc5lPAl0F1ayioF+hzh8ftJqKlC4wDdfArsqtqBC
	 85B6LCqFIYDvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09DA1EAB08A;
	Tue, 31 Oct 2023 06:31:24 +0000 (UTC)
Subject: Re: [GIT PULL] tpmdd changes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231024002514.433180-1-jarkko@kernel.org>
References: <20231024002514.433180-1-jarkko@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231024002514.433180-1-jarkko@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags/tpmdd-v6.7
X-PR-Tracked-Commit-Id: 03acb9ccec3f8cbcc0ed93c188b7a119ef30ef64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9ff774548cd91b45003b3b0d41f15cd52b25509
Message-Id: <169873388403.12768.7313939775437378549.pr-tracker-bot@kernel.org>
Date: Tue, 31 Oct 2023 06:31:24 +0000
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jarkko Sakkinen <jarkko@kernel.org>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, Mimi Zohar <zohar@linux.ibm.com>, Sumit Garg <sumit.garg@linaro.org>, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 24 Oct 2023 03:25:14 +0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags/tpmdd-v6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9ff774548cd91b45003b3b0d41f15cd52b25509

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

