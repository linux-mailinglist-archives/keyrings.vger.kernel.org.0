Return-Path: <keyrings+bounces-2305-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8E9D1AAA
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 22:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CEC28316C
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 21:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3931E6DD4;
	Mon, 18 Nov 2024 21:37:06 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1A11E47DD
	for <keyrings@vger.kernel.org>; Mon, 18 Nov 2024 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731965826; cv=none; b=B0W8bSi8XrNFPX9ag2XUweCxhhU1uDuBteBkuCBMQYuYJxjp9bhkNyP0QXSAlmpXWfRisX9U0Rd4GCfEz1nbp6vKvJmpgripl4ZS91/i4B7T71hcMtmi97mTm13tpzRtWG3iMNzdlwCTpGE/rIJrlGeUXa+dK0Gdy0bVcjJ6EL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731965826; c=relaxed/simple;
	bh=AD8RL+a16qS304XyMe5fRqoLGy5XqE4pyAEjYUVdeB0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aMZYf2fwPCF4yA0Lb4ZDXXf6zRNeACeRbu5CW/2jlVyatJa8S3iJ3yJQlDEWRRAYvlcWeeGkiYBQcPEx4mdba4F/YTu5qNOVuWynhYlWhfYr7TZ+dHX1vTI+s9/ZY3vP8p1o9pv2LRdKQqOAadF65yXyhTaQZeb0IJ5CnQENWRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a6b7974696so29915105ab.1
        for <keyrings@vger.kernel.org>; Mon, 18 Nov 2024 13:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731965824; x=1732570624;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nICKXi7/BY4L+b4MgIKYet21aV0bch1WeZjTtJNx1VM=;
        b=cigjqlRWYp8XOjpyslRntV8yBRGEwM1W2N1k9p0i/qF/8XSPtWw1ly7eb7AqfDgUOh
         //aJyBjyEacFAJvyf6yzr+aWQPu6YpwdCGbK6wsLagbRw5n4zf0pDsDUVnS1E4HygzHn
         dSCR37QoE6IWuba1hO6EPlv6i9t1zI1OmeSFetLIS7mwZzQMVpMqNE1KUo6zYN6sfQeh
         P/VJN2SGzZP73leXlnfwlF9MYyhMdtW7tla+a9A1/MClu601p6m09Yd7Uhs7S4t8XHcD
         u1bk+R5UEreAjvuLXp634zqMpSqsIWiRPfCTFdNmGd+Xk0jjriMWX6DQWHhkcow9CQEq
         YjEg==
X-Forwarded-Encrypted: i=1; AJvYcCXMo4mCZaNThIfFIUNBOVsWC0eQmuidlTIlc5uC3nYibBqbgOsdPnR5v7XRx9VS00e63giMHq7ycg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRr9sjH3ykJf1yygrM4GhHuJP2vm7Grz2J8kBdYO6Fcby/WlUn
	rUDJOoE4xWEDEdQ72BMLructSfVnVhaqU6mO581ahgoMm8mQ4kuBXiDXh0LyuCDaJvhZs/R33ID
	axhmrNuMePO0aAIXPhcEEWoCoYfZO147ZGLPKOvk/0xb1siqoYuTbmHo=
X-Google-Smtp-Source: AGHT+IGJW+n7lvA83sJnLZWBSzq5D53guT7v7kIGh3rmiBABzveN4sxuyZ+8da1KEFDylZ92PG81tcaxMFqjeI71tSx+BKKbO1L+
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c2d:b0:3a7:74e1:d54d with SMTP id
 e9e14a558f8ab-3a774e1d777mr22152385ab.21.1731965823827; Mon, 18 Nov 2024
 13:37:03 -0800 (PST)
Date: Mon, 18 Nov 2024 13:37:03 -0800
In-Reply-To: <CAHiZj8j7dp5L_A_nvN4zv9q9qH865MDhhzgEgtZUBMq9H1gPMg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673bb37f.050a0220.87769.005d.GAE@google.com>
Subject: Re: [syzbot] [keyrings?] [lsm?] KASAN: slab-use-after-free Read in key_put
From: syzbot <syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com>
To: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	surajsonawane0215@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

security/keys/gc.c:146:40: error: 'KEY_IS_DEAD' undeclared (first use in this function); did you mean 'KEY_USR_READ'?


Tested on:

commit:         9fb2cfa4 Merge tag 'pull-ufs' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=55f8591b98dd132
dashboard link: https://syzkaller.appspot.com/bug?extid=6105ffc1ded71d194d6d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1781eac0580000


