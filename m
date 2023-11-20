Return-Path: <keyrings+bounces-132-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB97F218C
	for <lists+keyrings@lfdr.de>; Tue, 21 Nov 2023 00:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 421B3282210
	for <lists+keyrings@lfdr.de>; Mon, 20 Nov 2023 23:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC923B2B1;
	Mon, 20 Nov 2023 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ufd0rVmR"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8138F8F;
	Mon, 20 Nov 2023 23:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1359C433C7;
	Mon, 20 Nov 2023 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700523848;
	bh=Kd8MO4g1L5NTe6VF4FsH/eaduBF2fDgRgJuS7ZGu1iU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ufd0rVmR5y3R7QnornCtBcuirGAcrKKp42f3eDqcYIB1XonOVDSdvIw6LrO4cW2ar
	 0NpeKZXlbxFXQqrGmG2KBLfCq9/M0n7dN8/1Dtc2JLwtubEj0mLNR6/jxRpyhuF9OR
	 R9SxEJt5l1+Cr/VOEqAnN4vRCKbhLjltSO2E7Lx316gDOrTKyZ+sZIIToUVsG2vuio
	 h5np78o+4dKBYHNZZFzQUkUCxZc3+p69vTiHJ7Y395UkGtLmJKQr88G0oKHWwoiIGO
	 a5mrFDA/e6gvjX7JVIVBvk4BTRlex4VESUTbpYKwKmoz/14KtZRi7Jb49dbEDDyqRf
	 ukRiua9v/JZeg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 01:44:03 +0200
Message-Id: <CX41E533XH4S.1B6IZCU0PKPL2@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] sign-file: Fix incorrect return values check
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Yusong Gao" <a869920004@gmail.com>, <davem@davemloft.net>,
 <dhowells@redhat.com>, <dwmw2@infradead.org>, <zohar@linux.ibm.com>,
 <herbert@gondor.apana.org.au>, <lists@sapience.com>,
 <dimitri.ledkov@canonical.com>
X-Mailer: aerc 0.15.2
References: <20231120013359.814059-1-a869920004@gmail.com>
In-Reply-To: <20231120013359.814059-1-a869920004@gmail.com>

On Mon Nov 20, 2023 at 3:33 AM EET, Yusong Gao wrote:
> There are some wrong return values check in sign-file when call OpenSSL
> API. For example the CMS_final() return 1 for success or 0 for failure.

Why not make it a closed sentence and list the functions that need to be
changed?

> The ERR() check cond is wrong because of the program only check the
> return value is < 0 instead of <=3D 0.
>

Lacking Fixes tag(s). See: ttps://www.kernel.org/doc/html/latest/process/su=
bmitting-patches.html

> Link:
> https://www.openssl.org/docs/manmaster/man3/CMS_final.html
> https://www.openssl.org/docs/manmaster/man3/i2d_CMS_bio_stream.html
> https://www.openssl.org/docs/manmaster/man3/i2d_PKCS7_bio.html
> https://www.openssl.org/docs/manmaster/man3/BIO_free.html

Replace with

Link: https://www.openssl.org/docs/manmaster/man3/

BR, Jarkko

