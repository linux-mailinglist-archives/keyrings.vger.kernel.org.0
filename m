Return-Path: <keyrings+bounces-1579-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85079900E1D
	for <lists+keyrings@lfdr.de>; Sat,  8 Jun 2024 00:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB141F22A00
	for <lists+keyrings@lfdr.de>; Fri,  7 Jun 2024 22:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A6A14EC4F;
	Fri,  7 Jun 2024 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BMyEDirh"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509D13DDCA;
	Fri,  7 Jun 2024 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717799704; cv=none; b=dCha+wIVrHY8xZMrj0fUDMs52FOX+X0NDypAHPylldzEmwb0yK6lq9Ul63F6MNMhSOPTbI3Sx6ap78mV9LU/ECUcLOwKaiDNjmO8Cel7tcXZZyIx7nlmShhbP2+wIRA6X9VALnoUpiQMQTL5Mplpa6D+omMc5rMOYkmuy2kOpw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717799704; c=relaxed/simple;
	bh=xuW5YMipoDmpaSgaJYvpXyIsNYOuZ14szg1dZSk48vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1Bv5Z0/8XoQx3GJJSCTZKXZPu6InVLdmSpMG98AthjvSospXM/OzdA9As+PuZDkxMfNO/k2WxZSqpn3NGnPF9Z7WJadWP+WLFD43IaQgfdrwcq+e5u5LB8eqZQGqD+Fm2Cq/Qbo+hgogQUEzoNXDn68VGrGIJq8LFjlFFygsh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BMyEDirh; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457MSKZf021486;
	Fri, 7 Jun 2024 22:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=pp1; bh=3GVoN+5pW+Vk9JH5zvBAo2aIACrddGBARf8eQVvC0Qw=;
 b=BMyEDirhFUtA88jgKreia0nAnxxPfWg8dQ0atFN57qT6JTjP1q5TQ2sgPgzU2hvM+8yo
 yVB14pRlw+BHXL6Ej/2ZrLlq+aDSKs7emIFrvPCrWA4wqjtCUlmGMqBVp4u7wr57hgpm
 3UhzoHZJ6+6SYOCag78NUoRUHXRbDb+9cHXU0ZtJan+V+mGMItWlYM3a5uPqFYTLp2+t
 Eq+u6+cg3g3bptcCO4Ntw0G4Y1AqOTQOwlT4ry4Zpi/BtSL0lz3zsnziQJA/5FZeyKd4
 HSWKwM05grShCbWDIY7cEE2iKuSuiYeZxZYFe3LHebEm/hyohQn5Eu5ubmnXgZLtLnQl TA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymb0vr07n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 22:34:49 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 457M6pWq000829;
	Fri, 7 Jun 2024 22:34:48 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyukeym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 22:34:48 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 457MYjqk26673768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2024 22:34:47 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5DFA5805D;
	Fri,  7 Jun 2024 22:34:45 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 442B858052;
	Fri,  7 Jun 2024 22:34:45 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jun 2024 22:34:45 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] crypto: ecc - Add comment to ecc_digits_from_bytes about input byte array
Date: Fri,  7 Jun 2024 18:34:17 -0400
Message-ID: <20240607223417.587821-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CMfxTGfIkCj_YCLycTmTN-84hQpfsVH7
X-Proofpoint-ORIG-GUID: CMfxTGfIkCj_YCLycTmTN-84hQpfsVH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=968 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070167

Add comment to ecc_digits_from_bytes kdoc that the first byte is expected
to hold the most significant bits of the large integer that is converted
into an array of digits.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 include/crypto/internal/ecc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index f7e75e1e71f3..0717a53ae732 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -63,6 +63,9 @@ static inline void ecc_swap_digits(const void *in, u64 *out, unsigned int ndigit
  * @nbytes    Size of input byte array
  * @out       Output digits array
  * @ndigits:  Number of digits to create from byte array
+ *
+ * The first byte in the input byte array is expected to hold the most
+ * significant bits of the large integer.
  */
 void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 			   u64 *out, unsigned int ndigits);
-- 
2.43.0


