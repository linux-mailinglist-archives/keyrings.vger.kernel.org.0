Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833F362E9C
	for <lists+keyrings@lfdr.de>; Tue,  9 Jul 2019 05:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfGIDPN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 8 Jul 2019 23:15:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:32782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727193AbfGIDPJ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 8 Jul 2019 23:15:09 -0400
Subject: Re: [GIT PULL] Keys: Set 1 - Miscellany for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562642108;
        bh=DTsjYMo4hXZJwEifoFQ9oCkFLKg14iT6hgBB03U8Md4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jDSdzA21h9mGbPGZg8pjBONTeSE/aNOu/mVMuNlvcDsUzeZw4m24J+Su+7a/p3tSV
         BmlsQlhDOP28k+evsDH6rJZaedRu7cy2sg/+AAHq/hiwgrCqbOrgewtReti2zQiaBp
         LDanZi+czEP4zcVkAk/tN0jETySGy0uDcp/LrC+8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <26702.1562360619@warthog.procyon.org.uk>
References: <26702.1562360619@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <26702.1562360619@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/keys-misc-20190619
X-PR-Tracked-Commit-Id: 45e0f30c30bb131663fbe1752974d6f2e39611e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 504b69eb3c95180bc59f1ae9096ad4b10bbbf254
Message-Id: <156264210818.2709.2723899358322424793.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 03:15:08 +0000
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org, dhowells@redhat.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The pull request you sent on Fri, 05 Jul 2019 22:03:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-misc-20190619

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/504b69eb3c95180bc59f1ae9096ad4b10bbbf254

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
