Return-Path: <keyrings+bounces-2450-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86FA55AA2
	for <lists+keyrings@lfdr.de>; Fri,  7 Mar 2025 00:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2B13AF4FB
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 23:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B718527CB3D;
	Thu,  6 Mar 2025 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=delugo.co.za header.i=@delugo.co.za header.b="fO/JKBdZ"
X-Original-To: keyrings@vger.kernel.org
Received: from outgoing1.cpt4.host-h.net (outgoing1.cpt4.host-h.net [197.189.247.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D774202F7C
	for <keyrings@vger.kernel.org>; Thu,  6 Mar 2025 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=197.189.247.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741302323; cv=none; b=af3N9kWFqmfjEwerqLhyi+wtOeN02QODc1jD+wgYcNzO6e6rs5G2k+Bf71LmyPWIR20zELjmYaVUH2iG0ECU+vfHeJYhIbue+Ad3UE/ZaDG6A3uOz07z+0HGwCuvrbs7bxEowqdGFNNk4Hc8+0MlGd1Wm54ro32U2PJkxNol86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741302323; c=relaxed/simple;
	bh=UOdy1uc1Ja6Ouzx9Gp3orqw2OLpxN4Hd+lHG4CKFzvE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q9g9uL6cr/B8NH6cO+yjUXKTQP80mmTRVh1S+quUCA6MUkPy4FrxX2xQq/ep9bb+RB6Nyg7/L4CO4ahAjKz7OdJd9lpvPEo0zaGeuHSplsX9flcu9b5s11NhDXatdxweVfZ6ZZMkxY1/h70JHcbizwVrxPJREISIWjCM4Z9NjP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=delugo.co.za; spf=pass smtp.mailfrom=delugo.co.za; dkim=pass (2048-bit key) header.d=delugo.co.za header.i=@delugo.co.za header.b=fO/JKBdZ; arc=none smtp.client-ip=197.189.247.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=delugo.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=delugo.co.za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=delugo.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:sender:cc:bcc:
	in-reply-to:references; bh=UOdy1uc1Ja6Ouzx9Gp3orqw2OLpxN4Hd+lHG4CKFzvE=; b=fO
	/JKBdZakhPJTG5jAsSWomOr73t7TZqFHsbDrDWQGlzikjSzrHsPs20Pgvoo8mHAAzkmoBpKJCaWhK
	FsqRRmyt6Lnwa7HQd75jXwbmFhIrg9xHIaAvYZOgUCtDfpbZxJ6tfpaYrc+6nPV1rCg2NP4p58pRN
	ubNhgmY0p/ZTNFg+CxmfJzuftNuHyGcvCpbclYa62kjoJTgJq/J1BpKlGJmbs9Q61zX+z7OtXUvtx
	sHgGCLmkbqBHnt8can2Z64pMfh48CQ54nD//fuBhea6tsECFac0fCTagFX4ygd6F/JFhxyvI5SQSj
	kUSolVLMSr0RJcWUm0ze2TsMEXoItbew==;
Received: from www46.cpt3.host-h.net ([197.221.14.46])
	by antispam1-cpt4.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <orders@delugo.co.za>)
	id 1tqKHD-001UUn-IJ
	for keyrings@vger.kernel.org; Fri, 07 Mar 2025 01:05:16 +0200
Received: from [104.192.5.240] (helo=delugo.co.za)
	by www46.cpt3.host-h.net with esmtpsa (TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <orders@delugo.co.za>)
	id 1tqK54-0000000Dm2b-1hNy
	for keyrings@vger.kernel.org;
	Fri, 07 Mar 2025 00:52:42 +0200
Reply-To: barry@investorstrustco.net
From: Barry <orders@delugo.co.za>
To: keyrings@vger.kernel.org
Subject: Re: The Business Loan/financing.1
Date: 06 Mar 2025 22:52:41 +0000
Message-ID: <20250306223012.07D63D0F4BEAC2EA@delugo.co.za>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: orders@delugo.co.za
X-Virus-Scanned: Clear
X-SpamExperts-Domain: delugo.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@delugo.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.75)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+5DhM0jw86KsbkaGfFMuQCPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zDQrfUAi3O/xfP/O+Sa6P2W4h0KqOTIGbSh7sPxo0b07gN
 zB/4Jkrw1eDLcif59fvZOxK68RwLjWTAxOmLPRgkgYVALhXkueKT79r7FRLqfR+evMtsdD6ftsld
 sfnMs10q9c+4Ff8pUXk0BTqlb4RLs8aMj3d6PkVfGnccqGRdIe3om1NOCXE1kCr91rpFr6SCNzgB
 zq1ySYML985VKzvVyIhNl47uPFa9YEAuYZYGqweph0m/7Zfos+AxsfpxEVjN0iSJBwaRRCp9wOH4
 R+ueaVyj66M1yz85ZZhpUrhTRbASVYnBhdKUnGmBdHG7BUn2dK6UtSEdwn3yFtfkzf2gaLnJjd8G
 94gdLOfhe8ud1dI4asu3KfN2fj0P4iw7xzsjF+zaopzR+EXhgx3SXAfA5fJjsMYie1KIHivoqPV+
 yClmkGsLc8BOsvUZq1oC3tQnKgUcmMkAcVs3h9yHT69gm54XYz0lbA+o4ZKLKop65ovhSJcbnX/H
 QqL/X9rNCJCc6iESJvKm1NV8gkr+Wu8ScVDXinOVyuIpITQ9z3M3DEPE5lEGmMkRWrcFIJmPjQ+l
 RpTAZpJuxsSbJHBbUUtocbizIpBmJyMKAzhAwIwRzA246snhpY0AHiBL6U5bHxzn9sfTcvc8Pdr1
 Eep4DMP1lKJ7jrNRXsNt/cBtRLSZFwHEfA/nAtW6EkD5d6HfoI3vpFmWyTLCbA81C8stasRnxi0A
 4m6JtJd9/PPFSsyQJla7kdVV0k0ysDMNhUO3O7IccBIk1Sag4dKiqCrF8eZZKVuxqyEw0bOyF0K/
 byuDO5t0Liotf6e5xyTYE7MyLegD9u4OiddtVk9xfnW9NSjMPmmtiDTojdHcBBawfH0Y+8GSFRx5
 C+DsqqfSwTWdevIqbWe2XTLJZsfQ+qOStW7Yzki9qqiuW3Bk5C+gdmOiVUocc7wo4xkKZzzZBdDM
 F0T/RZQXqz2OSxZa5G41j9ZG
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-Complaints-To: abuse@antispammaster.host-h.net

Hello,

My name is Barry at Investment Consult, we are a consultancy and
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
Barry
Senior Broker

