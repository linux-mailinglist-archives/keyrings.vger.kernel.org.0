Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3DE309A06
	for <lists+keyrings@lfdr.de>; Sun, 31 Jan 2021 03:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhAaC6l (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 30 Jan 2021 21:58:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32688 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229658AbhAaC6k (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 30 Jan 2021 21:58:40 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10V2tIiK181314;
        Sat, 30 Jan 2021 21:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YDPuxkcZzKm2C8fUKanfD/H6l+IU7POIQ46lP6+M5v0=;
 b=q/8HNNxxA+yCFZB6yJPNzR85cq6irpwrXqGXa6F0Lnuaxcs1YUtq0gelss55msmCoSes
 GN/oUO5QvWP/tRRoSbMg9a9yKv56IDokCqQxCr6QhjXq7xeGglQKG5ftIwfUEocj593C
 zYSI2jQYn9bKbxeGDccYmQJzbPpTdlCH8bH/TRNaO24ZBEFh4mIokVNcJnBy7bx1fJr2
 KzEUyYNmCMN7tU0v911HS9Oy/8NtWrcvn7s/1fiqmt4wLYWV3z9hEdN5vdncMqkACpfM
 IioaQRv+rmTIO8JRcTY9KCk+D+wphVGGGytFw75YsbEwPVjkfiGOx3jJcgEENLxw/v6R Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36dm6j00vy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 30 Jan 2021 21:57:42 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10V2uWrs182937;
        Sat, 30 Jan 2021 21:57:42 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36dm6j00vt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 30 Jan 2021 21:57:42 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10V2qoeq005543;
        Sun, 31 Jan 2021 02:57:41 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma02dal.us.ibm.com with ESMTP id 36cy38f6uf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 31 Jan 2021 02:57:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10V2vf1w31326552
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 31 Jan 2021 02:57:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 17CA6AC05B;
        Sun, 31 Jan 2021 02:57:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 04783AC059;
        Sun, 31 Jan 2021 02:57:40 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Sun, 31 Jan 2021 02:57:40 +0000 (GMT)
Subject: Re: [PATCH v3 1/3] x509: Detect sm2 keys by their parameters OID
To:     Jarkko Sakkinen <jarkko@kernel.org>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
 <20210127123350.817593-2-stefanb@linux.vnet.ibm.com>
 <689c44925d60238181390e775b52809e89e0b26a.camel@kernel.org>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <e975bd1e-5256-ea8f-2247-fc362302e647@linux.ibm.com>
Date:   Sat, 30 Jan 2021 21:57:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <689c44925d60238181390e775b52809e89e0b26a.camel@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-01-30_17:2021-01-29,2021-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101310008
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/30/21 4:26 PM, Jarkko Sakkinen wrote:
> On Wed, 2021-01-27 at 07:33 -0500, Stefan Berger wrote:
>> From: Stefan Berger <stefanb@linux.ibm.com>
>>
>> Detect whether a key is an sm2 type of key by its OID in the parameters
>> array rather than assuming that everything under OID_id_ecPublicKey
>> is sm2, which is not the case.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   crypto/asymmetric_keys/x509_cert_parser.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
>> index 52c9b455fc7d..4643fe5ed69a 100644
>> --- a/crypto/asymmetric_keys/x509_cert_parser.c
>> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
>> @@ -459,6 +459,7 @@ int x509_extract_key_data(void *context, size_t hdrlen,
>>                            const void *value, size_t vlen)
>>   {
>>          struct x509_parse_context *ctx = context;
>> +       enum OID oid;
>>   
>>          ctx->key_algo = ctx->last_oid;
>>          switch (ctx->last_oid) {
>> @@ -470,7 +471,17 @@ int x509_extract_key_data(void *context, size_t hdrlen,
>>                  ctx->cert->pub->pkey_algo = "ecrdsa";
>>                  break;
>>          case OID_id_ecPublicKey:
>> -               ctx->cert->pub->pkey_algo = "sm2";
>> +               if (ctx->params_size < 2)
> Either a named constant, or at least a comment instead of just '2'.


I will look at the 2 entries whether they contain the expected values: 
ASN1_OID and length

Thanks!

    Stefan

