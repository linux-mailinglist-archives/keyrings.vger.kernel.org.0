Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D263943B0
	for <lists+keyrings@lfdr.de>; Fri, 28 May 2021 15:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbhE1OAN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 28 May 2021 10:00:13 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:21306 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236185AbhE1OAN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 28 May 2021 10:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1622210317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nqhe4qxdoF5t8IuTxNMUs8lP+NifjqZHp3N0s18nIJ4=;
        b=HtQcl2Vt4QcPC/VEd7G41HfKw+KDnmr5zbrN0QT6IizE3RJhkrd0l4m08zl2Qsgp37ZWvB
        7PtTzAaI0qMyJnF48Vrgvs8MKjDzaR06SFcrC3BkU6lxjPvX1q3i95rbCwloRdDxXfxP90
        wvwEEGI5+/C8KHtosonCFtz44RC+3MI=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-gesE_vKrPJOk1KO1oUuALg-1; Fri, 28 May 2021 15:58:36 +0200
X-MC-Unique: gesE_vKrPJOk1KO1oUuALg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WESPj1cq77fXqIxPvLynmNeoJQS/uT+XxvboympRV5sg5LeWDBtYrGxnfo/ysPNiuMUidyt3XSFKXdLf0cZv35RAAr2Lcj8FaI1xEQaU9ckaVciGu19Ig49jab65c3xY2KDRlIrbcn5PEmf/z16seX4Rs1pUekSp5ykmNrAmF5BfnPIhR9l2KqD7FSt/0ASC190MiB/zB+4g2ed08bu5DpX1xRC4dJs2JIne+Am9D/Cf32n5X8eE/aksiDdazbDZIxR2XYd4ooLA7SfrFrO7ug6L9Zij4Qi7ZZJqtwSRK4iAtUJyllIHoV8IBYYkcJyXEntMk4N0qOSpFx8PCePvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F40ImvG4zAm52dFW/O+hTFTK5TuXWBgKvqAiXXOt2oY=;
 b=C5+sCpeBguF+q9WbzDApZqkAuooG0EznoMXUtKb6DSiNJjmqPXA8PiRJOY7FPvroS32MJKXQX29VP6SLyNSggVptQCiXBiVIIfW11BghWuI/ZYmsn2Rzvm7t+hitJyga9FB7OHWbCFylb+1t6cXczccorglos82+0RkuhZRSRBQFoEFR2LWizt8Cvc2hgdvSP+AnYzRjGqSue0BGPMljg84cVJ85B3/RMBwK1U2HLpDhU5f7IBZ6vHlscy/ly3qC/wMNSKOZf/Nk3AYAVj0Vm+iEIGeYD7MEZK6xck986HyQ8nSUaAOFtHF8Er2CVW86eWAvWLrxRJAJvJnGydunrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5492.eurprd04.prod.outlook.com (2603:10a6:208:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 13:58:34 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4173.020; Fri, 28 May 2021
 13:58:34 +0000
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
References: <20210524021540.18736-1-jlee@suse.com>
 <20210524021540.18736-2-jlee@suse.com>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH v8,1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <d0f20371-e713-220d-d49e-65bdf3ff62ca@suse.com>
Date:   Fri, 28 May 2021 15:58:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210524021540.18736-2-jlee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.32]
X-ClientProxiedBy: PR3P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::21) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.155] (95.90.93.32) by PR3P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 13:58:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7689b13-26e5-47b3-695c-08d921e0af27
X-MS-TrafficTypeDiagnostic: AM0PR04MB5492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5492C9D0A1CE1572B49BD8FCE0229@AM0PR04MB5492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9KO6iFFYhzEU464uxeSqqDb7MlMQcqde36GFlZpy6kFmkksZd8Q8foM2QtMCXentaLqQhFK/DXRmQdRk3YzYZveZzssDmuxOabHWZz/FnvfQ5f1X8jUTmS5GDVcU6v7sFjmyGuGtuvRvna6SDOOvqMphWH5S5mF6VibcWErG3e1kwyzI+ulXoX6oXPxQ7/HqX4WWioiROZCZPWmkq7Y9+SUOBJWYrrQU9ivROh5fX3L83ygZvpxKebnFqqav+29PmPGDt3NBbXwamFsu2WKasqrSlYHcVSK9Adsxmiyf8H9+oKSckb4xH+0p6rHfItyq0i+0az3DVlX48CXdEwJlc2FCMrokQ1CsiGM+ixTNcSeRme9J5ULdTn1/Nj+utkscOtJqEeyq7fKCdFxn/I4WKGGffvOVuMLapq+wKtTH1qU1f/0tbxlj0/b39WZ/Q1oG247xyhm/XU1bJWRpsItMT5idkaTQ1F3Br1LYjhwu20nsmqNF8ATlIeAS8VtyR3AN9nagL/EKNe0+kT0wL4hn7g8pDRc8t8WY8vDvRc2SB1q9tDUdGqIv/38iZXOlsMlFRoHYhB2K4YTXTvVkDKMZ4LRu/mT/mS8rtomvP4FtNmd6CjmwciwjDuVukBZdsvvRRFNZ5Ei2PKH4roAG5VxUJq+uQki76EVBAOt/CBUPAQL1ASZOPg9MVf84CswYy59
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66574015)(36756003)(2616005)(956004)(53546011)(83380400001)(31686004)(6486002)(107886003)(8676002)(4326008)(8936002)(16576012)(498600001)(54906003)(110136005)(66946007)(66476007)(66556008)(2906002)(44832011)(5660300002)(31696002)(186003)(26005)(38100700002)(86362001)(16526019)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cE6nDUsX82CKBjr5uBDKClHnxGrAMdIojbVPDpfyDCJvDRpZPWEVpFsMDxBH?=
 =?us-ascii?Q?t2jyhgRHfBnjgW1CvUGgQSAH7stwdW8Ej1+ODsXM861Bs9WFo8aXZhkonQu4?=
 =?us-ascii?Q?SN5PIspxZpsLjxacRb2f4oyHbfbu0/lOEg4CQD585tovatua/3k+onb5P9Aw?=
 =?us-ascii?Q?+Grz9g977l3WiEmH1OMlOJ9MBVoZ/+VkF5FfkvCshG8nAR+DKz0UXgHEGQwH?=
 =?us-ascii?Q?fccd77pqKdvvgkDV9POs5tRG8d4r3ZWCO8w7AtJLep96RCKZ0KSrkidPlwG+?=
 =?us-ascii?Q?tRqkzEYtY2I0hfODDjk3fCr7ojD2ac5+JruLHR1ejpZ4O93EkT8jovaC2kh+?=
 =?us-ascii?Q?5qUAfuUoXi9HC6OZC+UP/yuYb7wNba6CTAa8Qr55H9FXFOrvS2EaXkSoHtx5?=
 =?us-ascii?Q?RwnquxnwDHVfmhnir5ZpDD3Vog9Fxv4YVCJ0PjlyujkglXdDZQFvwne2DcFF?=
 =?us-ascii?Q?E7Gz1bNYSgOuydNgNo/zOiIx4Bt5HkRqDG2Rl8YTAXV/mDvrevkRFmL2xyEr?=
 =?us-ascii?Q?8Q4HkbXBSsMYR337EeH9/Hhyshs5FxaHM4pellBz5nqnOP2YpK8bLErRlo74?=
 =?us-ascii?Q?Q8kEMtvuALdQ+MD+xzM+IbTVHg8zTXs2e8ounHysxL2N7jleDtJMJ0KmS1qE?=
 =?us-ascii?Q?+PY+ps55k9WNosfOS8wZMvygQpzLz+50CRbDYEAGuQdd6ZDgJDtN+YuioGi/?=
 =?us-ascii?Q?aiuqbuVB68uwPSvBUJBrgUTph8MXAAiy0aOPmPxjoVrUECku/P0dxmzM1rpl?=
 =?us-ascii?Q?AKRmqjw/d7e9mAY6BcLhHiZy7oII3CiUbQXB8U2l41ErixSSKD6qQJDyQu7M?=
 =?us-ascii?Q?jIUb8SoPtNYJMihcGA/9kU6lpPBlsfJMXRGuB61GCTeKBR0OwMHXFK+vc1NS?=
 =?us-ascii?Q?4TuyHPrIXgLBnqTo4hz1f7SZbcEdfu5OtHhgHDVmw5/JpnTwPzsjISyFIvGq?=
 =?us-ascii?Q?ZiEzSN3FlUq4kQt/nIl5pUj66RTu4TNPtUyrd0D5gcmBvW1riWEBc3tiQzWC?=
 =?us-ascii?Q?K7zsDoRgghx3j+ivtTCDjk6HE1fOS7tmglpidkqWDcVVu9zLukePF5yDexAw?=
 =?us-ascii?Q?6VOYJ72xvbhuHotfw+PjSAeOLYdJQfegh+xjlbbb/AvYpGl5n+QQJLyu9NNu?=
 =?us-ascii?Q?ZAW3dvnGGWCYdw50ZB+qnOQJxqByGUJR3umlrcG23vanOjG5QvDm661ThDoP?=
 =?us-ascii?Q?DXCYOWalferBXk3FAW+J7q1p2FCaNdWeGGiWG8vVOOjeHwmMe+KakONdgwXg?=
 =?us-ascii?Q?TrvuaRq3lNsawKsp4zEPvTUiglJVQYv2LakEXfdWVqIcZK6XmDzD3cz9fVMN?=
 =?us-ascii?Q?CW9X/L7ktWS8HHNlAhMFRa8I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7689b13-26e5-47b3-695c-08d921e0af27
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 13:58:34.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXqDjnS1uw2kmZExORYWyNnNHKP6VnN8mI0nUKlj29pRYqEi8S3em6rrtwqzX6s1SxZvDPJiCREddbdAfSghQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5492
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Joey,

On 5/24/21 4:15 AM, Lee, Chun-Yi wrote:
> This patch adds the logic for parsing the CodeSign extended key usage
> extension in X.509. The parsing result will be set to the eku flag
> which is carried by public key. It can be used in the PKCS#7
> verification.
>=20
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 25 +++++++++++++++++++++++++
>  include/crypto/public_key.h               |  1 +
>  include/linux/oid_registry.h              |  5 +++++
>  3 files changed, 31 insertions(+)
>=20
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 6d003096b5bc..996db9419474 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -542,6 +542,8 @@ int x509_process_extension(void *context, size_t hdrl=
en,
>  	struct x509_parse_context *ctx =3D context;
>  	struct asymmetric_key_id *kid;
>  	const unsigned char *v =3D value;
> +	int i =3D 0;
> +	enum OID oid;
> =20
>  	pr_debug("Extension: %u\n", ctx->last_oid);
> =20
> @@ -571,6 +573,29 @@ int x509_process_extension(void *context, size_t hdr=
len,
>  		return 0;
>  	}
> =20
> +	if (ctx->last_oid =3D=3D OID_extKeyUsage) {
> +		if (vlen < 2 ||
> +		    v[0] !=3D ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> +		    v[1] !=3D vlen - 2)
> +			return -EBADMSG;
> +		i +=3D 2;
> +

Please use assignment rather than incrementing here, ie i =3D 2. This allow=
s the counter
to be independent of previous code.

> +		while (i < vlen) {

Or better yet, `for (i =3D 2; i < vlen; i +=3D 10) ...`

> +			/* A 10 bytes EKU OID Octet blob =3D
> +			 * ASN1_OID + size byte + 8 bytes OID */
> +			if ((i + 10) > vlen || v[i] !=3D ASN1_OID || v[i + 1] !=3D 8)
> +				return -EBADMSG;
> +
> +			oid =3D look_up_OID(v + i + 2, v[i + 1]);
> +			if (oid =3D=3D OID_codeSigning) {
> +				ctx->cert->pub->eku |=3D EKU_codeSigning;
> +			}
> +			i +=3D 10;
> +		}
> +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> +		return 0;
> +	}
> +
>  	return 0;
>  }
> =20
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 47accec68cb0..1ccaebe2a28b 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -28,6 +28,7 @@ struct public_key {
>  	bool key_is_private;
>  	const char *id_type;
>  	const char *pkey_algo;
> +	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */
>  };
> =20
>  extern void public_key_free(struct public_key *key);
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 461b7aa587ba..8c8935f0eb73 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -125,9 +125,14 @@ enum OID {
>  	OID_TPMImportableKey,		/* 2.23.133.10.1.4 */
>  	OID_TPMSealedData,		/* 2.23.133.10.1.5 */
> =20
> +	/* Extended key purpose OIDs [RFC 5280] */
> +	OID_codeSigning,		/* 1.3.6.1.5.5.7.3.3 */
> +
>  	OID__NR
>  };
> =20
> +#define EKU_codeSigning	(1 << 2)
> +
>  extern enum OID look_up_OID(const void *data, size_t datasize);
>  extern int parse_OID(const void *data, size_t datasize, enum OID *oid);
>  extern int sprint_oid(const void *, size_t, char *, size_t);
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

