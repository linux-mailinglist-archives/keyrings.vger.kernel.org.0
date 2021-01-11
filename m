Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71622F1855
	for <lists+keyrings@lfdr.de>; Mon, 11 Jan 2021 15:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388138AbhAKO2u (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 11 Jan 2021 09:28:50 -0500
Received: from mail-il1-f170.google.com ([209.85.166.170]:45391 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731825AbhAKO2u (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 11 Jan 2021 09:28:50 -0500
Received: by mail-il1-f170.google.com with SMTP id y13so10596546ilm.12
        for <keyrings@vger.kernel.org>; Mon, 11 Jan 2021 06:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urvLsb9L49mfp3PF0a1r8JjbldyFMuOLnnJxY1+7vC0=;
        b=gIJcQrtwUu9JVKUNKHr2GunGnwBlvdVPxCCHXEKKvMrDoQ/UA9S5OM1ilZ183/O9Qr
         akLcfw6hURcbYXO3sWRPNqnjIh3GeWEKmTY3l0dqPrzemeI1LI6An6U+5nejlepRjAT4
         8FRIxJZCSeqLQK39kAfGUPq+iHPpD29vQwfrZW4bfQkH21Ds8U/Rhspxo45gbJ8eGOMd
         d0Hc/5ShG70w19C10Ojp7s4eS1QsVuEhkxxB+z9/uux8x8KpkU4bftD/mnot1t2nsw5G
         BHN6h/dMEsoehnWb5ZLMm7YFmWBPb7Es0gMqjP309PC3lTWppjH+z3OFOX6gh2vgYs8A
         6Auw==
X-Gm-Message-State: AOAM530YJuE2UCc8iVsrW6gzKBJM+FSVsWiVXDKWvAPHoE/fAbK3jdOm
        Wq9ywHddFF+kBrSJ7TBnzsXHBPCL8/Ay3g==
X-Google-Smtp-Source: ABdhPJzgZ0WVF2bLxFPN8Z21eSE3RfMKNY4iPof4AwimCUL92A7DDKnVP92QuuhmAdnuwIlXqiOJvA==
X-Received: by 2002:a05:6e02:1a47:: with SMTP id u7mr450216ilv.260.1610375289318;
        Mon, 11 Jan 2021 06:28:09 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id y3sm16026938ilc.2.2021.01.11.06.28.09
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 06:28:09 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id y13so10596504ilm.12
        for <keyrings@vger.kernel.org>; Mon, 11 Jan 2021 06:28:09 -0800 (PST)
X-Received: by 2002:a92:8495:: with SMTP id y21mr15301428ilk.55.1610375288886;
 Mon, 11 Jan 2021 06:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20210104164048.1378237-1-andrew.zaborowski@intel.com> <X/qGVSXVoTeEks/j@kernel.org>
In-Reply-To: <X/qGVSXVoTeEks/j@kernel.org>
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
Date:   Mon, 11 Jan 2021 15:27:57 +0100
X-Gmail-Original-Message-ID: <CAOq732LtM-_6LXw6F2RAB7NsJqEC_+1AHsCQ4h0qKZH1fKF3Ug@mail.gmail.com>
Message-ID: <CAOq732LtM-_6LXw6F2RAB7NsJqEC_+1AHsCQ4h0qKZH1fKF3Ug@mail.gmail.com>
Subject: Re: [PATCH][RESEND#15] keys: Handle missing Authority Key Identifier
 X509 extension
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On Sun, 10 Jan 2021 at 05:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Mon, Jan 04, 2021 at 05:40:47PM +0100, Andrew Zaborowski wrote:
> > In a self-signed certificate the subject and issuer are the same and so
> > the Authority Key Identifier X.509 v3 extension is explicitly made
> > optional in RFC5280 section 4.2.1.1.
> > crypto/asymmetric_keys/x509_cert_parser.c can't handle this and makes
> > (at least) the restrict.c functions refuse to work with certificates
> > that don't include the AKID.  Fix this by filling in the missing
> > cert->sig->auth_ids with the certificate's own IDs after parsing and
> > determinig the certificate is self-signed.
> >
> > The asymmetric_key_generate_id return value is not checked because it's
> > already succeeded once at this point.
> >
> > There are root X.509 v3 certificates in use where this is the case,
> > mostly oldish ones.
> >
> > Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> I'll take active role with these.

Great!

>
> I don't think that adding field data that does not exist is a great
> idea.
>
> I think that a more sane way to fix this issue, would be to add field
> 'self_signed' to 'struct public_key_signature', and remove the
> equivalent field from 'struct x509_certificate'.

Ok, that's also an option.  I went for directly adding the
cert->sig->auth_ids because the name ".auth_ids" only implies that it
contains the signing authority's key IDs, which is something that we
have and does exist in the input file.  The name doesn't imply that it
should specifically be in the AKID extension.  Similarly
x509_key_preparse even generates a key description even though a
description is not part of the x509 format.

>
> Minor updates are required to:
>
> - x509_check_for_self_signed()
> - pkcs7_verify_sig_chain()
>
> Then you can use then new field to refine the check in
> restrict_link_by_signature().

Ok.

Best regards
