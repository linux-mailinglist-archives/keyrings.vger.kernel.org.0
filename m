Return-Path: <keyrings+bounces-2877-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1410AAEE7AF
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 21:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5A73A827C
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 19:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364BF2E5418;
	Mon, 30 Jun 2025 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="REE8c3k9"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE30292B4D
	for <keyrings@vger.kernel.org>; Mon, 30 Jun 2025 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312472; cv=none; b=i34U9+hLzfWUVUQfuu5iF4y7MiRLzkUxADEbj6cbMkJo/Un56XX/6WI8svWBCWVVG8WoKkWm79HAVi22JEL8KrnYwurrsJ++zRgWAfmrONtytKXuCuiTCiW4AERWl9ftZnv19XN13rTFf+efTtTmLagIAKGfs9rQLAqiQGSW5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312472; c=relaxed/simple;
	bh=Be6wlW3qxh61YAsYffI4w0XqSmxDwkX60bMi3A/giEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brbL8ZPDPf1elnKRmVNfyYttSrIBMi1TVHHiUWiskKeJepwS10c/zKW/1gpqS8LeBIxo1S8ebXMuTuWyNkyZi3H0tRyIqxJDfZKswsiMgVnMOBt7S6zAui4/OEBKU/ySowpIT0x9aEIUlzErlXqjB2Wx46LBwYJsLTIrYIwkn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=REE8c3k9; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-73a5c41a71aso2611074a34.0
        for <keyrings@vger.kernel.org>; Mon, 30 Jun 2025 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312469; x=1751917269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
        b=REE8c3k9Llv6fjCLeJmfHradu278Erz2k+VU3g4DSrG941g2VFe2jDCZ39SHGGvrso
         KTjZObWwzFZ6ALjM+UdbYisTShNDFZNaFXdKY2l6jrN8pMeSXYv0Nan0Up2OfYWSSiaV
         HMnASmvLMhXmxwmTbFtfxpLJH96KiWZmFyjwDtjfIJ/HSeZbvGv57aGMkX7lVHFQS/gg
         bulvC90/VU5iFR22U8arTd5mmD7ob7c+ky8Ejj0SSTVSOJaLW8tS/Vn21yiWtD/TCpEv
         p/d64ZmKFhM4hdirZcc06ZPn7iCOjEkOP7EpUI1Dq3wR1cLnRjkdSntDX+TyqF5MCSCB
         LlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312469; x=1751917269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
        b=rgiDPIG9uWcxiBL0k0e/AcCSSryn8fFSOf7SrkCuvxBhUiokWST2wEgODqFvD2nm81
         i+MMylGP5VgDUijx7dSaBa8M/ezdq6je6N0Mg5Q959M36K98CoUA2XgKFV0WF8mUeHqf
         s7MQuQGjTs8mFDl71Ft3N5B/77bepbYPHf6v+BK/0u75qscK/Msw1tQgnUL4sfkbct2z
         RL8a8oGj30LNht4NxHiLlGMjITahoeAXt7G/2IV+JIodgSv2GTIp/L6uGV06WFr69/UR
         F8me85o3Ed69fGnOgN5S67znSBYXLIB4slQkKk6dRnLPknbKuEJAmPPUQhpln3c9syNh
         rK8g==
X-Forwarded-Encrypted: i=1; AJvYcCXMzNe9KdXX0QyHHJy+wnMheqbhLGwh0hEWPylSdfXXgsoJbGxmEmiwSjcqlE+GKP6XCSdguaaZqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXdWUp0YLgdyZP/u5BPBcsfgHhL8iOtYFq4PGFO+O2zsUowVl
	2x38S7d0W9Tb0bnrys1c5wpbjmKn5EOBA5MXTzmDPapK4i29UAM5C/yxkre5rjyvNNc=
X-Gm-Gg: ASbGnctwuN1TuaaX0hxv66gyF8cH2SJnCRRn9/x+ZQYALqaiWYOrAjT9CIW+Vdw+ZVH
	ZQ+S5pRjy6UjUxRotAG/7IlEOtDIddSYLIwKlpFLPSOkG8dqCccfT0/0DBHCf7ZGAb4qB/qeQFE
	09IdJc4aGR42+dAK/fYk/lm0njj2sTFFxXLjRg8YhLHJ/HfTqFl5Xu9N+F6jRVrO1t1QkuHunub
	rxkkBuZm9FdhFZFBOpxZcq3/2ePGpeBq3AvYNoqVFKfqcO88KgGtspZO9fG9ddr1G0HoNEiKMr6
	WF09Qzvs+sgDyhobcoHX6oVMd43GxsOP9Ch7990tnU4Oj7sHH7sPbrqFzGAEEvbClK0Z
X-Google-Smtp-Source: AGHT+IFCr/h/Pq7YioC0C96yZfnS46Emb0XznV8LFfoTN6Hof+uG2lgGCVIDP4UToYNd7qu111FhBg==
X-Received: by 2002:a05:6830:2901:b0:72a:ec6:7fc1 with SMTP id 46e09a7af769-73afc6507b1mr8500368a34.14.1751312469502;
        Mon, 30 Jun 2025 12:41:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afaff249bsm1798804a34.6.2025.06.30.12.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:41:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 22:41:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gu Bowen <gubowen5@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Message-ID: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
References: <20250630133934.766646-1-gubowen5@huawei.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>

On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> To reintroduce the sm2 algorithm, the patch set did the following:
>  - Reintroduce the mpi library based on libgcrypt.
>  - Reintroduce ec implementation to MPI library.
>  - Rework sm2 algorithm.
>  - Support verification of X.509 certificates.

Remind me, why did we remove these?

regards,
dan carpenter


