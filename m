Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5586B9121
	for <lists+keyrings@lfdr.de>; Tue, 14 Mar 2023 12:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbjCNLIS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Mar 2023 07:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjCNLIE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Mar 2023 07:08:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CC4911FC
        for <keyrings@vger.kernel.org>; Tue, 14 Mar 2023 04:07:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6C9861718
        for <keyrings@vger.kernel.org>; Tue, 14 Mar 2023 11:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE98AC433D2;
        Tue, 14 Mar 2023 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678792051;
        bh=tUteAbpXh1Jkxij7yMkG8qg/HuzbcNHqmBVbzp/JnKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QtfwLekHZs8ZyQgh7rULUMf0G7M8SNunItNAJfCpUYVmKFLOnZ2LATLE90AAWvZQf
         fb2J6oNmL6doYIIB7ZyHdYJ2WFC+Mi8rI1rvMKrtGAwMHi4Y08RHVSGM5DBcPMu9XK
         2OE+nYKtdUACvDZ3s/b9LSd6NGGzj/0mbaGPVyOSRvf08qEIkdANaBp2uv75iGLpIN
         /e18TMVmor4OerTo/n97WhTwnY6+tiYBzpsWaWlsdS9+G/0OC9kunHpfyVmAiNp1QK
         dsTz8Fq+iwyAQq7FsGQP2apzI1lk0sNLDpfIn1zeFa6tIOiJ8ev0AXUrYKI12d8cAk
         8JINqlMUteLmQ==
Date:   Tue, 14 Mar 2023 13:07:13 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Bharath SM <bharathsm.hsk@gmail.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is
 requested from kernel thread
Message-ID: <ZBBVYX7O7QV8TFL7@kernel.org>
References: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
 <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
 <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 13, 2023 at 10:48:29AM +0530, Bharath SM wrote:
> Linux kernel cifs module uses dns_resolver for dns resolution and
> dns_resolver will use kernel keys infrastructure for key management.
> Cifs module calls dns_query during reconnect for dns resolution, we noticed
> an issue with dns resolution requests during reconnect operations from cifs.
> Where the dns_query was failing by returning EKEYEXPIRED to cifs. And
> this issue was
> happening only when CONFIG_KEYS_REQUEST_CACHE was enabled.
> Further debugging the keys subsystem and discussing with david howells revealed
> this issue in keys subsystem.
> 
> To reproduce the issue mount a few SMB shares on device with
> nosharesock mount option and try disconnecting connections a few times
> using "ss -K src dport 445".
> 
> Logs from dns_resolver:
> Notice that 2nd time, we can see dns_query returning -127(EKEYEXPIRED)
> 
> Disconnected first time and got right response for dns_query:
> 
> [Mon Mar 13 05:05:23 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Mon Mar 13 05:05:23 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Mon Mar 13 05:05:23 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Mon Mar 13 05:05:23 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Mon Mar 13 05:05:23 2023] [cifsd ] ==>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.file.core.windows.net)
> [Mon Mar 13 05:05:23 2023] [cifsd ] <== dns_resolver_cmp() = 1
> [Mon Mar 13 05:05:23 2023] [key.dn] ==> dns_resolver_preparse('
> 20.150.20.136',14)
> [Mon Mar 13 05:05:23 2023] [key.dn] no options
> [Mon Mar 13 05:05:23 2023] [key.dn] store result
> [Mon Mar 13 05:05:23 2023] [key.dn] <== dns_resolver_preparse() = 0
> [Mon Mar 13 05:05:23 2023] [cifsd ] <== dns_query() = 13
> [Mon Mar 13 05:05:23 2023] [cifsd ] <== dns_query() = 13
> 
> Disconnected second time, but this time we can see one of the
> dns_query request is failing with -127
> 
> [Mon Mar 13 05:05:30 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Mon Mar 13 05:05:30 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Mon Mar 13 05:05:30 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Mon Mar 13 05:05:30 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Mon Mar 13 05:05:30 2023] [cifsd ] ==>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.file.core.windows.net)
> [Mon Mar 13 05:05:30 2023] [cifsd ] <== dns_resolver_cmp() = 1
> [Mon Mar 13 05:05:30 2023] [cifsd ] <== dns_query() = -127
> [Mon Mar 13 05:05:30 2023] [key.dn] ==> dns_resolver_preparse('
> 20.150.20.136',14)
> [Mon Mar 13 05:05:30 2023] [key.dn] no options
> [Mon Mar 13 05:05:30 2023] [key.dn] store result
> [Mon Mar 13 05:05:30 2023] [key.dn] <== dns_resolver_preparse() = 0
> [Mon Mar 13 05:05:30 2023] [cifsd ] <== dns_query() = 13

Please summarize this to the commit message it is useful stuff. With
this report included the patch could should also have a fixes tag.

BR, Jarkko
