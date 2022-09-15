Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E3A5BA1EE
	for <lists+keyrings@lfdr.de>; Thu, 15 Sep 2022 22:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiIOUmq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 15 Sep 2022 16:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIOUmp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 15 Sep 2022 16:42:45 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01hn2218.outbound.protection.outlook.com [52.100.223.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9A7901BE
        for <keyrings@vger.kernel.org>; Thu, 15 Sep 2022 13:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOxypgdSpCAGkF6D8zg8x4wYTtQ9B0HZkqAgVXPTMXiRTD3I0l6thBExjWVVz8/uvQz2yY5V94EKiL7sDVE7/S3pvR5fp/h/O8LqDEEeFm1duI0bZyBSg5kdUkUMv00aMr+nZ8IlInjfx4Wa9NwFvSgBLgdxr+cgUHxw2Jw/Fn8eBYFfEwUPiIEXFS09wLpEto/cQyAoFrw4j4xPvItfJDVPwjm//DTpaMBZnEYF3G2fVS1M09ZfguOmuWzwkCZvCRdE7lm/U55dKWC4PLbjypZx5Fbg1T/Va7kM+/EeaS3AOwRpUA/nu4fF8lbWBco4DJjBPenjQRab3THUajnbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs10Md+15nMnyayKLyd22Uv+/ZH79IcFcpzuzGLq1Fg=;
 b=fK1BZl66P3Y2pnJQqjhM/JEyMQ2YsUcbpM9e7f3I/aV+JjWObgirsaQLowYB9Bl2OKYADfr2EqA5W0zQ9Mg6XbhED4XrAE9FKJS8/dEhsGuWB9//cjYWZ4e16THu77jWgltC8sycC7WjNOeoqyaEG6fZq7H9wp4ow0jUGQVf0QpMDFLhQFKBOtfYpWwdO4hdg3qe0sGaQ2G8pQEhXkKYuxM67HGcdQV+JyZe/lce5i5WeB1SlbYz2k8X2rz52ivJhXL2rkE6h7fluUyII/JTp2RfF2m1XDGgAY0prbV0iBbtkDsXGLPLSLNJHFynw1yUk9kZ2wXJJ0A7mjVmXQ5gSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.181.163.1) smtp.rcpttodomain=1x-100x56.png smtp.mailfrom=t4.cims.jp;
 dmarc=bestguesspass action=none header.from=t4.cims.jp; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR03CA0086.apcprd03.prod.outlook.com (2603:1096:4:7c::14) by
 PUZPR04MB6841.apcprd04.prod.outlook.com (2603:1096:301:11b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Thu, 15 Sep 2022 20:42:41 +0000
Received: from SG2APC01FT0045.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:7c:cafe::c1) by SG2PR03CA0086.outlook.office365.com
 (2603:1096:4:7c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.7 via Frontend
 Transport; Thu, 15 Sep 2022 20:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.181.163.1)
 smtp.mailfrom=t4.cims.jp; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=t4.cims.jp;
Received-SPF: Pass (protection.outlook.com: domain of t4.cims.jp designates
 195.181.163.1 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.181.163.1; helo=User; pr=M
Received: from mail.prasarana.com.my (58.26.8.158) by
 SG2APC01FT0045.mail.protection.outlook.com (10.13.36.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 20:42:41 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-01.prasarana.com.my (10.128.66.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 16 Sep 2022 04:42:22 +0800
Received: from User (195.181.163.1) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Fri, 16 Sep 2022 04:41:48 +0800
Reply-To: <rhashimi202222@kakao.com>
From:   Consultant Swift Capital Loans Ltd <info@t4.cims.jp>
Subject: I hope you are doing well, and business is great!
Date:   Fri, 16 Sep 2022 04:42:33 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <25ebab22-cb5c-4759-8202-cb3c4626fd9f@MRL-EXH-02.prasarana.com.my>
To:     Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[195.181.163.1];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[195.181.163.1];domain=User
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0045:EE_|PUZPR04MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a364446-0165-4ce2-cf0c-08da975ad5e0
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?zMZh4dgVb9pJ9ZPQQ1UOjnHKFLw16EpYD2Qq4chnyQ+oRbm2JdPHpi8h?=
 =?windows-1251?Q?JbdeyqQZElshjbU7mm1rWEHAWMvudiFpY4DSTYecoW4PN1MkUFopiXAb?=
 =?windows-1251?Q?P941OlIPvM0jX7PsbLicCGvTsWiwfqj3tYx/kumvUHzaSuGvmUoipB3J?=
 =?windows-1251?Q?Wp6bC0OebFvaanaMTy7BL3yOnVc8wQftCMp9OdFCBu5CqCCJTEk/sdOr?=
 =?windows-1251?Q?a18JfHOOM3M8GlRWfQkPgfLkchE875kCETtAbI8xY+vHpucZg0Xd6lV6?=
 =?windows-1251?Q?Li1AwXmxLRfoeN4KlJkR56gMqWdBuNjHjlkbEnLsmo9DcLNlR8zrTKk5?=
 =?windows-1251?Q?wQokQfO+47Y3NmdC7//hORRB4UAmI0d9SUSXvzV6mnI/164cUKpdVMcV?=
 =?windows-1251?Q?y2uC1EErhdWEXFU3OW/4OyQPTep9IgZINXMvrZXr9W0W8bmAm4OQ0nP9?=
 =?windows-1251?Q?Di5dyteY6DEXwCDujhJIj4ccs9v9ruR1C3RcA418LJ1RyN8kXvnRZFJ5?=
 =?windows-1251?Q?NJk7g3zhAZBJIm5FDSfELqS+VIlDcuEKxXjIlPayyGzzkkW6fWDRyuWX?=
 =?windows-1251?Q?Baeitx/P9tiuVzfDFF+tBs3fMLaNhs65nsMhYlQmhUtkG5dKCDFDtLTG?=
 =?windows-1251?Q?CQiAYwWmX3mXGLfkeXA1DZ4WAMebiNfV8GmLX4254kyQVb7dZtVnPOjD?=
 =?windows-1251?Q?no8dO9jIDFQsCn6Ew/rk1fEkYSb58p8CkYPHaRV+DIWaqCTrRtWkE0Ct?=
 =?windows-1251?Q?T1hFoWuAELGKF553dmpsid/6RsmqacwEgHRQhRYUr3nWW8JwjSOgr2Qq?=
 =?windows-1251?Q?Cnliybwgmb7vzrktKdfSK1UExobHJKyu14DM/uJr2Mm+4BmKCsxNzSgR?=
 =?windows-1251?Q?HgvsmWiRyLOlDY/dKbAizNvSBgXmWOtyZUrss75vJJIrlihgEZHP18RH?=
 =?windows-1251?Q?9a8ejGHTQRKYz7UT4omq0aF3tuk+Q7VYDAMYi0Tz+xY3pF5AQNKOT0By?=
 =?windows-1251?Q?7qt+Vla75K8i+S3fb3oFga14IcOZA72cKhdGT0ExhNhaKCN8ck7opTOm?=
 =?windows-1251?Q?ijQ9Aqvz7xzjAaiqePK/g/8Kw5JSln7txKhG7/srTsIFvXeBwtD4itJx?=
 =?windows-1251?Q?uhwL07ibBKf2Uj3OVFDYPtxNMgPz/R7Y4Qk93p175V1dz+sB7gq+sh7c?=
 =?windows-1251?Q?4PXgBssVGZjzxr665C4XgaAdgwUEwo30smNWUSf9DtNuhF/0V/bglKHf?=
 =?windows-1251?Q?ES0eKYs8uzxAIwKios2Ba5WnMBPelQekJgrWqVc6fIxDY+hwAm4Ui2sU?=
 =?windows-1251?Q?goOlSFRvHEOUUD2UYectbrSJfLOLC3mpINkXIRT1OAvX8/TJ?=
X-Forefront-Antispam-Report: CIP:58.26.8.158;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:User;PTR:datapacket.com;CAT:OSPM;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(40470700004)(336012)(8936002)(70586007)(81166007)(32650700002)(316002)(82740400003)(70206006)(4744005)(7406005)(498600001)(36906005)(86362001)(32850700003)(35950700001)(2906002)(31696002)(5660300002)(26005)(956004)(6666004)(31686004)(40460700003)(82310400005)(41300700001)(40480700001)(8676002)(7416002)(109986005)(7366002)(156005)(9686003)(66899012)(2700400008);DIR:OUT;SFP:1501;
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 20:42:41.6071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a364446-0165-4ce2-cf0c-08da975ad5e0
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0;Ip=[58.26.8.158];Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0045.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6841
X-Spam-Status: Yes, score=6.9 required=5.0 tests=AXB_XMAILER_MIMEOLE_OL_024C2,
        AXB_X_FF_SEZ_S,BAYES_60,FORGED_MUA_OUTLOOK,FSL_CTYPE_WIN1251,
        FSL_NEW_HELO_USER,HEADER_FROM_DIFFERENT_DOMAINS,NSL_RCVD_FROM_USER,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [52.100.223.218 listed in list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6078]
        *  0.0 NSL_RCVD_FROM_USER Received from User
        *  0.0 FSL_CTYPE_WIN1251 Content-Type only seen in 419 spam
        *  3.2 AXB_X_FF_SEZ_S Forefront sez this is spam
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.0 AXB_XMAILER_MIMEOLE_OL_024C2 Yet another X header trait
        *  0.0 FSL_NEW_HELO_USER Spam's using Helo and User
        *  1.9 FORGED_MUA_OUTLOOK Forged mail pretending to be from MS Outlook
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

I hope you are doing well, and business is great!
However, if you need working capital to further grow and expand your business, we may be a perfect fit for you. I am Ms. Kaori Ichikawa Swift Capital Loans Ltd Consultant, Our loans are NOT based on your personal credit, and NO collateral is required.

We are a Direct Lender who can approve your loan today, and fund as Early as Tomorrow.

Once your reply I will send you the official website to complete your application

Waiting for your reply.

Regards
Ms. Kaori Ichikawa
Consultant Swift Capital Loans Ltd
