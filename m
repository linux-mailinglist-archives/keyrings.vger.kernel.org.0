Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6FB3608E4
	for <lists+keyrings@lfdr.de>; Thu, 15 Apr 2021 14:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhDOMJI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 15 Apr 2021 08:09:08 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:26306 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232684AbhDOMJG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 15 Apr 2021 08:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618488522;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VhLuu8JK6HAlOLiVBeWUfyXFxlPfyg0PoJzV7Cq4nAg=;
        b=cliGj8dN2zPLd81AcvIJYvssqMk2bmNRUQpbVWjwDMVhqyJLc8vO2rMt+EY1G/ivGf6ACB
        X/K8J/va4fUkj6FMxehtzEBJIhMinNd5d7mHpOBjhuM+Xz6SrvIOekwlVp0by4PnmjOKYR
        EvSFdVf75zJN/JwNi2MEfc4HqnTpBHc=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-AECTUWi3M2SaQT2v-OSgUw-1; Thu, 15 Apr 2021 14:08:38 +0200
X-MC-Unique: AECTUWi3M2SaQT2v-OSgUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zp8d3haQPa5je8KuD31/6wOKQNm/yFyUF1764f3GG+Lvxp/xewsX1Vhn5TSFqcovqICPIo+LFVJ/+AujbZRNOmyL1r3YXiJvGYHsaJ9RIVRVshWSEduDiKYKRHJ1OVQZ+fxh6ZwPg1vntvkXs+G2eT6j5dkREYWH6xe/76wLKJbWmtTBszUnE70xPk/ZhRuXia2hYpRRcmbFh0zV82ajTiYy8i2ziIQQPlBpHwaj1ofe7ue/E9Rt0JXEWuAJJ7Thme2hfyxALWkKakeqwYcTq5AglU45/gNv4gRNYI7/YAOnAhST/FEExYThIBMrRlVAy9eTX/M57ApAYJb2DWAEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ROgmlnUGWRmmaEBsH95mEZQui7oOhGzp4nAy/JiIzo=;
 b=YVLLmXNzn1I4jM8P3PLBaIqCI6volYyRA6hxC9S2og4hIuS7JlxDYbM9pKajWw4jKhsZqvMq5nuGX4gQvY/PjRkBbmD9HEJ40B7++AK4aQa+IbbddiD/nrBrla9i4vxj0hO79OZShg6pduuwLMdG0zmCtorPFgxx2qQfzIacgmxbr7ThGI6FOSUnnxFMWtlyhIdPeJf4wvRT68U7pXruz5GrloU8HzCsuxnmnmP+JVfzOdD9UrMMmC4q7l64SRhlVmc8WjYfcZ51vLD6clqmS9YSuayPFiAhHituxB/+Twp9Czo0c3uMH5Ag0hm3FNaYnph1ExJeNlJ7kRTdBcd4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 12:08:36 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4020.022; Thu, 15 Apr 2021
 12:08:36 +0000
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
References: <20210409024656.8083-1-jlee@suse.com>
 <20210409024656.8083-3-jlee@suse.com>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH 2/4] PKCS#7: Check codeSigning EKU for kernel module and
 kexec pe verification
Message-ID: <27e7e83b-5754-956c-c314-9d4d0ae605b0@suse.com>
Date:   Thu, 15 Apr 2021 14:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210409024656.8083-3-jlee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: PR3P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::24) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.148] (95.90.93.216) by PR3P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 12:08:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f85b7df-91a0-47c8-6e72-08d900073271
X-MS-TrafficTypeDiagnostic: AM0PR04MB6770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6770BC88B50787FB3A0608CDE04D9@AM0PR04MB6770.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vIS2xmhsdcuKnUpbCdV1EOOqs4sQSve95rDPzJDomjWMPSlD9bhaEG3RkVEmYgmjFCE2xg+d3LY+CXthsX6jDXBBVjjSCsUd/IQmqSbHI677tHbIZV2F65h8vT4gG1OLsDhXcg1JPyNiykKs6BWIX5elyhiyMLlSNX8A4qb1/Im9sgDxwlpsNfl1dMsrzVBvn96VB9L61lgdNgRAPsLLEpemAZCg4lxwCnjpFRVGlmpOFjyBJulQ19fyHLuPG6srjjD1OPMPQQGEEbgWzZZMjEwk20mt6znJg/nl/0NUkMWVTTUMRtmc3YudtMdb1lVHB10wcJRFPDt/uI7Ew0JaON9nRdkjUGsnROPtUwWcc5Bz7DlBmWkyAkCA5JURzjNPNkCodLyjZ4w16JV9Xw+T+nxQp6Bgaqid5VzdBsgj/5ePF1GGpIdfn974QePY3IgVVyUSgZ1UUel8aIALWFi3g/XiK+N88pbhP+zkSe/T1gdIecK2TQVUX+rklKdhLG3Zj2JBZ38tRrVfGMRl4UWESY+1RIcBTFHXgmXHcPDoQAyj/VuwtHRMKemF1KREOx2hcOlFTmO3DUFnJcK89EbMflPQfe8wpxv/EoENVIs9fAEj4PY4Ztz0cB3XTQecsVq05rOXaCDOTX4TPam1FSfAF/4BB+dvu0mfcioZvyM0iJaMbB3CW+abBD2OfTlPYpAlViRXETpJRGOOe+0vREF5yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(396003)(346002)(376002)(366004)(136003)(38100700002)(8936002)(53546011)(16576012)(478600001)(36756003)(956004)(316002)(66556008)(2906002)(66574015)(4326008)(38350700002)(107886003)(8676002)(6666004)(7416002)(54906003)(83380400001)(52116002)(44832011)(2616005)(31696002)(16526019)(5660300002)(86362001)(110136005)(6486002)(15650500001)(66946007)(26005)(31686004)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qs+ukyXqHOk4zkqPfFC3unMmQDUaryKM09AhxHtRNo2gGOAb6KUjZTP0krXi?=
 =?us-ascii?Q?05S+dE2sinjhbct4T6N+Y083Er6shdldrOodEQwQ4DPd6Bzl5gYm8VieAZKN?=
 =?us-ascii?Q?PlVvJFRKxu5CieKu2G9/mpQTrUIBbeAyoD5gXQiQVhtLvu8G/jp6FagV6Nko?=
 =?us-ascii?Q?kyJ0SRvwOfxDSnY8bunn7XDYnmUFawAEDfd4bCL6gINb1suZLXllKA1tr+VK?=
 =?us-ascii?Q?kEu9jHxyUvlwgruCjkrNQS3iReN+kHPtddO+KEH4otSgL5+Gw3b3V+UufLmK?=
 =?us-ascii?Q?ShPAWAExflMiJt9muJbAz1A2OrRXGiXyLWre0G98qtWkT8X5iRKaF2r2eATy?=
 =?us-ascii?Q?0Toi2rOmIggwEBFSNu8jc07c2OE+lwe6T12jz6j0ugyEsb6TUlxxwxaVDx7X?=
 =?us-ascii?Q?JyV7//yEiQ3/ZsUVPb831vrFELuFE/a1vO0etffIaPu0MgY8EhB0XE//ioN6?=
 =?us-ascii?Q?9BTbXd0Eu9HqC8FCpC5s7nfTSsZZlqe8buUuYDrlvbEJKqLif4qStVFS13Am?=
 =?us-ascii?Q?YXiW+xIFPowkdzV7aEEmKa3as+UrPzWAiQQxWUS5lh3PTBA4I9NKQTwzsJ8G?=
 =?us-ascii?Q?1P+5z2RCJ6SjKdUecUXR2a1VS2jHNCgDXPLwrYjInfvR57WlLCEic1mhyluk?=
 =?us-ascii?Q?QfMdURenlWKJlmEmO0lTv270bp5xh5WytLv6n11qRe9SGx27QwIi0b+2qT4L?=
 =?us-ascii?Q?kJgqiLrvTCGBqKa5hCj8HbQPj5CIc/msq+HozSJoWiR8Yr6TyWOphjOobx36?=
 =?us-ascii?Q?3kwpwV250QGZdc9fsUoJAJaI5XLZnHAaN/3YirVwX8V7YLsxmwDOQKfWI2lL?=
 =?us-ascii?Q?qhF3kQ8TAybTYYBlBfBlMuHyCV4QZlUbojvFTpqhA0FOC2zTx/CUQkM8z6N9?=
 =?us-ascii?Q?N/Qpt8vN0hNhssYu5IAYbkBW9XWDDeNKAoLu5kPqayG3LxJQ1pBS5IZGNRRk?=
 =?us-ascii?Q?1uuZdlDEJqILX7VSyswFx4lgXtU1/SHMYEcWQOaAce4mnubBJuJrijaCJx0L?=
 =?us-ascii?Q?AUC1kCBefWhuGlJKeEQMbL4XX7h4tWcvQJnXE+b2zPJrBe1lP8pn5INO6oU/?=
 =?us-ascii?Q?m4NsozGNs9xfbw2pYHwkRueCtKnBd7IEWeeNUNgYCfy/dEFblwkFKSCNYnxx?=
 =?us-ascii?Q?xM+TDvfp/gZN3Z4U5pBblsvICwVAEifZxP5RQyndxlXekr0Y+i9TqHhDp2LB?=
 =?us-ascii?Q?ZRNmh/rwB6fTJu8yLauhp66nzV6l7eUsY5Qq8Y1uMa5kyOowGE6Rh3+J08k6?=
 =?us-ascii?Q?uRQzNctyuV24duxI/ga98iq64XnOUTv6DNqHBt3ZYFLSWqWjxRn4ciQI9AwX?=
 =?us-ascii?Q?ceXjddYNBXVU/A+399laU6RQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f85b7df-91a0-47c8-6e72-08d900073271
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:08:36.2970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJtSGxzOgyDR6hOpFTxqovF6TKAA/l/TpzKtbcf3Joivqm+EZgfNRweFYxBqQcLwWtC72oljlzqd1TXr9iMQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Joey,

On 4/9/21 4:46 AM, Lee, Chun-Yi wrote:
> This patch adds the logic for checking the CodeSigning extended
> key usage when verifying signature of kernel module or
> kexec PE binary in PKCS#7.
>=20
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  certs/system_keyring.c               |  2 +-
>  crypto/asymmetric_keys/Kconfig       |  9 +++++++++
>  crypto/asymmetric_keys/pkcs7_trust.c | 37 ++++++++++++++++++++++++++++++=
+++---
>  include/crypto/pkcs7.h               |  3 ++-
>  4 files changed, 46 insertions(+), 5 deletions(-)
>=20
> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
> index 4b693da488f1..c9f8bca0b0d3 100644
> --- a/certs/system_keyring.c
> +++ b/certs/system_keyring.c
> @@ -243,7 +243,7 @@ int verify_pkcs7_message_sig(const void *data, size_t=
 len,
>  			goto error;
>  		}
>  	}
> -	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys);
> +	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys, usage);
>  	if (ret < 0) {
>  		if (ret =3D=3D -ENOKEY)
>  			pr_devel("PKCS#7 signature not signed with a trusted key\n");
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kcon=
fig
> index 1f1f004dc757..1754812df989 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -96,4 +96,13 @@ config SIGNED_PE_FILE_VERIFICATION
>  	  This option provides support for verifying the signature(s) on a
>  	  signed PE binary.
> =20
> +config CHECK_CODESIGN_EKU
> +	bool "Check codeSigning extended key usage"
> +	depends on PKCS7_MESSAGE_PARSER=3Dy
> +	depends on SYSTEM_DATA_VERIFICATION
> +	help
> +	  This option provides support for checking the codeSigning extended
> +	  key usage when verifying the signature in PKCS#7. It affects kernel
> +	  module verification and kexec PE binary verification.
> +
>  endif # ASYMMETRIC_KEY_TYPE
> diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_key=
s/pkcs7_trust.c
> index b531df2013c4..077bfef928b6 100644
> --- a/crypto/asymmetric_keys/pkcs7_trust.c
> +++ b/crypto/asymmetric_keys/pkcs7_trust.c
> @@ -16,12 +16,36 @@
>  #include <crypto/public_key.h>
>  #include "pkcs7_parser.h"
> =20
> +#ifdef CONFIG_CHECK_CODESIGN_EKU
> +static bool check_codesign_eku(struct key *key,
> +			     enum key_being_used_for usage)
> +{
> +	struct public_key *public_key =3D key->payload.data[asym_crypto];
> +
> +	switch (usage) {
> +	case VERIFYING_MODULE_SIGNATURE:
> +	case VERIFYING_KEXEC_PE_SIGNATURE:
> +		return !!(public_key->eku & EKU_codeSigning);
> +	default:
> +		break;
> +	}
> +	return true;
> +}
> +#else
> +static bool check_codesign_eku(struct key *key,
> +			     enum key_being_used_for usage)
> +{
> +	return true;
> +}
> +#endif
> +
>  /*
>   * Check the trust on one PKCS#7 SignedInfo block.
>   */
>  static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
>  				    struct pkcs7_signed_info *sinfo,
> -				    struct key *trust_keyring)
> +				    struct key *trust_keyring,
> +				    enum key_being_used_for usage)
>  {
>  	struct public_key_signature *sig =3D sinfo->sig;
>  	struct x509_certificate *x509, *last =3D NULL, *p;
> @@ -112,6 +136,12 @@ static int pkcs7_validate_trust_one(struct pkcs7_mes=
sage *pkcs7,
>  	return -ENOKEY;
> =20
>  matched:
> +	if (!check_codesign_eku(key, usage)) {

Perhaps this can be a generic check_eku_usage() call, with codesigning as o=
ne of the
things it can check for.

> +		pr_warn("sinfo %u: The signer %x key is not CodeSigning\n",
> +			sinfo->index, key_serial(key));
> +		key_put(key);
> +		return -ENOKEY;
> +	}
>  	ret =3D verify_signature(key, sig);
>  	key_put(key);
>  	if (ret < 0) {
> @@ -156,7 +186,8 @@ static int pkcs7_validate_trust_one(struct pkcs7_mess=
age *pkcs7,
>   * May also return -ENOMEM.
>   */
>  int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
> -			 struct key *trust_keyring)
> +			 struct key *trust_keyring,
> +			 enum key_being_used_for usage)

Please also update the comment above to mention the `usage` parameter.

Regards,
Varad

>  {
>  	struct pkcs7_signed_info *sinfo;
>  	struct x509_certificate *p;
> @@ -167,7 +198,7 @@ int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
>  		p->seen =3D false;
> =20
>  	for (sinfo =3D pkcs7->signed_infos; sinfo; sinfo =3D sinfo->next) {
> -		ret =3D pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring);
> +		ret =3D pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring, usage);
>  		switch (ret) {
>  		case -ENOKEY:
>  			continue;
> diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
> index 38ec7f5f9041..b3b48240ba73 100644
> --- a/include/crypto/pkcs7.h
> +++ b/include/crypto/pkcs7.h
> @@ -30,7 +30,8 @@ extern int pkcs7_get_content_data(const struct pkcs7_me=
ssage *pkcs7,
>   * pkcs7_trust.c
>   */
>  extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
> -				struct key *trust_keyring);
> +				struct key *trust_keyring,
> +				enum key_being_used_for usage);
> =20
>  /*
>   * pkcs7_verify.c
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

