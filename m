Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8FC35E164
	for <lists+keyrings@lfdr.de>; Tue, 13 Apr 2021 16:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbhDMO2k (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Apr 2021 10:28:40 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:37802 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232138AbhDMO2j (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Apr 2021 10:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618324098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OBMSkGKQknYWd9vNbj44Rx9ki3TDZXUWjtVgXA7un1Y=;
        b=VbdMRVAS9PCzhg4/1HxBawEkBq/RZ9VMg98gu0FqFiwAXDKBMsnsaQtiCLbalVdfHUQ98X
        XQ7kWT2Nwtyf7dKWooKg286+kxeMOWoJl/ahv50FkDsde+8ONi/1n6qYGLPttmMDxa8fj4
        n9XBYJf5Dp4QKtbO/DnCC55+lew51rE=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-lWPPkw2_MD6X_RshOANp3Q-1; Tue, 13 Apr 2021 16:28:17 +0200
X-MC-Unique: lWPPkw2_MD6X_RshOANp3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iu1cQs8ketGh5P65NokvYivQYKWS4bZ/4PIk9zisswyCqSLjkzQ6jK/IxSTLV5MrWaKokX2uxTC5V2Tr1/bU4DhJD9yS7kDJ9tR0EoXW5vD56lU2p9hmBsx4FtNIf1avV1XK9O54Tjk1+Im83xM99tcvVbv2wRupGnK7T3bJ40ZIRSg3JQMzdwSwXPRIceR5+z2ttqi8eTqYP8RdwK69mRYxfpOeciwIVkIcEHLYgA/IcoRSaBLIj5Vg37J+4gHoDJ9fN1dycV3qGKMXoJt4tqz4gqx9viEi0GEf+lz4ZTLF34loXolk8GAmkVrDOIgYQvlvuDqxYeBbLRJMIkoYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix/kx37SDZ3tToFiRLb17p4XjZz7GkRP3yVC4PwAU90=;
 b=NQmP4Ec5A95P/vxUiLQj4eCRYD9flWz+8+Y4y/BIXC96bH5nNsWJZs/KTlEyG3jaLBKyji0cqrDv58HWHsD44W6gmEGqwmLg8sRgSSV/fEWda1wbdfk5N6VrZeCEztrelzkqfqDr0Su1kWKjRM5GLiij3oktCJYDOiT4RYt3yLNfGmmNWJiErvTcxkm9HGogEPm0tOgXG41uIF1352kcBroZCNDJtEHskLhT4Zt1H938+zZ9LOxDZ2E3IW6T4SpMZq4Ubd4m1mZBS0IxSt6vmTuC+lPTWi64oI1CWtHDxpcyCyGvDKugQYe/lcWCFQ6355kJHdy5YnIW1QQ+hjRNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Tue, 13 Apr
 2021 14:28:15 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 14:28:15 +0000
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
References: <20210309091044.2298-1-jlee@suse.com>
 <20210309091044.2298-2-jlee@suse.com>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH 1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <5eb3e055-8e41-80b5-8caf-c80bbf2f4068@suse.com>
Date:   Tue, 13 Apr 2021 16:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210309091044.2298-2-jlee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.67] (95.90.93.216) by FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend Transport; Tue, 13 Apr 2021 14:28:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b722cdb-8782-4e7a-f9ab-08d8fe885fe2
X-MS-TrafficTypeDiagnostic: AM0PR04MB6770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6770637D928FF3495504642CE04F9@AM0PR04MB6770.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i+k2RPgfpbWXt825Xk+lfM5IuiuY3B+2511pJB6m9UsfN6ajW7tF8g4H+ZAVCu/MbDViQ6ushu5MFE82I5mCD76nepEUmkRK9LbLUNq7ECjK3vsJ9weeKPPN3PHuaNkjI6RlddK1QZZI8aXSUIya1Y2wSIYP2iTiEWq7aCHvpWSTzAiK5RXNGVtDaM34eVwEAotnrA1QiQ+wJZFTEs58qgc9KYl6m8tBNffh7Z17m+YfpKFf/JSfjF11/dwkGol9ZSNY1OZDkJFJxkoESEePy+aJsbTAtrFeAk1VDH8rl6Z7LwPi8zHkgCRXSQGVHhfzZE34kQz8M9nxZTd1aKMhiVW1MCuDm1s0qAaqg6wc+ylPICUrPpbfeRQiyp9zXpmDgMLMokQdDhrn03wqo5KANhY+cLgJRvi2nvGSFjyQ1iU2YmUmy6ZpPnBb7RVcSqKXh3GtsNae/wiJLSanrgeAzeq+x1Bt8I0UUGMgp+SqN8LeYNHY789kEfOO+l5hqot0EgGEUF/CilsDHNoF2GndF4tmNCGQwYr6PRBBvLOjvtf7raavNf4iyMa44Robyw7ErZHs7czl1sdnzor2e2ppIkuqUmzf8J2OEsuZRiXirDdU56pqnioX3NUE0bckT0Kk2pRdcWH+UaBbZEJQ6qiE0BUH26CYmcTf73MPpkIncc2wFXRN9fiY+VuB2fw5KFSrf7ilO/6w9NOk5XRWcc08KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(39860400002)(346002)(53546011)(6486002)(66556008)(66946007)(5660300002)(186003)(36756003)(110136005)(66574015)(316002)(52116002)(7416002)(38350700002)(8676002)(2616005)(44832011)(54906003)(38100700002)(2906002)(956004)(31686004)(86362001)(26005)(83380400001)(6666004)(66476007)(16576012)(16526019)(8936002)(4326008)(31696002)(478600001)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rR1TnHvVGLtvpugZhqdEXLWfNah+oqO7kn496kfkzE9r2lr4BUelc9zEwKvV?=
 =?us-ascii?Q?Id1z5jMZMFzr6guMcOYAOjuWUz0TPOHTQ+KB7pt+nGewgtr58AQIJo3Zpf+C?=
 =?us-ascii?Q?vhAv24UsXAnzI5YYNNA43NZCElF+tySYp3QJQxAY3U8bBLSUfIT1y/MF9oS2?=
 =?us-ascii?Q?V/ishp5y4c4+QONoe98tV39fo0LCZTpZU1qeY8XldDm/PEv7Th8f7//ghvBP?=
 =?us-ascii?Q?j0N4Of1rB8XO9gWCztiHpHNlvD/POSczKAy2GGzsMhuDhVADGnkQUrwwxmdf?=
 =?us-ascii?Q?fx9lD1P0xn8guOFvuK5EKFka38oPNuzzpxAqvFlJNhcZrGrHV0sIgcnotZtO?=
 =?us-ascii?Q?q4l3RGBqrh/oU8K/LP73XzMYY2hjeNDDSrfXAL0mQwetQa7qJRjGJ/XTmF3U?=
 =?us-ascii?Q?nIO1Zq+XGHutC/M4UemYm7wHb+dP5y5v7ajfq9Ut+B2q9NVYfzfbsPVxDI1B?=
 =?us-ascii?Q?L3iW8PlSFE+b2ukDE33I+KcoG/WMo+bL0pcIIz2tXEL1Ef5ogFklAIKO6KV8?=
 =?us-ascii?Q?lNnCKPWU+cbVBzhhSZpiDkzWnv8j5HOnitUxvepQ+kDWnHbQ5d+9n1vdnFhx?=
 =?us-ascii?Q?GoAJIvC98KtnrpTf1Naa7LMF/Oh7CekgtUtbisGi5cEybDMgAuVdZIRFUisW?=
 =?us-ascii?Q?TeinKrVPWRqfVPneY53sEHhmtHfHJlE/agtOKt2YYY8/cibKiUwLbxlMBFVt?=
 =?us-ascii?Q?DomjNgREXqlhB5/SQZUzgZsDNB7vksHes2IcHTdpoFIEgztv2kE6HeeW/OZK?=
 =?us-ascii?Q?XYpoVmAYaR/NyXyeSlgIT6adKCUwXpiv/gZqKkay1sEWXKr7XHir7mtuhJfk?=
 =?us-ascii?Q?tO2fAHH6Hz90fk6Z+8SoimM1TD1bvF3Vqo0r+wbXbnNDjFLY5p/2ErU/r31J?=
 =?us-ascii?Q?2LxlRlwVU44Sjkq4KCre1QXAlNiVtein4/hHzEvxFnvpzSw/piw7L4JqqXcD?=
 =?us-ascii?Q?12f05+GRzBFSMRNlLTDn++ErPU5/s6z8miUu+89u/pfoMl1SoNyJmSRD2Db7?=
 =?us-ascii?Q?TW54ZzOyxogIGxtxN14NWyoLZpCGW6qNoq9IHr0F+BVv1u59E0LcUJ8Y+UZB?=
 =?us-ascii?Q?BlEHLTp3WRlP1IYNbFa1LBAkIA1hF3arVGFfIKRPHWOZZt/SKzpXhrJrhfG5?=
 =?us-ascii?Q?4wS1tS+ALGDaFtY5zG8ZXmWIIvMYlm5Zdahiu1U/L2E+UO0iTUB/rmBdwSXZ?=
 =?us-ascii?Q?pmr5TOpgahaNUsJFGtkvLS4axD7YlAqcQi1gFfaoVDYulqOagOSmAMTOtrp5?=
 =?us-ascii?Q?2dFVQaMp3SaXay4XwdIZ7HU+4zNiIl9TuYTrq8xeTqQLVKBagoU6WWjuuZS2?=
 =?us-ascii?Q?Tku0VUTqotWAXlbEt/RRh+Vm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b722cdb-8782-4e7a-f9ab-08d8fe885fe2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:28:15.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iqC6JEMB+ISHey+PsiEar4pe4xMPHfDcPtaCaOxvd5Ay8CDB+fIR5jDf6/JtvATgjXiIG1IjdtuuvNOqgQVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On 3/9/21 10:10 AM, Lee, Chun-Yi wrote:
> This patch adds the logic for parsing the CodeSign extended key usage
> extension in X.509. The parsing result will be set to the eku flag
> which is carried by public key. It can be used in the PKCS#7
> verification.
>=20
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
>  include/crypto/public_key.h               |  1 +
>  include/linux/oid_registry.h              |  5 +++++
>  3 files changed, 30 insertions(+)
>=20
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 52c9b455fc7d..65721313b265 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrl=
en,
>  	struct x509_parse_context *ctx =3D context;
>  	struct asymmetric_key_id *kid;
>  	const unsigned char *v =3D value;
> +	int i =3D 0;
> +	enum OID oid;
> =20
>  	pr_debug("Extension: %u\n", ctx->last_oid);
> =20
> @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdr=
len,
>  		return 0;
>  	}
> =20
> +	if (ctx->last_oid =3D=3D OID_extKeyUsage) {
> +		if (v[0] !=3D ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> +		    v[1] !=3D vlen - 2)

A bad cert might get here with vlen < 2, which would cause indexing into v =
to break.
Please add a check for vlen >=3D 2 before this.

> +			return -EBADMSG;
> +		i +=3D 2;
> +
> +		while (i < vlen) {
> +			/* A 10 bytes EKU OID Octet blob =3D
> +			 * ASN1_OID + size byte + 8 bytes OID */
> +			if (v[i] !=3D ASN1_OID || v[i + 1] !=3D 8 || (i + 10) > vlen)

Same here, for i =3D=3D (vlen - 1), v[i + 1] would fetch outside of v. Or, =
does the
ASN.1 layout protect against this?

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
> index 4462ed2c18cd..e20e8eb53b21 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -113,9 +113,14 @@ enum OID {
>  	OID_SM2_with_SM3,		/* 1.2.156.10197.1.501 */
>  	OID_sm3WithRSAEncryption,	/* 1.2.156.10197.1.504 */
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
>  extern int sprint_oid(const void *, size_t, char *, size_t);
>  extern int sprint_OID(enum OID, char *, size_t);
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

