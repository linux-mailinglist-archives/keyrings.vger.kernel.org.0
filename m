Return-Path: <keyrings+bounces-1665-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101291E575
	for <lists+keyrings@lfdr.de>; Mon,  1 Jul 2024 18:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2D81F239DF
	for <lists+keyrings@lfdr.de>; Mon,  1 Jul 2024 16:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAF016D9C9;
	Mon,  1 Jul 2024 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BhWuFcOi"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EF16D9D9
	for <keyrings@vger.kernel.org>; Mon,  1 Jul 2024 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851755; cv=none; b=Tcg2SqfCRkcFeSqugUjmtGl1VuQbYXP11TuKos7M9KLJGFfOnY9ZyGrLTMntZ4ONZ2ZqoV3vzgi5G6jxBPViMJ3rg2pFSTMxTbcT4Cow1dLa0j/YVcmCcCOLeYxHDE5Okzzbqmtd7JrYHnQzUZLj789duUxxTmjZmSmqc6YjeB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851755; c=relaxed/simple;
	bh=YLGmbdUVgoClE4zgm/y2rPqET0D9fHrQj2RcTVt3beo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RALTIg11Ig1faTp17TMF+/f3Rzl6ATyPn7nJ5oeL9jDty9PKeW7MYMmfxWKnyKue2TnZqYNW53vF3yFYeQujXCbCojR/YzkpuqNaflGkq/i+Muz238AWILk3ANm5Ja8bfTlzv/+r8xv2NBCvW//8rsOvIC9Hy3bHLpghjoXKit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BhWuFcOi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a724440f597so393887766b.0
        for <keyrings@vger.kernel.org>; Mon, 01 Jul 2024 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719851752; x=1720456552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Obs6N/BH5UkcS/x22yz2VPLEj/fFFqodHfDKGoUVc5k=;
        b=BhWuFcOiCnoR5G3m80+TbhSTHBl1eX+HdmSwzgRU4iW2dCq6Djfw6iTd4rpAEikpwU
         xr7WOCl8hClHoyn2OoeVnGBf0wWocdBDc1uCBPf6BBYUXeJu1aI2oJoGiUhsVZKsPtHI
         p1VTft6GmwsIORd+8U77OPI3rerypDSZmRiVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719851752; x=1720456552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Obs6N/BH5UkcS/x22yz2VPLEj/fFFqodHfDKGoUVc5k=;
        b=kIf/2t3UuAx/Oy6C1zMrZnuiZwprPROTkEG78ZpnuSYdaSaVTRTpiXk4K9yxOAT4Ov
         ZsfLRW3qzDbfuMt5PBWLYdNtVMwsvz4v/SQpd/pUX4PaRK2oq+akZv8I4dw+P18nqaXE
         H1iOvgedTajhrTHNHbLmWXCV7J6iduovdg1vieTzz5L2OttQsdMoaVchcdyC9TzDgM3h
         cXiW3ga0Zts5+tCTcKKuyNHEN7Z6A8T2ZIU4KZ9q8P+g/pu8oLxWGMzTQmLLCKamyjbh
         kkUmjSZe68AQEN/JHdxpPJJ0VC9uF+yJY1SlAJ8AQlKjlIQZOuSE24BfzBCDbJOi4Cr8
         Olyw==
X-Forwarded-Encrypted: i=1; AJvYcCVeFkOMucIQ1JNrxQEIMd4yofus5xUxqdvV2I6ts8lXC5ELWWr1BV3osL+4ob4f24D9D+5t5YLYnIvcw6GrGXT00SebCMy8qAw=
X-Gm-Message-State: AOJu0Yw+iBAhmqXbg3jLfuW1F+8ZcEH2dzZNwcgFTzeUSiXOjtjA2D/w
	4wEAmGfaVzAc2j7Y357f7TeXXk9Z5Ih+qv81LQxPgRXxG5ZnR7zTsnNiWeb0j/qvN3dtiT4hr9v
	qSlQ24g==
X-Google-Smtp-Source: AGHT+IF5C1nc/D4X1AVAOxZXB4IzhZei5uMWHvfnBebNcEJve16J062bp5RZ0HB2QJjon4DyLnlKJw==
X-Received: by 2002:a17:907:3d8f:b0:a6f:576e:4d32 with SMTP id a640c23a62f3a-a751441f084mr532237266b.4.1719851752149;
        Mon, 01 Jul 2024 09:35:52 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aafba2cesm348766466b.93.2024.07.01.09.35.51
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:35:51 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a72477a60fbso381908766b.2
        for <keyrings@vger.kernel.org>; Mon, 01 Jul 2024 09:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6khV5eJ8WHYXfz8zhT2Im65UN110cxW8NrdYvRWLpPw/5N8p5IDRg3yjGRMaS4UrpRmmjX8VyDebFd2cfzsZYCB2lCcyWsdY=
X-Received: by 2002:a17:907:724c:b0:a6f:5698:ab5b with SMTP id
 a640c23a62f3a-a751441edbcmr548618366b.8.1719851750079; Mon, 01 Jul 2024
 09:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D2EBML829ZJI.1XZZVLVGUXRBH@kernel.org>
In-Reply-To: <D2EBML829ZJI.1XZZVLVGUXRBH@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 1 Jul 2024 09:35:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYe22cLAF=LmZwRu3VOf80LO6XdsdYt3Lhb_TEJ0XnPA@mail.gmail.com>
Message-ID: <CAHk-=wjYe22cLAF=LmZwRu3VOf80LO6XdsdYt3Lhb_TEJ0XnPA@mail.gmail.com>
Subject: Re: [GIT PULL] TPM DEVICE DRIVER: tpmdd-next-6.11-rc1
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, 
	keyrings@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jul 2024 at 08:51, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> Contains couple of bug fixes.

This - and your keys pull - say 6.11-rc1 (and say "next"), but don't
really look like the usual merge window stuff.

Just checking.

            Linus

