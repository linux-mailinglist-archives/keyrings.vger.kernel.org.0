Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD6C707C2D
	for <lists+keyrings@lfdr.de>; Thu, 18 May 2023 10:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjERIi1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 18 May 2023 04:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjERIiZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 18 May 2023 04:38:25 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955CE19B1
        for <keyrings@vger.kernel.org>; Thu, 18 May 2023 01:38:20 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-561b50c1856so21729807b3.0
        for <keyrings@vger.kernel.org>; Thu, 18 May 2023 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684399100; x=1686991100;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=mzU1LdlLacObCo/T6RWj+dw5Z5tnU+bWw8yHeFWUbXs0cdXjLFaCidHfDhpKnwK0gi
         VuLNzPC2/awUnTJs46798CRSM4C3H2evFvd+h40jPw0wI9mfOd8psZju8dVX8On4H54P
         Z5nhi9OoVPC95gZQT9Mv5LrRT3gtvgk5psAD3XALS1X/djdF2wX4lc2vFhp1ZG8159Qz
         CWa8sKl18f4TTgCPOTLQRu5KvXc5qGAVOfTV88t8gD8zjWeDhrgvrA31nsTeS/Kw2KdT
         3wgJzKF+IY2Y8NNjZ/O0FerfmsmTj826UjnwbAQhTTjjrn745uvPu20IVL/7WMLg7t1j
         x5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684399100; x=1686991100;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=eD4eQFWJOHPzgvnIhaae4v5B2y61TwxbHLCRHIe8ymXr8jPT+zOPqNX3Bk3B0pJKG6
         Vz/bBDBPmmrxQ3Me6McqOLdpaZID6NL78xJSxwWiQX/mgx2Ix8+ng/h5EiyZvgX+Vwj1
         lsCNBArQCOQl8PoPHFYILeCJ6cvn7HzJPC+xal5mszLZB4OFPWThYAp5A1XxyX/UN/As
         lF0TZk1ZaHBhq40AYN9RSHSmwNiqTvMxwc4iANsmaESajngG6SlTbsFCvOHqcIRsVdqv
         e/IUDLHEl30VGiNu+M8VJdNEANISDzQ+bXTLKC3449GMGV/hafk3IbNaChZj8bPBxa/x
         dY7w==
X-Gm-Message-State: AC+VfDy8H2ONFc1ydCLl2jn8hBjINnFUqOCqpaJ1n1WohVn9bSjDr5mT
        GIgnek0sxazOl6hdiNZjYJS/dFXuCaXnBhgIwvY=
X-Google-Smtp-Source: ACHHUZ6QuN9X5wjkirF+7HXD4DxZhkw6EOWdkxu/TEBirnj8Rz6U5fhfxUk7hswdsDZTFoWhycgpUa2jjDwN1OZOERk=
X-Received: by 2002:a81:7309:0:b0:561:7cb7:6fb4 with SMTP id
 o9-20020a817309000000b005617cb76fb4mr935934ywc.7.1684399099757; Thu, 18 May
 2023 01:38:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:3acc:b0:2fb:68dc:b886 with HTTP; Thu, 18 May 2023
 01:38:19 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly332@gmail.com>
Date:   Thu, 18 May 2023 01:38:19 -0700
Message-ID: <CAGYF=X46sPVA3+tV4eMvpdtrnfEno01M-aeidePihqE_es-NYQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
