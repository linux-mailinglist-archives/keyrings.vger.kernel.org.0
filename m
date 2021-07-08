Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BBC3C1B76
	for <lists+keyrings@lfdr.de>; Fri,  9 Jul 2021 00:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGHWdB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Jul 2021 18:33:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19154 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229631AbhGHWdA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Jul 2021 18:33:00 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168M36eL155360;
        Thu, 8 Jul 2021 18:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+tKAWui9H07PmoURGM29yHvu85k+T7jBXWOYauoqnc8=;
 b=bg90Io1yMsZGhQDa6Lnv4KRetpvNwEmq3eoOv2/B/3SJiCVykMdDzwehgeqVhDnsy55u
 Vkxpd6uzqAWtcoZ0DtTSs1Orq4L/5MVkD4NI38FKLk22goOwR5na58Z1pv411Tf4nits
 P/Rev1K6lO/k5hOcUOXDcJ15B5WH6SPDN2Wa3LmysHJjHRcYE0QqAeEFtq7ZH5T8nR2M
 77kKPP+sK0+KJyp7SOdfuWnxnYJmzH7wHFjEixxxtPXX0Z+8/HcU5F0NsDXF26X8pNEX
 phg549RVjPKfCVebme3y8JGIYEwGgulNFwl5tPa+ounFzaKIHfR3sH7d5w+4FW86ge1B qg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39p2qqdy1p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 18:30:04 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168M35LI155211;
        Thu, 8 Jul 2021 18:30:03 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39p2qqdy15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 18:30:03 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168MH9MQ001458;
        Thu, 8 Jul 2021 22:30:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma05wdc.us.ibm.com with ESMTP id 39jfhdfb9r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 22:30:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 168MU2xh12059028
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 8 Jul 2021 22:30:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3B6CB124058;
        Thu,  8 Jul 2021 22:30:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 21AEE124073;
        Thu,  8 Jul 2021 22:30:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  8 Jul 2021 22:30:02 +0000 (GMT)
Subject: Re: [PATCH v3] pkcs7: make parser enable SM2 and SM3 algorithms
 combination
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Vitaly Chikunov <vt@altlinux.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
References: <20210624094705.48673-1-tianjia.zhang@linux.alibaba.com>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <23f6a837-5b45-5950-0b0f-b138793373e1@linux.ibm.com>
Date:   Thu, 8 Jul 2021 18:30:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624094705.48673-1-tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I_4TVNfqS7oUt2BoK87Do5NNYJiIU1t9
X-Proofpoint-GUID: w9hpo3HcMisF8apDP4aZpUW7ZANI9LP4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-08_12:2021-07-08,2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080113
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 6/24/21 5:47 AM, Tianjia Zhang wrote:
> Support parsing the message signature of the SM2 and SM3 algorithm
> combination. This group of algorithms has been well supported. One
> of the main users is module signature verification.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>   crypto/asymmetric_keys/pkcs7_parser.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 967329e0a07b..6cf6c4552c11 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -248,6 +248,9 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
>   	case OID_sha224:
>   		ctx->sinfo->sig->hash_algo = "sha224";
>   		break;
> +	case OID_sm3:
> +		ctx->sinfo->sig->hash_algo = "sm3";
> +		break;
>   	default:
>   		printk("Unsupported digest algo: %u\n", ctx->last_oid);
>   		return -ENOPKG;
> @@ -269,6 +272,10 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
>   		ctx->sinfo->sig->pkey_algo = "rsa";
>   		ctx->sinfo->sig->encoding = "pkcs1";
>   		break;
> +	case OID_SM2_with_SM3:
> +		ctx->sinfo->sig->pkey_algo = "sm2";
> +		ctx->sinfo->sig->encoding = "raw";
> +		break;
>   	default:
>   		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
>   		return -ENOPKG;


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


