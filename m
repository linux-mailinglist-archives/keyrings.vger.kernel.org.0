Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EEF3518DA
	for <lists+keyrings@lfdr.de>; Thu,  1 Apr 2021 19:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236195AbhDARr7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Apr 2021 13:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234378AbhDARlj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Apr 2021 13:41:39 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3898C08EC73
        for <keyrings@vger.kernel.org>; Thu,  1 Apr 2021 06:53:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g8so2919115lfv.12
        for <keyrings@vger.kernel.org>; Thu, 01 Apr 2021 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c893QbRRmjQkEtB2posydTcKTgGrQP7cS/Yzjgewk74=;
        b=cU1/w+Ev6H6Wdyc50mYASof9MSjhUc9dkCpvuENGmyhJsVhMz+Ufq+lmVSgNIeVBeK
         PbFUfLm4E1xcJ9HZ5XaHZORsL4dXolTon/o7fchVX7AzcKhccS4cnyNCP9eYDwkh/tjY
         ObFY120/dvcpAvkUtDNcIeaJwwzWacVE1zgEio1J/pBBIaVkeDFrBTHmbkLbGmh8e/vy
         7Jw5fVPkwDcKBziVeobEki4jh0HUVxqz4PODne1uZb1s1d+Z+c1J8ELr++rl+vf5b6KS
         zS1VLh347XyLyD4Q/E6wnYQBFCViiNhC29iHIGiFl4tcSv9WSK5SmIy9d9L57/H4xDfk
         b0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c893QbRRmjQkEtB2posydTcKTgGrQP7cS/Yzjgewk74=;
        b=q/X7m0BJGpAouHr4ZTTbPpu4v44UvBCuHgYiBDCPHicqqp9mvKYoIDi/HU9bdcIMm4
         PsHGWlVZg1gu2HshJPvK4JhLAa3A8KjaY2TxYp0StxuODkcTKXAim49NFG8fFjChK4iH
         ckUATZpD/3B/gIj6zLrzCR6q0QdVc7Xakb7xmiU+GB6kms7HJBdz2kJDqIkpNJTwqAMn
         eJoa8uJ2oXXol8QDOOqvcdb5gE2s+yW5jVv+jlgqm1+zSMoqGHT3CcRxsggBRI/Qg5BA
         un5WgMseAwVxGCv+B8pCK9W/gtpxhLpsWMLwAIoiesWuUcRWrbOtM31A905fFfT7UIkn
         k2Mg==
X-Gm-Message-State: AOAM533DAckCVxmCVTIAD7EySFF4EqgtkF2xzwpzPQ5L5bRIjjfbbVPs
        PKFAHIaadGXswjaCt+7/MWEEB/e1EVyJBySDb5Okvg==
X-Google-Smtp-Source: ABdhPJzf2Vf+J0kHLdivX0dvXkq4BlUU//tUmf8HMN2XU1LxE89EyoNOm2SAuZ5vFZYQrOuPdm9P3QNcmVEHVOzMvJw=
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr5525797lfg.194.1617285186182;
 Thu, 01 Apr 2021 06:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.56fff82362af6228372ea82e6bd7e586e23f0966.1615914058.git-series.a.fatoum@pengutronix.de>
 <CAFLxGvzWLje+_HFeb+hKNch4U1f5uypVUOuP=QrEPn_JNM+scg@mail.gmail.com>
 <ca2a7c17-3ed0-e52f-2e2f-c0f8bbe10323@pengutronix.de> <CAFLxGvwNomKOo3mQLMxYGDA8T8zN=Szpo2q5jrp4D1CaMHydWA@mail.gmail.com>
 <CAFA6WYO29o73nSg4ikU9cyaOr0kpaXFJpcGLGmFLgjKQWchcEg@mail.gmail.com>
 <1666035815.140054.1617283065549.JavaMail.zimbra@nod.at> <ea261e53-8f5d-ac52-f3b9-7f2db4532244@pengutronix.de>
In-Reply-To: <ea261e53-8f5d-ac52-f3b9-7f2db4532244@pengutronix.de>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 1 Apr 2021 19:22:54 +0530
Message-ID: <CAFA6WYODfsMTiCEyFA2aRGm+UQE0OTe-ui7mMSK-cqUR_YJFTA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] KEYS: trusted: Introduce support for NXP
 CAAM-based trusted keys
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Richard Weinberger <richard@nod.at>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        horia geanta <horia.geanta@nxp.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        aymen sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        davem <davem@davemloft.net>,
        James Bottomley <jejb@linux.ibm.com>,
        kernel <kernel@pengutronix.de>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Udit Agarwal <udit.agarwal@nxp.com>,
        Jan Luebbe <j.luebbe@pengutronix.de>,
        david <david@sigma-star.at>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        "open list, ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        LSM <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 1 Apr 2021 at 19:00, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Richard, Sumit,
>
> On 01.04.21 15:17, Richard Weinberger wrote:
> > Sumit,
> >
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Sumit Garg" <sumit.garg@linaro.org>
> >> IIUC, this would require support for multiple trusted keys backends at
> >> runtime but currently the trusted keys subsystem only supports a
> >> single backend which is selected via kernel module parameter during
> >> boot.
> >>
> >> So the trusted keys framework needs to evolve to support multiple
> >> trust sources at runtime but I would like to understand the use-cases
> >> first. IMO, selecting the best trust source available on a platform
> >> for trusted keys should be a one time operation, so why do we need to
> >> have other backends available at runtime as well?
> >
> > I thought about devices with a TPM-Chip and CAAM.

In this case why would one prefer to use CAAM when you have standards
compliant TPM-Chip which additionally offers sealing to specific PCR
(integrity measurement) values.

> > IMHO allowing only one backend at the same time is a little over simpli=
fied.
>
> It is, but I'd rather leave this until it's actually needed.
> What can be done now is adopting a format for the exported keys that woul=
d
> make this extension seamless in future.
>

+1

-Sumit

> Cheers,
> Ahmad
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
