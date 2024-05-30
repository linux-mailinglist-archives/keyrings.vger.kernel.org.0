Return-Path: <keyrings+bounces-1527-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1A8D4BD3
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 14:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F3AA1C21655
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABC7132121;
	Thu, 30 May 2024 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jGIyEAii"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57A18309F;
	Thu, 30 May 2024 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073084; cv=none; b=hDxysxhDA8thpNeO8Fc20Bghs9PnTl1xsqVVSetg9xBd74eJwfu+iZbqcx0EDVvrPSWsdJKmhqV60B4l2C0WHj09X4hlpDfuvDtXkD/ESDDXd69LPzqR+CrvAReRSZj328SbIGnvydyjtLG1nqWxKQo31/HAVKK5zDMRRmp6LDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073084; c=relaxed/simple;
	bh=tl3Gx8GhE1b/e4gvK0Lfp630cLEwyy06op12vRvGxFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfcvvGeyBIiQtQmy9LMj/z6PbhlgPZYUCauOTrFmM0h0s5FlCAFcTzxKRzLTU4E25Oba9LOnr17a2E5g2rYU8VqP1NbV6TqzXs/PD7tq3UBhjZzCGHnrrBm+Fl1KTnvO+F65hoAP7EatgwKREO3YbRoa/m6FCcVZ0165qgBpa9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jGIyEAii; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44UCGPZM001414;
	Thu, 30 May 2024 12:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=x/5WyAvEHtHaYc78l54/mQX1c4iwlaGJHyfS9qbBN8Y=;
 b=jGIyEAiiehCVGbYpPrTADNFymVxbc9/S8HJrWCjV3Sg2JybvRHYWpX355TYwCCIBvjAn
 UhynzApJTI2k9YlE2VTuvL9klXPAvkrzppkFPQrq9nLqbbL+kR3PjXQgn13btnSO8zKl
 vK/oSQbLGCv3Qw73R61y4FLueb+ICyJYin45rhOtTjC1kE80FGlO0vfC2dURJnlMIHgG
 nsAuj71uBinmZV6XbJmkRT6KmJSsA68hwem50ORNid4HZLCV9JvLtG5BECfd6FPB0DiW
 XtkC1mGbw97WGLlUW5y5x7QDrtdLp8iEXydqveXa6sAtlgZBnU+AS1X8GKImVPMmcdK1 Mg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yes5nr2sg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 12:44:34 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44UC6XH8026789;
	Thu, 30 May 2024 12:16:53 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpd2stbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 12:16:53 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44UCGoM618285144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 May 2024 12:16:52 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50F865805B;
	Thu, 30 May 2024 12:16:50 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7655804B;
	Thu, 30 May 2024 12:16:49 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 May 2024 12:16:49 +0000 (GMT)
Message-ID: <435d756d-2404-4f66-9ce3-363813997629@linux.ibm.com>
Date: Thu, 30 May 2024 08:16:49 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ecdsa: Use ecc_digits_from_bytes to simplify code
To: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
 <D1MPWI6C2ZCW.F08I9ILD63L4@kernel.org>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <D1MPWI6C2ZCW.F08I9ILD63L4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wnydKamIK_X16yge0UrmJz1oP5kdyasd
X-Proofpoint-ORIG-GUID: wnydKamIK_X16yge0UrmJz1oP5kdyasd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_09,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 mlxlogscore=966 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405300096



On 5/30/24 01:08, Jarkko Sakkinen wrote:
> On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
>> Simplify two functions that were using temporary byte arrays for
>> converting too-short input byte arrays to digits. Use ecc_digits_from_bytes
>> since this function can now handle an input byte array that provides
>> less bytes than what a coordinate of a curve requires - the function
>> provides zeros for the missing (leading) bytes.
>>
>> See: c6ab5c915da4 ("crypto: ecc - Prevent ecc_digits_from_bytes from reading too many bytes")
>>
>> Regards,
>>     Stefan
>>
>> Stefan Berger (2):
>>    crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array
>>    crypto: ecdsa - Use ecc_digits_from_bytes to convert signature
>>
>>   crypto/ecdsa.c | 29 ++++++-----------------------
>>   1 file changed, 6 insertions(+), 23 deletions(-)
> 
> BTW, would it make sense split ecdsa signature encoding to its own patch
> in my next patch set version and name it ecdsa_* style and put it to
> ecdsa.c?

I would only put it into ecdsa.c if functions inside this file (can) 
make use of it, otherwise leave it in your file.

> 
> Just asking this because the part should be the same same for any ECDSA
> signature. It must scale also to all NIST variants before my patch set
> can land.
> 
> BR, Jarkko
> 

