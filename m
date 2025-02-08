Return-Path: <keyrings+bounces-2386-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C16A2D90D
	for <lists+keyrings@lfdr.de>; Sat,  8 Feb 2025 22:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4FDC1885783
	for <lists+keyrings@lfdr.de>; Sat,  8 Feb 2025 21:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A4D1F3BB0;
	Sat,  8 Feb 2025 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=truemaisha.co.tz header.i=@truemaisha.co.tz header.b="H3XlxGy5"
X-Original-To: keyrings@vger.kernel.org
Received: from server-598995.kolorio.com (server-598995.kolorio.com [162.241.152.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949501F3B9E
	for <keyrings@vger.kernel.org>; Sat,  8 Feb 2025 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.241.152.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051805; cv=none; b=F1AUe8xPW2F2fJnka2nIQntdDtBtTondZ7Eq79Qzv8ONSAiL5eYkBC8hbYrio6Axf5AWswpogirmEf8eNsPUqoAV2gmObhPw0H3bsPhN7YIfAM5PC4XUVhm5Oo1xKrhck9A0GXGTrskAIBeZs44rqUeBez/pjGneibeuglzaBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051805; c=relaxed/simple;
	bh=gl4+7vNxgV9+JzZtw7EthQ6aGDgi0WVn3wQV/lnKiyo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A+Dk7J305LvWnmg5Fqz6WSulwz9uBnvY0TZeOYdRUj3LEjH6EuzScwt+sCN0L2F9TlCPcqs3QtYZP63xjKZ8awas6cEnUOuYgYswEBSDSmqKuNMkX+Gx0tM0V2o01zEGwbp/OrBohPMiyXF3pt+0TJrVhF1nC2Xu5yF5zlnIOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=truemaisha.co.tz; spf=pass smtp.mailfrom=truemaisha.co.tz; dkim=pass (2048-bit key) header.d=truemaisha.co.tz header.i=@truemaisha.co.tz header.b=H3XlxGy5; arc=none smtp.client-ip=162.241.152.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=truemaisha.co.tz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truemaisha.co.tz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=truemaisha.co.tz; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gl4+7vNxgV9+JzZtw7EthQ6aGDgi0WVn3wQV/lnKiyo=; b=H3XlxGy5Ke6aJwtX10J8s5qqKG
	ohnmFTEaIPvosQfI+ORI9KrPYVcfT+Ie59G0C40MzgPbPAvWq6NZhi7LBke5E+enyGZm2TXk+A44H
	ZIEwkJrkvp1ll+GfeQl+90Z1A62dje4UQYaYbin7O4SBl5MrALKOwEyoA5pljrSnB7y2/a+S3vBLz
	d+iuOZwwEWzOb5vEFsYn7ocTJjlfcxznnnYDQwbO+kaAeXPX3D3VQ1OEmfG7eMpRCg4xMQCG/Hpuj
	9yjj3MHC8JEyRJpVRc1z4uSR9IWKTJ3ArMSaYwxfBT+rvPL3A7R1TOoFNlWgpe/N8iua0D9OyRYSo
	0WC44d5A==;
Received: from [74.208.124.33] (port=59290 helo=truemaisha.co.tz)
	by server-598995.kolorio.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <chrispinerick@truemaisha.co.tz>)
	id 1tgsoa-0004A3-2F
	for keyrings@vger.kernel.org;
	Sat, 08 Feb 2025 15:56:41 -0600
Reply-To: dsong@aa4financialservice.com
From: David Song <chrispinerick@truemaisha.co.tz>
To: keyrings@vger.kernel.org
Subject: Re: The business loan- 
Date: 08 Feb 2025 21:56:43 +0000
Message-ID: <20250208210541.0C993469DBE7692F@truemaisha.co.tz>
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
X-AntiAbuse: Primary Hostname - server-598995.kolorio.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - truemaisha.co.tz
X-Get-Message-Sender-Via: server-598995.kolorio.com: authenticated_id: chrispinerick@truemaisha.co.tz
X-Authenticated-Sender: server-598995.kolorio.com: chrispinerick@truemaisha.co.tz
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello,

My name is David Song, at AA4 FS, we are a consultancy and
brokerage Firm specializing in Growth Financial Loan and joint
partnership venture. We specialize in investments in all Private
and public sectors in a broad range of areas within our Financial
Investment Services.

 We are experts in financial and operational management, due
diligence and capital planning in all markets and industries. Our
Investors wish to invest in any viable Project presented by your
Management after reviews on your Business Project Presentation
Plan.

 We look forward to your Swift response. We also offer commission
to consultants and brokers for any partnership referrals.

 Regards,
David Song
Senior Broker

AA4 Financial Services
13 Wonersh Way, Cheam,
Sutton, Surrey, SM2 7LX
Email: dsong@aa4financialservice.com


