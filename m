Return-Path: <keyrings+bounces-2313-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA39E6822
	for <lists+keyrings@lfdr.de>; Fri,  6 Dec 2024 08:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58B9168736
	for <lists+keyrings@lfdr.de>; Fri,  6 Dec 2024 07:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05437197548;
	Fri,  6 Dec 2024 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkjF+EAF"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FE13DDDF
	for <keyrings@vger.kernel.org>; Fri,  6 Dec 2024 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471182; cv=none; b=uVm6kjKFSii++z3p32pi++Eo7kF+FW7wne++MR/ud70faeBdjMuG/F5UhmprFxeQaQi8o5QdrejgEa1X71XKMMjZ5TTJ+h7nq1umnpUg9Z5G62UUl3yFla9p0cVQRcHRd4nNIBYB/idI2FIE32pbgRgQiw/2yl16obNh4FPceT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471182; c=relaxed/simple;
	bh=tPv4OOeD0gjIOZkECyAvR4dnHfIfx1W4nFgN8YXR6fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=dq5m5lGEOf0C30f5Kb4aQymA44jD5EUhKAJDGY7ab13u8f0vpeHPoUFTMDIOcnFbLxMFit93zWB7diXseM9dHwgkTbcnb0hhmhYjzDHZyyP/8d4rDrtZDy9eM1k+oVN8SZH8A6yk2RO7wYW9sMUJqE4QoF4J+fpHRlEEoYRHvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkjF+EAF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21145812538so14503825ad.0
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2024 23:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733471179; x=1734075979; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOFUZ9gV6La6sfZjXBczKJ4Mec0cKF4N95da3Hhde70=;
        b=IkjF+EAFD6WP5jqXeVjGH86nT9paOefwNzYl57mzNGjoMtkjRrv83qTMUMnTkvYLsS
         hccX/pBs3bPBI9L6DNNqCSltu5WPPJ0WCKrl7X1eNCLp0BdAF3Hsf4kTiiba1AmPGx/0
         6FCydbovILn0nWP/Qlf29cXaR5xHGjjoxtdsWibQgDl1+SJExUfNB5BROdSw0KkEzQmd
         CM0J2Zx6BLExmj1fgDlyIIONFTo3oysHziRmIDFiJaY8C4/NPq2HlKOc1ThTv/PInM7P
         CYpriRMHwidZOV1JKRGevLYnuQjlq3LN+QsgY7i0lcHjjU7ZoGZKReW2qAq0IeGde4EV
         srig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471179; x=1734075979;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOFUZ9gV6La6sfZjXBczKJ4Mec0cKF4N95da3Hhde70=;
        b=vJ9j5GyQH8RwcLpmvgdG7fFj3S8YpQhJZHrURvBJxagJGKjYMD1NOaf+GGx8ys/5EQ
         S1hARDvaBLvWcbBrIaPUD6XgqX067jY2K4HhV+Bc8Psq8H9Z4EMtG9pIGMSoNk6hI+Js
         8hWs1DycCHto1/sulUuxtreUay1uJ88ixKOZGelI5C8hy5pR6QpJFRHLWKoMXbUWOm5W
         f5ICtiajI85UdHGhcHL9CUGWcdbLzEyaFsJXL0ACsCaVweVVDcG7IQppegdBAXwrrwaL
         nQZ9oCTpNdHGJ8NInTy5NmR1e8fp41rmzQZ40IchMxRady4dv3KpnUClGYBqueoTU2lU
         jhQg==
X-Forwarded-Encrypted: i=1; AJvYcCXoWuzaxEanEw3jJmAe67BmoA6AZt5i2EfzK5PiJboDS0M7MrZpxqpOWsbMR+fvZnRaZjqyiveRLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQzpLJCg+Z8zk8LVyd/AyVB+kKcFfGhVa1pgssUSl0JrO/jIj3
	SC9VevW4FZDSzCajfnQ8L+w0IZhJG+bXV0t3GDMBDWJNZbyxqdwBitL89QHF
X-Gm-Gg: ASbGncu3ayEPwJOF833NOUkhuuRW5ejSGO+1Hyn0p5V21E5RPks/bsHs3BQuqTq2UMc
	C6HjNrRKbY4MFZ8JRMnafIH4AH486e78E4IbkZGUHeucJGDK/Z9mMXc4T1NocBCcHv0HlSww9uW
	KRD70mX8VqLNbBTKGkASJGfRIoUu4zJxBF3o+uRPX5I8MGoMS1e5ZQitXm2wEWhmzUnNQuCDljd
	jaVYhVCKaHPwNtQokliDoRhfL1vkwRB8CGG4lmZRLfhWo7/eKeDgEBzmY4=
X-Google-Smtp-Source: AGHT+IFfBf3Wo5WSegM9AhIaI9Ku/oZbtgpLCnAy5FBMiIpfociB2ByUULFmIraCKSpEHBIFh9HkXQ==
X-Received: by 2002:a17:902:dad1:b0:215:522d:72d2 with SMTP id d9443c01a7336-21614dd41a9mr22017395ad.45.1733471178654;
        Thu, 05 Dec 2024 23:46:18 -0800 (PST)
Received: from localhost.localdomain ([43.153.70.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa156sm23181695ad.131.2024.12.05.23.46.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2024 23:46:18 -0800 (PST)
From: MengEn Sun <mengensun88@gmail.com>
X-Google-Original-From: MengEn Sun <mengensun@tencent.com>
To: jarkko@kernel.org
Cc: dhowells@redhat.com,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	mengensun88@gmail.com,
	mengensun@tencent.com,
	yuehongwu@tencent.com
Subject: Re: [PATCH] keys: Add cond_resched to key_gc_unused_keys()
Date: Fri,  6 Dec 2024 15:46:16 +0800
Message-Id: <1733471176-24436-1-git-send-email-mengensun@tencent.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <D5Z646TLQVW0.2TIYHM0OCEUM1@kernel.org>
References: <D5Z646TLQVW0.2TIYHM0OCEUM1@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Hi, David 

On Sat, 30 Nov 2024 04:46:35 +0200 Jarkko Sakkinen wrote:
> From: jarkko@kernel.org 
> On Wed Nov 27, 2024 at 5:52 AM EET, mengensun88 wrote:
> > From: MengEn Sun <mengensun@tencent.com>
> >
> > When running the follow test:
> > while :
> > do
> >     stress-ng --key=64 --key-ops=1000
> > done
> >
> > We used the bcc tools funclatency to measure the execution
> > latency of key_gc_unused_keys(), and the results are as
> > follows:
> >
> > funclatency key_gc_unused_keys.constprop.5 -i 1 -m
> > msecs               : count
> >     0 -> 1          : 0
> >     2 -> 3          : 0
> >     4 -> 7          : 0
> >     8 -> 15         : 0
> >    16 -> 31         : 0
> >    32 -> 63         : 0
> >    64 -> 127        : 1
> >
> > It seems that key_gc_unused_keys() takes a long time to
> > execute, and there are no scheduling points in this function,
> > which may harm latency-sensitive services.
> >
> > Therefore, we have added a scheduling point to this function.
> >
> > Reviewed-by: YueHong Wu <yuehongwu@tencent.com>
> > Signed-off-by: MengEn Sun <mengensun@tencent.com>
> > ---
> >  security/keys/gc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/security/keys/gc.c b/security/keys/gc.c
> > index 7d687b0..14e4f1c 100644
> > --- a/security/keys/gc.c
> > +++ b/security/keys/gc.c
> > @@ -165,6 +165,7 @@ static noinline void key_gc_unused_keys(struct list_head *keys)
> >  
> >  		memzero_explicit(key, sizeof(*key));
> >  		kmem_cache_free(key_jar, key);
> > +		cond_resched();
> >  	}
> >  }
> >  
> 
> 
> This really needs ack from David.

Could you please provide me with some valuable suggestions? That way,
I can make adjustments for a version 2 based on your advice. Thank
you very much!

> 
> Get the idea tho.
> 
> BR, Jarkko

Regards
Meng En


