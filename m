Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354C1B5D10
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2019 08:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfIRGbd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Sep 2019 02:31:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43235 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729575AbfIRGXV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Sep 2019 02:23:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id b2so5288912otq.10
        for <keyrings@vger.kernel.org>; Tue, 17 Sep 2019 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wK9VKPT5PALGow0s1AD18j7lV+EvX5g7BMBWsTpeIng=;
        b=xv6lI474DYSgaSu5RV4eJEBRp8AAJwvehRoTTpWaCo2J8ub7oPk4fmWmvkg1ZEyHq+
         TtxFAJNA+CkO15cIf36iqqP9X57G/JNY3Jb2I187WuFFnZsD/6zxHIOCkgH6EgYA1jfH
         YFSSbCekS/IoziCPiLuxaZHnZq5wzOhwRethzETOZxKFgUsGwW/D4ZLudka0rLN2bOSj
         SAypaAGTp5bpQL5XY1Q813yX/HmVuGih8Q5wEvBX1r4lbpI+8QupHhP+fcbRFrASg2mL
         7pMs60vrA8DXbpmTG++BM1jE99VkeCVDR9xwYrqoLW/I0P3yuAd+Xz5+qsRpoB02XtZC
         WfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wK9VKPT5PALGow0s1AD18j7lV+EvX5g7BMBWsTpeIng=;
        b=nbNGez2D2EtR4Ygfhi0npFQjqxfnrl+VIionI2pRrn7hbvpVPeDlYbLvXIr5r5/zeS
         rPAPcHSWSfBbCzRDnKbqCqHG+dpgNdgaYTIeXPWb2l9jydOFOXII2irDAOWq30g3nXPK
         YrR97QRlNthb6in6I12r9kbpeJdwjPIBcvYeTI/pCmEzE5+h0OIICz2rB7SDMVtj/B7g
         8NI9uldGUWtuSwl4R8mn/CkgCxe8gsJdS8gOE1cv+2CGn7oDI0jNC/as5ibdodvb/Nu6
         BMwd/MIEmsBtWT91Pe1RZdEzBOmiNI22UZ8B6O1f9ppdAM3cj56HUg4VTElhuYB8jijE
         HiLQ==
X-Gm-Message-State: APjAAAWXZ/4dUFNu6lbRaclwYmcWLTNovmEl7b7UXt4vKWJTPWykzY0f
        lu8cTS9fnE3PbP5yuclbGzGqLkKY6f1vJEy+BTmtuA==
X-Google-Smtp-Source: APXvYqyy689jL78FRCBaToum4k1f1kK7Ku7U2vf7SNBEYUwL9xj0w29sOcLAmo488CIy0XySfEE42rIulH1rHL8wJvo=
X-Received: by 2002:a9d:24e4:: with SMTP id z91mr1722754ota.41.1568787800000;
 Tue, 17 Sep 2019 23:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <1568630064-14887-1-git-send-email-sumit.garg@linaro.org>
 <1568630064-14887-5-git-send-email-sumit.garg@linaro.org> <20190917181415.GA8472@linux.intel.com>
 <20190917181507.GB8472@linux.intel.com>
In-Reply-To: <20190917181507.GB8472@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 18 Sep 2019 11:53:08 +0530
Message-ID: <CAFA6WYMbUGQ6+-XvR9_qSc=oVe1QSTg4kB-+y6rBmQLq+B6skg@mail.gmail.com>
Subject: Re: [Patch v6 4/4] KEYS: trusted: Move TPM2 trusted keys code
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, peterhuewe@gmx.de, keyrings@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-security-module@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        jgg@ziepe.ca, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jejb@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 17 Sep 2019 at 23:45, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Tue, Sep 17, 2019 at 09:14:15PM +0300, Jarkko Sakkinen wrote:
> > On Mon, Sep 16, 2019 at 04:04:24PM +0530, Sumit Garg wrote:
> > > Move TPM2 trusted keys code to trusted keys subsystem. The reason
> > > being it's better to consolidate all the trusted keys code to a single
> > > location so that it can be maintained sanely.
> > >
> > > Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >
> > This commit has couple of issues that I only noticed when looking into
> > bug reported by Mimi.
> >
> > Right now tpm_send() is the exported function that is used by other
> > subsystems. tpm_transmit_cmd() is an internal function. This commit adds
> > two unrelated code paths to send TPM commands, which is unacceptable.

Makes sense, will update.

> >
> > You should make tpm2 functionality to use tpm_send() instead and remove
> > tpm_seal_trusted() and tpm_unseal_trusted() completely in this commit.

Okay.

>
> The consequence is that the result needs unfortunately re-review. Sorry
> about that, just took this time to notice this glitch.

No worries :). I will send next version of patch-set.

FYI, I will be travelling for Linaro Connect next week so you could
expect some delays in my responses.

-Sumit

>
> /Jarkko
