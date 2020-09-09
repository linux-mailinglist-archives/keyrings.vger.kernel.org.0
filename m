Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110DD263C14
	for <lists+keyrings@lfdr.de>; Thu, 10 Sep 2020 06:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIJEcM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Sep 2020 00:32:12 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51678 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgIJEcK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Sep 2020 00:32:10 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 089MiVL4156976;
        Wed, 9 Sep 2020 22:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=ZJSWj8UDSgwVvdQeB1Q6BSZE1Es3ixnnotRP8TRgN6o=;
 b=RF3P/tH4qLGee2XEa4s4rwbn+vrl/a0mcYAsQtMXbU2cV5G71WwcSYGEOqb7At4ftVba
 /CbbLxC/exYoayLX7V5zJRQYuiXH21IgdBpM1Ae1LX0Otp1GzOg/nUqLQf0becWmULLy
 fW+0y0ZdbzlCZ1Kh4C6TldbMmjxy1o4qUEyqEF6x+AJrYYZn+WjrE+XfgPubBSwX0uWY
 Pr0gp6VgRQknYwScAZ4TnTi9RvbvRz/dXlRjJikkP01H7rR/EkNqYq0vA1deh4haUKHW
 PqIr0FyH22YWxLUirxY35CX0DUpVRGYxBjxzhEH0Epx8W9Rgm3cdlk8htI0tQtTpHdcZ Qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33c2mm4pmm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Sep 2020 22:44:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 089MdcWP132724;
        Wed, 9 Sep 2020 22:44:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 33dacm6e4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Sep 2020 22:44:46 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 089Miet6010647;
        Wed, 9 Sep 2020 22:44:41 GMT
Received: from dhcp-10-65-181-26.vpn.oracle.com (/10.65.181.26)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Sep 2020 15:44:40 -0700
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <5074bc5c-8dd4-16d7-2760-3e657b90bfa2@infradead.org>
Date:   Wed, 9 Sep 2020 16:44:37 -0600
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D3BE738-67D5-41DB-B58E-FCD2ECD9A4F0@oracle.com>
References: <20200909172736.73003-1-eric.snowberg@oracle.com>
 <5074bc5c-8dd4-16d7-2760-3e657b90bfa2@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=3 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090198
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=3 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090199
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Sep 9, 2020, at 11:40 AM, Randy Dunlap <rdunlap@infradead.org> =
wrote:
>=20
> On 9/9/20 10:27 AM, Eric Snowberg wrote:
>> diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
>> index 38ec7f5f9041..d8f2e0fdfbf4 100644
>> --- a/include/crypto/pkcs7.h
>> +++ b/include/crypto/pkcs7.h
>> @@ -26,11 +26,19 @@ extern int pkcs7_get_content_data(const struct =
pkcs7_message *pkcs7,
>> 				  const void **_data, size_t *_datalen,
>> 				  size_t *_headerlen);
>>=20
>> +#ifdef CONFIG_PKCS7_MESSAGE_PARSER
>> /*
>>  * pkcs7_trust.c
>>  */
>> extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
>> 				struct key *trust_keyring);
>> +#else
>> +static inline int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
>> +				       struct key *trust_keyring)
>> +{
>> +	return -ENOKEY;
>> +}
>> +#endif
>=20
> Just to be clear, you want to do the #else block when
> CONFIG_PKCS7_MESSAGE_PARSER=3Dm.  Is that correct?
>=20
> If so, it might be clearer to use
>=20
> #if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
>=20

I just added this part to fix a build error when none of the
asymmetrical keys are defined within a config.  I failed to notice
CONFIG_PKCS7_MESSAGE_PARSER could be configured to build as a module
too.  The code I added that uses pkcs7_validate_trust is always=20
builtin. Taking this into account, please disregard this patch. =20
I will need to solve this a different way.  Thanks for pointing this=20
out.

