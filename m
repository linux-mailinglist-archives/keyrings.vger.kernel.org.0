Return-Path: <keyrings+bounces-1978-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B3974458
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 22:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBB5A1C24EBE
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 20:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB66193431;
	Tue, 10 Sep 2024 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IYe2zooS"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328A188014;
	Tue, 10 Sep 2024 20:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726001643; cv=none; b=PCI+tzVV4CGq5Gj2Fli/nQSsL9V09oCna4CnofEcjNXfl1CdcTNFEKjT9QL1m6Z7cTVrk18oBalXdka0QJmfIbwDTeG305gigreCD4nRYGDiW1cZQCvtLCSOromfc7obHpZt/1g9eCRkkCfWqDFsPpMOJ4pMEh6K1nCvCSlbvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726001643; c=relaxed/simple;
	bh=BmmUaqGUVrCJoLi60JHyuV7xSP2HMQzH1y9fks5k5sA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y/+JVP+bzj8YASyEj+IEsj8my1FJdHCqrtkla0hzJlBBCU+2bYErivE8o+dVD+dHTbhkDao1AjCihhL0HfuCU1PmuMaNlOSLmB61TE17Kdl1PU9FSEOSZxDQnuVQsoyj6+xhj4x+vUPxtHu+kbFRoSaK/i2+nKsDwZ+5iSVZNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IYe2zooS; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AFKRiE021760;
	Tue, 10 Sep 2024 20:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	XoMAaSbV0shsbM/kvb3WVXBVHWOh+fH7ZZ7BY/PYM7Y=; b=IYe2zooSlSjIUBes
	AaDKCJSyZElbUcn3pHdJg6AasSWiStFJKW+5tmJIWNsLMt+FSzG9nZYNZzaqjjvR
	k3yQiXm3px9kzQZ/fIbFzy3InoE1Pta9dKXbA62jdftY2XP7kDa2QkY8J3gX8rWc
	B6m/dCPxuJVEfNpz+1EJ0pCZaqzYQOdXi+NxY+ppJ4MWFjec8hDgMdO5cJHXSDbd
	RGDokenAz4etYSV6oltvYlROcSpmHQnmzYOi7E/WMdIYx+dJToakGhE4BCp37kH+
	C3M1HNeBDnOD5SMCV6biLaP0ZYlF52rp7enqSu3KyZjRhhNwocjkRvcSh/gXi+/X
	O7RbNQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qa47g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 20:46:34 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48AKhTrr013669;
	Tue, 10 Sep 2024 20:46:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qa47b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 20:46:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48AJKOLw019853;
	Tue, 10 Sep 2024 20:46:33 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h25pwh4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 20:46:33 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48AKkW6J15532672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 20:46:32 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 255495805F;
	Tue, 10 Sep 2024 20:46:32 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB1E25805A;
	Tue, 10 Sep 2024 20:46:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Sep 2024 20:46:30 +0000 (GMT)
Message-ID: <1f102959-9a9b-4684-a1e9-ce434ee81ef5@linux.ibm.com>
Date: Tue, 10 Sep 2024 16:46:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/19] crypto: ecdsa - Move X9.62 signature decoding
 into template
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>, Vitaly Chikunov <vt@altlinux.org>,
        Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>,
        Andrew Zaborowski <andrew.zaborowski@intel.com>,
        Saulo Alessandre <saulo.alessandre@tse.jus.br>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>,
        Varad Gautam <varadgautam@google.com>,
        Stephan Mueller
 <smueller@chronox.de>,
        Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org
References: <cover.1725972333.git.lukas@wunner.de>
 <467f4245dffbe19b9e9bde3043fba39ab5c2cfda.1725972335.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <467f4245dffbe19b9e9bde3043fba39ab5c2cfda.1725972335.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cL8OP3XUY6wy4MwnlbzwpeZa16A9N2o4
X-Proofpoint-ORIG-GUID: RXhU_RUy_iAKxC2X9Mv2ZQwZ4hkOukOY
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_08,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100153



On 9/10/24 10:30 AM, Lukas Wunner wrote:
> Unlike the rsa driver, which separates signature decoding and
> signature verification into two steps, the ecdsa driver does both in one.
> 
> This restricts users to the one signature format currently supported
> (X9.62) and prevents addition of others such as P1363, which is needed
> by the forthcoming SPDM library (Security Protocol and Data Model) for
> PCI device authentication.
> 
> Per Herbert's suggestion, change ecdsa to use a "raw" signature encoding
> and then implement X9.62 and P1363 as templates which convert their
> respective encodings to the raw one.  One may then specify
> "x962(ecdsa-nist-XXX)" or "p1363(ecdsa-nist-XXX)" to pick the encoding.
> 
> The present commit moves X9.62 decoding to a template.  A separate
> commit is going to introduce another template for P1363 decoding.
> 
> The ecdsa driver internally represents a signature as two u64 arrays of
> size ECC_MAX_BYTES.  This appears to be the most natural choice for the
> raw format as it can directly be used for verification without having to
> further decode signature data or copy it around.
> 
> Repurpose all the existing test vectors for "x962(ecdsa-nist-XXX)" and
> create a duplicate of them to test the raw encoding.
> 
> Link: https://lore.kernel.org/all/ZoHXyGwRzVvYkcTP@gondor.apana.org.au/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

I ran my signature verification test cases over this:

Tested-by: Stefan Berger <stefanb@linux.ibm.com>

