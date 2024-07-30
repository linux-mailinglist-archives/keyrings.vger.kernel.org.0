Return-Path: <keyrings+bounces-1837-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB599413B7
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2024 15:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2AD6B223F3
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2024 13:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53E319580A;
	Tue, 30 Jul 2024 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ptY+5TtD"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746D1A073C;
	Tue, 30 Jul 2024 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347750; cv=none; b=iYvLPo3cxl8zQbiIJi35znJvkxi0NQ+6IidzimIxY8XhRbEwG73U14MygJa5kH7xphMEgUNOMKXZNwW2ybr1Cqxq73EiQaLAZ/4RuwH+LmEmmFja7SuKka+oZC2ioGvMY0IAig4uEvaPCQ7g9oMWWmdeco0dtjCZdJIM7iP26+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347750; c=relaxed/simple;
	bh=L6iSsb9dY9GgMD5jkzqxUmACpzdxzll1k7gjdK8xQlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PomrfSyhFXg5xg1xagTfYggGM8sDAJGqsaHtReK/Feknk2arL+lBmwDDTZuR0KCxqWNyuGak1LCBlJYrBeYw6ONl9WU8NsVahHl/LINe3FaRjqjfarPD9H0oT9MVVQdXbc1NaWyDKAHFYpqaAfeVFz4a9a5676mFb9KglcHTQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ptY+5TtD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UCeMQm006055;
	Tue, 30 Jul 2024 13:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=1
	MINSpHEnZhXgKlj8DRgvIXKxyO0lCmVKVXSnz+kzws=; b=ptY+5TtDW3+qL5Zex
	kr6EotLXHNSK/re7PzW+IavqHT4mQbvyzsytVBe2x6g03lFCwJznWRiQVviTjfas
	tK6+gaiZAB20PY2ClQNiCsmZkjcc71d/+IxrhGx2dM08ABvu7yg+pHFGK6egsKyK
	JGitZrLe9+Ka5EgsjKD2cNx46rLTU8SqpaTidtszfq8Qf+N1i2G9WCZkx9FsBVkj
	j/HcPm1mlpHd60lJ2f/i0WC1J/3uKGIo+EvTS9ElqbVoJWODLQjOXnB+1iSUZfvk
	d2cHQ5JK9VB++kXx1Q3gQO6ti3wR2ND1bwlBBVDIT179go8fc7wDbZtHa/urNXTn
	c9oIw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40pnnn216e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 13:50:22 +0000 (GMT)
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46UDoM67004966;
	Tue, 30 Jul 2024 13:50:22 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40pnnn2169-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 13:50:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UAoGOs029094;
	Tue, 30 Jul 2024 13:50:20 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nbm0n2dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 13:50:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46UDoI7Q21824148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2024 13:50:20 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538FC5805E;
	Tue, 30 Jul 2024 13:50:18 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D287B58050;
	Tue, 30 Jul 2024 13:50:16 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Jul 2024 13:50:16 +0000 (GMT)
Message-ID: <cee0d829-8f44-41d8-9f49-c215aa582f77@linux.ibm.com>
Date: Tue, 30 Jul 2024 09:50:16 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] crypto: ecdsa - Avoid signed integer overflow on
 signature decoding
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>,
        Tadeusz Struk <tstruk@gigaio.com>,
        Andrew Zaborowski <andrew.zaborowski@intel.com>,
        Saulo Alessandre <saulo.alessandre@tse.jus.br>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
References: <cover.1722260176.git.lukas@wunner.de>
 <919ce5664ab3883f1bc15aadfc6b6a2d9b30ecbd.1722260176.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <919ce5664ab3883f1bc15aadfc6b6a2d9b30ecbd.1722260176.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1G8tptm3wS6y4dH5QQdRxQjqp2nrs6d4
X-Proofpoint-GUID: QYiX9AUMFuTF4MECsXXARzDh14VfZ-5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300091



On 7/29/24 9:49 AM, Lukas Wunner wrote:
> When extracting a signature component r or s from an ASN.1-encoded
> integer, ecdsa_get_signature_rs() subtracts the expected length
> "bufsize" from the ASN.1 length "vlen" (both of unsigned type size_t)
> and stores the result in "diff" (of signed type ssize_t).
> 
> This results in a signed integer overflow if vlen > SSIZE_MAX + bufsize.
> 
> The kernel is compiled with -fno-strict-overflow, which implies -fwrapv,
> meaning signed integer overflow is not undefined behavior.  And the
> function does check for overflow:
> 
>         if (-diff >= bufsize)
>                 return -EINVAL;
> 
> So the code is fine in principle but not very obvious.  In the future it
> might trigger a false-positive with CONFIG_UBSAN_SIGNED_WRAP=y.
> 
> Avoid by comparing the two unsigned variables directly and erroring out
> if "vlen" is too large.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

> ---
>   crypto/ecdsa.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index f63731fb7535..03f608132242 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -35,29 +35,20 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
>   				  const void *value, size_t vlen, unsigned int ndigits)
>   {
>   	size_t bufsize = ndigits * sizeof(u64);
> -	ssize_t diff = vlen - bufsize;
>   	const char *d = value;
>   
> -	if (!value || !vlen)
> +	if (!value || !vlen || vlen > bufsize + 1)
>   		return -EINVAL; >
> -	/* diff = 0: 'value' has exacly the right size
> -	 * diff > 0: 'value' has too many bytes; one leading zero is allowed that
> -	 *           makes the value a positive integer; error on more
> -	 * diff < 0: 'value' is missing leading zeros
> -	 */
> -	if (diff > 0) {
> +	if (vlen > bufsize) {

At this point vlen could be 1 larger then bufsize in the worst case and 
there must be a leading 0.

>   		/* skip over leading zeros that make 'value' a positive int */
>   		if (*d == 0) {
>   			vlen -= 1;
> -			diff--;
>   			d++;
> -		 > -		if (diff)
> +		} else { >   			return -EINVAL;
> +		}
>   	}
> -	if (-diff >= bufsize)
> -		return -EINVAL;
>   
>   	ecc_digits_from_bytes(d, vlen, dest, ndigits);
>   

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

