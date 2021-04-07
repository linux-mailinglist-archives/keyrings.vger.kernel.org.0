Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F998357695
	for <lists+keyrings@lfdr.de>; Wed,  7 Apr 2021 23:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbhDGVUr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 7 Apr 2021 17:20:47 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:23067 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232023AbhDGVUm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 7 Apr 2021 17:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617830430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q2i7eQICj39hyKSIFBo1yrWdN/3cQw7AMNmlzPc/ctU=;
        b=ZnjwHPEzHFh0hsnvp/UjaXlz7i/XMWktrLyTW2qkBndnXQtdQzgQsAzA2ahDwYSFUICW6d
        OW+KLEt0dQudhJRxe0NJI4by0PWZlj/8n5UY2cO1paD21nfj8XfXN/viEfT5bUQj9RwsmP
        dWlyAHpe+MDfmSIrQIh8zgt3QqmgeyE=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-vuACd9dcNk6QWKmFd9nGRA-1; Wed, 07 Apr 2021 23:20:19 +0200
X-MC-Unique: vuACd9dcNk6QWKmFd9nGRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gK5xggPJXdRSmsfpuFJMxoUlqO/KeyXAh3ZdocKPDA3+GneYzXmbM6t89BasFtLeFzpt91kiy+7hAb3BZWeysNjFngvsdMkBjHSYH7ZD+zjXht3tIt8Bm4lVl1pIYrgnLq4pheojsNqLHKJVf/cREUVtQ0Wl07oxZ9A8ql/BAvlE80Cu5R2JaIVdKSm4kL+qIuZhVX4PdqawramE8mgzSv5su71dUBfuiugbGrMW480anPkxG1lccBoxcFuL3tL0spDwkh1tJDrhtRQsJUMXfOmQUXwXjTEXLZQaQcZXCyYKwm2q979hzZ7pQ03n960jL0XVTHZG292JRYY8slLeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GktQO+W3BI6IUvqOfR9om21kv48iD9Un6SF1atAhrUw=;
 b=fVL3zP7aEZPLYDcsdITHeM1L7kl+aP3oRXdDXxyVJY40qhmGEGxnWHG2jSKwizAXtmSxG9989sC+s3+Se3dUUGWwWVXoMaWst/IZraqbC3YQileXR9ZljqhQ4gAfBTaaMkoqmPhtv44EF/rFlxhG5EhKkzY/9iFJJmwzaaCPTcwvXabyRBRzqoHTwMA+qKUBituIsb0830w7LVZCUSgGEAgqiPcMdOYPlniKYkhSfTj8E9Z/OnM+gTmTzHVECKwUXSX0UH0NdPjxZ5BTr/ztTu+8Ll+RTnsosxFrT7TJCCB7NCrEyPsOIMTol88ursTAusl3BvkMh/VqkqBdV+nHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4836.eurprd04.prod.outlook.com (2603:10a6:208:cd::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 7 Apr
 2021 21:20:16 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 21:20:16 +0000
Subject: Re: [PATCH 01/18] X.509: Parse RSASSA-PSS style certificates
To:     hongbo li <herbert.tencent@gmail.com>
CC:     linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210330202829.4825-1-varad.gautam@suse.com>
 <20210330202829.4825-2-varad.gautam@suse.com>
 <CABpmuw+ht5BmNtqN+pJt7A0ZHp7JJArZtj51hkhBc96L8iwvwg@mail.gmail.com>
From:   Varad Gautam <varad.gautam@suse.com>
Message-ID: <29804310-e75b-80fb-81a3-0823b06827ea@suse.com>
Date:   Wed, 7 Apr 2021 23:20:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CABpmuw+ht5BmNtqN+pJt7A0ZHp7JJArZtj51hkhBc96L8iwvwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::17) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.67] (95.90.93.216) by ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 21:20:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcfd78ef-ff41-4316-8865-08d8fa0af059
X-MS-TrafficTypeDiagnostic: AM0PR04MB4836:
X-Microsoft-Antispam-PRVS: <AM0PR04MB4836F27500F1E1C5BB89FAAAE0759@AM0PR04MB4836.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIKye8tRxiaicOJ/xK+h6jt3hadfOClXI8/P8S/1yJaQrqXP4ddB/qNcIt9vHNqJkYb/yonsKUY1ZzU5+/HXsOa7S71EVExT2fvYAQ1HROtM1lbpkZuNANoLxde9AwBcYNht7XVJdH/qldNjGv6O8gIGCaQF2/yrR8n/hoODRiSw60y63E838jp9vdmQ6Xj3SW23v/EeKXzcwP0NOJqOBAQcxzMGhD7D/8WPKNgtMEvrX2ONk7zZWGoyDLJg3DyhxZQGL8TlBlNv6czRiy7BXakuuEplts1HJGIfSXlllF9qOLzq0pAGeYEHbN708E4uFYWHCfMNVQs23nIU4Ay0Sh9bI7gxI1zNZfLu48UAhMPQvvGAiiIS7EtND67XXT2HUGXz7XDUL/pZTZ1nOkf/3tRH+8UjbHl/Ynh8QDqivcAGjNFae2ohWt5H4SNPnmu9ZFR4nbhjHHOorBSQSDF3zCS3/3IxRx6e/UWrOS3Sy4OBwO3wnYGcB1xfLjTaPSf1yM0LCHGHrC2zYACSBhk7NXuBERQIndyYCfUVA3RfSsTtF9KA4vWBYNSSE47ycWOP32bnOR/n+ZEbDnk37m3K7o95nWq4bg2EAXX5PLkCYUgeuBlV6bAkA2N8/W0517WnHbN+Kg80vWQqZsE/gbKXt/f7xVsKpnwCQ6umH0xiTsVwZ+Y4yh8OANCVa1SmJO4jEIGrfQMhCPPH4Gxilh9iFhno3GOovt7/smS0S4yowlFj3w7LMJSdYpoDkJ4vayNtS6SNVbOPHsN8joAnthfs2arK4nRNy2InwYXgixJLlEg1ahAjJJRp4SFFRxj7Zzrz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39840400004)(376002)(396003)(366004)(346002)(66574015)(316002)(36756003)(4326008)(2616005)(8676002)(2906002)(8936002)(83380400001)(54906003)(38350700001)(6916009)(38100700001)(16576012)(66476007)(66946007)(44832011)(31686004)(52116002)(478600001)(966005)(5660300002)(86362001)(186003)(956004)(31696002)(16526019)(6486002)(26005)(53546011)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uloxpahJ9mP7jtomdT2qWHQ8fy/HyFVMVdURdcna+J8aumNeH7J1Ansll/Dw?=
 =?us-ascii?Q?mN32vBwRmOUDTTF5Jwlt4fVHxUR+63Q1WPJZOhAk6zAte7Kx3FlK5re2U0Et?=
 =?us-ascii?Q?d5ubKN/Fp2LHXMH5mFzLZ3zHRfD2qNfnS2W7tC8XI5rgMFzakVxAebkinEYX?=
 =?us-ascii?Q?qIY3pmeK0MkUVSsFmV+JMZvEwz0fQvWTCa044belL8PYdK/SxsDOUoi+iI/l?=
 =?us-ascii?Q?zBVJme6JyX6WxA4zF6QGMjG1CO+0md5Ucx17TxLF/FpvZtQADdSF0bAiyzVc?=
 =?us-ascii?Q?rB+/SQgktko7zvf/jXGS6XKfANBvAMCl2WSwdlnQMarfTq5Jwp8mijQeG6i2?=
 =?us-ascii?Q?EgjNS9VnhdmUdX95aKtn41Mfdfy0jFOJBhaR2jYm818zgP5d3UPy/6HhZQ0C?=
 =?us-ascii?Q?Bco6KC4qI7VtZB34ow5cjMRi6AjDBJeJxvm6IbkfogKC8/BUngpiSvNiOAa9?=
 =?us-ascii?Q?00LOEHmdbFjH3J2Gj9Cdfm1y2DyhMNu0YzW+mXFdaMBxXGOnj2ZcL7yxYyZH?=
 =?us-ascii?Q?GY/fcn/gVR9gPEqdaQZwcw6ap5+d3ftjzn1ax2/mJNqGdOpqGaw58d+XuHve?=
 =?us-ascii?Q?N72bzXYwTnP+DGYjptr4FyHh8Mfgtb+IgEJKo9IW0yx7/dzPy/S/ygWer/cy?=
 =?us-ascii?Q?Z4ShS4eBvLnn6T/iqle9Cxn1HSxwhKwrXHN7YDOxC+Df6ON8aHjtIgQk0/b5?=
 =?us-ascii?Q?5P3VAj6cwrANb3hVm3Qy71guqV4vPAD+CIFuL/KE0h0t0AQKGej0L0BIzX7j?=
 =?us-ascii?Q?o0+oQRaskAyD7wG3mDesfOLmnNyfrZct8vD8yX68Y7MoJTbG+TT8BrZaYW49?=
 =?us-ascii?Q?r4We9pErdSj0GdtnMCcTiaB4I8YlMmDPMQpy0FGbatT+ZKOi1IMZANczTpDM?=
 =?us-ascii?Q?0e4//33F4o1G+ED8MVzLoTb/pIZGRHM1OkG1bI8/8pW6fDqyCg5u2eaUR0Eb?=
 =?us-ascii?Q?PiFNYMxmxdloST8s57gSEAt67bgY6JbmqcuRJkvqq2qf7cyWhWrfMzwFEf+Z?=
 =?us-ascii?Q?09gk0ZUkxP8wG97waSfi3p3VA0Kv3huhHgk2lAgxKEXtg11dPhbAYgDzbWL1?=
 =?us-ascii?Q?eytMBkd7TPwQQn9ZYHpxvsBW0IU5QmQ/5stGhs9+HTU1iIW2ypKyDncb0RiP?=
 =?us-ascii?Q?6cNgka72tnltqtVZA9Fq0A3LYj4pUrG/WXKH1OHI7+J/LOok7LKbRVfQyA/Q?=
 =?us-ascii?Q?l1JRhgpY8qCitnJZ33RZBwCcbFjePNMjOBh5TXQFGTA/VAht4q9QOluxIr5Y?=
 =?us-ascii?Q?ulJ8L9gq4u2KpxIh4Is4saaOMAG+1dr4RxrLpwWrKkncywE2CGDGCV0DMLi2?=
 =?us-ascii?Q?KUbMG9rUBHVoQNefTNIYIyvY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfd78ef-ff41-4316-8865-08d8fa0af059
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 21:20:16.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2XF+llYWzVRCIvDi2Gw1QsqkdyxDJkgc1q49/io98Np0VYD3vtN9BA40ETIKDvpzQ6+3yNzgnwRajK9tcoDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4836
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Hongbo,

On 4/7/21 10:27 AM, hongbo li wrote:
> Hello Varad=EF=BC=8C
>=20
> I also made an implementation of rsa pss: "[PATCH v3 0/4] crypto: add
> rsa pss support for x509".
> I notice your patches and did some review,  find the following
> differences between our patches:
> 1. You rework the rsa pad framework. This is reasonable.
> 2. You did some changes on the keyctl and asymmetric struct. I don't
> see the reason.
>     Because for x509 layer, it only need to know the hash param, and
> could ignore other params(salt len, mgfhash).
>     Let rsa-pss itself parse the pss related params. So it seems we
> don't need to change asymmetric's
>     common struct.

A signature might be generated with a different set of params than those
used for signing the x509 certificate that wraps the corresponding pubkey.
In this case, using the params that came in when the pubkey was loaded,
instead of params for the actual signature would be incorrect. I see
struct public_key_signature as the right place to store such state,
regardless of where the signature came from (detached or selfsigned).

For the same reason, I also prefer the parsing machinery for signature
params be kept in x509_cert_parser instead of unpacking a buffer in the
PSS akcipher's set_pub_key implementation [1]. Going that way, we also end
up parsing these params twice, since x509 needs to unpack the hash
algorithm in a pss-specific way anyway.

For the IMA usecase, since x509_key_preparse() would have already filled
in the params in public_key_signature, asymmetric_verify should be able
to find and set these from key->payload before calling verify_signature().

> 3. Why reject the cert whose MGF is different from the hash function
> used for signature generation?
>    My implementation could support different hashes, so don't get your po=
int.

The verify operation (psspad_verify_complete [3]) in theory supports it,
which I've tested against such certificates crafted via openssl.

I chose to reject such certificates early on during x509 parsing since,
- these are not a common occurence in practice, and
- testing (besides via openssl) without a set of reference vectors to harde=
n
  the verification against seemed insufficient.

I've had some more test runs complete in the meantime, and I'll drop that
check in the next round.

> 4. I add a test vector and a patch to support using rsa-pss for iam.
> 5. Other implementation difference, i.e. the mgf and verify functions.
>=20
> Maybe we could merge our patches, what's your opinion?
>=20

Sounds good. I'll send out a v2 soon, and if you agree, the test vector [4]
and IMA [5] can go on top of it?

[1] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3051=
3-3-git-send-email-herbert.tencent@gmail.com/
[2] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3051=
3-5-git-send-email-herbert.tencent@gmail.com/
[3] https://patchwork.kernel.org/project/linux-crypto/patch/20210330202829.=
4825-2-varad.gautam@suse.com/
[4] https://patchwork.kernel.org/project/linux-crypto/patch/1617802906-3051=
3-4-git-send-email-herbert.tencent@gmail.com/

Regards,
Varad

> Best regards
>=20
> Hongbo
>=20
> Varad Gautam <varad.gautam@suse.com> =E4=BA=8E2021=E5=B9=B43=E6=9C=8831=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=884:31=E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> An X.509 wrapper for a RSASSA-PSS signature contains additional
>> signature parameters over the PKCSv.15 encoding scheme. Extend the
>> x509 parser to allow parsing RSASSA-PSS encoded certificates, with
>> the defaults taken from RFC8017.
>>
>> A certificate is rejected if the hash function used for the MGF is
>> different from the hash function used for signature generation,
>> although this is allowed in RFC8017.
>>
>> References: https://tools.ietf.org/html/rfc8017#appendix-C
>> Signed-off-by: Varad Gautam <varad.gautam@suse.com>
>> ---
>>  crypto/asymmetric_keys/Makefile           |   5 +-
>>  crypto/asymmetric_keys/x509_cert_parser.c | 152 ++++++++++++++++++++++
>>  crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +++
>>  include/crypto/public_key.h               |   4 +
>>  include/linux/oid_registry.h              |   3 +
>>  5 files changed, 180 insertions(+), 1 deletion(-)
>>  create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1
>>
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

