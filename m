Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A247D7D1D3A
	for <lists+keyrings@lfdr.de>; Sat, 21 Oct 2023 15:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjJUNZG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 21 Oct 2023 09:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjJUNZE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 21 Oct 2023 09:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC77D65
        for <keyrings@vger.kernel.org>; Sat, 21 Oct 2023 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697894649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sAJJoylF1cW1oW2mCcwy+DSGsa9dllVFEwoULjFHt7U=;
        b=bavzUNnJWFisWT60X4K6nCXnzfZeiMBQpSuOzflL9KYThC9ogtneKFS6foFLEfyb/2DmPI
        9Om0M68ZmsV7S4klCWWyGEFwhNzcs2SczuMretQlVcF5wfM9TGDoygqitGyKHW+zAwcgbs
        h9+8PQxoLQJs99WFA164zDWLbcCaXhg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-FTFj6eiRNPqxvVUEJlNPjw-1; Sat, 21 Oct 2023 09:24:08 -0400
X-MC-Unique: FTFj6eiRNPqxvVUEJlNPjw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-53e2acda9d6so1084858a12.2
        for <keyrings@vger.kernel.org>; Sat, 21 Oct 2023 06:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697894647; x=1698499447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAJJoylF1cW1oW2mCcwy+DSGsa9dllVFEwoULjFHt7U=;
        b=qb/QGlvEdEcD70ioC6fFSOd8B1himQBiy+VB4RomHd5iDwx7YbdZPrILZ4/t+Rkzpo
         8IH9FNHNgMVcriLiJgcSiT4YpjH8KXumV41G6rAU5gtbuUo94aEF2jGVVbNOrBOw6Grj
         /emmpjiENatOlGG3MyRlrvZa3c8Bq+PvifaQb2EJAaatHu0BBzHlFK+eu5KZRiDK5z0Q
         AKq2AMdtXrA6/MnCKgwMKRi/YXABv5WsxrfmLA2jMCyDTv7XntcUw5nSeGWC4uTKV6G8
         HuH2wgV5dshEbJ8nX+De48pHZcMSu6sfJ3hnavC/E3GyKO3dhYWCUTygd0ig4ayH7itp
         iFsQ==
X-Gm-Message-State: AOJu0YyOAu8QjD/splZ4DfSqQiD9OE6QiEzJQRutJlCdYsV6Rgx6S6dO
        Vz5Pg+epBQihYUmtnGJadlmSykmvaARinOAvEJ4jUOxh4dUKlnqmNs1gFXY5LM+bqz35wxcc+2C
        ptBF4rcA7a8mlDXnVA+9zN3dgzZ57Dx2WLj4=
X-Received: by 2002:a50:aacf:0:b0:53e:1388:cb2e with SMTP id r15-20020a50aacf000000b0053e1388cb2emr3332765edc.35.1697894647032;
        Sat, 21 Oct 2023 06:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyy9uSFCMUqfgN2rj17ch/G/jvq1QTWJGPAXTF5FtC6Qouo5v3kERhMpzgMczbfZXe5FR3mAcf/aFuBhBAvjs=
X-Received: by 2002:a50:aacf:0:b0:53e:1388:cb2e with SMTP id
 r15-20020a50aacf000000b0053e1388cb2emr3332740edc.35.1697894646692; Sat, 21
 Oct 2023 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
In-Reply-To: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
From:   Richard Fontana <rfontana@redhat.com>
Date:   Sat, 21 Oct 2023 09:23:55 -0400
Message-ID: <CAC1cPGx-cb+YZ9KgEFvSjtf+fp9Dhcn4sm9qHmFFDRDxb=7fHg@mail.gmail.com>
Subject: Re: [PATCH] treewide: Add SPDX identifier to IETF ASN.1 modules
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-spdx@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Tadeusz Struk <tadeusz.struk@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Steve French <sfrench@samba.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
        Taehee Yoo <ap420073@gmail.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>, coreteam@netfilter.org,
        netfilter-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Oct 21, 2023 at 7:25=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> Per section 4.c. of the IETF Trust Legal Provisions, "Code Components"
> in IETF Documents are licensed on the terms of the BSD-3-Clause license:
>
> https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/
>
> The term "Code Components" specifically includes ASN.1 modules:
>
> https://trustee.ietf.org/documents/trust-legal-provisions/code-components=
-list-3/

Sorry if this seems super-pedantic but I am pretty sure the license
text in the IETF Trust Legal Provisions does not actually match SPDX
`BSD-3-Clause` because of one additional word in clause 3 ("specific"
before "contributors"), so IMO you should get SPDX to modify its
definition of `BSD-3-Clause` prior to applying this patch (or get IETF
to change its version of the license, but I imagine that would be more
difficult). This issue of a multitude of nonsubstantively different,
non-matching versions of clause 3 is a common issue that has been
coming up in the Fedora project's adoption of SPDX identifiers for
license metadata.

Richard

