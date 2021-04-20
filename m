Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FD8365810
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbhDTLsX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:48:23 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:57829 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232094AbhDTLrm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l8WyrO7ptjoqVa5LGx9xZNYw6pC5eWEnI2PvwnthvUg=;
        b=hRrfCyYTCVewRFxV5RCKnqjc+oCqfu1q5jsSy4viP821q/jYiY9/0uDFUmqu1IQb3x+obc
        Gr/zqO1aZUdVHl4WkvYMpfSMGHyLaUWReNyo8ee+f6193ha2+gOoNrt1MXzKp2NE8sxUof
        uo12/gIbY82BESVmIZ0+izckvjLaDRY=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-5BSPKEX8MG60j6c3iwi83Q-1; Tue, 20 Apr 2021 13:47:08 +0200
X-MC-Unique: 5BSPKEX8MG60j6c3iwi83Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1Eq7V/I9WArnfD0zc9iK09KtOQtQQhRsjg5c/5nbB1i2y/h+O2rHATusxZ+iRKk6gR2QQbXVXAkohRcI7h1HsjdDseIMVhYV2b0Ij80qy8zIpbSuf8MZ/HUcg3w+NIvg1sHrO6IyxdvsEb/znIqyavBnIY1502/IPwsOrJ09F2TPqM2CPNHUnMpgTrMJvO+cSVoyq/9W12b32PxbwEDPoRmCfXJtwdAhT6rLqNGvYYHvyPV46xrqulvDrw8UFlC1UPyPglJYRkYfHO8v1zQzLInUmyeZSN5/PX9ZR9IpGkxbic86ScGJrMNADT2yrw4banCKCYWJmyNoh3l1IYGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBNG1zTCxXyLMe36f9znlMWEDeDi6roTGj5H9Von5AY=;
 b=VWS/DrtLCyb4UqIhQn1YX+PaDHF50DWnReMoQjWjCafwo0LusVxlXZir6ZT2I4g9K4L+5IgpY7ZXfZ+nOSEjF+BEvsWCHgmd6/F+0n0t48VAJEkndz/FYfmZG6wK9Z9coA3oZqKu70S1CYw3O1okrvb7LTtRDus6LvKhK28PPv/WbJiGdQx8MEvnBtPULWjLVAN7lRhxUTQ7go06qsBkMHbvRVKyrY051DuRAdPb9qG1Fh32ahLgYQ2GaHeWoTjvNmMsuDp+NC9YYJIXoX+VUQlYnIINTISoaLtM38IMNKMVoPLKCZM4yz75WDTNMD/xU5AN8gcEw001M2un57OTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:47:07 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:47:07 +0000
To:     David Howells <dhowells@redhat.com>
CC:     linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
References: <20210408141516.11369-1-varad.gautam@suse.com>
 <13252.1617894484@warthog.procyon.org.uk>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH v2 00/18] Implement RSASSA-PSS signature verification
Message-ID: <bb9e7bb2-7e93-b0cf-5e4e-29e726d3da1f@suse.com>
Date:   Tue, 20 Apr 2021 13:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <13252.1617894484@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: AM0PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:208:55::25) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.179] (95.90.93.216) by AM0PR04CA0120.eurprd04.prod.outlook.com (2603:10a6:208:55::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Tue, 20 Apr 2021 11:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5c21058-aa5f-45db-a5fc-08d903f20619
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-Microsoft-Antispam-PRVS: <AM0PR04MB49955199F1704A856232C110E0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJHaftNklxXHt9oWklGMVA0kATTrD++c0ZCsNc70MIQuyX0Uxs1r9W0RNhXh+CEH9ArbxgxZ1ciNjOALRJvO+3dNTRGmSfwCevlaywgAwpzPTAz/USmJRiS2fS7DMHnjiy/Gjhh8aUkgdKKdlWawwWZ4ogRN2A+tmC+y+5csKxSFR/hGsciTAw0CNB4vspUOjcT32DcjustSNRMvCsoOkRQdtzEHJA5+eLfar3X7VAVTnEdlPfMJELXJe/03oGOUIIV57MO+XLnYJl1J6ygrt6O1EVRPu9acjXckpaS1rsI2veb4vTbjRFJi8qICVl0vxymOCmpyKDtDfForeOyXLcdy2qROU16Jfcs7gXR4QOdqFUpLV914SuDCbF/0jRAqPG1JwJHUEuesX2sZM+nZA69op5E1Z+p8hleGjkGCzWivMfuoO4Hmm+S59MNWZ6d5TfDbB/3kLxUJoxrYfidefL1hUOBm66L3x9qgdrtkkrYaPjrykk68S/+w4Q9Rwr9EuCFMXqpzu8bMIiMggdQNBOfOnlYYQYFmwI2tQzwXIPLExq+8IUmADxjX7OYXEPYqb/qpnbFR+skjr0jdtR6yPj6NX8xy0esxx8SoCbJEtIL03Cbnl+nwjEUXYI2fM6/eIrXtwB6hsTmolQ6oOT1gawy07lGey4Y0Bn2QSGX78C2WeQ62JrJGLR5CODExngeFvg3aKujlEtoLoxyCRlvmJ2xxKE9tEXtzO0yaL+dUqCjKc8PTtzs7UJLaMTBD4vUZvMSuOT1qHe5Iu9ujRUnyyO3nMJI5naTTYA/KcbnW/gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(16576012)(8936002)(31686004)(6486002)(52116002)(26005)(956004)(53546011)(8676002)(16526019)(2616005)(6916009)(478600001)(44832011)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(966005)(36756003)(31696002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q3xJ/WP8TlVdzT2dLR68W4mTIOasjVVA+HJvPFNl2VMlCC0yzKYAgEGMQigw?=
 =?us-ascii?Q?cSHBHdulUmVVYuG7yDIML5bRZfhAINQr/5agAAn2+3IJUPWT+/xtVGXKqdDb?=
 =?us-ascii?Q?DNn476JW/CyTcx3y2tyT7wSsa3wCrfR8Sd/tPi4dI9DS7r5Fr31P8MAxkOT4?=
 =?us-ascii?Q?K+XoQwEnPH3Z+UDNDFDdyhHodXUgRPy44zUqh2trOFabmj0GiASK9w5e+n1d?=
 =?us-ascii?Q?rtcW1Do3hLqXOPy8Zfw2K4ZDtr7+hf5/LbZxpJ1aM78nEoMh3feAQJdYFm0F?=
 =?us-ascii?Q?C/mMW1NeCQG+LcJBw6X8mcUIpnoZcJPt45HEaUoGCr4UxDRoZZIqALE29W+S?=
 =?us-ascii?Q?6idWaebTi+ihNDWl1sDu++GHYXmZ12L4Qb9H58bqtmbBrlC4m+qJZMfRmC3j?=
 =?us-ascii?Q?BFFezxu1cOyWV56ISoNa57weVmNrQ8bMtIUJn9JkjBqaUGuutEYMA3V4dbMN?=
 =?us-ascii?Q?5fMVvexdOIch8osMurQa2MFFfHquDn5QOm8pIuQP8YPryoV2lJUl2bb6DPa6?=
 =?us-ascii?Q?TIOTZFJaol2h1000MAp1pQv+0PYdhiUj6IAbDYCP1yZINprok+Hb21pPyD1w?=
 =?us-ascii?Q?Zuwr4xINhIrc5nJAs2kenT1iFMivHrJPJ3vQ1XcZ/7u2zQGanTpIh1MMhFVE?=
 =?us-ascii?Q?nDY6mqmoGXftAVqKGIniLrumu2dUsA1fpDKcn+w8b7YhOk0uVP411psso6R6?=
 =?us-ascii?Q?2g3V2UvSURr0F405R6TQ6dwzYcrgS2+KQrGz/5jWgL8+7XbsVT6wQkjll+E3?=
 =?us-ascii?Q?yDdb6XYnhaqZWval3rqvifcCv2p3gklGLESDm9kHQ0TSpyfQT0eDcx+cluJ3?=
 =?us-ascii?Q?KmH5dkIukS0eLc6b2Uj6SuQS03wAofsaqfdIh3A7RXS8nmnFWHCsSFHQPT2c?=
 =?us-ascii?Q?rx+w95pPzrQw58crXtiW7vpQ07X+ciuOpvTKzpozPOoEebIek325a6Y1WQ0Y?=
 =?us-ascii?Q?Kr0XGQQ7ynW9gZCgJNFtBDZClTL6Ttztv2p8BtnaqgkwUuQYbfdcNOoahb8D?=
 =?us-ascii?Q?wgXuAhUe0+VVMVJFynABdUHJMFgionAejldNeJlb7qvHi0a2E08he154ujfy?=
 =?us-ascii?Q?jFHTLN1UWesGFHiFc04UU3Q30jPJct4ZGyqKM1jmwP0Ws4br23BHGD6xae4I?=
 =?us-ascii?Q?iicZ2PMIERcVYMr4lX6Waxxpo4divBY46TKtIxCfy1GjdIV6l2dm2htk4TFV?=
 =?us-ascii?Q?NGN0KMYa4Dwshaf8a52DYSI7FliG7P1tZ47oCzr/svNzITDoe7eXuSSQubp7?=
 =?us-ascii?Q?KUKgX7UtTIQljA4on0hP+COZkoLuI7RreWgegEc0VLunZFBVLhTIkxL4LGfR?=
 =?us-ascii?Q?rACQQNLUJOt6DYex7jfT0JRO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c21058-aa5f-45db-a5fc-08d903f20619
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:47:06.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usoQ2YxK0YxziwNq5iB1UsZGstWvKzKfejn5hGByzP9NNSirJPwCxZodoza7V2k6jnx4y4/G93Dwvngjq15+Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi David,

On 4/8/21 5:08 PM, David Howells wrote:
> Varad Gautam <varad.gautam@suse.com> wrote:
>=20
>> The test harness is available at [5].
>=20
> Can you add this to the keyutils testsuite?
>=20

These are two separate things IMO - the keyutils tests test
for "the keyctl interface behaves as advertised". Testing the underlying
algorithms used for key operations (against reference vectors eg. NIST /
Wycheproof atm) is independent of the keyctl interface, and can also
happen at a layer below (eg. a kmod). I doubt keyutils is the best place
to keep this.

Regards,
Varad

> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git
>=20
> David
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

