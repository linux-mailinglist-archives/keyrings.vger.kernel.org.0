Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E536A1B4
	for <lists+keyrings@lfdr.de>; Tue, 16 Jul 2019 07:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfGPFHR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Tue, 16 Jul 2019 01:07:17 -0400
Received: from m4a0039g.houston.softwaregrp.com ([15.124.2.85]:40964 "EHLO
        m4a0039g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbfGPFHQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 16 Jul 2019 01:07:16 -0400
X-Greylist: delayed 921 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jul 2019 01:07:16 EDT
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY m4a0039g.houston.softwaregrp.com WITH ESMTP;
 Tue, 16 Jul 2019 05:07:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 04:51:05 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 04:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzXltiqMMLoNzi4oo6FjCEV4dSACiB/Rxa7I7HdWL6PQ2x6rDicmydgHtOpCKv4u91eajAVIvPfhPoqLCwCUTIHonhTn9OjEkdF8/I7pjLTxYYIAxwXUSMjNDExgbjveEQQo9Qb6k2EP+m1i6a7X8x6H9gmarfqXnd4tai8Ydm/4gBdVD/F6mmU9ekKSr3Y0poBkx+wonYD3tEg0ne0QZsHRgxwJ2p1bekTANG33p6G+bRsFhmENKacHk8ij7atn7k9wtg6GAJU1/RZWzCH+XCDm9uI7Wq1M+KwBDlXB7YQwGIdtnP0YcPSqnJvSCzUcBExlLgFCPh9X4ogLZs3o/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9kLBiKUoW2inHVPp1ZhgSoEnYplzEHjR0KLJDyLSQQ=;
 b=FTQL6Oizd1o+/sTLNSslSRElneKZ1EhkjDv5iYVY9m1IlQYz8dN1+fm83CGtpBj9/VxKSEui69hagodgtMiDQeBG1Okk6L6lC5r3BQG0CdFOERTnQf00cnu+xpcc37Z1kUkQ8LyzX6Y7aFr+1QXhDvAAArvkJ4oJFaj83uuSzmaJANOG0fXi+dKKGqTkZypE+x9EwzHLwtYJsScPao5arvN/i0ugLcM7glpzpo2Nv3XrD9/aMPHeXAW2xhGcU6vmp1CiMMBLhwEOpkdUvRXTWQqdy5VtJHuo5HJ/4mdetWHZuUxqVK/OSkXWDm+S6xjA4PjWhcPiQN7IipQoFexJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BYAPR18MB2725.namprd18.prod.outlook.com (20.179.56.95) by
 BYAPR18MB2486.namprd18.prod.outlook.com (20.179.92.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 04:51:03 +0000
Received: from BYAPR18MB2725.namprd18.prod.outlook.com
 ([fe80::9c11:600:7b6b:6a32]) by BYAPR18MB2725.namprd18.prod.outlook.com
 ([fe80::9c11:600:7b6b:6a32%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 04:51:03 +0000
From:   Joey Lee <JLee@suse.com>
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
CC:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        "Mimi Zohar" <zohar@linux.ibm.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] X.509: Add messages for obsolete OIDs
Thread-Topic: [PATCH] X.509: Add messages for obsolete OIDs
Thread-Index: AQHVO5ISsfBgDswl10u2AJhdqmT5Ug==
Date:   Tue, 16 Jul 2019 04:51:03 +0000
Message-ID: <20190716045056.GT28008@linux-l9pv.suse>
References: <20190502041202.30753-1-jlee@suse.com>
In-Reply-To: <20190502041202.30753-1-jlee@suse.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To BYAPR18MB2725.namprd18.prod.outlook.com
 (2603:10b6:a03:103::31)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=JLee@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [202.47.205.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ed8e547-f874-4096-ff0e-08d709a93466
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR18MB2486;
x-ms-traffictypediagnostic: BYAPR18MB2486:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR18MB24868D2CCA5C57B477CE50D8A3CE0@BYAPR18MB2486.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(199004)(189003)(66066001)(305945005)(7736002)(68736007)(99286004)(102836004)(8936002)(54906003)(316002)(52116002)(8676002)(186003)(53936002)(446003)(11346002)(256004)(26005)(386003)(14454004)(486006)(64756008)(81166006)(66446008)(66556008)(66476007)(6512007)(66946007)(81156014)(9686003)(25786009)(3846002)(6116002)(966005)(19627235002)(15650500001)(2906002)(33656002)(6436002)(6486002)(478600001)(86362001)(6916009)(14444005)(476003)(229853002)(80792005)(76176011)(5660300002)(6506007)(71190400001)(71200400001)(6246003)(1076003)(36756003)(6306002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR18MB2486;H:BYAPR18MB2725.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T1Oo/uoe8taNJWx7dhgPaXqysoaro4guYn45N5I0f8w86uHzMvjuJwtFqxH6Qzw4L9K9TtIz867Dm7gm5UzTbcYwUudkAio/YlT1tw/h7X3g9h/5hVO+Hff+a7Lnwj/xOHWtOo+9mj5sdI6O9ZdMg9cfvQUzMHgf3fuoJ/zdv2teWUq+ax2OiPFR7JQs360WQBeYo2GN2+5EvCorRT23h7LrQfTwVUXW9wyn3lpbx9bvTfg4TsN9LOyARWhgML+cdH3S0vcrO+cEzClGjTjAP/qry/t79caOBCCF+QM0Oip7lHgnzjSlufjWvAH+/pqnATVoicuTEJ9bQ0/Om+QPwdgHFJzkRoQ7MzhWmz886nevuEPySPW3A3gXLXI4y+r+rgOwEHhxcBVPKbuX4Mjd4mT5RKatCj3G7YBOEIQw/To=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21D8B41B4637C34795985E26D8AA0396@namprd18.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed8e547-f874-4096-ff0e-08d709a93466
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 04:51:03.3010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLee@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2486
X-OriginatorOrg: suse.com
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi experts, 

On Thu, May 02, 2019 at 12:12:02PM +0800, Lee, Chun-Yi wrote:
> We found that the db in Acer machine has self signed certificates
> (CN=DisablePW or CN=ABO) that they used obsolete OID 1.3.14.3.2.29
> sha1WithRSASignature and 2.5.29.1 subjectKeyIdentifier. Kernel
> emits -65 error code when loading those certificates to platform
> keyring:
> 
> [    1.484388] integrity: Loading X.509 certificate: UEFI:MokListRT
> [    1.485557] integrity: Problem loading X.509 certificate -65
> [    1.486100] Error adding keys to platform keyring UEFI:MokListRT
> 
> Because the -65 error code is not enough for appeasing user when
> loading a outdated certificate. This patch add messages against
> 1.3.14.3.2.29 and 2.5.29.1 OIDs.
> 
> Link: https://bugzilla.opensuse.org/show_bug.cgi?id=1129471
> Cc: David Howells <dhowells@redhat.com> 
> Cc: Herbert Xu <herbert@gondor.apana.org.au> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>

Have any update or comment for this patch? 

Thanks
Joey Lee

> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 7 +++++++
>  include/linux/oid_registry.h              | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index 991f4d735a4e..bbd22d5c5b5d 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -192,6 +192,8 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
>  	pr_debug("PubKey Algo: %u\n", ctx->last_oid);
>  
>  	switch (ctx->last_oid) {
> +	case OID_sha1WithRSASignature:
> +		pr_info("1.3.14.3.2.29 sha1WithRSASignature is obsolete.\n");
>  	case OID_md2WithRSAEncryption:
>  	case OID_md3WithRSAEncryption:
>  	default:
> @@ -464,6 +466,11 @@ int x509_process_extension(void *context, size_t hdrlen,
>  		return 0;
>  	}
>  
> +	if (ctx->last_oid == OID_subjectKeyIdentifier_obsolete) {
> +		pr_info("2.5.29.1 subjectKeyIdentifier OID is obsolete.\n");
> +		return -ENOPKG;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index d2fa9ca42e9a..0641d5aa2251 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -62,6 +62,7 @@ enum OID {
>  
>  	OID_certAuthInfoAccess,		/* 1.3.6.1.5.5.7.1.1 */
>  	OID_sha1,			/* 1.3.14.3.2.26 */
> +	OID_sha1WithRSASignature,	/* 1.3.14.3.2.29 */
>  	OID_sha256,			/* 2.16.840.1.101.3.4.2.1 */
>  	OID_sha384,			/* 2.16.840.1.101.3.4.2.2 */
>  	OID_sha512,			/* 2.16.840.1.101.3.4.2.3 */
> @@ -83,6 +84,7 @@ enum OID {
>  	OID_generationalQualifier,	/* 2.5.4.44 */
>  
>  	/* Certificate extension IDs */
> +	OID_subjectKeyIdentifier_obsolete,	/* 2.5.29.1 */
>  	OID_subjectKeyIdentifier,	/* 2.5.29.14 */
>  	OID_keyUsage,			/* 2.5.29.15 */
>  	OID_subjectAltName,		/* 2.5.29.17 */
> -- 
> 2.16.4
> 
