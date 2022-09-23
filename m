Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBA95E85D3
	for <lists+keyrings@lfdr.de>; Sat, 24 Sep 2022 00:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiIWWYQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 23 Sep 2022 18:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiIWWYM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 23 Sep 2022 18:24:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51D814AD46
        for <keyrings@vger.kernel.org>; Fri, 23 Sep 2022 15:24:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 10so2347489lfy.5
        for <keyrings@vger.kernel.org>; Fri, 23 Sep 2022 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=oD2UyGyhLaodAMVLZEM0pp92bLbq6IPWrm+arkJI44c=;
        b=KLocQXZ9DAdhHIGaOzUHK3AoWBRuJqZ6NDAlqDCSh0w1AeBIA0VvwphQmlYYNBWYQR
         HBvqEgSCK7w+ZHX+RZxD2EQiRjL2H7fhfuVKyTqmKZVDHAHCO499/Ro5Ryz4ubIyjxSK
         RzPiwmWQdKYQlYqmVnnrEb1gc27Oue3Qo/Z6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oD2UyGyhLaodAMVLZEM0pp92bLbq6IPWrm+arkJI44c=;
        b=HWpQ4REa7mY3hVhkDGf+rzkbXYDkJKcCTTUXEVFdbxwHG4FtkDRIwPM9MCT1Jjr9KN
         smvQE5K4P1TEgx7vErTgNDNqrBnkfPOo2I2/33btaodMxlszYufdSMNsDLn0C4KhzzL2
         vTznMu2Ib3n3kLB3HgtZOuvIAJFQWEBap0XmgsTLwZwKKe6kIFGv5lqt0biOkWR3vdXh
         okF92ROF+x3rmEYdVek5Vy4HH4VqlJ4OM/IHkxbw0LGM/MBjJltVdg06V7IznKduME01
         g2z7ahLQnuABYmdgcTUzKQtXnifOV2v7bzXaqXu8FImOZyMEfu+AuY39rBBTR3/nHhjE
         dpsw==
X-Gm-Message-State: ACrzQf3kWKKsvTVxb30E8ry0ERMkW27Eg5UiOxd0zWtMTE+CYGfY+7kf
        nZetndQpE6u8Cm5Krb5cEZfDOzy70oLJEg==
X-Google-Smtp-Source: AMsMyM4uotczCpBk3mU/sOo3srdBOkcxmG/6Yqtz9gZHx9Tjwl626EBze6uoyILQ+R5mBV8SpAcwkA==
X-Received: by 2002:a05:6512:10d6:b0:49a:1fc0:cc62 with SMTP id k22-20020a05651210d600b0049a1fc0cc62mr4396062lfg.138.1663971845839;
        Fri, 23 Sep 2022 15:24:05 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id by40-20020a05651c1a2800b00261e3856abcsm1503554ljb.102.2022.09.23.15.24.05
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 15:24:05 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id w8so2292402lft.12
        for <keyrings@vger.kernel.org>; Fri, 23 Sep 2022 15:24:05 -0700 (PDT)
X-Received: by 2002:a5d:5c08:0:b0:228:e139:43f3 with SMTP id
 cc8-20020a5d5c08000000b00228e13943f3mr6607580wrb.396.1663971834264; Fri, 23
 Sep 2022 15:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220823222526.1524851-1-evgreen@chromium.org>
 <20220823152108.v2.5.I6cdb522cb5ea28fcd1e35b4cd92cbd067f99269a@changeid> <202209201605.505F96D@keescook>
In-Reply-To: <202209201605.505F96D@keescook>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 23 Sep 2022 15:23:17 -0700
X-Gmail-Original-Message-ID: <CAE=gft6wO0Hv+dgQG_xcPdQTCQxtBeJNo94hqivdO8rxvXjbbg@mail.gmail.com>
Message-ID: <CAE=gft6wO0Hv+dgQG_xcPdQTCQxtBeJNo94hqivdO8rxvXjbbg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] security: keys: trusted: Verify creation data
To:     Kees Cook <keescook@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        linux-integrity@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        apronin@chromium.org, Daniil Lunev <dlunev@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        Paul Moore <paul@paul-moore.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Sep 20, 2022 at 4:07 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Aug 23, 2022 at 03:25:21PM -0700, Evan Green wrote:
> > If a loaded key contains creation data, ask the TPM to verify that
> > creation data. This allows users like encrypted hibernate to know that
> > the loaded and parsed creation data has not been tampered with.
> >
> > Partially-sourced-from: Matthew Garrett <mjg59@google.com>
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> >
> > ---
> > Source material for this change is at:
> > https://patchwork.kernel.org/project/linux-pm/patch/20210220013255.1083=
202-9-matthewgarrett@google.com/
> >
> > Changes in v2:
> >  - Adjust hash len by 2 due to new ASN.1 storage, and add underflow
> >    check.
> >
> >  include/linux/tpm.h                       |  1 +
> >  security/keys/trusted-keys/trusted_tpm2.c | 77 ++++++++++++++++++++++-
> >  2 files changed, 77 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> > index 8320cbac6f4009..438f8bc0a50582 100644
> > --- a/include/linux/tpm.h
> > +++ b/include/linux/tpm.h
> > @@ -224,6 +224,7 @@ enum tpm2_command_codes {
> >       TPM2_CC_SELF_TEST               =3D 0x0143,
> >       TPM2_CC_STARTUP                 =3D 0x0144,
> >       TPM2_CC_SHUTDOWN                =3D 0x0145,
> > +     TPM2_CC_CERTIFYCREATION         =3D 0x014A,
> >       TPM2_CC_NV_READ                 =3D 0x014E,
> >       TPM2_CC_CREATE                  =3D 0x0153,
> >       TPM2_CC_LOAD                    =3D 0x0157,
> > diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/=
trusted-keys/trusted_tpm2.c
> > index 1d1470b880ca01..f81c6578c7f783 100644
> > --- a/security/keys/trusted-keys/trusted_tpm2.c
> > +++ b/security/keys/trusted-keys/trusted_tpm2.c
> > @@ -691,6 +691,74 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
> >       return rc;
> >  }
> >
> > +/**
> > + * tpm2_certify_creation() - execute a TPM2_CertifyCreation command
> > + *
> > + * @chip: TPM chip to use
> > + * @payload: the key data in clear and encrypted form
> > + * @blob_handle: the loaded TPM handle of the key
> > + *
> > + * Return: 0 on success
> > + *         -EINVAL on tpm error status
> > + *         < 0 error from tpm_send or tpm_buf_init
> > + */
> > +static int tpm2_certify_creation(struct tpm_chip *chip,
> > +                              struct trusted_key_payload *payload,
> > +                              u32 blob_handle)
> > +{
> > +     struct tpm_header *head;
> > +     struct tpm_buf buf;
> > +     int rc;
> > +
> > +     rc =3D tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CERTIFYCREATI=
ON);
> > +     if (rc)
> > +             return rc;
> > +
> > +     /* Use TPM_RH_NULL for signHandle */
> > +     tpm_buf_append_u32(&buf, 0x40000007);
> > +
> > +     /* Object handle */
> > +     tpm_buf_append_u32(&buf, blob_handle);
> > +
> > +     /* Auth */
> > +     tpm_buf_append_u32(&buf, 9);
> > +     tpm_buf_append_u32(&buf, TPM2_RS_PW);
> > +     tpm_buf_append_u16(&buf, 0);
> > +     tpm_buf_append_u8(&buf, 0);
> > +     tpm_buf_append_u16(&buf, 0);
> > +
> > +     /* Qualifying data */
> > +     tpm_buf_append_u16(&buf, 0);
> > +
> > +     /* Creation data hash */
> > +     if (payload->creation_hash_len < 2) {
> > +             rc =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     tpm_buf_append_u16(&buf, payload->creation_hash_len - 2);
> > +     tpm_buf_append(&buf, payload->creation_hash + 2,
> > +                    payload->creation_hash_len - 2);
> > +
> > +     /* signature scheme */
> > +     tpm_buf_append_u16(&buf, TPM_ALG_NULL);
> > +
> > +     /* creation ticket */
> > +     tpm_buf_append(&buf, payload->tk, payload->tk_len);
> > +
> > +     rc =3D tpm_transmit_cmd(chip, &buf, 6, "certifying creation data"=
);
> > +     if (rc)
> > +             goto out;
> > +
> > +     head =3D (struct tpm_header *)buf.data;
> > +
> > +     if (head->return_code !=3D 0)
> > +             rc =3D -EINVAL;
>
> Do you have a reference to this TPM command spec? I have a dim memory of
> some of these commands having success/failure listed separately from
> other things in the reply. Is that true here? (i.e. is the return_code
> only about "yes I replied" and there is a missing "but the answer is no"
> check?)

Here's the link to the volumes:
https://trustedcomputinggroup.org/resource/tpm-library-specification/

The description for TPM2_CertifyCreation in part 3 says this:
```
This command is used to prove the association between an object and
its creation data. The TPM will
validate that the ticket was produced by the TPM and that the ticket
validates the association between a
loaded public area and the provided hash of the creation data (creationHash=
).
NOTE 1 See 18.1 for description of how the signing scheme is selected.
The TPM will create a test ticket using the Name associated with
objectHandle and creationHash as:
HMAC(proof, (TPM_ST_CREATION || objectHandle=E2=86=92Name || creationHash))=
 (4)
This ticket is then compared to creation ticket. If the tickets are
not the same, the TPM shall return
TPM_RC_TICKET.
If the ticket is valid, then the TPM will create a TPMS_ATTEST
structure and place creationHash of the
command in the creationHash field of the structure. The Name
associated with objectHandle will be
included in the attestation data that is then signed using the key
associated with signHandle.
```

So my aim there was to check responseCode in the response, and as long
as it's success and not RC_TICKET I should be ok. Though I see now
from other examples I should have used
(be32_to_cpu(header->return_code) !=3D TPM2_RC_SUCCESS). I will change
that.


>
> > +out:
> > +     tpm_buf_destroy(&buf);
> > +     return rc;
> > +}
> > +
> >  /**
> >   * tpm2_unseal_trusted() - unseal the payload of a trusted key
> >   *
> > @@ -716,8 +784,15 @@ int tpm2_unseal_trusted(struct tpm_chip *chip,
> >               goto out;
> >
> >       rc =3D tpm2_unseal_cmd(chip, payload, options, blob_handle);
> > -     tpm2_flush_context(chip, blob_handle);
> > +     if (rc)
> > +             goto flush;
> > +
> > +     if (payload->creation_len)
> > +             rc =3D tpm2_certify_creation(chip, payload, blob_handle);
> >
> > +
> > +flush:
> > +     tpm2_flush_context(chip, blob_handle);
> >  out:
> >       tpm_put_ops(chip);
> >
> > --
> > 2.31.0
> >
>
> Otherwise looks good to me. :)
>
> --
> Kees Cook
