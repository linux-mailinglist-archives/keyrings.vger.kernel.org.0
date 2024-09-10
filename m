Return-Path: <keyrings+bounces-1980-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53946974501
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 23:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E89AD1F23707
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 21:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7D718C33E;
	Tue, 10 Sep 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IzB/gmcy"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34416C854;
	Tue, 10 Sep 2024 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726004926; cv=none; b=Pju6bPJ8HlO/pwPXE60Ufj+NrqQS7vAM65QWmS0ExeCQU2c2La5JoRo1V2NedX8r8TOqQlt6HcBjrxA0zX8FigCuEXiv/0skPQpW9/xpYhmsAiPlszhszpkk1ep9114NXqMtT+V62LeeuPjaS2upHqyK0pm3DilDyl4hVNVEAPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726004926; c=relaxed/simple;
	bh=vGPncFprsxm/fAOWXG3+i9RfL/D57gHl+J/0ZFyJTHE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jG2Fv7h1Uduz8QiUa1xEyfWtWzjA1vRtn5umXkY5c0MbVV27K4BedOdI1nlu4XGUXIWxI8aHpl0xwc7IWg22afoeUUhQyzoPHkYGyFpwgC1CPfk4oadPUw9+CXg9LAvTqrbQikjviBpn17Cxj5v3KjOiRH782MN1E9kpG3/F2Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IzB/gmcy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AFKRlt021760;
	Tue, 10 Sep 2024 21:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	CX2CcmFdyKQa10u3RE7Hlil+wr28ZSrTGQQi9hSImxo=; b=IzB/gmcyaV+UnvY4
	TFtkw7t05j6nEAj7zvZjrTr9dacMTFITalzb8rcqWZMlAXVtq0tPSv+Ry4Pq7Je7
	2W/3gOearyhbx5yn4xNnD8TiOKMmh6pzAYIcuhbrnknhzI6Pi7ZdNdk3GsF0WBJs
	Sf+Bp4fA3KpzlAtgpVAsCClI11WdZ91yww9w/g/DCqV5vC6D8oGUQ6NE+f1thh87
	C6P+vs4PQ9ZAOnLO3Mk04VuoxQSjDHIwT04CZktjSiyPxGniOgfdBP1MUanFagUv
	IKb9HIpTz752+ygHnBGBvhkWaFlQotojNTrEKV+8FDRcaXhTx3cdt9b1vHPaT24e
	NsHhbg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qab2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 21:46:21 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48ALkKhx005236;
	Tue, 10 Sep 2024 21:46:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qab2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 21:46:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48AJL4H9019891;
	Tue, 10 Sep 2024 21:46:20 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h25pwqsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 21:46:19 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48ALkJG4459358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 21:46:19 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC0CD5804B;
	Tue, 10 Sep 2024 21:46:18 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57A3158055;
	Tue, 10 Sep 2024 21:46:17 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Sep 2024 21:46:17 +0000 (GMT)
Message-ID: <20e10bf5-2ac1-4d10-bedd-7c61572fc55f@linux.ibm.com>
Date: Tue, 10 Sep 2024 17:46:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/19] crypto: ecdsa - Support P1363 signature decoding
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
 <73e9e6b6ba2631e2d9474bd53be165b2ae8810d4.1725972335.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <73e9e6b6ba2631e2d9474bd53be165b2ae8810d4.1725972335.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZZxG3LUB8lzeSRK_jilvAzve6lW-p3CZ
X-Proofpoint-ORIG-GUID: 0ItC-gs4zkE9iI2T34SnfGiVEVaw30K0
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
 malwarescore=0 adultscore=0 clxscore=1015 mlxlogscore=747 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100161



On 9/10/24 10:30 AM, Lukas Wunner wrote:
> Alternatively to the X9.62 encoding of ecdsa signatures, which uses
> ASN.1 and is already supported by the kernel, there's another common
> encoding called P1363.  It stores r and s as the concatenation of two
> big endian, unsigned integers.  The name originates from IEEE P1363.
> 
> Add a P1363 template in support of the forthcoming SPDM library
> (Security Protocol and Data Model) for PCI device authentication.
> 
> P1363 is prescribed by SPDM 1.2.1 margin no 44:
> 
>     "For ECDSA signatures, excluding SM2, in SPDM, the signature shall be
>      the concatenation of r and s.  The size of r shall be the size of
>      the selected curve.  Likewise, the size of s shall be the size of
>      the selected curve.  See BaseAsymAlgo in NEGOTIATE_ALGORITHMS for
>      the size of r and s.  The byte order for r and s shall be in big
>      endian order.  When placing ECDSA signatures into an SPDM signature
>      field, r shall come first followed by s."
> 
> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0274_1.2.1.pdf
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


