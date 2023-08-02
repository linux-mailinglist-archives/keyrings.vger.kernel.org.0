Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2204F76C408
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 06:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjHBET5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Aug 2023 00:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHBET4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 2 Aug 2023 00:19:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62BE11D
        for <keyrings@vger.kernel.org>; Tue,  1 Aug 2023 21:19:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B52A6175C
        for <keyrings@vger.kernel.org>; Wed,  2 Aug 2023 04:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202CEC433C7;
        Wed,  2 Aug 2023 04:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690949994;
        bh=qcjiWP2ZXvUNV/2aZaK7THgTv/X54Rn1v+OBCth4puY=;
        h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
        b=Pco1a4Kj/4VH3PEHvs8NRKmFaMFnG2RF0/Mf9kt/xWOHa8E7oV6GTLQyssrt+yh+r
         rZGe2w7bn6orMTGr+UjdEK2ELuQCzq+XyxLTYXWuYCdQvNgAClL7xngo0+bHeQklSU
         OXcbctdJyEtx81kVidYYu0fZ0La/OZfgpG+QVRH/ZEChgcgewyVZLwqNx1JpCtwUoA
         Lw4loBnRmawCSXsGnfrfyqP4jcRpqxl/xFWBhOoMSKxJ2F/E7OaTCQuwbRZPdOuS8K
         IKmWXm9OvbW1ODYmiQH3j/vDJAlklxGZ/dfHoklCQ86PK4/Vhd3PzdTEjonjN+UPUM
         v9aVOiULObJBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 02 Aug 2023 07:19:50 +0300
Message-Id: <CUHRQTQP50HI.MZCFN3TZUZ58@suppilovahvero>
Cc:     <dhowells@redhat.com>, <keyrings@vger.kernel.org>
Subject: Re: [PATCH] key: Make key_sysctls static
From:   "Jarkko Sakkinen" <jarkko@kernel.org>
To:     "Ben Boeckel" <me@benboeckel.net>,
        "GUO Zihua" <guozihua@huawei.com>
X-Mailer: aerc 0.14.0
References: <20230802021542.13473-1-guozihua@huawei.com>
 <ZMnBCW7vlvvic/N7@farprobe>
In-Reply-To: <ZMnBCW7vlvvic/N7@farprobe>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed Aug 2, 2023 at 5:35 AM EEST, Ben Boeckel wrote:
> On Wed, Aug 02, 2023 at 10:15:42 +0800, GUO Zihua wrote:
> > key_sysctls is not used outside the file. Make it static
> >=20
> > Signed-off-by: GUO Zihua <guozihua@huawei.com>
>
> Previously submitted:
>
>     https://lore.kernel.org/keyrings/20230611113210.182652-1-trix@redhat.=
com/T/#u
>
> --Ben

Oops, sorry, applied:

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/=
?h=3Dnext

BR, Jarkko

