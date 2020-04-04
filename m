Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7958119E778
	for <lists+keyrings@lfdr.de>; Sat,  4 Apr 2020 22:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgDDUFV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 4 Apr 2020 16:05:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgDDUFU (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 4 Apr 2020 16:05:20 -0400
Subject: Re: [GIT PULL] keys: Fix key->sem vs mmap_sem issue when reading key
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586030720;
        bh=0D6rNwDCyX/8UGV2BnkG3oNh97ge3r3+D/9F0mEmuaI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=XSZcrygNc7toYpUESW2Ti/40QiqL7LFjijZt0RKbkYQxQwNri7tk+81sdgAJYK0JC
         6kN7cyzWNfD159AjT8M8gDWCYdDRvMiQnelBCI6XqFS8mM/+Bql6yV1gSnMDY0Tyqm
         k2zNUMLplJ0I+dvMiqldwylxq4uoGf60W2BRJa5s=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <1437197.1585570598@warthog.procyon.org.uk>
References: <1437197.1585570598@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1437197.1585570598@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/keys-fixes-20200329
X-PR-Tracked-Commit-Id: 4f0882491a148059a52480e753b7f07fc550e188
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c205c84e249e0a91dcfabe461d77667ec9b2d05
Message-Id: <158603072028.17464.2702740836511365562.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Apr 2020 20:05:20 +0000
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org, dhowells@redhat.com,
        jarkko.sakkinen@linux.intel.com, longman@redhat.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The pull request you sent on Mon, 30 Mar 2020 13:16:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-fixes-20200329

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c205c84e249e0a91dcfabe461d77667ec9b2d05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
