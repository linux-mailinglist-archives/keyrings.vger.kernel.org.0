Return-Path: <keyrings+bounces-1932-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D59699C8
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 12:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38A91F238B0
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 10:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E557B45003;
	Tue,  3 Sep 2024 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b="EREZoX2A"
X-Original-To: keyrings@vger.kernel.org
Received: from mod.modforum.org (mod.modforum.org [192.254.136.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BBB1A0BC7
	for <keyrings@vger.kernel.org>; Tue,  3 Sep 2024 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.254.136.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358352; cv=none; b=Nl8CBYIvAC5wSV++8sBgKQ77b4oiF1zjC80mEnBHJ7rU5QGqJ16MV6/HuDWO2uLSNsJiSKXlELjjZ3u9331FUMb3mD89Nrle5/spqO+8BUJTL2WrmlrrWoXc80T8/EQMDmQoPL8MirInAG0oJs+W1IZ0Hg+VPohELSd7pRij3NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358352; c=relaxed/simple;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BHryKAMI1nmmBH2zq+OaoMBg0gJfQdcqniTlkIqgTYQUwZ2l1/awdgG2o2LEyGhBREYCeLqh91ZsOBwGh7YcgwYL2xS2+XKCrjdpybxlppfhn1L3uOcEmgyRIxq5S8Z2MrjoGx4fd9iKg79tHMsf9OHU0+LS1iQVTfpeG9DkqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com; spf=pass smtp.mailfrom=basantfashion.com; dkim=pass (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b=EREZoX2A; arc=none smtp.client-ip=192.254.136.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basantfashion.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=EREZoX2Ai1ZvMyO4jiQZxBRZZx
	BmWrO8+TSITR0NaZ0N35jeMlW5+Xv69/WAVREN9uym6Q59LDAV6e344uAR5UiolEygQRpTcYDwJPA
	40h0gj9ieK9GHkwHoSSE1V/kjlBLein6C4icfCRf4iWQGFA28RGX1x0+HObgEiyX08aViLwRBcXcK
	GHMRSsJ3ixM6NLNqPdQ+29h9nfJbyzNd7oMp3V7cuLX8XyoU2UbjjMudzWfx8Y3idLmlpFzsyn3aw
	3Ix2EPzImxfVfrSY60oo6aUnjsmt+u8T5pungKc1gffu2eixIt1OCxqLM3bLeUivKBPV/vUctLTrC
	ExuN7N4w==;
Received: from [162.244.210.121] (port=65067)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1slQVa-000146-AR
	for keyrings@vger.kernel.org; Tue, 03 Sep 2024 05:11:34 -0500
Reply-To: procurement@mercuira.com
From: MERCURIA  <kuljeet@basantfashion.com>
To: keyrings@vger.kernel.org
Subject: Request for Quote and Meeting Availability
Date: 3 Sep 2024 03:12:29 -0700
Message-ID: <20240903031228.86891B76A79670D3@basantfashion.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mod.modforum.org
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - basantfashion.com
X-Get-Message-Sender-Via: mod.modforum.org: authenticated_id: kuljeet@basantfashion.com
X-Authenticated-Sender: mod.modforum.org: kuljeet@basantfashion.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Greetings,

I hope you are doing great.

We have reviewed your products on your website, and several items=20
have caught our interest. We would like to request a quote the=20
following

Can you ship to the United States?

What are your best prices?

What support do you provide?

We are also interested in your services for this project.

Could you let us know your availability for a virtual meeting on=20
Zoom to discuss this project further?

Please advise us on these matters so that we can prepare a=20
meeting notice for our company executives to effectively engage=20
with you.

Thank you for your attention to this inquiry. We look forward to=20
your prompt response.

Best regards,

Nina Petrova
Procurement Manager
Email: procurement@mercuira.com
12 Marina View, Asia Square Tower 2, #26-01, Singapore, 018961
Phone: +65 641 1080

