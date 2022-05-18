Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B4F52C5F2
	for <lists+keyrings@lfdr.de>; Thu, 19 May 2022 00:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiERWFy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 May 2022 18:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiERWFn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 May 2022 18:05:43 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4B7AE249
        for <keyrings@vger.kernel.org>; Wed, 18 May 2022 15:03:38 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n10so3362492pjh.5
        for <keyrings@vger.kernel.org>; Wed, 18 May 2022 15:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iMSU8o/vmnYNF8oQukQMHTmX2hEc142qWw/OVQkloYA=;
        b=MOOXL5WVm4dB91B2uKf9xSR4S+HJHSL0TSMbqIdkTz9lYASuHqAVOAh95f3WbJIGEb
         2IaGHgmG9CFXLXuPdZupCWf8T178NlwE1qWO2jFgLEwYvF+sfpOK8l6uvCeDw5Wt4s/P
         33mlqihbA8q89DMJJhJswWsj/E81EP1S3Q2TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iMSU8o/vmnYNF8oQukQMHTmX2hEc142qWw/OVQkloYA=;
        b=7n51Ldzc487BdZSHeVO24LAdhyCKGrHTxk/gZNXob7pphqQ671c6h6Qmwp4nwpRI/y
         cJwbY6NUGwWw15l/EqXRNS1eegJj6PALWsPj6z0EJ8SXkk9SU7uuqXl5vFIzFsmYy1zm
         dHVASkGevKDcbdmwuGsTFhRvKom+y0cdeh+3Yo5TyIyNlVRO7R2y0GVLisxt80AWj3nL
         YrKFZh/mZVNym9IajXL7yi6qGXm9PcZK9eUu0a1NlqwOJxFm8f7DUn3gHNY+wtpLZ/ky
         unTs6kwOQQYZQMx7qQFjvD57WTXrnsmRdYphTUO/A566mZAvUHJxjpmV2BzoLvDkkzqa
         8RTg==
X-Gm-Message-State: AOAM530xlMrBI+XTnBGmlzvEMDJZ5AfnzSx/m2N654hjtQb6L/VL+Rzj
        S8ErdUPXXtJEjMgp5XrN7oXGxw==
X-Google-Smtp-Source: ABdhPJy+E8w/oaLMW4XqP48igVHAKcm8FsJk8ICdSbgkBYqluSRAo5HHX3Oe93HcFbp3abQCi2+fww==
X-Received: by 2002:a17:903:1c3:b0:161:8b3d:7948 with SMTP id e3-20020a17090301c300b001618b3d7948mr1426496plh.158.1652911418065;
        Wed, 18 May 2022 15:03:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p42-20020a056a0026ea00b0050dc762818dsm2529221pfw.103.2022.05.18.15.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 15:03:37 -0700 (PDT)
Date:   Wed, 18 May 2022 15:03:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     GUO Zihua <guozihua@huawei.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        davem@davemloft.net, dhowells@redhat.com,
        herbert@gondor.apana.org.au, gustavoars@kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] crypto: Use struct_size() helper in kmalloc()
Message-ID: <202205181503.AA72D88E15@keescook>
References: <20220518062518.236965-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518062518.236965-1-guozihua@huawei.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 18, 2022 at 02:25:18PM +0800, GUO Zihua wrote:
> Make use of struct_size() helper for structures containing flexible array
> member instead of sizeof() which prevents potential issues, as well as
> increase readability.
> 
> Reference: https://lore.kernel.org/all/CAHk-=wiGWjxs7EVUpccZEi6esvjpHJdgHQ=vtUeJ5crL62hx9A@mail.gmail.com/
> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
