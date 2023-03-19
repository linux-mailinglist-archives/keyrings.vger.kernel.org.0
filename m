Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973E16C021A
	for <lists+keyrings@lfdr.de>; Sun, 19 Mar 2023 14:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjCSNjo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 19 Mar 2023 09:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCSNjo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 19 Mar 2023 09:39:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA57413DC6
        for <keyrings@vger.kernel.org>; Sun, 19 Mar 2023 06:39:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72D0AB80B16
        for <keyrings@vger.kernel.org>; Sun, 19 Mar 2023 13:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A3FC433EF;
        Sun, 19 Mar 2023 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679233180;
        bh=wMKgIwxcxDmMFtUHKIWG7gmCxySySjQVxoYuGE0w+Gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uJkqSRZKedJbw7CkkR2qnCny06ZnDOQrfRi0N+Q0UeTV/Dwj/WqKaMPWdffsyC3J6
         AMxi07Jz8DEpCo5CfgBL5xdwzDHKCQipvq2F0HJhneYzRHgb9d0Ovot6hTzSfQIxJy
         T3yIiK1VHf/WPmz/ap+NbnvwyRizpPfu3nfQdIYAEXthC1+n2XySPb6eT1MOoDz3FF
         0feXljFQRmsxUOJmUI64TWLoviiLFI3G+lkVbXuqTkZbF+lsygO8VQyseEhbxPtjDG
         iyRFTuvu95GkFZYa3cNyStoyxV/xiX7ffIP3KvoC1g1ebMsdkiky3kUXwLBllzM0lb
         t63lXlIvzMCHg==
Date:   Sun, 19 Mar 2023 15:39:36 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Bharath SM <bharathsm.hsk@gmail.com>, keyrings@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is
 requested from kernel thread
Message-ID: <20230319133936.xmzmusgcldwknxwa@kernel.org>
References: <ZBBVYX7O7QV8TFL7@kernel.org>
 <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
 <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
 <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
 <3711676.1678807652@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3711676.1678807652@warthog.procyon.org.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 14, 2023 at 03:27:32PM +0000, David Howells wrote:
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > Please summarize this to the commit message it is useful stuff. With
> > this report included the patch could should also have a fixes tag.
> 
> I've expanded the commit message to:
> 
>     keys: Do not cache key in task struct if key is requested from kernel thread
>     
>     The key which gets cached in task structure from a kernel thread does not
>     get invalidated even after expiry.  Due to which, a new key request from
>     kernel thread will be served with the cached key if it's present in task
>     struct irrespective of the key validity.  The change is to not cache key in
>     task_struct when key requested from kernel thread so that kernel thread
>     gets a valid key on every key request.
>     
>     The problem has been seen with the cifs module doing DNS lookups from a
>     kernel thread and the results getting pinned by being attached to that
>     kernel thread's cache - and thus not something that can be easily got rid
>     of.  The cache would ordinarily be cleared by notify-resume, but kernel
>     threads don't do that.
>     
>     This isn't seen with AFS because AFS is doing request_key() within the
>     kernel half of a user thread - which will do notify-resume.
>     
>     Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>     Signed-off-by: David Howells <dhowells@redhat.com>
>     cc: Jarkko Sakkinen <jarkko@kernel.org>
>     cc: Shyam Prasad N <nspmangalore@gmail.com>
>     cc: Steve French <smfrench@gmail.com>
>     cc: keyrings@vger.kernel.org
>     cc: linux-cifs@vger.kernel.org
>     cc: linux-fsdevel@vger.kernel.org
> 
> David

Looks good to me! Can you send a version with this?

BR, Jarkko
