Return-Path: <keyrings+bounces-1520-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8F8D41AF
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 01:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4B9A1C2125B
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2024 23:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DA7200109;
	Wed, 29 May 2024 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nGK0s54c"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AFF17B4F8;
	Wed, 29 May 2024 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024127; cv=none; b=dOMjPX11fQvcKNCn5iaVIsgHyWxXxg7UyXxZAicGFubQytrijcyqsp8ATpopvKd4qa4vVa97v6Mj+UTk6n9cn+bb+4bVU9QIjVNJEcaqm1K8WKBwgShTFcPR67gJwngSCVmieNlyb2Uur9oNjk6LwQsCS9Elh0B224zDeZ5i9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024127; c=relaxed/simple;
	bh=qqaqxixml0DZHaHq5au0Y/z6Z7gDIpLbU8xm2/jNyiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4xImnTvzAlmJwxwiN6I7T52VC9zcmJyYgb2as6Fztq/PcxjOI5gE/bnIGQaCmG1qRKRF62ONLHAT6QE2HRsBgoGYUIhLGGQqg35IFqUXPRnErGuKk+fCIfQ5qOqUUuusd2LIPa47stLK0t5GVPn2XweLtUGy5tx81KDvCk54Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nGK0s54c; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44TMt8sS015064;
	Wed, 29 May 2024 23:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=pp1; bh=oTnFNl/RFWIcMBoViFfGUFJ0EOULpVLfxgPZ5X7QdL8=;
 b=nGK0s54cLh/itnJYRHwdmOChZQLvFqPuIfV+Uoc+HAJ/rH1Zwhy4FR4xP21D+qKHK956
 Hh2VkPO4vs8aDP/zDO7gBxpCbnS/z52gk1gLn71dISDZ0h1RUNiYTPiccj5e2mTkLiID
 0ZT2K4IrVmzRp69PHVRnpUry9XKMD4Ne4vcp0LQiTf5YBTfZuAVnxbqAalElRsP5BKV/
 V0c1XZH7Quym5pNRV/BrvBSYVwVQ5sVIhzmV8oIMWBZH4UMQF1tIDTKd2tFESSyT/72D
 T8WJGxRWh+XkNs6ZuVqB3hy+qEu+QAxe/MeLLHe+vt/mMbgYOPRcEcp7d9bE/urlvkwI 9Q== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yedhsr0np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:08:35 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44TLJs1F009841;
	Wed, 29 May 2024 23:08:34 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpbbpkf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:08:34 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44TN8VoU16056916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 May 2024 23:08:34 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D57B558055;
	Wed, 29 May 2024 23:08:31 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A09058056;
	Wed, 29 May 2024 23:08:31 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 May 2024 23:08:30 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/2] ecdsa: Use ecc_digits_from_bytes to simplify code
Date: Wed, 29 May 2024 19:08:25 -0400
Message-ID: <20240529230827.379111-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: chh-x652G66ubPkPQruPeqE_g9_7uw5M
X-Proofpoint-ORIG-GUID: chh-x652G66ubPkPQruPeqE_g9_7uw5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 mlxlogscore=738 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405290166

Simplify two functions that were using temporary byte arrays for
converting too-short input byte arrays to digits. Use ecc_digits_from_bytes
since this function can now handle an input byte array that provides
less bytes than what a coordinate of a curve requires - the function
provides zeros for the missing (leading) bytes.

See: c6ab5c915da4 ("crypto: ecc - Prevent ecc_digits_from_bytes from reading too many bytes")

Regards,
   Stefan

Stefan Berger (2):
  crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array
  crypto: ecdsa - Use ecc_digits_from_bytes to convert signature

 crypto/ecdsa.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

-- 
2.43.0


