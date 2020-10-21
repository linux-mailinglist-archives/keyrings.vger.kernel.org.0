Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339B0294B1B
	for <lists+keyrings@lfdr.de>; Wed, 21 Oct 2020 12:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409607AbgJUKLP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 21 Oct 2020 06:11:15 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:29003 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405591AbgJUKLP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 21 Oct 2020 06:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1603275071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=89Yg6vbTn6BKVOpzF3QEaawYsgB85ymoJlzefQdDbKU=;
        b=h12qQY397Ik1K3FAyfLvDPWbtYbj9WbR7KGEBy/gFzcj7MnKX+Sxv2JfpQTt7rGh3Tf+Nj
        3bAL36dBkRfQxXnGuuKPRdRm2PmeGwFzXRzWwLUH+kIGEhd5THptoiLPdgomRA8/53Etr4
        A2V4HBldB425se9m1yj+tz+sLH4S83I=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-Okk6C-cOOFCGXM_rI6Qm3Q-1; Wed, 21 Oct 2020 12:11:09 +0200
X-MC-Unique: Okk6C-cOOFCGXM_rI6Qm3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSs/nJ27RS0JitC60Ipi2Ll3zaiUIgqyOd/9nXOHP4XMrJ+s6nwRGq13Wqp5BJe5NxduxDvZUYKyvUj5nTeWHDnoZa4t1subz+GF0RjksM/tQkau4CFUFNibBaCXBaOnIJZLaSPRmS14uaIIWv2WqI8NY59lIj+2iF9Y5/wJ+q5USSh2A6tjoFPlm2AWjmGgowF7BlvbMOtWH7/rqH34IiUWirji6lXqZZPCxoXAkIjSFUJ/I3hLJ3oMnV8BIlHwifAwaVHSCWNs90y1LNUa93dIfrgBbofu15tE7SHteEr9opFKzvZ3MkTSMT+9gaJiA7kgV0h1tdUdNzgFGBwGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89Yg6vbTn6BKVOpzF3QEaawYsgB85ymoJlzefQdDbKU=;
 b=MUlsMgwYaRqyZEmUjGMp73ldc47hFKsHsKCqjngf2IKvau78/oRvYk+Oc1+7Na83oZPX9iJjDFyvCXProRaAcvxsXZWrhpgqFVLQbt9dofWOZhP2oR2okvRHUXcZFKFUsOMA9ZOmR8GDpYvL41Vk9e7uOkIiZb+s8KdChun0G034w/xMa8XYWsWzx4Im+52SUq7YqeSnFCLbYiKofEkIP7fqHNVGqEtLcXLhs0NkhNGmgOTmwbwYelltHzjwTXkkT6vhEUOK8BwJ9OdWoa1JcGC701gRmjUYRwEnKsmhnNe1/V7KyhWz1hnoqdAt0+pfg7kBnhtRyxX2yg043jhOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: me.benboeckel.net; dkim=none (message not signed)
 header.d=none;me.benboeckel.net; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR04MB4303.eurprd04.prod.outlook.com (2603:10a6:803:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 10:11:07 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::4850:c5a:699b:e466]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::4850:c5a:699b:e466%9]) with mapi id 15.20.3499.018; Wed, 21 Oct 2020
 10:11:07 +0000
Date:   Wed, 21 Oct 2020 18:10:57 +0800
From:   joeyli <jlee@suse.com>
To:     list.lkml.keyrings@me.benboeckel.net
Cc:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] PKCS#7: Check codeSigning EKU for kernel module
 and kexec pe verification
Message-ID: <20201021101057.GA13854@linux-l9pv.suse>
References: <20201020065001.13836-1-jlee@suse.com>
 <20201020065001.13836-3-jlee@suse.com>
 <20201020134208.GA297878@erythro.dev.benboeckel.internal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020134208.GA297878@erythro.dev.benboeckel.internal>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 21 Oct 2020 10:11:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 852619d2-99af-45a6-fe62-08d875a9a074
X-MS-TrafficTypeDiagnostic: VI1PR04MB4303:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4303AA9F1663C87207DFFDB5A31C0@VI1PR04MB4303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1VgN+iLUWjWUti4xN7ZxhAN6mje/zaxfjI075mCmeGtuDzshfXuUnkwbNHEugqcATYEkWBjfjTcCDvbbqVC8/yweNeStSAwZewI58wYinU/CFHSUT7cBMbu+N6P3HYdX48gyPLOiYuonvS89Po1wiJ9/Tq61nqI8NZlJhlfs3hkItL6SEYUfeSQ90JiOrBJWx+cjBAL2IxJzBB+yiQ6HRJKEA/SHR0UkU8Cn68/RpjO14pFPvx6gyRheYUq66V4nlsEAzJx0M2h6uT4GYw4m6y6bLEZ9zZNHP5bXON/EwHcCaQQjycVioUsbZOgwHiVMDOEic8iI61uKfo7ZQOZGPRluHdnwJsjuB6RgaiRiGgHl+roVrxdTQ9pyKZhx9iB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(346002)(39860400002)(5660300002)(66946007)(8886007)(15650500001)(66476007)(6666004)(66556008)(1076003)(83380400001)(86362001)(16526019)(8936002)(478600001)(2906002)(6506007)(53546011)(4744005)(9686003)(54906003)(316002)(6916009)(36756003)(4326008)(956004)(7696005)(52116002)(8676002)(186003)(33656002)(26005)(55016002)(43062003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1pBy9MB4hyKQq/9pvf8tD/6WD/Mv/NSIfZxjP2w2Fb8Al6p0QN4NlIailQZrQhD070ANF1Rg/SdLOod/nqjnS7cOmhIRQAawCrMtQbgDO0vsuUVPYmWWcNm5wrwQ2nhGL6Vyc45oQatEgrE4lEYNzVLUlsA20Ue7ABVpJ+ZRs4xbcTuH6kiRmMQcQJAa6GIv3yu4lJIVHHhc6zzeblnYBb1pnrKI0FNjA5Dp0DQadDcWj7VtR2OXqS3skMo3mMytEWwMao1RKaenPiJ+50FiPcN1t3q6IeMZNey1TwFlCirw5PfSxN6/swHq7IURKNmyx3GYjr2QPXOBlGL0OEdccdkbE2D1+ywYKskPllLu1DalG63fmhJRuiR+ejlSH/asut7uPXX46pvgWuuM/kgglR9yyYlt9vLJX3GA3ZxShEJR0gVcU29pU73bAN3JUWzfN39i+hTeF8yOSEOdA7wR09x0XFGiUyGwhqVh+EzPQbNRxPFqJnqgZlS2Lj55/4fTSzU1hB9o6OoZ2l5islDaB7zculmmz8vUEwm5lf/ZmTCnmAEevnHe6AtCc81tZuSYZHpYL7LblUiph/q2L2JZN7pblwsW0wtDEXzevpb8Cb+YjJs0DbhMSd6QV60O4kXFYlmrBJBdUrUmVOlg1XnyXg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852619d2-99af-45a6-fe62-08d875a9a074
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 10:11:07.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twINEqPrG/G9LxcK9DAgJhUyeOgN88isJSpSq7pLkH30DVxGG7pcySDAIpI80DRN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4303
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ben,

On Tue, Oct 20, 2020 at 09:42:08AM -0400, Ben Boeckel wrote:
> On Tue, Oct 20, 2020 at 14:50:01 +0800, Lee, Chun-Yi wrote:
> > +config CHECK_CODESIGN_EKU
> > +	bool "Check codeSigning extended key usage"
> > +	depends on PKCS7_MESSAGE_PARSER=y
> > +	depends on SYSTEM_DATA_VERIFICATION
> > +	help
> > +	  This option provides support for checking the codeSigning extended
> > +	  key usage extension when verifying the signature in PKCS#7. It
> > +	  affects kernel module verification and kexec PE binary verification
> > +	  now.
> 
> Is the "now" necessary? Isn't it implied by the option's existence?

Thanks for your review. I will remove the "now" in next version.

Joey Lee

