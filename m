Return-Path: <keyrings+bounces-3087-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8AB97EA6
	for <lists+keyrings@lfdr.de>; Wed, 24 Sep 2025 02:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DABD7163053
	for <lists+keyrings@lfdr.de>; Wed, 24 Sep 2025 00:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445FF19D071;
	Wed, 24 Sep 2025 00:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="DU4UD/Io"
X-Original-To: keyrings@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A0CC2E0
	for <keyrings@vger.kernel.org>; Wed, 24 Sep 2025 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674559; cv=pass; b=NTsUjFGztxqBI+5P+L8yW+uBaEW/Qi3Xy9xJBRBK1Qka/iAKTmaoB1VnbA0REFCFtply/nEjI/4KBwZJN4yZxujcb9Xav9xwCvQffk9EcYQfZ5jjGxwTXX3tRh1yKNOhDhYI2ktn0VM8iHeH6xeVjjYZR77EjkMRPj7ALwRS6t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674559; c=relaxed/simple;
	bh=DUtdIXjaREy7WfBZCel2VW8rBjJ3oorPzh/52xKYVfs=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=EhB5M4eZ8u5j0eOH5duOqyboW4VlxRCJW/9vPE3QrlKKvZLF6jrw726usaNGtA+YS8JIqASq3FNWRlPxWt9mvx1r5AyGaEHCXgcmdIjG5p1EbD4NmpBdOif95D+3guFbUEbIZ/1fJiG+I3Y2FDW+Vj6qBNZnms7o/FvDbkwxyb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=DU4UD/Io; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674556; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=jHHCq7YEg0Z7Ltc2Mr84kLAbn7m6dfBAbfwCSjaMPgOgKKOvDnUUZK+qkYDNxP1v8IKSvbBMZogJ7LS84tAbB/2CPURBLUfvVIYzzXO3oNC6yAlySp1pIfyvAzUz8xWUGfSrHXxgDs3sp4PZ8uOb9DhydoiqRxSeNeLlREV9xSE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674556; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=DUtdIXjaREy7WfBZCel2VW8rBjJ3oorPzh/52xKYVfs=; 
	b=goMGTg4P3LzDm9aZL421XryMY6Xh0WtGM4s6/xZijXNkBqtmjHRYPdAFg1+QUXBQ5+idZ0nffWzVbbuAz5iuX9f1RLgjj+WVEpISY/VRiMxcSYdg5GZ8OTspjMVhrDWNnDTJNSduOJt71hK1lU9klzT2f50rC2ZJCmbL/wzLzBM=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+6f266330-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671580624301.85232319838497;
	Tue, 23 Sep 2025 16:53:00 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=DU4UD/IoZ/gCyN3m2WkIjvYtyTtFZUlZBejR9TRbCD0LXRhTC3c9CBvpyy0zatTEo1iQHBdOavh3gRv41izLLxNACgG/uNk7+d7q5ovjHM011VXmsAfudZL3M/vrP3oPg0xUQeuTskYL7pyYaGPagze2QO/yzcA5byho1xtzBRk=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=DUtdIXjaREy7WfBZCel2VW8rBjJ3oorPzh/52xKYVfs=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:53:00 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: keyrings@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.6f266330-98d8-11f0-8217-5254007ea3ec.19978fea8e3@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.6f266330-98d8-11f0-8217-5254007ea3ec.19978fea8e3
X-JID: 2d6f.1aedd99b146bc1ac.s1.6f266330-98d8-11f0-8217-5254007ea3ec.19978fea8e3
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.6f266330-98d8-11f0-8217-5254007ea3ec.19978fea8e3
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.6f266330-98d8-11f0-8217-5254007ea3ec.19978fea8e3
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.6f266330-98d8-11f0-8217-5254007ea3ec.19978fea8e3@zeptomail.com>
X-ZohoMailClient: External

To: keyrings@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

