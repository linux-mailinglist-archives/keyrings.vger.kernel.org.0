Return-Path: <keyrings+bounces-1933-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DD969B39
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 13:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD84C1C2127A
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 11:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0A81A0BEC;
	Tue,  3 Sep 2024 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b="JEuuq03q"
X-Original-To: keyrings@vger.kernel.org
Received: from mod.modforum.org (mod.modforum.org [192.254.136.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747591B12D9
	for <keyrings@vger.kernel.org>; Tue,  3 Sep 2024 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.254.136.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361790; cv=none; b=GkdHZcelnSk23p7J+J4/jNWYBMzuLiIbcq+yvJqhUsy9NTt5fCtSjn7zz6VcwJigH4BVND5aH3PJStBWtPV9txV/9bquswGBPWGfYRI+46jhtIP4q24d1B21Cn+9sCPvMEcGQcG1G0q0jF26bdzYl0DKPo6lhwu8MRh56plCKnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361790; c=relaxed/simple;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kmYMjOGIawjj1phKO/d81QbwiSdb0l2oBIdLMAcEDDmKIMq3xVEi9ziW241lrikDFkxT3HjK6Fo+BpolCLfe+/F9bEF9MJn7KyNVcpqO82IsdH9pPHpV9BrC4UN9M7+GsU/izXU9FURdW5PEzYgJYHhjSpJtBrVziXuj+rv9ph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com; spf=pass smtp.mailfrom=basantfashion.com; dkim=pass (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b=JEuuq03q; arc=none smtp.client-ip=192.254.136.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basantfashion.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=JEuuq03qcSKdDgW1G7H7IWsMke
	aZWwWJNcy5ybunuD/t9HQiuuBLL4y7KnI5zYDdhYFZeuIkfTVu+WTm6NenKnMzPQJ0ycB2zhFZZ4N
	2TX9Of2u9PTjxenGsX5RGOvyqyAvEymw/RNzpD2CG68PQkqF+Jm2yX7cZTfnVEiBjwaAo1dvLzG4l
	BIbgfg7V3CON1hw3MCrBCLbUDqWhKfb4aWDLKY9dAMIymXdUAZnQGAlN5Lwp4f6IxNDL4ftZm3SJG
	N2p453IJmxhZvuEUhv1ImRzpxXFZXntGzvdT79PHDxkF5Gd6vQuBAJqtUGLScsQMxgF1Ir2UWjz35
	PhgyDZ6g==;
Received: from [162.244.210.121] (port=49616)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1slRP0-00026T-QY
	for keyrings@vger.kernel.org; Tue, 03 Sep 2024 06:08:50 -0500
Reply-To: procurement@mercuira.com
From: MERCURIA  <kuljeet@basantfashion.com>
To: keyrings@vger.kernel.org
Subject: Request for Quote and Meeting Availability
Date: 3 Sep 2024 04:09:45 -0700
Message-ID: <20240903040945.5B4DE113970A2975@basantfashion.com>
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

