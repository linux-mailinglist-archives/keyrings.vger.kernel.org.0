Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61455653B8
	for <lists+keyrings@lfdr.de>; Thu, 11 Jul 2019 11:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfGKJZn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Jul 2019 05:25:43 -0400
Received: from mail-eopbgr780082.outbound.protection.outlook.com ([40.107.78.82]:12112
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728024AbfGKJZm (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 11 Jul 2019 05:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDFle8KYi5L+L3wjkkPB12ErVtquOcT3MqdB/MhjGiQ=;
 b=dqbvOxsmXKFeQn67Xx6ElX0d4LDFR2YCM/WNUYuB4TF6r9Y7JYgvnur9yM0LpBf8T/UEzIWb8vYc2pY4syvpdI96ZYFpU1v7N9fIlWlnlSE30BMfMVw1eG2dwFlo9cZA1sAzc/Bpz1Q3Q3p2HcxZsKQxOzi42P0J8hDDdRxgQmk=
Received: from BN7PR02MB5124.namprd02.prod.outlook.com (20.176.26.153) by
 BN7PR02MB4244.namprd02.prod.outlook.com (52.135.251.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 09:25:39 +0000
Received: from BN7PR02MB5124.namprd02.prod.outlook.com
 ([fe80::cba:ad22:b7fd:2cfe]) by BN7PR02MB5124.namprd02.prod.outlook.com
 ([fe80::cba:ad22:b7fd:2cfe%5]) with mapi id 15.20.2052.022; Thu, 11 Jul 2019
 09:25:39 +0000
From:   Kalyani Akula <kalyania@xilinx.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     Stephan Mueller <smueller@chronox.de>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sarat Chand Savitala <saratcha@xilinx.com>
Subject: RE: [RFC PATCH 4/5] crypto: Adds user space interface for
 ALG_SET_KEY_TYPE
Thread-Topic: [RFC PATCH 4/5] crypto: Adds user space interface for
 ALG_SET_KEY_TYPE
Thread-Index: AQHUrjLRC0KQY4vUUEiutylzuXEA7qWzVM+AgJUjQyCAA8MlgIAVaNiQgBkBuACAGpYxMIAAFOSAgCdEexA=
Date:   Thu, 11 Jul 2019 09:25:38 +0000
Message-ID: <BN7PR02MB5124F4680E424C25D77D178DAFF30@BN7PR02MB5124.namprd02.prod.outlook.com>
References: <1547708541-23730-1-git-send-email-kalyani.akula@xilinx.com>
 <18759853.IUaQuE38eh@tauon.chronox.de>
 <SN6PR02MB5135CE53C3E3FB34CA5E6BA8AF320@SN6PR02MB5135.namprd02.prod.outlook.com>
 <2554415.t45IJDmies@tauon.chronox.de>
 <BN7PR02MB5124A7E685AC0F59AFBEFC8DAF130@BN7PR02MB5124.namprd02.prod.outlook.com>
 <20190610063501.u3q2k2vgytvknxs3@gondor.apana.org.au>
In-Reply-To: <20190610063501.u3q2k2vgytvknxs3@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kalyania@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c51238a-e0b7-46c0-f32d-08d705e1bcfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BN7PR02MB4244;
x-ms-traffictypediagnostic: BN7PR02MB4244:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN7PR02MB424488DD1D8E78B241AB09F2AFF30@BN7PR02MB4244.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(13464003)(189003)(54906003)(33656002)(26005)(53936002)(316002)(7696005)(486006)(99286004)(71190400001)(102836004)(71200400001)(76176011)(25786009)(68736007)(186003)(6506007)(9686003)(6306002)(4326008)(55016002)(14454004)(966005)(6246003)(107886003)(478600001)(6116002)(229853002)(256004)(6436002)(14444005)(66476007)(52536014)(66446008)(5660300002)(66066001)(66556008)(64756008)(86362001)(76116006)(7736002)(11346002)(3846002)(81156014)(6916009)(305945005)(74316002)(8936002)(66946007)(446003)(8676002)(476003)(81166006)(53546011)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB4244;H:BN7PR02MB5124.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X2tYWxnTyyBUkx/MY7xHc8Fmhpiag7fY9zIa7Yz7vd4tVqR4p8mNNjCzdNSpGMSf/3+oKWbjaZVIOj0s0fQ52YqNJJuWx/gh7FFGwbSW2xP3JyCtzXxJQxl/mqfDvq7KSYEyzG+mfbo7z7uygwqtzV3bAVTUOrOwLR4Hlj10Y1xop6VgN56UU6YoJTdZ4PVwGSkZoJwCUlqyApA/fqUB8HHh2dS1l67AzPof0NvsBQtk5/PFfCPjCiZFxa76ZeW9ge+mt1VFJi4eoFUwaPIx0n9NXdferw9PljKd2EbwZghpU9eSYc8rA9UwSfxPREADzXZQ2haHQ/mJMM5+5pAJgNradjjREL+/pzgEQmM7UDq7uzk0YK7h4Ku9QidU/0OnKDQNBS7UjjRmj8cJymy39xRFCdn0STBRerF31rze/dQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c51238a-e0b7-46c0-f32d-08d705e1bcfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 09:25:38.9530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kalyania@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4244
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Herbert,

Paes driver is using key expansion algorithm to encrypt and decrypt the pla=
intext. HW capability of expanding the given plain key is checked based on =
the provide key length. Here the HW key is the expended version of plain ke=
y.

Xilinx AES hardware has a capability to take plain keys/encrypted keys ( th=
ese keys are user programmable but for security reasons they are not readab=
le. Only AES accelerator has read access to these keys) stored on chip ( in=
 eFuse/BBRAM etc, ) and used for AES encryption/decryption.
Xilinx software is giving the Customer, the flexibility to choose among the=
 different on-chip AES keys.
So, we chosen a way to add AES_SEL_HW_KEY option.

In Paes driver , The ALG_SET_KEY interface is used to distinguish between H=
W Vs SW expansion of plain key based on the key_len.=20

How about using same interface to distinguish between the User supplied key=
 Vs HW key selection based on key_len parameter.

Thanks
kalyani  =09

> -----Original Message-----
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Sent: Monday, June 10, 2019 12:05 PM
> To: Kalyani Akula <kalyania@xilinx.com>
> Cc: Stephan Mueller <smueller@chronox.de>; keyrings@vger.kernel.org;
> davem@davemloft.net; linux-crypto@vger.kernel.org; linux-
> kernel@vger.kernel.org; Sarat Chand Savitala <saratcha@xilinx.com>
> Subject: Re: [RFC PATCH 4/5] crypto: Adds user space interface for
> ALG_SET_KEY_TYPE
>=20
> On Mon, Jun 10, 2019 at 05:20:58AM +0000, Kalyani Akula wrote:
> > Ping!!
>=20
> We already have existing drivers supporting hardware keys.  Please check
> out how they're handling this.  You can grep for paes under drivers/crypt=
o.
>=20
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au> Home Page:
> http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
