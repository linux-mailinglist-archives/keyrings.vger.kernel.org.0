Return-Path: <keyrings+bounces-1108-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A1B8AFB39
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 23:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 234E71F2110C
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 21:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9CD143889;
	Tue, 23 Apr 2024 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdGFM8Hx"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0C20B3E;
	Tue, 23 Apr 2024 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713909385; cv=none; b=dj7nxFUQC44n3kjRztgGiJS3RxG3/sWdYP98lDW0s/ismOW+nAsEYSB0EW0XkUp8b4UySQPYbsRsOtnoG+zKgle3+kCO/Rso4j518aGHmwVTkZiajMQrk8QLUsg48i5y0A7B9VE/DrOEtidDmNw/UfgvEMQrXzTDJLxCWiNd7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713909385; c=relaxed/simple;
	bh=56w71RtqAQteY310zIfLwFnMhd7MGgPLIN8xxLPHNjg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OfS7M4yMcVbNLvZ6KAmdBkuCuapQgHntuEGZVdyDWEAM9K9eML5bwrPBUuEAprY7NpjxPlTrSJOw69ke9W2ZCtwIaLuVpd25OzzAbcxZCVePBFZsSLHSMhke0U7C7m+d+nYqDdh4yhKb4HjAPL58j16kLdYikczK1vBrp/ZSOk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdGFM8Hx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9255AC116B1;
	Tue, 23 Apr 2024 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713909385;
	bh=56w71RtqAQteY310zIfLwFnMhd7MGgPLIN8xxLPHNjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdGFM8Hxv53ZXKIieMuH0zTLLjP8DhuS/gpu9UsU40xa7B/rbzItKC4xut8BZJR/j
	 a6/67KYAoPOQqkmhXfzGtALh2y7qz57ux3OnsWxyNcrp+WBdfVom1hHNRlt1eb+nyV
	 lMBmjytNOXPxnNrV4ptPofgjyS++tPPyWAQK1dhd718MmtgkT8XOGQ5p3gMLd+Kbbg
	 tBZbD5WqLPwP97VToSk8a/QJ3foS4Hf+KjfE64+W0KwKJv5ELA4zzKP2dDvzSzDM1f
	 mLKbX54Vzvlx2jBnSR4BUG7yo7RIIo9lLTEpcn4uaKDbLlxgu0BhuW+syGeNoLqGM3
	 ILVoAcVgxU17w==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Apr 2024 00:56:21 +0300
Message-Id: <D0RU64GRK26M.3TH8TUG9PCKPT@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Joachim Vandersmissen" <git@jvdsn.com>, "Eric Biggers"
 <ebiggers@kernel.org>
Cc: <linux-crypto@vger.kernel.org>, <keyrings@vger.kernel.org>,
 <stable@vger.kernel.org>, "Simo Sorce" <simo@redhat.com>, "David Howells"
 <dhowells@redhat.com>, "kernel test robot" <oliver.sang@intel.com>
Subject: Re: [PATCH] KEYS: asymmetric: Add missing dependencies of
 FIPS_SIGNATURE_SELFTEST
X-Mailer: aerc 0.17.0
References: <20240422211041.322370-1-ebiggers@kernel.org>
 <908bc808-f8bd-4cc2-8644-c6c84e8cd4ea@jvdsn.com>
In-Reply-To: <908bc808-f8bd-4cc2-8644-c6c84e8cd4ea@jvdsn.com>

On Tue Apr 23, 2024 at 7:02 AM EEST, Joachim Vandersmissen wrote:
> Hi Eric,
>
> On 4/22/24 4:10 PM, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Since the signature self-test uses RSA and SHA-256, it must only be
> > enabled when those algorithms are enabled.  Otherwise it fails and
> > panics the kernel on boot-up.
>
> I actually submitted two related patch recently which change the=20
> structure of the PKCS#7 self-tests and add an ECDSA self-test. See=20
> "[PATCH v2 1/2] certs: Move RSA self-test data to separate file" and=20
> "[PATCH v2 2/2] certs: Add ECDSA signature verification self-test" on=20
> 2024-04-20. The explicit dependency on CRYPTO_RSA shouldn't be necessary=
=20
> with those patches (I think).
>
> However, I didn't consider CRYPTO_SHA256 there. I think it can remain=20
> since both the RSA and proposed ECDSA self-tests use SHA-256.

Their how in my master branch, I'll mirror them to linux-next in day
or two.

BR, Jarkko

