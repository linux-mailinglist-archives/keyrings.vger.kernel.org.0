Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB42524631
	for <lists+keyrings@lfdr.de>; Thu, 12 May 2022 08:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350585AbiELGz2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 12 May 2022 02:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350505AbiELGz0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 12 May 2022 02:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2A5B227B57
        for <keyrings@vger.kernel.org>; Wed, 11 May 2022 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652338522;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KIW16efPZTPXF7vXmoAKJ6+LI7vVPqzYCyoW+qf9gM4=;
        b=ZjNEr+S9uMezBanGXquw8oH2+rmygi6bWJ5XnCe7RZCgW+3fPe9E8meLbTDU4UIM8DP0uQ
        t1hZEAjd0YgrUsnsGTSoN46XXSKUwrvV9JutkIAuMpmD8hA2QnFidXNBdOPcSaRckZNAj0
        JUdGWKwsUyTWDFkevejhohgGRXqFtdU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-5jgu1FWjNFe9qQezUFbVSg-1; Thu, 12 May 2022 02:55:21 -0400
X-MC-Unique: 5jgu1FWjNFe9qQezUFbVSg-1
Received: by mail-pl1-f197.google.com with SMTP id i16-20020a170902cf1000b001540b6a09e3so2325524plg.0
        for <keyrings@vger.kernel.org>; Wed, 11 May 2022 23:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KIW16efPZTPXF7vXmoAKJ6+LI7vVPqzYCyoW+qf9gM4=;
        b=xEBdEQJoWVpwB2ehST6D9ce8paDYnyIrGW/qgbuyNL2qgj3pnbvysk8WzRzFYgaEcD
         t1kEx+Iaxtt04amB9JimxNJHHFKqrWFPlnynOoDgfTsbaxoqJ6hFpS3ng9QimYyovfM5
         lILHDa99wOvB+yYl/m1bxIt+7aAiXLMzAJwns/rti7g7jI3DjJRPQJfTtq0CIQwReWci
         9eriVhGtLQRPYQ0ac0wY0ftgVVg0SyBnMHw4bjU5SejruXABHW32UgHUAWWg5whX6SQu
         tS99dX/RgtQkpA0x8LWFi25tAZrfWJN5+e2h1eQnNtClIqXTdz3SKnOZA6aio7AUZdpE
         TUcA==
X-Gm-Message-State: AOAM532Dg2LK1iORxN75uET0hxuu1RNarPtIvcwpzT3t/POX4c2GfqY5
        voWy2f+w7B6AzCAHIwLhh8diqvP5fyfDtTdGD42peypzd54bBiGVy+zG/rc/sBgu50CipIrqy4U
        h6K7Iyjt9J02pPURLGgE=
X-Received: by 2002:a63:80c6:0:b0:3c2:88f0:9035 with SMTP id j189-20020a6380c6000000b003c288f09035mr24278688pgd.606.1652338520732;
        Wed, 11 May 2022 23:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkdTJ7sQGjP+3Rj3u8vSGTO9HWGPdcwyACt6Ww8UmyQOmDfjVrRB+T+y5XgfYVWwoXO1Gqrg==
X-Received: by 2002:a63:80c6:0:b0:3c2:88f0:9035 with SMTP id j189-20020a6380c6000000b003c288f09035mr24278669pgd.606.1652338520467;
        Wed, 11 May 2022 23:55:20 -0700 (PDT)
Received: from localhost ([240e:3a1:2e9:efa0:e73c:e550:ac9e:58fd])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d34c00b0015e8d4eb296sm3022491plk.224.2022.05.11.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 23:55:20 -0700 (PDT)
Date:   Thu, 12 May 2022 14:54:09 +0800
From:   Coiby Xu <coxu@redhat.com>
To:     Baoquan He <bhe@redhat.com>
Cc:     kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Dave Young <dyoung@redhat.com>, Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Mimi Zohar <zohar@linux.ibm.com>, Chun-Yi Lee <jlee@suse.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/4] kexec, KEYS: make the code in
 bzImage64_verify_sig generic
Message-ID: <20220512065409.xxegsttgwfh63fsv@Rk>
References: <20220512023402.9913-1-coxu@redhat.com>
 <20220512023402.9913-3-coxu@redhat.com>
 <Ynx1DUvDTL1R4Pj5@MiWiFi-R3L-srv>
 <YnyEafqEcSh/wRRN@MiWiFi-R3L-srv>
 <20220512043310.v3e22423ybe4z65e@Rk>
 <Ynynwe7Q0+0DSABQ@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Ynynwe7Q0+0DSABQ@MiWiFi-R3L-srv>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 12, 2022 at 02:22:57PM +0800, Baoquan He wrote:
>On 05/12/22 at 12:33pm, Coiby Xu wrote:
[...]
>> > Just to make clear , is this patch fixing an issue, or it's just an
>> > preparation for later patch's use?
>> >
>> > Or I should ask in another way, any problem is solved with this patch?
>>
>> At least it doesn't fix an issue that satisfy the criteria listed in
>> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>
>Then it should not be CC-ed to stable.

OK, I'll drop "CC:" in next version.

>
>>
>> >
>> >
>> > > > Reviewed-by: Michal Suchanek <msuchanek@suse.de>
>> > > > Signed-off-by: Coiby Xu <coxu@redhat.com>
>> > > > ---
>> > >
>> > > You can put the note here, it won't be added to commit log when merged.
>> > > Maybe it can be removed when merged.
>>
>> Thanks for the suggestion! Shall I send a version to fix this problem or
>> can I just bother the maintainer to remove it?
>
>Better send a clean one, it will save maintainer's time, they can pick
>it directly.

Thanks for the confirmation! I'll simply delete them because,
1. these notes don't make sense anymore if I don't CC the patches to the stable
    tree 
2. I've explained in the cover letter the first two patches
    are the prerequisite patches for the 3rd patch.

-- 
Best regards,
Coiby

