Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD8074E942
	for <lists+keyrings@lfdr.de>; Tue, 11 Jul 2023 10:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjGKIkW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 11 Jul 2023 04:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjGKIkV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 11 Jul 2023 04:40:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E99BF
        for <keyrings@vger.kernel.org>; Tue, 11 Jul 2023 01:40:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-307d20548adso5470978f8f.0
        for <keyrings@vger.kernel.org>; Tue, 11 Jul 2023 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689064818; x=1691656818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jO3p2R6PvDXWlq4WPv9Xl22zgwoTKhJNavHiIsEtFtA=;
        b=Ae20dguLWTcUcArQpBwy+8UhyKeU1IHItg1B/5XQWMwITlVy/68fHyrFMly/KqdLp3
         xTUbzyjr6im01vIGo0taf8ujfJfq1q8qHFhlbAXlUTWZ7l/NTnwo45FKLpaa0pudmDUp
         rh9hZNFCMhST68TuTm4JcScGSf2IbgLWj/HUgOJo+w3Jqm4+IwMrjyo1xcQS4pMEhJSd
         ndg6tFlmvM3I3nXWfgCLnvSyq8sp+j2J9MX1Baysgrvqfwd3U6C+cEA3tQlHWsXM3N1K
         DJaX2RZSVZS9nxKzsQ1kRzd9j1gpmCZ5PMEHrU7565JU9HtFmDgTr0KXruYjx0H+WUwl
         QKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689064818; x=1691656818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jO3p2R6PvDXWlq4WPv9Xl22zgwoTKhJNavHiIsEtFtA=;
        b=Pyx7KAWr0B0+rX36LtR4WTtGx7zFVKzLfzdjNeWI4twHo/TB4VxNIFqytQRkJChd7R
         HevXAJ5waNBCqTrnpWiLjzMmn/U6H4xa0KN52d/ell+o2LExLuBGONl5K3C9LLFVOEtP
         G7hcANIpCD68cg/5YA9C7lRvr3/SN1xjlFlx3HE7sz/GYgsB0XYoJ0RPc1rKxLtZoT2L
         Dv5v9kLZTtuOJCAKnyCu5acVjIp+nuOnUq5wVP1EFOdrJfnQg0gOdtH44nyJHsJ9gdF0
         bUoWJFThI5YWxV6jcEUDRKa2ZfS7F6UFIG26KymOBr1sGxk6sCVWgMRAF9GQu7dKzoO4
         x+TA==
X-Gm-Message-State: ABy/qLZ5xCJ/PrzIbRGkAlt9ff+Sl9+wZzojJGaffAjfbd43Ks7VbMCs
        LQAayyUo+gYlXfL4cBGTItuX0J32MvYe56uEHPQ=
X-Google-Smtp-Source: APBJJlHFGlltvFFqYky0ftaQRRy3ncLK1TPRpiIYcTCCuWWaBIxh3CsVAwMtRs+v+r5eDRDETT+ilQ==
X-Received: by 2002:a05:6000:104c:b0:313:e55f:b78c with SMTP id c12-20020a056000104c00b00313e55fb78cmr12965313wrx.21.1689064818638;
        Tue, 11 Jul 2023 01:40:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003144b95e1ecsm1589896wrn.93.2023.07.11.01.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:40:16 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:40:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KEYS: asymmetric: Fix error codes
Message-ID: <15340a35-2400-43dd-9f50-fcbcb3c4986d@kadam.mountain>
References: <c5e34c6a-da1e-4585-98c4-14701b0e093e@moroto.mountain>
 <CTYVE0G0D53P.Y8A7V3C9BW9O@suppilovahvero>
 <CTYVFFFI0SE9.2QXXQPRJW3AA3@suppilovahvero>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTYVFFFI0SE9.2QXXQPRJW3AA3@suppilovahvero>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 11, 2023 at 02:12:22AM +0300, Jarkko Sakkinen wrote:
> > > Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without scatterlists")

[ snip ]

> >
> > I'll pick this as I'm late with 6.5 PR.
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> Causes merge conflicts with my tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/

Your master branch doesn't include the "Use new crypto interface" commit
so it doesn't have the bug.

(I'm just testing against linux-next and I don't know how the crypto
trees work).

regards,
dan carpenter
