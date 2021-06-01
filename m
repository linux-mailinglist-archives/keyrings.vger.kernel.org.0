Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78E6397545
	for <lists+keyrings@lfdr.de>; Tue,  1 Jun 2021 16:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhFAOUy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 1 Jun 2021 10:20:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:46811 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234257AbhFAOUw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 1 Jun 2021 10:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1622557149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D8Dd59iEbsAV/sql9K/91di+RfAX6PQoDmKFG7lzBko=;
        b=NbAlGvAgZm01dWD1ncwvZbwZakAxN6MOh1aNBIw/VGh5tbU1TkPx7rGl3yCuVorGL2j2AT
        L38wFXFPbvABNxchvRw/LXRyNcXeXYRm8lpgrVmHQPmWgIQbYEE4FS9fspbsxHSL3Dz0t1
        2IEuwFlCsUwCnGoLwxL01sFK2M9wbjk=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-nOcbWBG4P12sjcRnTNkTnw-1;
 Tue, 01 Jun 2021 16:19:08 +0200
X-MC-Unique: nOcbWBG4P12sjcRnTNkTnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJpHGQd5nM8rnCpueD6BMRXVXXXC+MzM0pXbDPO1iF43KLeY8nNfJdBNwAuOyfVrSigOwu84woHGMygsKTBwSwH7eeluEyBiWRhvMiKDlicVOyzLTc5icessWWRFrhh/uj0+lSw8TYoy2RjOtwSZesO5km6OgnpVvFC5kndgOeinpDepe+Vfm8ecA3xnW9mXN20hEydursDFhYP30bl8mZ9rfNgMu/7ZTain0Fe0z3BmMgKb34p5hfz2Im0MsRbVpobDsWkNTi9vyCR9q0C+lH9GQlZB54BjXZ/5CK2EsemZ8Jq1Es9x+BnUU/h8aBW83fGatQ6z5udNh1Y1ItiqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqaHOPTAz+zs4BrVIKVXVXrhOIjJR3N6/MmkSsn6yz8=;
 b=eFgx4y4DqeV/Y2BuZktccJRBARaQtd7aV/7TgrC5kPnMazxQGDWgzIwh0ubXVOODVhqNjPjPnXHM/FtXC4C9GexPD6Nh7CwmVIrrNM/XL6NHlro5DHzxxXNhMP2iWf5bz+0JWbgWrc4kK0UZti3XjdSTe5nxsNhvOsbNevXSUI9ZUo915gN14+aji3MNtxOJwPgZNx5+7NxK7HuLShDXDw3jlmVQv3PUiAO47dLa8iem5FCOPoioFtSKOJUSPXIVezZLQ3m0G2pwp16ZqGOFuz4kW4mYKs8UQ1vgDqO80BcNPMDXmALCfqthrAJQ5XNKCkw5gtcSG3gvIqMc/AX1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 14:19:07 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 14:19:07 +0000
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
 <20210524021540.18736-3-jlee@suse.com>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH v8,2/4] PKCS#7: Check codeSigning EKU for kernel module
 and kexec pe verification
Message-ID: <333b0737-8cd2-244d-b6f5-52d9702315a8@suse.com>
Date:   Tue, 1 Jun 2021 16:19:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210524021540.18736-3-jlee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.32]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.155] (95.90.93.32) by AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 14:19:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf677160-56ea-4711-567c-08d92508375d
X-MS-TrafficTypeDiagnostic: AM9PR04MB8415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB84151D3ECBB9266297FF4D2AE03E9@AM9PR04MB8415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hV26wNTBOJm8GdFJSZTnhiRZIR29Wlwk08kK/lGP4ngei7C8KgFFhpqn7osWG1O7KHHppLMla7he149VlokGzx7b9yf7uzsig5/ariyBkqGeyEODirZrO+5pkAU6BCsU9Z/FmQqYo/+0UIGQlWXhyAl21mHJ7gIMwCqPwmKwfpIgtc25fw7MGXNg5PYCGoNlgTM49RJsCumR5/Iu1ELyB8P9bIs041NqDYugCr0kwxOz4xEB24TPnoa/eq/v2XU0ZsyBP5hPTRS48GYIcwdGgE4jkwyr+CWLLKy5SSaSbZFEDLcnrHKnmxjc0aDE2KzCU/rfGmNnDf9WqZICRmVTLQVMBvYVwB3wbZNost5vg5ky9VTFgry/goQTeYf3vavbo3918WwTr0S1zvb/pgA/ywiGQSFWNuJx1zxKjsSXSq2iVWcM88aboDRhmwqcpbmwWcyMTddcVMNKKUwSCgcHOw35WE/VDeh3hPPrNT2dUk6fFz2QHJoC4NMKRQs/hCKmEPxzuebqU1HHo1FijUbhUqFpaXvGVTlTT8FOpch0AHrtIDKqkU6yvpr6QWeRq5Q1KGv4BlwvAB8tPx9SYsnP11iUiPz53v8Okr6zGIX1jLTd8Sfgwnn6kLq47FIIYfztKaoXxGUR8o8GscOAq0ixGWq5xyXXdtAWGTcJ0y28odCRbJZq0wA/j77geHdf6XX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(31686004)(66556008)(53546011)(2906002)(54906003)(26005)(66946007)(110136005)(8936002)(498600001)(86362001)(16526019)(8676002)(186003)(83380400001)(31696002)(107886003)(44832011)(66574015)(6486002)(2616005)(956004)(16576012)(5660300002)(15650500001)(36756003)(4326008)(7416002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P5gu31Yj+oP0sVuQ5WzGNgK6J1UsLttlOs5NR3QQN6CCj0vs2GG1RjeHwzdH?=
 =?us-ascii?Q?LZ3YiXax6k/QTn/YsMCZXX9c2T0sYRfSZczZt28bQuqFAfyyTiR03R2SepqU?=
 =?us-ascii?Q?iEJWcNdrd7suUjyG++vFAGDuCGRTv4HFF5OqK4ZLNXwvRiV+drzt6wE+V1y6?=
 =?us-ascii?Q?ozVK1T6quc+YdHVsZ+1vAzrmC38LVeiI+T4X2wn9l8MNqQ1mXT9JhHPRYEvQ?=
 =?us-ascii?Q?xuuCSrZbSVFJ1lKGu6JfpvsSIIsuium72GRc2OxmfvibvLt4P4FP5a1xdEme?=
 =?us-ascii?Q?odtmw3blfjjxQRPyIrk5DaTnZse23PEzyX24LjGrPOspr+jOcoUm+mCSwA/j?=
 =?us-ascii?Q?2U6b8FcZWZekvp9IMMbQ2GS6/0qijIwD/G03umtmjwD1IxKJNbicT6oRbmKj?=
 =?us-ascii?Q?KoSQiIVuAFDDEujgxdsKoX4bQxWKRqfp6TdwDkyp5a5JD/0wAsZtk9iy9uxn?=
 =?us-ascii?Q?v7CiixGQkOGUql1XMuw/L9ueaOF747+KOjk8cShUsav+PxO2/rByuDaZUtrW?=
 =?us-ascii?Q?xtWl7FTrBJyX/Lx1EjeugKe8AZ9vYJ7zXTKPcQlXbfzKIUbXSsW+kzYf/ADu?=
 =?us-ascii?Q?otBIseNKCgNkRj91Gevu576VSnQv0iXhf0MvHFz+dFE8stZkAPeBakYfNWwX?=
 =?us-ascii?Q?/Tb6Fj/mjTZSgLFqX8LgqdAQ3HAbMYRXyeuoHA8l3f/Uz6Lrq1YuxwWX0F1L?=
 =?us-ascii?Q?DBCBB16/xxsqTFNCkDKeZxRACUG98O5uQkgsgjJZmpIE1mDIa+5/xO41IijG?=
 =?us-ascii?Q?pQNcSpFfYm2OS4e6OjVzjrisY98hHvLKHk4mL+sI3EOTXSPr5MaH2UYv/nbH?=
 =?us-ascii?Q?ioQb4zlrutlJroqyhswc0XtTPslX1NbbAt0M70LTP4X/5rNbvhi3A9IBYDmN?=
 =?us-ascii?Q?5i1Nq9bTueCfuudjod7dZwrTrTyJabqLcbTHKLuzznbVbwIK6bLSLzY+pa5L?=
 =?us-ascii?Q?CAb8qWwI2vISShkuv69f+8friEFcA0AgBAOt9QAxHnbQUmxdGPkIsNmX9w5O?=
 =?us-ascii?Q?Exz4XLZ0n/6t2SnmYibnoGWT20Z1IREJyk2Rs4xVXXXRJuGX1rD30Vfr+qw7?=
 =?us-ascii?Q?jTqnHTbULzrwYITx86uRENc4ZnEUx2v8dcymnJ2O4pKqVgI1A5sez5uHbWpm?=
 =?us-ascii?Q?0CTZb/CNP/LZg66c9Sl88yR3RQmfXxmc5GmVZBsug+7Mx90oF0eSwg3paZru?=
 =?us-ascii?Q?ZJxLdI7wB2HwW7D625slTiVckyCno8nHGiGAkyiLGuXexdCszlctL4pcrsoZ?=
 =?us-ascii?Q?9PrkaLC70E2YvgJsZB1lrDX+3HMu0ONO0pjyTfF1laueyNM0c0u2rtiNI4a2?=
 =?us-ascii?Q?SbSvrgEqzpy0t2gUrtz9ND2p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf677160-56ea-4711-567c-08d92508375d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 14:19:07.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR1Z9dny4AmtVPvtxbk876Saix2iaiwd0E/N4AvpcURfRSBwQDIOBjcdWk6oqP5tQt2qAueNdERmmNeSjl6E/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Joey,

On 5/24/21 4:15 AM, Lee, Chun-Yi wrote:
> This patch adds the logic for checking the CodeSigning extended
> key usage when verifying signature of kernel module or
> kexec PE binary in PKCS#7.
>=20
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  certs/blacklist.c                    |  6 +++--
>  certs/system_keyring.c               |  4 ++--
>  crypto/asymmetric_keys/Kconfig       |  9 ++++++++
>  crypto/asymmetric_keys/pkcs7_trust.c | 43 ++++++++++++++++++++++++++++++=
+++---
>  include/crypto/pkcs7.h               |  4 +++-
>  include/keys/system_keyring.h        |  7 ++++--
>  6 files changed, 63 insertions(+), 10 deletions(-)
>=20
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index c9a435b15af4..a4ef26286584 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -16,6 +16,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/uidgid.h>
>  #include <keys/system_keyring.h>
> +#include <keys/asymmetric-type.h>
>  #include "blacklist.h"
>  #include "common.h"
> =20
> @@ -181,11 +182,12 @@ int add_key_to_revocation_list(const char *data, si=
ze_t size)
>   * is_key_on_revocation_list - Determine if the key for a PKCS#7 message=
 is revoked
>   * @pkcs7: The PKCS#7 message to check
>   */
> -int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> +int is_key_on_revocation_list(struct pkcs7_message *pkcs7,
> +			      enum key_being_used_for usage)
>  {
>  	int ret;
> =20
> -	ret =3D pkcs7_validate_trust(pkcs7, blacklist_keyring);
> +	ret =3D pkcs7_validate_trust(pkcs7, blacklist_keyring, usage, false);
> =20
>  	if (ret =3D=3D 0)
>  		return -EKEYREJECTED;
> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
> index 692365dee2bd..394cf4e0feed 100644
> --- a/certs/system_keyring.c
> +++ b/certs/system_keyring.c
> @@ -221,13 +221,13 @@ int verify_pkcs7_message_sig(const void *data, size=
_t len,
>  			goto error;
>  		}
> =20
> -		ret =3D is_key_on_revocation_list(pkcs7);
> +		ret =3D is_key_on_revocation_list(pkcs7, usage);
>  		if (ret !=3D -ENOKEY) {
>  			pr_devel("PKCS#7 platform key is on revocation list\n");
>  			goto error;
>  		}
>  	}
> -	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys);
> +	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys, usage, true);
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
> index b531df2013c4..c6ebf3e6adfd 100644
> --- a/crypto/asymmetric_keys/pkcs7_trust.c
> +++ b/crypto/asymmetric_keys/pkcs7_trust.c
> @@ -16,12 +16,40 @@
>  #include <crypto/public_key.h>
>  #include "pkcs7_parser.h"
> =20
> +#ifdef CONFIG_CHECK_CODESIGN_EKU
> +static bool check_eku_by_usage(struct key *key, enum key_being_used_for =
usage)

Can this check fit into the existing find_asymmetric_key call (or, a new
find_asymmetric_key_by_usage call) instead? pkcs7_validate_trust_one
needs to match the signature against an EKU_codeSigning key on trust_keyrin=
g.

Thanks,
Varad

> +{
> +	struct public_key *public_key =3D key->payload.data[asym_crypto];
> +	bool ret =3D true;
> +
> +	switch (usage) {
> +	case VERIFYING_MODULE_SIGNATURE:
> +	case VERIFYING_KEXEC_PE_SIGNATURE:
> +		ret =3D !!(public_key->eku & EKU_codeSigning);
> +		if (!ret)
> +			pr_warn("The signer '%s' key is not CodeSigning\n",
> +				key->description);
> +		break;
> +	default:
> +		break;
> +	}
> +	return ret;
> +}
> +#else
> +static bool check_eku_by_usage(struct key *key, enum key_being_used_for =
usage)
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
> +				    enum key_being_used_for usage,
> +				    bool check_eku)
>  {
>  	struct public_key_signature *sig =3D sinfo->sig;
>  	struct x509_certificate *x509, *last =3D NULL, *p;
> @@ -112,6 +140,10 @@ static int pkcs7_validate_trust_one(struct pkcs7_mes=
sage *pkcs7,
>  	return -ENOKEY;
> =20
>  matched:
> +	if (check_eku && !check_eku_by_usage(key, usage)) {
> +		key_put(key);
> +		return -ENOKEY;
> +	}
>  	ret =3D verify_signature(key, sig);
>  	key_put(key);
>  	if (ret < 0) {
> @@ -135,6 +167,8 @@ static int pkcs7_validate_trust_one(struct pkcs7_mess=
age *pkcs7,
>   * pkcs7_validate_trust - Validate PKCS#7 trust chain
>   * @pkcs7: The PKCS#7 certificate to validate
>   * @trust_keyring: Signing certificates to use as starting points
> + * @usage: The use to which the key is being put.
> + * @check_eku: Check EKU (Extended Key Usage)
>   *
>   * Validate that the certificate chain inside the PKCS#7 message interse=
cts
>   * keys we already know and trust.
> @@ -156,7 +190,9 @@ static int pkcs7_validate_trust_one(struct pkcs7_mess=
age *pkcs7,
>   * May also return -ENOMEM.
>   */
>  int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
> -			 struct key *trust_keyring)
> +			 struct key *trust_keyring,
> +			 enum key_being_used_for usage,
> +			 bool check_eku)
>  {
>  	struct pkcs7_signed_info *sinfo;
>  	struct x509_certificate *p;
> @@ -167,7 +203,8 @@ int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
>  		p->seen =3D false;
> =20
>  	for (sinfo =3D pkcs7->signed_infos; sinfo; sinfo =3D sinfo->next) {
> -		ret =3D pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring);
> +		ret =3D pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring,
> +					       usage, check_eku);
>  		switch (ret) {
>  		case -ENOKEY:
>  			continue;
> diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
> index 38ec7f5f9041..5d87b8a02f79 100644
> --- a/include/crypto/pkcs7.h
> +++ b/include/crypto/pkcs7.h
> @@ -30,7 +30,9 @@ extern int pkcs7_get_content_data(const struct pkcs7_me=
ssage *pkcs7,
>   * pkcs7_trust.c
>   */
>  extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
> -				struct key *trust_keyring);
> +				struct key *trust_keyring,
> +				enum key_being_used_for usage,
> +				bool check_eku);
> =20
>  /*
>   * pkcs7_verify.c
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.=
h
> index 6acd3cf13a18..434a9b41d3a5 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -9,6 +9,7 @@
>  #define _KEYS_SYSTEM_KEYRING_H
> =20
>  #include <linux/key.h>
> +#include <keys/asymmetric-type.h>
> =20
>  #ifdef CONFIG_SYSTEM_TRUSTED_KEYRING
> =20
> @@ -59,13 +60,15 @@ static inline int is_binary_blacklisted(const u8 *has=
h, size_t hash_len)
> =20
>  #ifdef CONFIG_SYSTEM_REVOCATION_LIST
>  extern int add_key_to_revocation_list(const char *data, size_t size);
> -extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7,
> +				     enum key_being_used_for usage);
>  #else
>  static inline int add_key_to_revocation_list(const char *data, size_t si=
ze)
>  {
>  	return 0;
>  }
> -static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> +static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7,
> +					    enum key_being_used_for usage)
>  {
>  	return -ENOKEY;
>  }
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

