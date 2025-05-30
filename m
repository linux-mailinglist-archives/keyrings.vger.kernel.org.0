Return-Path: <keyrings+bounces-2778-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A85AC9821
	for <lists+keyrings@lfdr.de>; Sat, 31 May 2025 01:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4281BA0061
	for <lists+keyrings@lfdr.de>; Fri, 30 May 2025 23:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55B421772B;
	Fri, 30 May 2025 23:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBJlGDdA"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0048186A
	for <keyrings@vger.kernel.org>; Fri, 30 May 2025 23:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748647950; cv=none; b=A1Y8PJKedUTT2DPnpUR0TS6E6k8H97Pm3mlMXk6EhdQZl1/0ems0bNS+P5MBqIewbmqLPU5UGg8pZclKKC7E1sb/nj83ocvnROwLRNyvaxFRYQajscbO/9meUdnujfFEFSAxhLrw7R3l3LxAXmW7RtMDjOP7V2G8HwaRfzjLsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748647950; c=relaxed/simple;
	bh=kggCqTMPG5sotUIYA3iRlmrG1UM6sH0EEjF6Bj7Gd/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3vv/67Fg3ri+Al8Q8quDMVa54Ce7WmgNMXYfeY4GHC+LwHQ19LQxAP8uARC0yXv4LPE9EQ2nhSdEHG/QIGgf8bsom1Wat859ezjQQpTYzzvf7dTobturabJh9ENxAr5gAe8VskV0f3e5BUP7U0M49Hjl1ePgB++GZrXl79vJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBJlGDdA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BE9C4CEFA
	for <keyrings@vger.kernel.org>; Fri, 30 May 2025 23:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748647950;
	bh=kggCqTMPG5sotUIYA3iRlmrG1UM6sH0EEjF6Bj7Gd/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MBJlGDdAy/YjAIoESj63/k2Kd+PzzEmI3LV/Tu+LxRHW+sOsSJZxlosyV/cjmOrCf
	 MyrKHMVf+ZEVApBUQaFCuh0F97bYgEgLH6PrkIdhA6upA/TMLqW8OvdXZEDOf0R+ld
	 P6ybXSaEnFLariJo6jqHFdxRgbBLmU/7pdZUYiUjG+BAqS9anvN1Kgmm7wQvlVYhKy
	 iTl+Pv+L/XZCVmwdtFLch/puQk5Ecbv8uPRzopnkmaQ7MZYrDo2Vfyfl22H2BQrh9j
	 qE3S5UggUGzGlY1Gs7aNY+rDik1UkriA2OAfsgEGUJpcqO+l61uYOf/EKwzxN0zVAe
	 9g6sRVE+kZAvA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6046ecc3e43so4014813a12.3
        for <keyrings@vger.kernel.org>; Fri, 30 May 2025 16:32:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIWLYAEjShu+JW2a8SlOFE3NYD5dxVFqjaftFYdQX7Ob6yw2i2W8VxmlKbTFc4ol8PcdznykdwZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEsLPXlQbadw252HvhswxoLwJbNceeVauKqjzKbkR1SNfCDpg0
	W3glllqAKl6v8gt6S294J9Ny4IEfEifw9S90wS6wQL+/R24cTwa07iHI85Aj42nFt+LM76bMYDW
	QyLh/Gb8taONyf+CG46MHaw579G0CbyQWSKtB+PlL
X-Google-Smtp-Source: AGHT+IGnT7gcHCA6T9nJz/Po1RVmey5EX60YKSUOFtgmIA3wDq2w5CiZNs8pkH3x66RYx+isVTtJ5wHdkcQjB7rhyEM=
X-Received: by 2002:a05:6402:84e:b0:601:94ab:790c with SMTP id
 4fb4d7f45d1cf-6056e14ca18mr4710890a12.18.1748647948800; Fri, 30 May 2025
 16:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528215037.2081066-1-bboscaccy@linux.microsoft.com>
 <CACYkzJ5oJASZ43B531gY8mESqAF3WYFKez-H5vKxnk8r48Ouxg@mail.gmail.com>
 <87iklhn6ed.fsf@microsoft.com> <CACYkzJ75JXUM_C2og+JNtBat5psrEzjsgcV+b74FwrNaDF68nA@mail.gmail.com>
 <87ecw5n3tz.fsf@microsoft.com> <CACYkzJ4ondubPHDF8HL-sseVQo7AtJ2uo=twqhqLWaE3zJ=jEA@mail.gmail.com>
 <878qmdn39e.fsf@microsoft.com> <CACYkzJ6ChW6GeG8CJiUR6w-Nu3U2OYednXgCYJmp6N5FysLc2w@mail.gmail.com>
 <875xhhn0jo.fsf@microsoft.com>
In-Reply-To: <875xhhn0jo.fsf@microsoft.com>
From: KP Singh <kpsingh@kernel.org>
Date: Sat, 31 May 2025 01:32:18 +0200
X-Gmail-Original-Message-ID: <CACYkzJ5gXf4MOdb4scid0TaQwpwewH5Zzn2W18XB1tFBoR2CQQ@mail.gmail.com>
X-Gm-Features: AX0GCFv_7BJJSl838TozCcwnoaszDpfbe-yzu3mWadgSeXOyob3Yk8byF4z0Rt0
Message-ID: <CACYkzJ5gXf4MOdb4scid0TaQwpwewH5Zzn2W18XB1tFBoR2CQQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] BPF signature verification
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Paul Moore <paul@paul-moore.com>, jarkko@kernel.org, zeffron@riotgames.com, 
	xiyou.wangcong@gmail.com, kysrinivasan@gmail.com, code@tyhicks.com, 
	linux-security-module@vger.kernel.org, roberto.sassu@huawei.com, 
	James.Bottomley@hansenpartnership.com, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, Quentin Monnet <qmo@kernel.org>, 
	Jason Xing <kerneljasonxing@gmail.com>, Willem de Bruijn <willemb@google.com>, 
	Anton Protopopov <aspsk@isovalent.com>, Jordan Rome <linux@jordanrome.com>, 
	Martin Kelly <martin.kelly@crowdstrike.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Matteo Croce <teknoraver@meta.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, kys@microsoft.com
Content-Type: text/plain; charset="UTF-8"

> And I'm saying that they are, based on wanting visibility in the LSM
> layer, passing that along to the end user, and wanting to be able to
> show correctness, along with mitigating an entire vector of supply chain
> attacks targeting gen.c.

What supply chain attack?I asked this earlier, you never replied, what
does a supply chain attack here really look like?


- KP

>
> So in summary, your objection to this is that you feel it's simply "not
> needed", and those above risks/design problems aren't actually an issue?
>
> > Let's have this discussion in the patch series, much easier to discuss
> > with the code.
>
> I think we've all been waiting for that. Yes, lets.

