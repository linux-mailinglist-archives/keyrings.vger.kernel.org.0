Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E8B59BD08
	for <lists+keyrings@lfdr.de>; Mon, 22 Aug 2022 11:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiHVJlV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Aug 2022 05:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbiHVJlU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Aug 2022 05:41:20 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07hn2203.outbound.protection.outlook.com [52.100.160.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4490531352
        for <keyrings@vger.kernel.org>; Mon, 22 Aug 2022 02:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeQ2UOCMBptz2j0mep1PNpeG3/SoamiO38lXcRhwYeQq8lpOWsPaD8H9FDP+QGVqPAAschwQC+7VLmovwbrmvWKx+qPpHutG4O/rzsCeRNE837glukFk7WkDMW35eULCx48oPfflodyvzVS9SlMl9nvkaSX1BuGBMdEUKPy7mrBex1uvFJEjBjbfRhzA7behcXYqOasHu+TJKUQ3SJfmTguvDWY2oLsfZmcwCF1pBLnLzlFp2B3Ie/7xqdjNSlAMSfsEXmIRdsYQhhwDpbd9AfkCieSsQf45P2CSqY0yQViikcOptgq2Aah2QUN67r0iZE8rRMQ5uhWduhVp6o4tQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q/yjd9/8xibPdsZdFhZX7kiMHx2MklYSU1hL2gHHq0=;
 b=OqHxseMTHPOS5IFmZYFjzgsM9RRhbnmSRYs3O61VzKRWR2muX6XVS976Y99x2HB3IB6Ic4vafL38PW3M7bqUazW/9WQkIAwNzijMvx1721WjO1WmBDag1hAiCMv/mFM0zKEUc64AKZWY/hiZlgfh8wQ4uWF8eRXjDPAuzQMi/GV1q6/GpNGxbVoYhnmkGt6H/TlwbMSndjnWlNkklmpx3yN6HBmmQgSP1GD4qSyKP6ozdlsWGogK4n+pcQ38lB+WIm1ZZoVganCd9rNpQ5qJ1LaWi+pK1mce7xK5TdJtrUVtM1pSoTJxkH13BlZQm6dqE6UrOBoKeOpOjs7IpnIfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.136.252.175) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=stryker.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=stryker.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Q/yjd9/8xibPdsZdFhZX7kiMHx2MklYSU1hL2gHHq0=;
 b=Af/rKtGS5d8BUn832/rJ354myUzm8HINzKzmiCx0Z4dz/xeSqxn3vjPv5I9BPIJQm+rxtd0MDyQxBDLYRJzRIIbX1G7zkytOXBVqt3j2YeJrMCmwR2+8icLpkI4cAv1gmTX8rMp2ZnYwXbuROdiEHbsbt6IzHccShdO/YqoTg0Mp3ncRof8KQDmqbvlc9oHRtkBK9bBMF7m+7Gy/KWXnt+Vk6LASxoV/Tglq/W7RxEW+Z+uxIdP3HQXlzu82/DnfToaUSB7/Fz4TJ+JnFFP1vF3HNv8cJHEU/bw/wqfIKIjTWqfS+Sr1giRxTcwUGSg/sFPRoSubDYID5uEmZcs7XQ==
Received: from DS7PR06CA0038.namprd06.prod.outlook.com (2603:10b6:8:54::19) by
 SN6PR01MB3757.prod.exchangelabs.com (2603:10b6:805:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Mon, 22 Aug 2022 09:41:09 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::67) by DS7PR06CA0038.outlook.office365.com
 (2603:10b6:8:54::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Mon, 22 Aug 2022 09:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.136.252.175)
 smtp.mailfrom=stryker.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=stryker.com;
Received-SPF: Pass (protection.outlook.com: domain of stryker.com designates
 64.136.252.175 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.136.252.175; helo=kzoex10a.strykercorp.com; pr=C
Received: from kzoex10a.strykercorp.com (64.136.252.175) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 09:41:08 +0000
Received: from bldsmtp02.strykercorp.com (10.50.110.115) by
 kzoex10a.strykercorp.com (10.60.0.53) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Aug 2022 15:11:03 +0530
Received: from bldwoapp11 ([192.168.131.10]) by bldsmtp02.strykercorp.com with
 Microsoft SMTPSVC(8.5.9600.16384);      Mon, 22 Aug 2022 03:40:59 -0600
MIME-Version: 1.0
From:   <noreply@stryker.com>
To:     <wos@stryker.com>
CC:     <keyrings@vger.kernel.org>
Date:   Mon, 22 Aug 2022 17:40:59 +0800
Subject: Daily News: Nicht genug Geld fur irgendetwas? Es gibt einen Ausgang
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-ID: <BLDSMTP02NF44VEm0Gc00056c73@bldsmtp02.strykercorp.com>
X-OriginalArrivalTime: 22 Aug 2022 09:40:59.0730 (UTC) FILETIME=[4940AB20:01D8B60B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d479026a-9e7a-4ebc-05c0-08da84227129
X-MS-TrafficTypeDiagnostic: SN6PR01MB3757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:64.136.252.175;CTRY:US;LANG:de;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:kzoex10a.strykercorp.com;PTR:ip175-252-136-64.static.ctstelecom.net;CAT:OSPM;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(36840700001)(40470700004)(46966006)(34020700004)(36860700001)(86362001)(81166007)(356005)(40460700003)(82740400003)(316002)(6636002)(8936002)(2876002)(2906002)(6862004)(5660300002)(70586007)(70206006)(8676002)(4326008)(82310400005)(47076005)(186003)(336012)(478600001)(40480700001)(966005)(26005)(9686003)(41300700001)(558084003);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iyxPWgXNm2ID/gCHdWObgt8KzfrpKXE970QF9knliNxIoBwlAXQtBbDjibYj?=
 =?us-ascii?Q?C8vrJrpQ2AT9WnNPaGZInG+n/+HhRsAmeUOx1QBOQj/Wy/mkDn7Br9aIDwcO?=
 =?us-ascii?Q?Mt5QRu032GdlXq15L1rzJPh6C2na/+onK3c5N/YtOTOADNcNW2HWZ0ByV9vP?=
 =?us-ascii?Q?uLwJsh/RZVv0U484G70nC9sSuOu27NlEVAl0afGXT5nc9QdIAb6z8ViK22m0?=
 =?us-ascii?Q?mkObTHUzq2Saxv2m86zKX3hsJsrvFOJFjiyTf+dkTKcQRroVGEskpnrDdVkj?=
 =?us-ascii?Q?bDtdh8EPL+9wTdlg0PKbGGfOgwSwerHyYcCGdMXnKWGqOobbRPFXtlp27lMN?=
 =?us-ascii?Q?BrNcTAknVePIl0uCTw6d5Uwsx2BXCdv3AIc7saEMcTq4+au5+97Xd7h8SSNZ?=
 =?us-ascii?Q?qQb8/WakNjAwTIOZHliDSeD09Enx5BqWYkWkfGLePGxaXJR1L7vCC8cw6kFD?=
 =?us-ascii?Q?GuaSSiD8Ra1LtRIfn2g6IISz3kz2Ejw3sj8xjDZn7TREGDilgjJYKfW551+4?=
 =?us-ascii?Q?CkuNF+SXjmjWMLNQs+Jh49v2ctVqjYekqUGXZ0g0c0ltHb495nZg23s/R8v+?=
 =?us-ascii?Q?U3gV7fiutn4dcd5oVTYZkhGCvWiNIQFXOhklMqSlDWBkofDcdu6zhAeYzlxn?=
 =?us-ascii?Q?MVAbf5qlJrBPYXAGIDSnX/usk9l+BbshZfV/yzD1E3Eh/uY3ZQF/OqUiv+Tn?=
 =?us-ascii?Q?fsReq4QbevBAfqsmb+TwQuiattJoypZ1u3ILK/Cf8a9zYBcEvETvR8v7YDQ7?=
 =?us-ascii?Q?Ea5YJFvSwXzJlb5FbbRhKTYiFkZA5bLwR+7mpkfwu4fg9WHDPhTpUiFh3uAG?=
 =?us-ascii?Q?FIfb3niu+mkOAsrPsb6y/UPV16HrijGOBzGjbBbLX4Q9NcDVIDPWOTeXfGjS?=
 =?us-ascii?Q?XWXLOCH9M+QyiJiVODU6uLv1fUa+Zo8smBGI1OnXdgnrkqmWriOfJBJHle8P?=
 =?us-ascii?Q?XBnmz68NlFpqVkUyLGOS6pIm4xFbunxksGWrMf6LPUITTEObAc5Yz82evJKq?=
 =?us-ascii?Q?PpOFgmPJFRQLAuIdzOBpnjJnxIKHZWXK3ATqnUQMs70WQsGXUAhUlYc1Iif0?=
 =?us-ascii?Q?010j+gMFgs167v0fYPMX/8fdON2eFxZSAskxalGyX+u+PWclOhaMJ9GWVjBm?=
 =?us-ascii?Q?tsEuuTsKWvpoeKnz34v9qSeFyYcFyBaKz07TZRlJ7UWNiFvNzQfKLAn9g3zN?=
 =?us-ascii?Q?u6+JJRxNrl014VtM3JvfWfcUD6xpU/zJEQ1I70ksv7X6BDz/nHNrsBLXPZkb?=
 =?us-ascii?Q?XLNfg49/DIGwuvM2D1SFPiSuD+U5i2OtpN2ekXpitHZp0tV5ZNE8YjZZi+iB?=
 =?us-ascii?Q?o/dfVceslu8AIOHs6RDNNlMWSNPFyJpxBDxz5l6qXu5tUwkAUW8jgFGMMNPv?=
 =?us-ascii?Q?XeEaq86Rq9M2XfR/FybjfBtATsNxSqdmD15QaI9q7VpsT45vCg=3D=3D?=
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:41:08.7052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d479026a-9e7a-4ebc-05c0-08da84227129
X-MS-Exchange-CrossTenant-Id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4e9dbbfb-394a-4583-8810-53f81f819e3b;Ip=[64.136.252.175];Helo=[kzoex10a.strykercorp.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3757
X-Spam-Status: No, score=2.9 required=5.0 tests=AXB_X_FF_SEZ_S,BAYES_20,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_PH_SURBL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Mude von Arbeit und Schulden? Raus aus dieser Scheie? http://ukraine-news.k=
enlynch.com/SD-6100

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>
