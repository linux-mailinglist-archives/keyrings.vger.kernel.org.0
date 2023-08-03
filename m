Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAE076F53B
	for <lists+keyrings@lfdr.de>; Fri,  4 Aug 2023 00:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjHCWBI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 3 Aug 2023 18:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjHCWBH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 3 Aug 2023 18:01:07 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4825B2D7E
        for <keyrings@vger.kernel.org>; Thu,  3 Aug 2023 15:01:01 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-584243f84eeso16479247b3.0
        for <keyrings@vger.kernel.org>; Thu, 03 Aug 2023 15:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1691100060; x=1691704860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSYrMpI2xB+WfBOsO3yAq2dJN3Nv27kk/7akbAhaNLQ=;
        b=TfCqptoQmbSqbr1S2zvlpcH48pIJ+0muyuNXwxWWoMUjWTv1/ovxjm7kIlzER+kZhi
         TEfwTs/jrENYGer0+zJllNL2NFF14f4LMTqT3Ck9kyQSx32LKErGZsEa1mSex0I6wP3g
         eqVU1heQvIQ95A7HlDJ+fWaQDRmlURlbgSsrGfLngHN1LTAHCUd2FasSsKI3UkPe0L0u
         4YMdzubpXU1fFmBk8MiunzUvh+oVgIBosfXMOsTouiOc5sjbe2OK9EWmJvK//SBYKc7c
         u8VnsvCQit1AVx2EcieK05m0AzLjzfaEoYMryq7yLpv+UEfOSERi6/8FVl6lsy4Q2F8F
         PV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691100060; x=1691704860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSYrMpI2xB+WfBOsO3yAq2dJN3Nv27kk/7akbAhaNLQ=;
        b=hOqw4mNE49ACsFec0LTEs8iK9LolPKsopy2uEOmndy613gbm2813WONVEJ59DZLLO+
         tGzy+mLYElkkpmHuARuZLbpgZzTL74L2dcP2EItZp6M9hp/SjlkQcVvLxbAmxMz9buUt
         mBcSPwv7Xe18q+o6pdEglT2x7eg4vXBeCFHgqHKP7zUhcmRy4eDzH5x0g2YbJdWO8ALm
         5HIVHhm2K/rbnp/R3KZe0UeXrB6+FUky9Q9N648iFfJ6HdyTI/BNj7V2+7tJ1yDbB5nt
         S+kkYDlvRcVlh57WYo5AbiSQzoQu4ilItN9d8TSZKtp8XZ3Fe87ClgkCViqqZgX0Nkbs
         JYqA==
X-Gm-Message-State: ABy/qLYaJn1R/4cEQuvY0NuSbDo2hZnTDJ1AuP2RFUUctIdCSyDP0mxV
        mj8wUZzKCUvNELecLPiiYoWbFM338YlUsaSxUcnK
X-Google-Smtp-Source: APBJJlEgLPlqAwkPPrIb6oCF0QOzGZswZtU6IPWBCij7+2y3NzyVzSj3lYqtQCHdE9u7OysL/JKCm/My+k4pMYRiIRM=
X-Received: by 2002:a81:a101:0:b0:577:617c:8cd with SMTP id
 y1-20020a81a101000000b00577617c08cdmr22173319ywg.35.1691100060506; Thu, 03
 Aug 2023 15:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230621074623.498647-1-cuigaosheng1@huawei.com>
 <CAHC9VhQzZYg1HH_Q6OYytkp-uYOmCAnpzHb9tiRA-YC0VNha9A@mail.gmail.com> <CAHC9VhQaWM=eC98ezfKmOA6sd9wzxQ0PFp5EysUKLZFEt=yB=A@mail.gmail.com>
In-Reply-To: <CAHC9VhQaWM=eC98ezfKmOA6sd9wzxQ0PFp5EysUKLZFEt=yB=A@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 3 Aug 2023 18:00:49 -0400
Message-ID: <CAHC9VhTibk2tFPt7ZjFL9ps9NO6_sCQwXtbF1pQCXO+jGhshpg@mail.gmail.com>
Subject: Re: [PATCH -next] trusted-keys: Fix kernel-doc warnings in trusted-keys
To:     Gaosheng Cui <cuigaosheng1@huawei.com>, jarkko@kernel.org,
        dhowells@redhat.com
Cc:     jejb@linux.ibm.com, zohar@linux.ibm.com, jmorris@namei.org,
        serge@hallyn.com, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 25, 2023 at 4:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Wed, Jun 21, 2023 at 9:33=E2=80=AFAM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Wed, Jun 21, 2023 at 3:46=E2=80=AFAM Gaosheng Cui <cuigaosheng1@huaw=
ei.com> wrote:
> > >
> > > Fix kernel-doc warnings in trusted-keys:
> > >
> > > security/keys/trusted-keys/trusted_tpm2.c:203: warning: expecting
> > > prototype for tpm_buf_append_auth(). Prototype was for
> > > tpm2_buf_append_auth() instead.
> > >
> > > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > > ---
> > >  security/keys/trusted-keys/trusted_tpm2.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Reviewed-by: Paul Moore <paul@paul-moore.com>
>
> Jarkko, David, can one of you pick this up into your tree?

Guys, this patch is both trivial and obviously correct, please pick it
up so it can go up during the next merge window.

--=20
paul-moore.com
