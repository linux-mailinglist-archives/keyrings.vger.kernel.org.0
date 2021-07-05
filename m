Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E883BBA60
	for <lists+keyrings@lfdr.de>; Mon,  5 Jul 2021 11:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhGEJl6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Jul 2021 05:41:58 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:23716 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231127AbhGEJlw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Jul 2021 05:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1625477954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TY5EkOc9okoLZd/wY+wEHiildtLYbg/afKDcRCDbWtg=;
        b=AI/0WeQJzm28AqQoncoOcA7CBjJemj1hYt5Xeaq5Ln0HfrR8oP202LOVz9G1AMnguHpuQg
        Ja8bAQfm8BtQrrS1fXg4884VaHfL1pmsKuwa8vbsrgxwCr0hdZgHwf6DXGXo50SaitfCEN
        DNMOnWhirRu6SZyMj9HXtZF3WcmnueE=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-evL8Y2SMPl6Rx_8c2bufvg-1; Mon, 05 Jul 2021 11:39:13 +0200
X-MC-Unique: evL8Y2SMPl6Rx_8c2bufvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYSnJtDEcTMUDBtZ25zwcO7MrYdFm+0VBkIYcfSlawqlVugHt5Fn4CGi6y2lxwKPjHbV++b/YKHyjEK/mF2asClInVT2sHQgFk1fpk6v0cI18l2YQWtyLUSpN7BpaAqJeMtnaPXU9ALKZYxFk4pY2mdYRgraGW5BOJmchfhHurKUR4H5NyGHwbQjI7JtUwLikuvFvJZBRTjl3YDwDkNtEZYcgf8yoyF/XDMBROL5wUzmRpjX4BXwBbuNmrHM8fpuHnLAc4fAn17mdiC1aj4oEvl2sbDlsVGRVvg6A9QzwtMkmVvIeo5FHhC4iQgC25VI1EWlvlAHe+qBoxyTHWbfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lglnIG06rXl/GMh5LxzDacerLqpLD8ueThLbPWDR4UM=;
 b=F6vNyuiLDWGFHnPk5d8/sKNMeTaMikwelVVzpP1GjYU8NymznxACojmqTvliEYy7/ZT612p8jUTvHdXBIXP+2QgoAwRFowqBjoTP46xRo/r4ITucPhXHa6XqUeMd7QR/FsWQQ490lZIBBHsgA1UXYRdMRIRRczVMi3MMPU22uphlOGnVh5pm2owanPbVztszEBYFb+565jkRsJl1EXhDh4HCucBCq4emKam+7W6roR08iZVfQP5iISbYX89e5FLNOGzpFbX/81gQR7W1a1B0f/yADlZsBUiiOQ5kRy6HIGddkG6jfdm9umNtbYWrr9M6X1mMkBHr/c5bh6KaDBHU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3730.eurprd04.prod.outlook.com (2603:10a6:208:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 09:39:12 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::55a8:3faa:c572:5e98]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::55a8:3faa:c572:5e98%7]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:39:12 +0000
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     linux-crypto@vger.kernel.org, dhowells@redhat.com,
        davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
References: <20210420114124.9684-1-varad.gautam@suse.com>
 <20210420114124.9684-14-varad.gautam@suse.com>
 <20210514104535.q4zjtshxroruvoz3@gondor.apana.org.au>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH v3 13/18] crypto: rsa-psspad: Get signature parameters
 from a given signature
Message-ID: <9af846ac-ad96-f59e-d89e-0c75bb75416c@suse.com>
Date:   Mon, 5 Jul 2021 11:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210514104535.q4zjtshxroruvoz3@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.166.153]
X-ClientProxiedBy: AM9P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::14) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.52] (95.90.166.153) by AM9P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Mon, 5 Jul 2021 09:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace4eef7-f159-4a68-047d-08d93f98bea5
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3730:
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3730BFBE4C4F4DC9253211F1E01C9@AM0PR0402MB3730.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WhTkvQ3q+Y2tma8JQw7MZmhiOQzDsuIWtG0n+k+v5VCjUa8g4BgoPVmsgjaLVilISffJN8T+z9tOonHhJsXTpBgNjNTpIjb7eV65aTYx9U8rs/A2ocdDjDB8hSYjESOi6XAwOisltPQBXlX8JsQXA9+2ffqpYL+1kbYV765ek5ES/B1yF5v22Z41BLKlXFDzFVUl6F+Y0s4QiiVln/Nct5ESf2bdX5fHnIpYIM99uNHwWRObNq1+I7bMKiDcKFkyJFG943o72VsY70riUAqRWf/+v86aDd7pJTQCzeveYfkI2xsFkV8JSbBkQTokDaiwNrOVnTggu8OuZNKkvsPDLyysG+MYi0ff20mmLrGFGwkPTT/f6zIPWk2yvFsUmBCOQ5eAKospRqU20Mot4f2TIIi/I89rLAWLMEGCugYm50PSjZlfBDW+yK6xswQSmKnRTwkKGgXw8jAunJ6b6WRpECS08v3Eh5jMlRHRoGM/BJzV0ZWpBg3CPwj/i1pydiTXQFR6bsy8ISSAfIQf4Irrfuw0GoFGJR1E9P6keo5NcR1u9Zyf2IUw0QmW72k9yWqnlOZ/WWxbK3JGcsSbOZRR6qYRnI9VfgR8q89sirUcey3SuAy09OJ97LK0EaZtLoCvJyKMEXJnR7WyRGtc0yf24A1fbhLNxuIMdyK8ZDasWCWTqjMgCNd37VKl+W0dMdIkmTDvct5OwPQct3HXoRLHAmf92TbmyH0TW7jQIyZX5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39860400002)(31686004)(2906002)(44832011)(66476007)(66946007)(38100700002)(186003)(16526019)(36756003)(66556008)(86362001)(5660300002)(83380400001)(8676002)(8936002)(53546011)(16576012)(6916009)(316002)(4326008)(26005)(31696002)(66574015)(478600001)(6486002)(2616005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tBBjqR1AXbYPzkwCN5YkXMNrfXRxW0R1Vej1SSNx7qa8q2m0ylf/48bLqGrO?=
 =?us-ascii?Q?So1bqBVxyPcFDHJ5byhu1tE6CpqvIuBljfJCk6djalhQ+FpOmRbHX1j/wAV8?=
 =?us-ascii?Q?30SZUOw93/D5zIyfCtMgmME7XpEfHGUpsNK1ddiGVGyB9eXHN7zLXmsrJurN?=
 =?us-ascii?Q?16aZNGvQ41EOfYbV1PCOUpHuufAeiSlE1SpD87vdYZqcpXpRjbleCSvl3twl?=
 =?us-ascii?Q?qe0Lpa3fxmXmjVWoVM0B2vKAW9mchp4ZULwhdSP2xFRQWCaGM3jjPoHtj0tJ?=
 =?us-ascii?Q?OJ2lkBHDkn3i7mzKCxdbMl0KIsbbUFRRq8Lh0IsVNDSoTxYRf9ZSasUt8qEz?=
 =?us-ascii?Q?mRkUGWLm7mKUQPL9Tb2HdIMUmQhTcPmsFZpjGubtus7ag2BDC3fudFZ/AVoI?=
 =?us-ascii?Q?rwBnm+aRsuDLE2AWSAeimjJLarW+0Yt9flCV1L4xR2TRkndA6PeG9ajwRV+u?=
 =?us-ascii?Q?BfGQs6MYW4EmvxStgaGePWwc73VrypbFbUFJ1xKFh8K7u+/ftqOb7M0lBZiC?=
 =?us-ascii?Q?e1m0gwSzaTkuUfGYXlxII0vRtZsshR/gx4JVLT+IV1fp2qgB+nv8vvZ/mRNj?=
 =?us-ascii?Q?Watr7mvqMsw0+iu8ZCHPlBGyNv6qIy1kfsRw7o/5hVBNsdhBmVX64mN0uSKj?=
 =?us-ascii?Q?6U50Ii0waXu+A5RrmXWh54NiqyhbahjzZxPh3FXiGOn5o0ABG5BooQgAj4LN?=
 =?us-ascii?Q?9aH/KBUaCtM5HVNYNRF2WXz2b60wY+VoiKeAmI8gSrFY64lpvT4hC8lzTz/N?=
 =?us-ascii?Q?CIZZ9XHM0EkZBBVJjDswzhmO4YtV0qCxNET74zpSwgl34tSI8oPkzQY6MNNv?=
 =?us-ascii?Q?SVXsXVeoRsjO//s2e321esUiZIxDJQALOyepZ6/KKGWwQN8GdnPiq/wDl1q+?=
 =?us-ascii?Q?mlBH6Cj/RdsTlzZxnBSGPXpi7pY7FcuWdkPmCLsk8FW32AZ2RblUiEdomqA5?=
 =?us-ascii?Q?6RzFmltI4dEIt7AXsgQGuPjEKU9rRr8YaovKNSavgjD2xIkwzHnnmLFbjoMJ?=
 =?us-ascii?Q?tWTff7/OMqz3ix9L989QiAV78d0usWd2LGp+OMsmLNszkPVxBDs1qgpUoyeF?=
 =?us-ascii?Q?0iDc9Y1o/FAlJ5PRJVv44yKKGgQ7cVGEY4tkLgtAdTqbi6VzhuxmIHfQmVA0?=
 =?us-ascii?Q?OiYyHZI5YZAOMOK4IFZpiWbxVaiCYHoZp9zCFnxmeKh9zZPsxx/Tu+aFRLjY?=
 =?us-ascii?Q?WSTaxEurbprqxh+s64Nd5cfv3rvaWnU88n9TiLTalgDVrrhFhyqm4iLOt+el?=
 =?us-ascii?Q?pRlRs1imrOUrCWAvhevgRZti0I6ZAVZebTqCJFARAEB6sC4lvihtPfrpm9ic?=
 =?us-ascii?Q?HR0yr+vDPrbsYvgVW0vpaJOt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace4eef7-f159-4a68-047d-08d93f98bea5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:39:11.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VevZiQgIXTs5dhK89M8JcLGvzNfm1XdyccHPSUN2sqRH+NX3Bidht5rcImfUNTvu6i+ZK3lYBIVJpdp65JH8jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3730
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Herbert,

On 5/14/21 12:45 PM, Herbert Xu wrote:
> On Tue, Apr 20, 2021 at 01:41:18PM +0200, Varad Gautam wrote:
>>
>> +static int psspad_set_sig_params(struct crypto_akcipher *tfm,
>> +				 const void *sig,
>> +				 unsigned int siglen)
>> +{
>> +	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
>> +	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
>> +	const struct public_key_signature *s =3D sig;
>> +
>> +	if (!sig)
>> +		return -EINVAL;
>> +
>> +	ictx->salt_len =3D s->salt_length;
>> +	ictx->mgf_hash_algo =3D s->mgf_hash_algo;
>=20
> Is there any reason why this couldn't be embedded into the key
> instead?

Sorry about the delay, do you mean setting these as part of
rsapad_set_pub_key()?=20

The same pubkey can be used to verify both PSS and PKCSv1.5 style signature=
s,
so I don't see the signature params (salt length / mgf hash) being a part
of the pkey state.

Thanks,
Varad

>=20
> Thanks,
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

