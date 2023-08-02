Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDB476C366
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 05:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjHBDO0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 1 Aug 2023 23:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjHBDOZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 1 Aug 2023 23:14:25 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54554FB
        for <keyrings@vger.kernel.org>; Tue,  1 Aug 2023 20:14:23 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFxrG3LHGzrS4S;
        Wed,  2 Aug 2023 11:13:18 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 11:14:20 +0800
Message-ID: <1850df55-dfd6-fab2-2e7c-859fec5e5d32@huawei.com>
Date:   Wed, 2 Aug 2023 11:14:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] key: Make key_sysctls static
To:     Ben Boeckel <me@benboeckel.net>
CC:     <dhowells@redhat.com>, <jarkko@kernel.org>,
        <keyrings@vger.kernel.org>
References: <20230802021542.13473-1-guozihua@huawei.com>
 <ZMnBCW7vlvvic/N7@farprobe>
Content-Language: en-US
From:   "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <ZMnBCW7vlvvic/N7@farprobe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ben,

On 2023/8/2 10:35, Ben Boeckel wrote:
> On Wed, Aug 02, 2023 at 10:15:42 +0800, GUO Zihua wrote:
>> key_sysctls is not used outside the file. Make it static
>>
>> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> 
> Previously submitted:
> 
>     https://lore.kernel.org/keyrings/20230611113210.182652-1-trix@redhat.com/T/#u
> 
> --Ben
Thanks for the info!

-- 
Best
GUO Zihua

