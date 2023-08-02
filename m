Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC6376C401
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 06:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjHBEPu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Aug 2023 00:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjHBEPt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 2 Aug 2023 00:15:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B0FED;
        Tue,  1 Aug 2023 21:15:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4460A61789;
        Wed,  2 Aug 2023 04:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FE0C433CC;
        Wed,  2 Aug 2023 04:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690949747;
        bh=qVu2h+90Sr9xTEFTCM5T6XS4B1BUEaWCYaE9ful83Bg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCZKIym2/Jx5XI1zKv4mYtoXLKPWqdTnJx9IdZMfvZtPy7D0rd3W2X3v4Ksa28AUe
         EHvM7Q8c898oh3vY2mVdnxMlpz7st7bs99MzmR38gz84Arz+G72o6AlYaSfRTFD9Se
         pSg8fDonEN2lR8/+2H6eKFA76p1zwIL5J9JNDdSIcEKc1yCv4qCwRKZXwkf5Q/xAmW
         4OEIPspMIaU0z7aZuAOx78a09zWmsgEUzZ0pz6kbBu3TfFA372AKNWbkgKa3pY7LCM
         RIgh8z1fzfBnsrm9DE1APXRmSSj+wdWeGUMaTkBLEzxJsVF5uYBs+KVlSrz8djVo9L
         D/fI/X+2w9x6A==
Date:   Tue, 1 Aug 2023 21:15:45 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Victor Hsieh <victorhsieh@google.com>
Cc:     fsverity@lists.linux.dev, keyrings@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] fsverity: skip PKCS#7 parser when keyring is empty
Message-ID: <20230802041545.GA1543@sol.localdomain>
References: <20230801050714.28974-1-ebiggers@kernel.org>
 <CAFCauYMrQf4TJJ+8atPrsihDa9+nKb5zn-rCKqB3081d8ZvZoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCauYMrQf4TJJ+8atPrsihDa9+nKb5zn-rCKqB3081d8ZvZoA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Aug 01, 2023 at 09:07:44AM -0700, Victor Hsieh wrote:
> Should the whole use of "d" be moved into the else block?

In v2, changed to use an early return instead.

- Eric
