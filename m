Return-Path: <keyrings+bounces-2485-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063CDA69403
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 16:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FFB1172659
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 15:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20DC1AA1C9;
	Wed, 19 Mar 2025 15:49:04 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968B1B0F1E
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399344; cv=none; b=dWbyWpsBHCnhwpnFmFHuTLm3Oearnhg04RMX0GmW9aI2aXGaLWH9iaBwxSh8+oDoqeb7t1A7lZuVtVH65VdtK2L9nDK7ngsgA7TLia3+5J9hCo9xEwl1IIUORxvP9QvokAsyClNOBqxkG9Oa2Ln1j6oXtxDBuDVoiPmYqDBPybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399344; c=relaxed/simple;
	bh=fcWnykL2D+X3lsK2+aZi+h5+Y/7JPhjSfSZX8mz6iQE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Qhj6ly5rqDL/meeDZ5X6ldPdlBZQuX53ckDWSZCFmjAkmQQ2QEX82Tlw9nC5BrMm1yZBvU9Q8O2TB+q/dtDPA3r/odXOvJ6Zbblg7U/GlRxUz/ug7J3/hUBkUYGNldKat0/1v10s81lys+qjDhjelMs9vA36X+39E7VFz5DGqHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b402f69d4so700107039f.3
        for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 08:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742399342; x=1743004142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cU5MsUCPLlub46H1EeBsFjmZwiNLwRWEGXg3sa+2OEw=;
        b=VVcdhMdxVh23eKmFyiWZPTYgZK2yUNFsieBvzi82/M8JUYqO/xLnbzta39quXtCzT+
         Ou15DrJy+nilt3tTNB1VrD8je3wUgi0rkOgHfrdBc+fJTYgKv85ON/TKwL1OyreDPoPQ
         /7gQKx2b4nh+fNH4k6wDPvCSABGlGLY0f32OOkOy7NmoctwBsAB5OUgI6ZuJUWGdIG0m
         dsSpOi3P2muWpu+I2LqpmebyWzoj4ZqM+G2UnOFLocztxmUI0FjzEGB4k0Pfq7Pq4qRY
         F4p1ahWUiaLPx8DblnXHQqAakdVKJ37Lr/BwUEvc5ykiT4cKJdrVStLLJxGtl1eLJOn5
         tz5w==
X-Forwarded-Encrypted: i=1; AJvYcCV6H1bDX2QTRV0HNbVg84uLImfpriVXn9hAgvw3a429OmxAGrXWO28gXtUd1mQa+mWMolzMTdB2ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyireGZi8+tVxlfYTbk4yx1q4tKxaZhp1hoCUv/5WMOUFmuyrzA
	SHIg9geggcXcQczfEoejPtpYvbPxbXz5pmhTSZwFd611D2YZT4398WG2mTEQYhB++7Em1PBtqLB
	TrvJXucsZLNARgKeFKlert7MUThUOj0UrnU6vtM8u9Vd/H41CcmkDBw4=
X-Google-Smtp-Source: AGHT+IHigf+/jbu+BrDOZ0kUNEQZh8ja/sQ5P27qFvtFb3664GIL+McAifFSK3M9l9uXqP9Hc3TcZOIAlW7XNZTiIoNPl0IQs5eu
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e9:b0:3cf:c9b9:3eb with SMTP id
 e9e14a558f8ab-3d58695fc90mr26735465ab.0.1742399342212; Wed, 19 Mar 2025
 08:49:02 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:49:02 -0700
In-Reply-To: <2831141.1742397619@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67dae76e.050a0220.2ca2c6.0199.GAE@google.com>
Subject: Re: [syzbot] [keyrings?] [lsm?] KASAN: slab-use-after-free Read in key_put
From: syzbot <syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com>
To: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, oleg@redhat.com, paul@paul-moore.com, 
	serge@hallyn.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
Tested-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com

Tested on:

commit:         81e4f8d6 Merge tag 'pmdomain-v6.14-rc4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1216744c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=14213ea05709bce7
dashboard link: https://syzkaller.appspot.com/bug?extid=6105ffc1ded71d194d6d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16bb93b0580000

Note: testing is done by a robot and is best-effort only.

