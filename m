Return-Path: <keyrings+bounces-1981-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9397460F
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 00:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516FA1C24EA4
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 22:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1C01ABEB7;
	Tue, 10 Sep 2024 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2xaRTUi"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED6B1A76BE;
	Tue, 10 Sep 2024 22:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726008062; cv=none; b=awzAqfbo4jqZ8JgOWx3wxsIQZdIrwFF1c2BQB9i8CGFGYZvEPzQm5k6zPlu/pYOtNeGfDcAW4njGkku83J2rSzU0fTobwYL8lP7sPN/B5Fp03gmJREdgQe8mdKPf5ke2bMgqO1tzqlpQtOh8JaKq8sW97O2GScjs+bTVuCk90/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726008062; c=relaxed/simple;
	bh=ewHx+sqMlVODPcD8RjZ430z/omXn0nvn/987s1r2yaQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sfFDB0O2S92HfA05LJ7K9sFCQuD0qcI9jmAZ6UWarFZlvcCNILicu+xJjUkt1/LYdmB0WnkNbXddzGQ3Ybd0nrGlU/4Jy4KVo/z7yQm4V+eqz6puJwMFZWb6Fbs7gD0xRiVz5bcAKePMyAStOaZ/2AbSpvNCTNITkvXSzI4sftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2xaRTUi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB512C4CEC3;
	Tue, 10 Sep 2024 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726008061;
	bh=ewHx+sqMlVODPcD8RjZ430z/omXn0nvn/987s1r2yaQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=g2xaRTUiMfwqZw5v2BfwEka1lG4rqdJHbfqPlziBpWZcTIgTi8nFHx1aMg0qzsufP
	 4butw248eu/wQFN+eo0ifoeXpqV1jU15kp1FbZQxbDlf2n6eLoCJY8RZAmqbjsbttQ
	 rfBLidb/QNB6ukD4Fej+zt/sq5X2NoCF7L5Qp7FO+NPyp9X7OTprcIyeAQmYU2DzDl
	 ZjojZ8XPX/K2RN4+p8u8qxUga/TcTL/rC9MF/o1expFJ/tEhTbD4L4gJ1yui54wOnQ
	 RLx/r2MR3ixLQhRG/oxuIwfxCQJZBCDSDZFFVm3byP0yMBk/JGOtEvq1EsIZvEEp14
	 CelKkwbsCJFtQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 01:40:56 +0300
Message-Id: <D42YSIV15N2O.2JNV0VVFUT8S5@kernel.org>
Cc: <keyrings@vger.kernel.org>, "linux-integrity@vger.kernel.org"
 <linux-integrity@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Pengyu Ma" <mapengyu@gmail.com>, "Roberto Sassu"
 <roberto.sassu@huaweicloud.com>
Subject: Re: [regression] significant delays when secureboot is enabled
 since 6.10
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Linux regressions mailing list" <regressions@lists.linux.dev>, "James
 Bottomley" <James.Bottomley@HansenPartnership.com>
X-Mailer: aerc 0.17.0
References: <0b4a5a86-a9f6-42d1-a9ba-ec565b336d3a@leemhuis.info>
 <db275ab4fb73fc089c66738ffbcab23557e53055.camel@HansenPartnership.com>
 <1de8359d-f231-452c-bf5c-9fc01f0ec800@leemhuis.info>
In-Reply-To: <1de8359d-f231-452c-bf5c-9fc01f0ec800@leemhuis.info>

On Tue Sep 10, 2024 at 3:41 PM EEST, Linux regression tracking (Thorsten Le=
emhuis) wrote:
> FWIW (mainly for others that later find this thread on lore), I's pretty
> sure James meant CONFIG_TCG_TPM2_HMAC.

Yeah, exactly.

BR, Jarkko

