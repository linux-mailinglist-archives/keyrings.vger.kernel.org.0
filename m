Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8089A32353E
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 02:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhBXBYg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Feb 2021 20:24:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:36619 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231591AbhBXBGZ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 23 Feb 2021 20:06:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 79C2764EC3;
        Wed, 24 Feb 2021 00:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614126737;
        bh=jOJmSCxtenO1WTtfL7d1uP4jeqm3TLos+sg+rh3P7pI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=q/R/xA7ZNgWlqegXEi6CPoImKZT00/Ze/oDKl4UUpwwlit1kqYViSzgwJ0WN7cu49
         F7daU7OqW/5l8IuazW/f6t8gn2YoVjAEZ79/NYaY7x0Wg7koIenIPWja3ybzzSfneL
         CObP3rokZiK66bM1xtWtu4hX4qJbXxhrn+Tl5+sUABFqpbTDGfXFqsmfX9jSkGvxcv
         3STQXzSvyx83oLSfVHOxNTUqN5MiwwG5tHLnSEatGT7zJkVNl8vpwzY1svqsWrG7vs
         BaFLuITpYs4s3ULokcvOmCVy1bxYeAOVRpQ0ic2XsfRwf2SWri7aPbpi2Q5v4btWg1
         FYaAe+VsXb08A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 638B2609CC;
        Wed, 24 Feb 2021 00:32:17 +0000 (UTC)
Subject: Re: [GIT PULL] keys: Collected minor fixes and cleanups
From:   pr-tracker-bot@kernel.org
In-Reply-To: <1322896.1612969174@warthog.procyon.org.uk>
References: <1322896.1612969174@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-crypto.vger.kernel.org>
X-PR-Tracked-Message-Id: <1322896.1612969174@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-misc-20210126
X-PR-Tracked-Commit-Id: 8f0bfc25c907f38e7f9dc498e8f43000d77327ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c03c21ba6f4e95e406a1a7b4c34ef334b977c194
Message-Id: <161412673735.16978.8992204250231676229.pr-tracker-bot@kernel.org>
Date:   Wed, 24 Feb 2021 00:32:17 +0000
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org, dhowells@redhat.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Ben Boeckel <mathstuf@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jann Horn <jannh@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The pull request you sent on Wed, 10 Feb 2021 14:59:34 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-misc-20210126

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c03c21ba6f4e95e406a1a7b4c34ef334b977c194

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
