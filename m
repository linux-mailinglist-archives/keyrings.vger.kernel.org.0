Return-Path: <keyrings+bounces-2968-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7CB256FA
	for <lists+keyrings@lfdr.de>; Thu, 14 Aug 2025 00:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54AE81C22D28
	for <lists+keyrings@lfdr.de>; Wed, 13 Aug 2025 22:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5732FB962;
	Wed, 13 Aug 2025 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="bGTBQM/I"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D192FB96F
	for <keyrings@vger.kernel.org>; Wed, 13 Aug 2025 22:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125478; cv=none; b=Ddz7gwijtBKg3ofb4qXbPKfY6exJfvqw1R00BYgCmX5MFLuZ0XcOEBLlDJ1cvAhAQj71CqKmIY70CsE6pEP6pz+ibH81zXTj0g39o1wsuimQv01vqy1fCDluZuwG6Yynov0D+e909RG8L59K7Zpm/3s1NhIRi+KsbS1HSDSP1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125478; c=relaxed/simple;
	bh=+QMZYCpYmISKDe8esyPmnsJcY7v4/c6URivX2WpgQ+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKuxrH1522YMxHsJ4n5CZiBbqeP6Km5xE0MlsRWkZBKVOPGpWTq2mCZo/XhiiIz8DhZS1+ujf27+twbyiphQjdUCtpl4UeQ+vxDTmU7ZE6D7V/YCmZLIszAFhuhO/fIv1sCe3yBFBnSR3dQyeXU84e4Ht6DovyVrVe8PmOwJ224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=bGTBQM/I; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e8706c880eso45627185a.3
        for <keyrings@vger.kernel.org>; Wed, 13 Aug 2025 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1755125475; x=1755730275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKiv6wl+jImpJWRZhxxyuJZvdfk+D/HeaOoJPyHB4H0=;
        b=bGTBQM/IisnK3Hi0aRgnHd15GBbJqjelB33BroCsJOOA1dKSPwr9cpl9OmM6vy2AIj
         HVd1If4i+on1MLehPsk//515ZYEzkNdDegVm/ZSAN5saMuCMzqJcSd5RnXSW5ZiQp0aK
         YNDBQx5fztp1v2oc8AGGvNTVPEeFcALUUdsU0vJaRXyfI1Eqy1HJTo9d4ozor6FkiPaf
         6j8G/wJ5SSKLxauMct192ywDhWYlTmHkyHt64mb7gcYNw7KtCD97iEePRSVOU0JO/BU6
         5EzQsqjuhZ8AVkKO5umSURiCHmTPtBhh/i1rQKBQ+0r98mmvlZ3AbMedb3ub0MUhXM9K
         VMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125475; x=1755730275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKiv6wl+jImpJWRZhxxyuJZvdfk+D/HeaOoJPyHB4H0=;
        b=i2+Y0aH1Hnsiz4CDEJyT2q+MuwEXrSp+glW8+gzdMxHqe8M6Og+QP85T9NMpI0i6+d
         69swu8AfYdzWlVNYmuejepA/MC/neN2qAMH5ev6Kv8MLi5LzUvcXzocyKOPG5Tnn5ksw
         OUxdtw2E32MMgZEmuU1pywF3+9bJJGjF9jk4M5xPKogaGbv9y3CRpJw17HjGx0LIas5a
         yz2vTvqJmO9wu8mVBz/2W4/lcFebAGnaAg3fhu5Hk0OWhY+Hn+tSA2Wg80+u60XZe853
         cgRdIoktS6neIxz5rCbEIgEd/CqFYMFnJsTgdcMAkysiRx5O57LBExPnkKclVjHqU5xN
         rfLg==
X-Gm-Message-State: AOJu0Yxhi6SMMFh35RQBY0A6/97qW+lbWNKOQ4ekn2zKDoGUfLZpnnl7
	tsr/e9sZ9sayKKvjqzYgtfASiovN7gSqr4Btsl+rRRa18i9gubdJjca8hBKQw8OjZp1MvyYHHM7
	i07R27w4npDMq5P85RHe3jx5o5xqd3Y/rEmZePAv4
X-Gm-Gg: ASbGncsyW9Qva/GRC9veUq5PfW7hyREs1+4slMYvoSHP+I4iB3YyqH2XXSHWejq+6PB
	IdYB4i9MwJS7CzBtjKjf6LHE3dgUXa5+KHQNWtcloTNpiLZzxZuNF1Z3cvnVfFRC7tU221LfNqO
	7JpGYSNmIeDzgRjw0RcHTdRf9i9njjj5cbIHPRDi0BBF3gaYXIBXVSFk0PzxGVq3K0l662bltzC
	x4wqvB+uaKLqA==
X-Google-Smtp-Source: AGHT+IEDrLwXr33eZrsGB8hileXp3lWWmGqjiKU5XkfJQNEoE2lmdZGTwIkoK/QI8KxT1HHTk+QdTtZ3//7k3hYxEoc=
X-Received: by 2002:a05:620a:2a0e:b0:7e8:6e78:8de0 with SMTP id
 af79cd13be357-7e8702e024amr168230685a.10.1755125474735; Wed, 13 Aug 2025
 15:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718234541.3087-1-dannyhu@arista.com> <188741.1753212750@warthog.procyon.org.uk>
In-Reply-To: <188741.1753212750@warthog.procyon.org.uk>
From: Danny Hu <dannyhu@arista.com>
Date: Wed, 13 Aug 2025 15:51:03 -0700
X-Gm-Features: Ac12FXxZOBmFHULFcTS9uP64TOgZxwFm-t3VmWsopTAgLyDtShj2yrwcZiBTTx4
Message-ID: <CAFn2k5AsoZf1znsQqbRs9huX4ccx2v5TGqMidCoHXVpDvk19Og@mail.gmail.com>
Subject: Re: [PATCH 1/2] sign-file: Fix memory leaks in the sign-file tool
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, dwmw2@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 12:32=E2=80=AFPM David Howells <dhowells@redhat.com=
> wrote:

> Why?  exit() will clean that up.

You are right that exit() will clean up all allocated memory. However,
when this binary runs within tests instrumented with AddressSanitizer
(ASan) and LeakSanitizer (LSan), these leaks cause the instrumented
tests to fail. This happens even if the program isn't leaking in a way
that would cause long-term resource exhaustion.

The main reason for this change is to satisfy LSan. By doing so, we
avoid false positives in LSan-instrumented test suites, which allows
us to rely on LSan to detect actual, problematic leaks that need
fixing. The alternative would be to omit any tests that use the
`sign-file` binary from LSan instrumentation, but that would mean
sacrificing test coverage, which isn't ideal.

Thanks,
Danny

