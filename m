Return-Path: <keyrings+bounces-2847-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E6AE0D24
	for <lists+keyrings@lfdr.de>; Thu, 19 Jun 2025 20:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB7F51C2031A
	for <lists+keyrings@lfdr.de>; Thu, 19 Jun 2025 18:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723322D78A;
	Thu, 19 Jun 2025 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="b1ljQc3t"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2630E84E;
	Thu, 19 Jun 2025 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358995; cv=none; b=kI5Bc7XXozV73YE3TxvNRtipvnhSCx0BC77797YVTL7DzAfkJrLMasYolPVkW4DqIofpNufucwqPDXo6hF5PPTfYVwbyeK8D81IKXeqNYqsSPelMvmWpOds0um2+MmEQ4JARTrvN1H1g5dzjqGvVe61/3XnQjxkNsj49uGnJLj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358995; c=relaxed/simple;
	bh=IgLZ+wW2iKf4zedwAhePtcnxjJWns1fhdBd/jedKVVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qR4gtlIjgen6SZhOfIhKIc5Rz0nIrVlciToGKoi/0oZQhZdRO7igGBh6PfDMxqMlR1Qo41xP1Ly3cWnOmydCw81mw7ENIAyjJNkCEcqncBls6ugb0kmWuFSrxVi9C9fm5ythnd+o3w7d8PXKYa0WU1bKBFulmUPDFXb4/dP/+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=b1ljQc3t; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB4SVH002785;
	Thu, 19 Jun 2025 18:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aCu9v7
	Bko2S3a/lR0+u625Si9DterNuLFxnjektrgNQ=; b=b1ljQc3tdB1/UhXc9zztog
	7g7p3qukkXoDjQALWH1zEGu7j6H6gQFtuUYP1da6mlyi6vYj3CXboHtirCnY6laS
	HGr+7cgZsMKcyYB6/3JztYYlyNEaZVsUndIBiqhaEY9krVKOb6gyoVT28cTOqcPh
	Ojd+AIzbbvggCiL6V2Oozh6RVHh2OIBlEtTL3Jwv3QCGMPTLH2D3UbixLDkIbz3t
	2dxoh7GfeUbBu0kKEiWbkhJzK0a6I3UF4HU93Ec7L0hwWyObn1JLsXgfR+9F1NGC
	+yZsBqvzDeJkdqKtDx8AFRouaNLLoO97YQMy76otN8dEgUPSfceSbC8fXbP+HUhw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47beet4v0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 18:49:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFYcg2021612;
	Thu, 19 Jun 2025 18:49:35 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47cahwb9ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 18:49:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55JInZnF10683088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 18:49:35 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 159565805A;
	Thu, 19 Jun 2025 18:49:35 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EEE758056;
	Thu, 19 Jun 2025 18:49:34 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Jun 2025 18:49:34 +0000 (GMT)
Message-ID: <53e81761-47e1-400e-933d-0a53018c9cab@linux.ibm.com>
Date: Thu, 19 Jun 2025 14:49:33 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Module signing and post-quantum crypto public key algorithms
To: Simo Sorce <simo@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Ignat Korchagin <ignat@cloudflare.com>,
        David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        Stephan Mueller <smueller@chronox.de>, torvalds@linux-foundation.org,
        Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>,
        Clemens Lang <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>,
        Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <501216.1749826470@warthog.procyon.org.uk>
 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
 <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
 <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com>
 <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bPmLlaqINDo009ZWaJ3t33eb6lBrAuBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE1NCBTYWx0ZWRfXx5xWkXk8OiF/ nZ3EsvctxQPUTp/nMKLrwiOkBpq2knbo+0lC4URZ0AdllEzLiXW13t0CBvXAyj7nPpc+lXBGllK lB44iiVDcXZW5k6bb+j+IAhbA9CDej85O+tOTntJuu+mnkltVrTt6nRUuKzFa73u/OPV8D0aDuS
 GTvOsoUSb0t+NqeYX4M1PawmTnsHJglPFrFCBvItGrQcBtIBm39ENtaLTiDHc4chJ1D3qzYcZkg Rmm5ncfkKt2R41hB2wYx+5gm0ySNYlMzZ1Y0yauIAKsU8LFZo67hKrAx18T1/B7R+6ungCVr9S9 GCzmT9Wx9XOmDzDQLZCPRJaN1VrjS6yl2fqhPSMz66Ye0iygJTPK6Bhbgfe2YG25IU8dKOxbtzP
 h53x/s9JC8JdpV6ESPwi8k5tucsyPc6N8yOMFJVqM9Q9b4JgHgt3AiasadSK/Bq1xQQk1Ev8
X-Authority-Analysis: v=2.4 cv=PrSTbxM3 c=1 sm=1 tr=0 ts=68545bc0 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=6FsnnaTg7kJAo-EUfpsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bPmLlaqINDo009ZWaJ3t33eb6lBrAuBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190154



On 6/16/25 1:27 PM, Simo Sorce wrote:
> 
> Of course we can decide to hedge *all bets* and move to a composed
> signature (both a classic and a PQ one), in which case I would suggest
> looking into signatures that use ML-DSA-87 + Ed448 or ML-DSA-87 + P-521
> ,ideally disjoint, with a kernel policy that can decide which (or both)
> needs to be valid/checked so that the policy can be changed quickly via
> configuration if any of the signature is broken.
> 

FYI: based on this implementation of ML-DSA-44/65/87

https://github.com/IBM/mlca/tree/main/qsc/crystals

(entry point is mlca_verify)

I created a prototype of a kernel driver for mldsa-44/65/87 that can 
verify self-signed mldsa certs created with this openssl command:

openssl \
	req \
	-x509 \
	-newkey mldsa44 \
	-keyout localhost-mldsa44.key \
	-subj /CN=localhost \
	-addext subjectAltName=DNS:localhost \
	-days 30 \
	-nodes \
	-out localhost-mldsa44.crt

(it seems to use the shake256 hash by default)

https://github.com/stefanberger/linux-ima-namespaces/commits/mldsa.06092025/

There's lots of cleanup needed, but with a test suite in user space, 
this should not be too difficult.


