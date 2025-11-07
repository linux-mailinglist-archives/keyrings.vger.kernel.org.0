Return-Path: <keyrings+bounces-3309-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F504C416D4
	for <lists+keyrings@lfdr.de>; Fri, 07 Nov 2025 20:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28D444F084A
	for <lists+keyrings@lfdr.de>; Fri,  7 Nov 2025 19:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1A12D5944;
	Fri,  7 Nov 2025 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iwB9wdMk"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E6292B44;
	Fri,  7 Nov 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762543194; cv=none; b=FC5nCg4ErKz3eUfXaxbpFTHKIxQ+XMIt+sTFWLivO2GnPk6OOxS47wPphLtF2121TiJEgI98AZCT4bSJGHPd8Di0F7QahuemX7SOIQl4xRUNA7p0lqxR4ygIB+j3FdeiJ2latyeXa5z3t1o2MOPGbOwst/VrtuCYk0dG6Ddhp1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762543194; c=relaxed/simple;
	bh=oLgM015OM6CB7TstOOmFItZLsdG8/LLCc/TNDBwFG6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOZevz1otXPsE66dGCPBEJ1+wvqC1aFzUm9zLywC2CvMEGhJjjDyRGYpIQ4CwIY9WVvvvzCZjCAlwtRMGc9P+0oCjMuJX/PFd+u435X5lEs3aaCKYjD8t/2izd4qvG+6u4djuRzC518mmk4T/HN/oNPWd1qa00qejom6frArhPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iwB9wdMk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7FMvtd018950;
	Fri, 7 Nov 2025 19:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lYTk4Q
	KdhbLy2+aNu5zpAguuzePfls8unBeR/cJArbk=; b=iwB9wdMk9hTxVeHtkUr5ZA
	cLnZ41L2VPDblbPE/dD3cqNca9AUz2Re0air3MQOsWUzuDa9/pjsq+5HUYmF0+7N
	E/eOGXlxxlOAh6+PilbmGoN+Z6wYI060lyTi5r1+bD2svJoTrspDxwc1d+N5vMGH
	wToIEfFklRwF713ChKOD1WPQKos4uLBmd2pAMxDO689m3PeegbwoVW1JpNXhNUqD
	CCjvrta016nsHQaWRE1upj501r7iqkTv7Joz4kQZpCGwfF/0YJ+dhcDsxDIL4RPD
	YZPBv51lZcUIOCPJdfsDlpMw0o83dRk5MeSo6ooRfCC41cSqlKIVc+hZV0qZnJfQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mrngjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 19:19:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7GHfkX021463;
	Fri, 7 Nov 2025 19:19:25 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrk49ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 19:19:25 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7JJBaY18547454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 19:19:11 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D778858060;
	Fri,  7 Nov 2025 19:19:24 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDF0D5805F;
	Fri,  7 Nov 2025 19:19:23 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 19:19:23 +0000 (GMT)
Message-ID: <3bb08a53-0387-41a7-98bd-31054edf48cd@linux.ibm.com>
Date: Fri, 7 Nov 2025 14:19:23 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Module signing and post-quantum crypto public key algorithms
To: David Howells <dhowells@redhat.com>
Cc: Simo Sorce <simo@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Ignat Korchagin <ignat@cloudflare.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Stephan Mueller <smueller@chronox.de>, torvalds@linux-foundation.org,
        Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>,
        Clemens Lang <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>,
        Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <53e81761-47e1-400e-933d-0a53018c9cab@linux.ibm.com>
 <501216.1749826470@warthog.procyon.org.uk>
 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
 <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
 <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com>
 <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
 <61528.1762509829@warthog.procyon.org.uk>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <61528.1762509829@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LyNIrI7VH9IiLAXu7TEEMMMI12NyfKyF
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=690e463f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8 a=UqG-1mT3ekDs38WSfRMA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: LyNIrI7VH9IiLAXu7TEEMMMI12NyfKyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX21XGpXMFmoYG
 MhxAhCgXJnE8FGuNgzAPbERaTsmc2jpgLhBmlVq7yszuf+xaw2RSQc57yCV6dompEOMLxjaeBbI
 Pln95yeGvq1FrTG/glkCWUS4WTLJNMtdvtFe3mkLlyF5x4Z1/5+zs51UYm8G76LCjlt3P80hA8c
 Alxn79cK285N2jIyVAbR/HQpf8Yh0FIZbuAubbL1DtgWe72kFUt640HcACuBBusaH+BvYxl11pU
 OEX6adxi+0QRPQrOINZQhVnQe+R4pZt3sDEH8gBUlV48IUsCySAuLsaACToLeaVHrJFiSTA0d7B
 Deu1qxobgxNhZymH6nq4AuIEIFQKA0BWBgDUECjzQHfZuBLWqQ/+HBKJzCBOB0mlGPP+PF49K47
 8CqgdRueEFH9Nb42u/TH09EfMqn4fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001



On 11/7/25 5:03 AM, David Howells wrote:
> Stefan Berger <stefanb@linux.ibm.com> wrote:
> 
>> On 6/16/25 1:27 PM, Simo Sorce wrote:
>>> Of course we can decide to hedge *all bets* and move to a composed
>>> signature (both a classic and a PQ one), in which case I would suggest
>>> looking into signatures that use ML-DSA-87 + Ed448 or ML-DSA-87 + P-521
>>> ,ideally disjoint, with a kernel policy that can decide which (or both)
>>> needs to be valid/checked so that the policy can be changed quickly via
>>> configuration if any of the signature is broken.
>>
>> FYI: based on this implementation of ML-DSA-44/65/87
>>
>> https://github.com/IBM/mlca/tree/main/qsc/crystals
> 
> The problem with that is that the Apache-2 licence is incompatible with GPLv2.
> Now, it might be possible to persuade IBM to dual-license their code.

Correct. It was supposed to become GPLv2 + Apache 2.

> 
> David
> 
> 


