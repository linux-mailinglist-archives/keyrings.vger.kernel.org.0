Return-Path: <keyrings+bounces-2342-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BFA04003
	for <lists+keyrings@lfdr.de>; Tue,  7 Jan 2025 13:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25D837A23CD
	for <lists+keyrings@lfdr.de>; Tue,  7 Jan 2025 12:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305F21F03D8;
	Tue,  7 Jan 2025 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="oAAdNDJE"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E8C1F03C8
	for <keyrings@vger.kernel.org>; Tue,  7 Jan 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254579; cv=none; b=Fbzj0UYzR0r7iQXBvd2NgxlTbRAG9rD5AiIcziAYivi2MioVqTBJKo11xXn3EY+MvRMdIFzG+A8e2U6alXzldH8l6eJuOKBt9Bph+dI54YGNSkFzCbRTED3VRdRoyvpvq03a9qsa5QWI7reklTDDyK/0BKzMwYw/vmitSA/qavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254579; c=relaxed/simple;
	bh=mhjI5XJs+wlmeptweqROi6JQ9QOeOFdceKqB0fLjzng=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jb/TuveOfyRBtrSg1XNpmrq7jzvORs9H73ucWbDIdh/oqidcSPeqytw97eNqixR530Fa3aJLHWG9WGmSAzMRVHtGDABRt9qpAbcjgokPmz38k89eXqvpNwlXzaeWSnm1GnULaHfqApRiGEG0UHjpgMj63zC73PCvbbv2hdX0DX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=oAAdNDJE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43623f0c574so106807285e9.2
        for <keyrings@vger.kernel.org>; Tue, 07 Jan 2025 04:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1736254572; x=1736859372; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3ZCQbwToICSm537L8Sy2gP7aNDk3KXPLLCsJPGfnhw=;
        b=oAAdNDJEJ8VtwnjbngputK7jhZAlRPGLevRm47nr5NWcX4W3pQmbLFrSLLL2pEbRue
         t1nHYeufDY0YIMmsDoqKG9r8XJw/03JMsfHIZu1tC0x3paVyDu1DxydjzNuR2PXsThCs
         zCZr0ubOJsetBrE+lMmnMNC9keQjqzGxLB6Og7IHc5iF/tmvVlPMpaB4ZtvnGtvp92oR
         j2+iYg8RsiNrBUL/yLVmlapCgyXtqN1dJpuTthIbSTlelmM3T2MznXakUDsp5vyxFQY+
         hJ/ojDCeHk15UJvDatgAO13Up6/n5hpJefqI/1y483A14q4SsCX8jckDlwTNlaODXEhy
         0JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254572; x=1736859372;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3ZCQbwToICSm537L8Sy2gP7aNDk3KXPLLCsJPGfnhw=;
        b=AVe85oTMpN/I4REkTlkTftykaGRwD+QKtbQoZX40zQ2tdpe0qW4C3kfc2OY6jZ/A1I
         8LytB0kM2gwKgitKfQmgeT19aK7/H9eNVb5d0f3eSPPUnniy0wiejFx18xv/qVdpIeci
         itCYdQ6roOQrEZAEIjnsJ3r40hqBVJban8cu9lm6jfIr4JUkmNnmjypDBK7sVC6LrC15
         V7OMoGMQT1Zcpl5mEZ9rXkzZz/7CGm3ZiZwEi0dCUWnP0fYkbXAaKbWrApU9Sq4iTbYj
         Md/XCojMBls/KYZdoDFn0YhOvNBYi29RrZQ7cFai3H1K0Uwb3x+TRT93qNEeUcNRFMfv
         DQQg==
X-Forwarded-Encrypted: i=1; AJvYcCWDJ/of970m2JXJ6J5s5tqRU2JAp/JHVHYyrq/8hKQ4WBfeK8ow03U+NGxr65fWkm9OV06RlLF6QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/O1VhHiwTUefr9WZgeXXJa19VpZqEbC64jBl0aEbzKVyiyaZ
	uKpybUt38aDYXLRbslKgj6ObNeS1wzIEn1Dgf4LB/btChIOZigMEs+YAaQS7Bjo=
X-Gm-Gg: ASbGnct5iOebJlbvvvfF0wvHeJwNk95wg3tvy8diDX0HWWTCEEI2RVRJDJqrFXL74xc
	1R7JPgl63uMgUKYEeSxkt9P+5rPESOCK4oUBLbOi26JVBiyYf2N5chVPUlvg+pz5mlsM94Nsuyi
	DJ/nCe3KN5zs9YBMVa+X4uA7sbx/iBuun2puP4m5Qe02lZqliBTKyHHn/kA+8fZ/e889qf+uHTa
	cqYKqDYo0+/ffccpWnsFtJ2BPVwSZwtHw7NM02F1IdTM30PGQOt/DLqekx5mFegZAlfhJk=
X-Google-Smtp-Source: AGHT+IH3LnvvjrofmboXcdOA469qCM6U4NR7fF54KLrYPLcSCkDti2tVbLL3RQaJvGouHlnnaL3mEw==
X-Received: by 2002:a05:600c:45cd:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-436686462f9mr571258605e9.17.1736254572516;
        Tue, 07 Jan 2025 04:56:12 -0800 (PST)
Received: from smtpclient.apple ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a546e822bsm24831226f8f.22.2025.01.07.04.56.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:56:12 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] KEYS: trusted: dcp: fix improper sg use with
 CONFIG_VMAP_STACK=y
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20241113212754.12758-1-david@sigma-star.at>
Date: Tue, 7 Jan 2025 13:56:01 +0100
Cc: "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CA61EE6A-F2D5-4812-96D4-4B1AF3B8B3ED@sigma-star.at>
References: <20241113212754.12758-1-david@sigma-star.at>
To: sigma star Kernel Team <upstream+dcp@sigma-star.at>,
 James Bottomley <jejb@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>,
 Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
X-Mailer: Apple Mail (2.3826.200.121)


> On 13.11.2024, at 22:27, David Gstir <david@sigma-star.at> wrote:
> 
> With vmalloc stack addresses enabled (CONFIG_VMAP_STACK=y) DCP trusted
> keys can crash during en- and decryption of the blob encryption key via
> the DCP crypto driver. This is caused by improperly using sg_init_one()
> with vmalloc'd stack buffers (plain_key_blob).
> 
> Fix this by always using kmalloc() for buffers we give to the DCP crypto
> driver.
> 
> Cc: stable@vger.kernel.org # v6.10+
> Fixes: 0e28bf61a5f9 ("KEYS: trusted: dcp: fix leak of blob encryption key")
> Signed-off-by: David Gstir <david@sigma-star.at>

gentle ping.

Thanks!
- David


