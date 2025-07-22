Return-Path: <keyrings+bounces-2933-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF05B0E503
	for <lists+keyrings@lfdr.de>; Tue, 22 Jul 2025 22:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C427E547EFE
	for <lists+keyrings@lfdr.de>; Tue, 22 Jul 2025 20:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9C8265CCB;
	Tue, 22 Jul 2025 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="IRVrG245"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A527E7DD
	for <keyrings@vger.kernel.org>; Tue, 22 Jul 2025 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753216479; cv=none; b=lt9LdQBflPe7bbhHQVigyajkTsi5jzqONxfK30lDOVcvN7JbT3v7TisYmm+g10bjm7NNkIfyrcFYgMlEjCcVAumE+YoROylu5aQxlbss/6ctClMi9ONMjZm2X2mLPFBlxD8TynfY7WO3uQNdU3xymvtocebRnq2u4vzEAMOF7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753216479; c=relaxed/simple;
	bh=fAx4SuEW5nG4bEcZYEBD8UwuYAsMULoGgyEKtiWdvUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GTpesMT2WaqBoH+1iOpZYNkzxxXa/MTcXJKL6s05iY5dinaJEcd4Mz+1qQEYTXkKr/jFwmHeGHhvVE9YjGisNt5eOu4ZOXgYoNBq23MJ4DjUt6vieLZLVjRVBoJkKsLP5voj0Z2eD1q6bm50qRrgY+hr1PKGnVyV6E+vhZ6snQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=IRVrG245; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-702cbfe860cso48664406d6.1
        for <keyrings@vger.kernel.org>; Tue, 22 Jul 2025 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1753216476; x=1753821276; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/QJMBZb+DpBcSJtaRxCCyoukp0oBMfIDt/D+IokmP8=;
        b=IRVrG245rSGoHwG/0muHNRkPbvq9Mi8Vtz4/47kjoZXRR+yXWHDaHAF8qjxHlL7wQw
         2fSB8Wc0KJWJQeY7Y7CD7+pPQ89ENiis0PhqryIs/EJnmRRI347CpQ0H/XuswBWns/me
         RbsWoCvDSLwDuKAhPhQ9h5YX3jdZlExItORQHqpNTHAAGiSFhFSo66uf75L6gLqlnt9g
         Sg00xmqYbgN8SlhS8f1f5I8sT6hNiy1AxJQrBG1SrKiF7edWkB/FTPSe+Rh1n5CiObPy
         8aiWattCgMvTwLw66vsMr0l8/5ASXLVqyQ77aBNMuoPJEk5LOVK5gUQxunf0s7auIBNb
         R5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753216476; x=1753821276;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/QJMBZb+DpBcSJtaRxCCyoukp0oBMfIDt/D+IokmP8=;
        b=ib09/MXFG8tULb2+byUqDBZnDXdtq0Q+pHfmQCQwm0HXLJxBA9DL0NdKYeCFYI+uK/
         Kme9Xa3+UatZhpLbS4mC8z5yIWD5FQfD5wH3iaqJ8E9YQQOCaG3Qb3UcUTLHT5Zd+i1c
         2wry9f7TdWjV6stZUHi4nW5ifSn6oJpqNPSn/HyHM4RxB7wunf5PQ28Q11DuezvxxbXV
         sV43OZpHkMDNXdve9PcI0oA9oS8icMfEICLpybceXml5+DhJ900Nbus/YfBZmLiQzdAl
         9RiGn2Ie0GkjPYy/RCV/By3m0PJOXIeM7pu/XF6sPjYR7ALJdovaD1WDnzqiLQmX5BRT
         eGHg==
X-Gm-Message-State: AOJu0YywPFZd8kQPzC4leaLsrOhMhNyRJlIlHzdo2OGWvcM3ssR/cBct
	66Xi9+VPM4LxAd9tV8Z9yx+NmURA6qEDZw9GSABP6sg8J9q/Ae6ZOxVOk2ojwU5fWvsJnuUYNuW
	jXfFlXgm4FHHPOaHQPfI1LHUaeYif75Wit5FUGLzpA1V5EKkd/PeCVg==
X-Gm-Gg: ASbGncsjNwaicJLAJw7I1mvp/qQnsKVF//QYo98OYmorSepUzDbFmq8CwYGra8Q2EpN
	6WTacpUQtltXPorgscHZtdnmE13c7dOsBClUHMc5c4gqcdYWkExjfrf77jrlF5eSXw2ZCEFGNb2
	BllKZ2fTLF9T2hIgHuHsURAOZfCR2UjtuAatLzeHder3nD5q/weybepRs82muc6NGAnVYmePA/D
	RWc3xM=
X-Google-Smtp-Source: AGHT+IFHLWinE9F638XWiNqrj3dhtsDaki/0TEDOJ/Nv1HZStVrNn/XQ9slE3dsEfSPyrMf0mmDrfL/WVXJYVjmHZ7o=
X-Received: by 2002:a05:6214:c6c:b0:701:77a:88b with SMTP id
 6a1803df08f44-707005ab0camr8733776d6.21.1753216476503; Tue, 22 Jul 2025
 13:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718234541.3087-1-dannyhu@arista.com> <188741.1753212750@warthog.procyon.org.uk>
In-Reply-To: <188741.1753212750@warthog.procyon.org.uk>
From: Danny Hu <dannyhu@arista.com>
Date: Tue, 22 Jul 2025 13:34:25 -0700
X-Gm-Features: Ac12FXwKHFtdmJWGHHT2_wPlZSqRnjBvEccvd6U1dOxZo58V19_rNotjWDM78Fs
Message-ID: <CAFn2k5B6gizddQsWy-k07z5krxA7KkaMp9yNyX7CSnVk=zmmLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] sign-file: Fix memory leaks in the sign-file tool
To: keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Why?  exit() will clean that up.

You are right that `exit()` will clean up all allocated memory.
However, when this binary runs within tests instrumented with
AddressSanitizer (ASan) and LeakSanitizer (LSan), these leaks cause
the instrumented tests to fail. This happens even if the program isn't
leaking in a way that would cause long-term resource exhaustion.

The main reason for this change is to satisfy LSan. By doing so, we
avoid false positives in LSan-instrumented test suites, which allows
us to rely on LSan to detect actual, problematic leaks that need
fixing. The alternative would be to omit any tests that use the
`sign-file` binary from LSan instrumentation, but that would mean
sacrificing test coverage, which isn't ideal.

Thanks,
Danny

On Tue, Jul 22, 2025 at 12:32=E2=80=AFPM David Howells <dhowells@redhat.com=
> wrote:
>
> Danny Hu <dannyhu@arista.com> wrote:
>
> > 3. Ensuring that any structs which have been allocated are freed
> > with their respective free functions.
>
> Why?  exit() will clean that up.
>
> David
>

