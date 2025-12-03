Return-Path: <keyrings+bounces-3500-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48002C9F449
	for <lists+keyrings@lfdr.de>; Wed, 03 Dec 2025 15:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60ED83A6DD2
	for <lists+keyrings@lfdr.de>; Wed,  3 Dec 2025 14:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58032FB99F;
	Wed,  3 Dec 2025 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="o+w9U9Rs"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C3B2FB98D;
	Wed,  3 Dec 2025 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771578; cv=none; b=V7ZCL2kcwv/8zxMO5+9bfvi8M8AWrdr41MHNB3nRN9zXK0bQKqn0a3rnNIgqTnK16HYHzGc+cakjlbMlUMoEVJ850fzsYL38uienNMxWW6MXsgNyWuUl+BAH1H/yhfAU93cUkS+3WXM3XBsQ8olprTto4Rlfzbci2Sqm6ltgG+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771578; c=relaxed/simple;
	bh=3fHKIFDijVXh2sdzuBpCDFJ9pZdsPHpG6lafVbE6XcU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XmRWKz6EzkFAA4FGG/TmHINXjTL5sIlk6jfD0/Q5Jsq/p5vXGuKF3RPKX3srMC1L0BVxLcLQ8EdgIDyD0HdZ3LWJUWmwhfNrimRmqPsLJ+LP0OTWG5UOm8/N/SkbXTFbJKOWy8AwsYgaD1jWAYAEDSZ2yMnQlVc9ihy9udw1eiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=o+w9U9Rs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B38eVeX002684;
	Wed, 3 Dec 2025 14:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=qg38prt9TH+H53GK2QjDx8lhyYMq7xohhkT7KP6iT9s=; b=o+w9U9RsiPpI
	ApZbFQ9ew5Br7K0zzTZJz0KMiVL8uSAgMmHpHA+wgWTU73YZcyXJ9r0WDThVYJsU
	ONpoDmG1gHOrduCLXkmntGjHul72GMC1OyrfoTjTwZECbqG9DgcvAP+ZdCZhHlVL
	TzCuAQFZubCpBsca7NzN4cen1hpxCkvHyAesm4njAS8rQl/LUefkCrDsXAHH+Rdn
	aIr4erehlMCXolfd2yyRNMuQPFomcveJ7Nbs4P5pum5Op/JZ3TcDRt96B79lFOxl
	xsfi9xgTLw2DgCi6s3LqC59csAgXftFbzPRiM9Z6X3LvhBa+kfq9pwN8N8QIsh6L
	qW7IiT7WOg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8utqyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 14:19:25 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B3EJOH5000930;
	Wed, 3 Dec 2025 14:19:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8utqya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 14:19:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B3Ddrus003864;
	Wed, 3 Dec 2025 14:19:23 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardcjt7w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 14:19:23 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B3EJNVX28574318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Dec 2025 14:19:23 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1947458056;
	Wed,  3 Dec 2025 14:19:23 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56DD658052;
	Wed,  3 Dec 2025 14:19:22 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Dec 2025 14:19:22 +0000 (GMT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 15:19:22 +0100
From: Harald Freudenberger <freude@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Luis Chamberlain
 <mcgrof@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez
 <da.gomez@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Jason A .
 Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephan
 Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>,
        Ignat
 Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] lib/crypto: ML-DSA verification support
Reply-To: freude@linux.ibm.com
Mail-Reply-To: freude@linux.ibm.com
In-Reply-To: <20251203072844.484893-1-ebiggers@kernel.org>
References: <20251203072844.484893-1-ebiggers@kernel.org>
Message-ID: <94cb715bd8782b93e10a285c6dc6ec58@linux.ibm.com>
X-Sender: freude@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TEchfwkShtSIAN-N8v8p8IsahX8PvYlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX0AKZL3EknfxW
 sZ4viDDWnCqdIxeu84t4JSN+4wIiEGxNA7ZCG0LXVrhfdU/P/WdV/DFrcXh9fTXSSgEesHVZA4Q
 RQm0Rfj7JLHHsdWMieHzDh+oEGBD+WhhZUD+6/a2lsmjfAhMl/cSmsOzkG+43GXppJTZQEmw/XC
 c0S5HW+3i05Yi7VCjvSCgml3JQV1aCkZFbmhphahKbvrR6aAejGBsrOhnCNRgjLJ+EjSp6StQXN
 0Zm830tDqIyaI5iADr9tmGICOm6HUG1n5CtCYPfJ/6b8prWxR7KWRqWRsmc32+2CNrIGDQMevvL
 j6pLMXNLidGVSncyZ1yJQT0aJxDvECi7mebv4fuofJL/aInYNaeNxCgT3jpubkUKIPrUPNE86S6
 1d//odpY5MKJGG1cvMN5w0b1cpOJEw==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=693046ed cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=00hyyMZXiDFzOaysM7QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: eTpLS2S2kx9t96xTBvjb9rkDRNlOjaDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290008

On 2025-12-03 08:28, Eric Biggers wrote:
> This series can also be retrieved from:
> 
>     git fetch
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> mldsa-v3
> 
> This series adds support for verifying ML-DSA signatures to 
> lib/crypto/.
> Patch 1 is the ML-DSA implementation itself.  See that for full 
> details.
> Patch 2 adds the KUnit test suite.
> 
> The initial use case for this will be kernel module signature
> verification.  For more details, see David Howells' patchset
> https://lore.kernel.org/linux-crypto/20251120104439.2620205-1-dhowells@redhat.com/
> 
> Changed in v3:
> - Moved SHAKE128 block buffer off the stack
> - Reworked use_hint() again, simplifying it further
> - Added unit test for use_hint()
> - Moved some of the reduction logic into invntt_and_mul_2_32() and
>   simplified it slightly
> - Updated Zq_mult() to not rely on signed integer overflow having
>   defined behavior, though this is unnecessary in the kernel
> - Formatted the documented return values into a list
> - Other minor tweaks
> 
> Changed in v2:
> - Reworked the KUnit test suite
> - Improved commit messages and comments
> - Added missing MODULE_DESCRIPTION() and MODULE_LICENSE()
> - Made the return values of mldsa_verify() differentiate between an
>   input being malformed and the "real" signature check failing
> - Refactored w1 encoding into a helper function
> - Used kfree() instead of kfree_sensitive()
> - Avoided unusal C syntax by accessing the hint vector via 'u8 *'
> - Reworked use_hint() to be better optimized and documented
> 
> Eric Biggers (2):
>   lib/crypto: Add ML-DSA verification support
>   lib/crypto: tests: Add KUnit tests for ML-DSA verification
> 
>  include/crypto/mldsa.h            |   60 +
>  lib/crypto/Kconfig                |    7 +
>  lib/crypto/Makefile               |    5 +
>  lib/crypto/mldsa.c                |  652 ++++++++++
>  lib/crypto/tests/Kconfig          |    9 +
>  lib/crypto/tests/Makefile         |    1 +
>  lib/crypto/tests/mldsa-testvecs.h | 1887 +++++++++++++++++++++++++++++
>  lib/crypto/tests/mldsa_kunit.c    |  437 +++++++
>  8 files changed, 3058 insertions(+)
>  create mode 100644 include/crypto/mldsa.h
>  create mode 100644 lib/crypto/mldsa.c
>  create mode 100644 lib/crypto/tests/mldsa-testvecs.h
>  create mode 100644 lib/crypto/tests/mldsa_kunit.c
> 
> 
> base-commit: 3f9f0252130e7dd60d41be0802bf58f6471c691d

Hi Eric, I pulled your branch but it does not build (on s390):

[root@b83lp71 ebiggers-linux]# make
   CALL    scripts/checksyscalls.sh
   MODPOST Module.symvers
ERROR: modpost: module mldsa_kunit uses symbol mldsa_use_hint from 
namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/ext/ebiggers-linux/Makefile:1963: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
[root@b83lp71 ebiggers-linux]#

any ideas?

Harald Freudenberger


