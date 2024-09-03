Return-Path: <keyrings+bounces-1931-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD31F969699
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 10:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D160A1C21801
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 08:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B164200134;
	Tue,  3 Sep 2024 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QkWrn3Qr"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D115573A;
	Tue,  3 Sep 2024 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351094; cv=none; b=X8HF8IfRqXI84b/oMtGRBfL194h6eQK/JRyu02WyQDQr6QwGYaEu8TMZPFgcf+dZPYeii2DyVefXYzwsjz8KjHHCO2Q5P89EI51uuJYqVlZ+UmrmdGoBZsQ2YUkKm0A319IYuux/kOVCyoHBLJyTLab5JFggYnnc1ypLUclpKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351094; c=relaxed/simple;
	bh=3WT4YhrvIXByI531oOZsnICq37sHBt1S6wXSAuYjBOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T/g3Kw8VXgVUVDoWvJHuOwdPrP+zL6o4eOXAVCnfCIahSOL5ny15xyFrDMXA9hpeE7rTjSz0xim9xPeAWkwGGuYhJdM/xDNms5NyHtbNSCI1BKUKgRt3VC7iHhOZh2jeSGnkzSXZi4NldhzRibfKJMoMFcPCaG3GX5StpTNAvOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QkWrn3Qr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4831lFsk011825;
	Tue, 3 Sep 2024 08:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=Bn8RNZPjAEKRN
	FGkkzHpV2AgIOoZAQ1VfOIxAAhP/gg=; b=QkWrn3QrJFvAUVxnyilfooJG9UQss
	8tjNBudeJ0OhmEwUzugEtKDyqsD6xgokCvM6dAySBbXcdpsmy0Rz1Kvkxr667aSc
	9/wsQvDZORfQwvm51P5LyuNzxIpwaEPvCS2vquNPuM6Cck8Fm5o1JPfd1E9rD9VN
	Nh+KePB9n7CetbeNiQfbaWF81/gAs3813J/bF8tBwY6l+spE4bmI0pTAf2QfJ9/C
	l0xVd1fV7P6H4QXuCccHzwRBo3cTB5lebKkGc96BbQyw+Xq1W1Is59Z8hOcb2Nyi
	PJpVhi/lnzRAKWlH2X1W8fgNkmGLY5iarXRj/7Pqzw2lIbBWLF+JQJ6iA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41bttychw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 08:11:25 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4838BO15015732;
	Tue, 3 Sep 2024 08:11:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41bttychw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 08:11:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48344L2p007980;
	Tue, 3 Sep 2024 08:11:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41cfqmsjua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 08:11:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4838BMiV29426170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Sep 2024 08:11:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A2C120040;
	Tue,  3 Sep 2024 08:11:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAD5F20043;
	Tue,  3 Sep 2024 08:11:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.242.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Sep 2024 08:11:20 +0000 (GMT)
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
To: jstancek@redhat.com
Cc: dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, zxu@redhat.com,
        R Nageswara Sastry <rnsastry@linux.ibm.com>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
Date: Tue,  3 Sep 2024 13:41:19 +0530
Message-Id: <20240903081119.73876-1-rnsastry@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <cover.1720728319.git.jstancek@redhat.com>
References: <cover.1720728319.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KWAQLZDZaAqzXHINLm59PUD_CkdJApQ2
X-Proofpoint-ORIG-GUID: dWhGuoXOSej-xNj3d5d7JwtLrG4QIjp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=403
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030064

>Date: Fri, 12 Jul 2024 09:11:13 +0200	[thread overview]
>Message-ID: <cover.1720728319.git.jstancek@redhat.com> (raw)
>
>The ENGINE interface has its limitations and it has been superseded
>by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
>Some distros have started removing it from header files.
>
>Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >= 3.
>
>Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs11-0.4.12-4
>and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and comparing that
>the result is identical.
>
>Jan Stancek (3):
>  sign-file,extract-cert: move common SSL helper functions to a header
>  sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
>  sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
>
> MAINTAINERS          |   1 +
> certs/Makefile       |   2 +-
> certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
> scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
> scripts/ssl-common.h |  32 ++++++++++
> 5 files changed, 178 insertions(+), 129 deletions(-)
> create mode 100644 scripts/ssl-common.h

Tested on a system where openssl-engine package was not available.
With out the patch, couldn't compile upstream kernel (tried 6.11-rc5)
With patch, could compile upstream kernel (tried 6.11-rc5)

Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>

>
>-- 
>2.39.3

