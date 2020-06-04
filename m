Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C26F1EE97B
	for <lists+keyrings@lfdr.de>; Thu,  4 Jun 2020 19:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbgFDRfH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Jun 2020 13:35:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730083AbgFDRfH (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 4 Jun 2020 13:35:07 -0400
Subject: Re: [GIT PULL] keys: Changes for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591292107;
        bh=r7M5q0iHyfHGyBRKj6jAheCd58vLXxbeaRkdNijLQxw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=iq5GnctdVbfiV74Ky9wwKSBkE0lGnZshu35uJ+t44i9t3k3vNvmPIrmDhrHJetTTt
         brpyuloVMBJkCAjSMSdLww/z1SS2lHipxdd5rnRTHCCPMU4CqriDKP1VxzR/mlthjy
         OfbV7+oXUhuEYnzw4NEm2S1s5V5395sfU+zQSNo0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <1509351.1591115280@warthog.procyon.org.uk>
References: <1509351.1591115280@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1509351.1591115280@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/keys-next-20200602
X-PR-Tracked-Commit-Id: b6f61c31464940513ef4eccb3a030a405b4256d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a484a497c98a0447aca2d70de19d11b1d66e6ef7
Message-Id: <159129210706.22790.7029741775337917188.pr-tracker-bot@kernel.org>
Date:   Thu, 04 Jun 2020 17:35:07 +0000
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org, dhowells@redhat.com,
        jarkko.sakkinen@linux.intel.com, mathstuf@gmail.com,
        gustavoars@kernel.org, Jason@zx2c4.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The pull request you sent on Tue, 02 Jun 2020 17:28:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-next-20200602

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a484a497c98a0447aca2d70de19d11b1d66e6ef7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
