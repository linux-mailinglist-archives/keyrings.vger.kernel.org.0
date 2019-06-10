Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0EDC3AE96
	for <lists+keyrings@lfdr.de>; Mon, 10 Jun 2019 07:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387484AbfFJFVC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 10 Jun 2019 01:21:02 -0400
Received: from mail-eopbgr810051.outbound.protection.outlook.com ([40.107.81.51]:30931
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387457AbfFJFVC (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 10 Jun 2019 01:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9jPIrjrGwR9dzSGc3epmEvjkVYqRndp3RJZWukVrUU=;
 b=IkGwJFsM4dBLFbWfZtFiFOSw3BgFXviTDtg4COoLQh9FeB8MfFlAeRfAuks7LAOMojE3Ncd5Glg8CvQbOhqdGMzc6xhbCEmvffzhmBi5ZDi7rGmdHC/BsQdAP3pwF141nV1X+OLVgCtkSr+IwxWfYyYBboJaSBAlRwO0ZBMjE6Y=
Received: from BN7PR02MB5124.namprd02.prod.outlook.com (20.176.26.153) by
 BN7PR02MB4146.namprd02.prod.outlook.com (52.132.223.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Mon, 10 Jun 2019 05:20:58 +0000
Received: from BN7PR02MB5124.namprd02.prod.outlook.com
 ([fe80::a56f:7a30:7488:ff99]) by BN7PR02MB5124.namprd02.prod.outlook.com
 ([fe80::a56f:7a30:7488:ff99%4]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 05:20:58 +0000
From:   Kalyani Akula <kalyania@xilinx.com>
To:     Stephan Mueller <smueller@chronox.de>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
CC:     "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sarat Chand Savitala <saratcha@xilinx.com>
Subject: RE: [RFC PATCH 4/5] crypto: Adds user space interface for
 ALG_SET_KEY_TYPE
Thread-Topic: [RFC PATCH 4/5] crypto: Adds user space interface for
 ALG_SET_KEY_TYPE
Thread-Index: AQHUrjLRC0KQY4vUUEiutylzuXEA7qWzVM+AgJUjQyCAA8MlgIAVaNiQgBkBuACAGpYxMA==
Date:   Mon, 10 Jun 2019 05:20:58 +0000
Message-ID: <BN7PR02MB5124A7E685AC0F59AFBEFC8DAF130@BN7PR02MB5124.namprd02.prod.outlook.com>
References: <1547708541-23730-1-git-send-email-kalyani.akula@xilinx.com>
 <18759853.IUaQuE38eh@tauon.chronox.de>
 <SN6PR02MB5135CE53C3E3FB34CA5E6BA8AF320@SN6PR02MB5135.namprd02.prod.outlook.com>
 <2554415.t45IJDmies@tauon.chronox.de>
In-Reply-To: <2554415.t45IJDmies@tauon.chronox.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kalyania@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d97bf42-987c-4e46-cecb-08d6ed636be5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BN7PR02MB4146;
x-ms-traffictypediagnostic: BN7PR02MB4146:
x-microsoft-antispam-prvs: <BN7PR02MB414604F0DE79EA6CBC5CCFACAF130@BN7PR02MB4146.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(376002)(366004)(346002)(396003)(13464003)(189003)(199004)(486006)(2906002)(7736002)(54906003)(110136005)(316002)(305945005)(14444005)(256004)(5660300002)(476003)(71200400001)(71190400001)(86362001)(33656002)(2501003)(74316002)(52536014)(11346002)(446003)(14454004)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(26005)(53936002)(7696005)(66066001)(73956011)(68736007)(186003)(76176011)(102836004)(6116002)(3846002)(6506007)(9686003)(6436002)(53546011)(55016002)(229853002)(478600001)(25786009)(8676002)(81166006)(99286004)(8936002)(4326008)(107886003)(6246003)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB4146;H:BN7PR02MB5124.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: beHgnN2MCG+T/IWkn39JiLZgGCdx8nxM7zZveUbGy53tjJryiIXOIk0PDeUaJlzL8xNt4G4luAF6Emw8k4KOfZw4DBQK0onIF3Bvor1X1bEKVM2XsIaEN1UN1bkmkxtzLHyXTmCq1ijzkU1WN/5rXi8Mc+jBb0Z0tn1kSncULUGxy29Z3Hftml2APWknfT+pxkm2ZqZlK+KxIo1CozNHLckD0TnnosfFhN1ack/1UC0Vnr/nFM/ynXRBYMr+WhpJYOGqk0KDY8E3JLF1NmAKX1eT2YrkJkAeSqLNssdiVkEQEnmpcJbE6C1xxttEfn2Ih93nD+HzSIvdCK4C9ETvNVST+G5venqFq3Ue6ctzxUgikCFxgV457Wrd9y4fLkVRulT60MGXo+yAqvvwEA10UbwjceQbnl/FEesxrvtZbSM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d97bf42-987c-4e46-cecb-08d6ed636be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 05:20:58.6922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kalyania@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4146
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ping!!

> -----Original Message-----
> From: Stephan Mueller <smueller@chronox.de>
> Sent: Friday, May 24, 2019 12:50 PM
> To: Kalyani Akula <kalyania@xilinx.com>; keyrings@vger.kernel.org
> Cc: herbert@gondor.apana.org.au; davem@davemloft.net; linux-
> crypto@vger.kernel.org; linux-kernel@vger.kernel.org; Sarat Chand Savital=
a
> <saratcha@xilinx.com>
> Subject: Re: [RFC PATCH 4/5] crypto: Adds user space interface for
> ALG_SET_KEY_TYPE
>=20
> Am Mittwoch, 8. Mai 2019, 11:31:08 CEST schrieb Kalyani Akula:
>=20
> Hi Kalyani,
>=20
> > Hi Stephan,
> >
> > Keyrings is in-kernel key-management and retention facility. User can
> > use it to manage keys used for applications.
> >
> > Xilinx cryptographic hardware has a mechanism to store keys in its
> > internal hardware and do not have mechanism to read it back due to secu=
rity
> reasons.
> > It stores key internally in different forms like simple key, key
> > encrypted with unique hardware DNA, key encrypted with hardware family
> > key, key stored in eFUSEs/BBRAM etc.
> > Based on security level expected, user can select one of the key for
> > AES operation. Since AES hardware internally has access to these keys,
> > user do not require to provide key to hardware, but need to tell which
> > internal hardware key user application like to use for AES operation.
> >
> > Basic need is to pass information to AES hardware about which internal
> > hardware key to be used for AES operation.
> >
> > I agree that from general use case perspective we are not selecting
> > key type but selecting internal hardware keys provided by user. How
> > about providing option to select custom hardware keys provided by
> > hardware (AES_SEL_HW_KEY)?
>=20
> I am not intimately familiary with the keyring facility. Thus, let us ask=
 the experts
> at the keyring mailing list :-)
>=20
> >
> > Thanks
> > kalyani
> >
> > > -----Original Message-----
> > > From: Stephan Mueller <smueller@chronox.de>
> > > Sent: Thursday, April 25, 2019 12:01 AM
> > > To: Kalyani Akula <kalyania@xilinx.com>
> > > Cc: herbert@gondor.apana.org.au; davem@davemloft.net; linux-
> > > crypto@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: Re: [RFC PATCH 4/5] crypto: Adds user space interface for
> > > ALG_SET_KEY_TYPE
> > >
> > > Am Montag, 22. April 2019, 11:17:55 CEST schrieb Kalyani Akula:
> > >
> > > Hi Kalyani,
> > >
> > > > > Besides, seem to be more a key handling issue. Wouldn't it make
> > > > > sense to rather have such issue solved with key rings than in
> > > > > the kernel crypto API?
> > > >
> > > > [kalyani] Can you please elaborate on this further ?
> > >
> > > The kernel has a keyring support in security/keys which has a user
> > > space interface with keyutils. That interface is commonly used for
> > > any sort of key manipulation.
> > >
> > > Ciao
> > > Stephan
>=20
>=20
>=20
> Ciao
> Stephan
>=20

