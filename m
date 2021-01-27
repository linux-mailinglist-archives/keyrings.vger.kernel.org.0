Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD90306790
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 00:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbhA0XMz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 18:12:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60924 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233821AbhA0XHn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 18:07:43 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10RMVXH5109943;
        Wed, 27 Jan 2021 17:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ynM+t9piKJBCMZZ5Lsh/QsnYco++i2SGz87esxAJErA=;
 b=kK4M3H0IuZhCYUfUWU6NrORFRdjvIAR3KO8hQ1XCfkYlbIaxq7hxCMsHmOSwt/eOzng1
 0fjgD3bhGilP2i5Uyhx82zbm6qQhv/qgr5biqSoKBGJssdF9BPkGCjcznqDt1K6BWV5O
 qNi3if1L+QS+lOwY7QUipsn00tpYzI67bRSNRUKy6M2akAqdqVdKpZDxFQrt7WIVbLmQ
 JsADrAozeZpMxqsTlU80wrp4OVMvlPQYYZ8PgzoJhyGVNazeTYPnUb0/TdZmL42YZ5fd
 LstD9G6QX5Y8WmXDJhY8gr0Q+tNtXbn1u9Oh2gHlLaz+1YixxAKkIOTFrh4PCC7NWTJu Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bdh8ds9w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 17:39:08 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RMWh46112963;
        Wed, 27 Jan 2021 17:39:07 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bdh8ds9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 17:39:07 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RMatiL005442;
        Wed, 27 Jan 2021 22:39:07 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma04wdc.us.ibm.com with ESMTP id 36ag3yc1jf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 22:39:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10RMd6NK12058942
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jan 2021 22:39:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CDAE8AC066;
        Wed, 27 Jan 2021 22:39:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C4F93AC065;
        Wed, 27 Jan 2021 22:39:06 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Jan 2021 22:39:06 +0000 (GMT)
Subject: Re: [PATCH v3 2/3] x509: Add support for parsing x509 certs with NIST
 p256 keys
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        linux-crypto@vger.kernel.org, patrick@puiterwijk.org
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
 <20210127123350.817593-3-stefanb@linux.vnet.ibm.com>
 <20210127193152.GA27505@gondor.apana.org.au>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <d7f04b7a-75f4-fce8-b826-d268e522cf42@linux.ibm.com>
Date:   Wed, 27 Jan 2021 17:39:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127193152.GA27505@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_09:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270110
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/27/21 2:31 PM, Herbert Xu wrote:
> On Wed, Jan 27, 2021 at 07:33:49AM -0500, Stefan Berger wrote:
>> +static struct akcipher_alg ecc_nist_p256 = {
>> +	.verify = ecdsa_verify,
>> +	.set_pub_key = ecc_set_pub_key,
>> +	.max_size = ecc_nist_p256_max_size,
>> +	.init = ecc_nist_p256_init_tfm,
>> +	.exit = ecc_exit_tfm,
>> +	.base = {
>> +		.cra_name = "nist_p256",
>> +		.cra_driver_name = "ecc-nist-p256",
>> +		.cra_priority = 100,
>> +		.cra_module = THIS_MODULE,
>> +		.cra_ctxsize = sizeof(struct ecc_ctx),
>> +	},
>> +};
> This is not how we name generic algorithms.


Are saying that I cannot name it "nist_p256" but should call it 'ecdsa' 
and the driver becomes "ecdsa-generic"?



>
> Please split this out and submit them through the crypto tree
> instead.

Will do.


>
> Thanks,


