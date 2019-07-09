Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB6A62E9F
	for <lists+keyrings@lfdr.de>; Tue,  9 Jul 2019 05:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfGIDPN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 8 Jul 2019 23:15:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:32796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727540AbfGIDPJ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 8 Jul 2019 23:15:09 -0400
Subject: Re: [GIT PULL] Keys: Set 2 - request_key() improvements for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562642108;
        bh=bhI5nRtP7I46rw87zwlc1TgXY5dZsMFgbNno8ecg+WI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=f3oUwImdKjQ6v12txKshRctFBzFNQBLY3DqIiYTrWn/QCCpXd5n5NBiNuUcbV8tN5
         RCsHiTBzFAxgRmrRvkeS9ssn2XGgLXdsig0eI5K5t0KyQ8QA2cPKDHFJzzV4t2t1KG
         mZjJh/0dcxj8V9wPRgb43dH3K/fQ4nyX+xW7k08A=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <27327.1562361214@warthog.procyon.org.uk>
References: <27327.1562361214@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <27327.1562361214@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/keys-request-20190626
X-PR-Tracked-Commit-Id: 3b8c4a08a471d56ecaaca939c972fdf5b8255629
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f771fde82051976a6fc0fd570f8b86de4a92124b
Message-Id: <156264210874.2709.11032841563948507768.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 03:15:08 +0000
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org, dhowells@redhat.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The pull request you sent on Fri, 05 Jul 2019 22:13:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-request-20190626

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f771fde82051976a6fc0fd570f8b86de4a92124b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
