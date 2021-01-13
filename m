Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CC82F4D25
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 15:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbhAMOcG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 09:32:06 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]:46971 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAMOcG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jan 2021 09:32:06 -0500
Received: by mail-qk1-f171.google.com with SMTP id d14so1667362qkc.13
        for <keyrings@vger.kernel.org>; Wed, 13 Jan 2021 06:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h44jr+QZ7jrVl5XJQGCGGXZkye/5BiPXfGImPI5e+ok=;
        b=fy9XoUk3rdu30H7otz81QGKt60zGmlAzByJ/nlSauyDSH60tJIdW1jNKjma0vnW8gI
         HQskJIRIbK62cZMOUZDr9KMNsNUHdDI31tGM441kK9XdbxeIAaB5ZWMNAcyNEX0dbVRr
         MuV55yOL0FYHdgzjLNTunp8a1g7g0mmPaMo7KvAgthPaNcWbPJk5TFIsRKsB2FVFnu8X
         MFep3yuceL3XWdQwkEOZIRuJovwl1cUPDd7NN73oiWJvb3DHQd/CdSRMxHDyyaDczrqt
         4VrPl/TukPnE/EdHFhh6w2EEwURDWW3KJRS/nmwuJs5x3PVkOlWslxJfGGGM0FHpZ611
         k8AA==
X-Gm-Message-State: AOAM530jCIdWbrnEaJ3xoe94d7d94AiM/cV5hbyDuUxjKXL6OVtw5jbP
        csdxGO86Pl2QkPjgPxIcByNhN8Hpgkw=
X-Google-Smtp-Source: ABdhPJyv9FIWe8cbQNALqpPKeqQu5QN4g/rL2CX5dirP55nNaUStW/z7V8PPgLenGncIIDrK3ALkxQ==
X-Received: by 2002:a05:620a:673:: with SMTP id a19mr2225779qkh.353.1610548285427;
        Wed, 13 Jan 2021 06:31:25 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id g26sm1093170qka.76.2021.01.13.06.31.24
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 06:31:25 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id 19so1682336qkm.8
        for <keyrings@vger.kernel.org>; Wed, 13 Jan 2021 06:31:24 -0800 (PST)
X-Received: by 2002:ae9:e517:: with SMTP id w23mr2354957qkf.34.1610548275668;
 Wed, 13 Jan 2021 06:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
 <X/qGVSXVoTeEks/j@kernel.org> <CAOq732LtM-_6LXw6F2RAB7NsJqEC_+1AHsCQ4h0qKZH1fKF3Ug@mail.gmail.com>
 <X/z+Gh54yOXsZieb@kernel.org>
In-Reply-To: <X/z+Gh54yOXsZieb@kernel.org>
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
Date:   Wed, 13 Jan 2021 15:31:04 +0100
X-Gmail-Original-Message-ID: <CAOq732LXcYQ2TpqunHzL0ZYy77X=BAJOotTvh--zf=UD9qdCnw@mail.gmail.com>
Message-ID: <CAOq732LXcYQ2TpqunHzL0ZYy77X=BAJOotTvh--zf=UD9qdCnw@mail.gmail.com>
Subject: Re: [PATCH][RESEND#15] keys: Handle missing Authority Key Identifier
 X509 extension
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 12 Jan 2021 at 02:41, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Mon, Jan 11, 2021 at 03:27:57PM +0100, Andrew Zaborowski wrote:
> > On Sun, 10 Jan 2021 at 05:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > I think that a more sane way to fix this issue, would be to add field
> > > 'self_signed' to 'struct public_key_signature', and remove the
> > > equivalent field from 'struct x509_certificate'.
> >
> > Ok, that's also an option.  I went for directly adding the
> > cert->sig->auth_ids because the name ".auth_ids" only implies that it
> > contains the signing authority's key IDs, which is something that we
> > have and does exist in the input file.  The name doesn't imply that it
> > should specifically be in the AKID extension.  Similarly
> > x509_key_preparse even generates a key description even though a
> > description is not part of the x509 format.
> >
> > >
> > > Minor updates are required to:
> > >
> > > - x509_check_for_self_signed()
> > > - pkcs7_verify_sig_chain()
> > >
> > > Then you can use then new field to refine the check in
> > > restrict_link_by_signature().

I decided to try supporting key lookups without the AKID extension
first, as I proposed in
https://marc.info/?l=linux-keyrings&m=158621913606374&w=2 , because
this would make the new sig->self_signed field obsolete.  It's a just
slightly bigger change but fixes verification for a bigger set of
certificates that are in use.

If there are arguments against it then I'm going to send a patch to
add a sig->self_signed as you suggested.

Many thanks
