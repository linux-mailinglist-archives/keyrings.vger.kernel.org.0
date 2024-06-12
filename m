Return-Path: <keyrings+bounces-1605-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B889056A8
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 17:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27491F24D9D
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 15:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C2B17DE35;
	Wed, 12 Jun 2024 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oS+6I6qH"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294F1CABD;
	Wed, 12 Jun 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205575; cv=none; b=DmoaoGVKHY3FgawWAE+B/baWKt7JePAOWhT5OiKLAqzy5qlcYeOdzlPoox+ScqIP7YZ12deU1AYv1TCuHi+2rWy2N0uqoxex9U0kX3bDE+O1ovyoopIoCfvuPe1eMOocplgtZ7sJBdNxKXMBDk6V5KUqgYmP/OnYEzkuDKfGqbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205575; c=relaxed/simple;
	bh=6KQuNfs/TXpkp2KlxNFXCFMll5A5h+Z36Mt0IjiDsIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbWtGfDEXeWxWPKFFfWk7417G5SdTX0goqynhGxuSxrptGZ/WqF/kGXLEiEcTlJdLKm4ftLZgXCi6IoMflVvzyT4f0vaZpuw0aysRbDKNx3AewwzkEWCjPi40kTCvB1ow2BTYEtTay+ynYoJsMCBM8W3RyJhHkePeN3TPCZ9ZHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oS+6I6qH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CExI54030986;
	Wed, 12 Jun 2024 15:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=a8QKQRxgGexcpLfklLGXpnIHyr
	R8uSHIHaiYX77300M=; b=oS+6I6qHQCaCQ0GhDfiTa7EUJtE+O73mIZP68wY+sw
	1I56ZOPFSAmje+tDR7gY2NB3jhcUwHtK7qxxQnD3OKbEXQqfXVGjgnE88AKhsphx
	qjFMJNbXFwGbAkQh9wf8VtTmyd0Yh9+JU6jaPp3l4KMyaL0NEBGkmr/ok5aI1cQ1
	3gsLNPf9405joJBKq8okxsgb8t8yEsGxbTWrCXW9LzAktFudC6aL07s5Qla1OOsI
	o7ezLx2+yjizNj1oNl+Kf4g5WzJoq3ZxSdF+POjK35xAWxdEyQfeid29LoG5bCWt
	cxuPHABYwtFYnXXmYoUrmPk7fl6DGc/WeTBqntUHD2gg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqdwg81qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45CDbUOd003881;
	Wed, 12 Jun 2024 15:19:23 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn2mpxxh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:23 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45CFJKuH65536478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 15:19:22 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE91358068;
	Wed, 12 Jun 2024 15:19:20 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1730C58059;
	Wed, 12 Jun 2024 15:19:20 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jun 2024 15:19:19 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, saulo.alessandre@tse.jus.br, ardb@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [RFC PATCH 0/3] Introduce ecc_digits_to_bytes and clean up ecdh.c
Date: Wed, 12 Jun 2024 11:18:57 -0400
Message-ID: <20240612151900.895156-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XQCTyrQyVk0jhJIneMgpQ6o3Y4BJECbR
X-Proofpoint-ORIG-GUID: XQCTyrQyVk0jhJIneMgpQ6o3Y4BJECbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=464 malwarescore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120106

This series introduces ecc_digits_to_bytes to convert an array of digits
to bytes and uses this function and ecc_digits_from_bytes in ecdh-related
code to convert between byte arrays and digits. Using these functions is
generally better than using ecc_swap_digits. The latter cannot be used with
curves like NIST P521 since it does not properly handle curves that do not
use all bytes in the most significant digit.

It also introduces ecc_curve_get_nbytes to get the number of bytes (nbytes)
a curve needs for its coordinates. It derives this number from the nbits
parameter of a curve. Using this function is also generally better than
deriving nbytes from ndigits, which does not work correctly vor NIST P521.

None of the converted functions have been used with NIST P521 but only
with NIST P192/256/384 so far, so they work fine as they are.

Due to concerns related to constant time operations when signing with EC
private keys I am not planning to add NIST P521 support to ecdh, so the
changes in this series are primarly 'code improvements' (-> RFC).

   Stefan

Stefan Berger (3):
  crypto: ecc - Implement ecc_digits_to_bytes to convert digits to byte
    array
  crypto: ecc - Implement and use ecc_curve_get_nbytes to get curve's
    nbytes
  crypto: ecdh - Use functions to copy digits from and to byte arrays

 crypto/ecc.c                  | 47 ++++++++++++++++++++++++-----------
 crypto/ecdh.c                 | 24 +++++++++++-------
 include/crypto/internal/ecc.h | 37 ++++++++++++++++++++++-----
 3 files changed, 79 insertions(+), 29 deletions(-)

-- 
2.43.0


