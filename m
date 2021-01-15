Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABF02F76EE
	for <lists+keyrings@lfdr.de>; Fri, 15 Jan 2021 11:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbhAOKp1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 05:45:27 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:46567 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbhAOKp0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 Jan 2021 05:45:26 -0500
Received: by mail-io1-f44.google.com with SMTP id q2so15568132iow.13
        for <keyrings@vger.kernel.org>; Fri, 15 Jan 2021 02:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9USFh6s5IAR4KhlrWURgbztiJsOxc8zRtPNE8ox1MPk=;
        b=NUEIJSyNAn/nmte/Iv0z4CMRnDquzldaUFblicjrrKJ7mqMbHnb/WWpjXMKKZMt1I3
         7SWuGlh/f0bjAiz3JDnvyexeD1X0UoHHkBg8lwH08w/93r7r6sStDdiD9nd6ls9fX8YH
         HK+9fMs1czhDq4wYbdoRUMkzW6TycpLqYop3ISGpCS+OhbQXjxnY8bhslxTgGqSKXMh2
         SdHC2bMmkpBF2Jlvxfddgzj4ADQoj3da64ZdIVYGmlJGUi6bPZWFTyaSXg48lfKPhq5Z
         X9DunQvREOlmDydLstLSgCVgnVJIZBdtue1aSuZeiM8dHCjLrrhKb9Fk6AQJnjo/49v4
         fV1w==
X-Gm-Message-State: AOAM532jwxIGg6ihkgZWFwD++D7xqZv4tIUYwUDK8mCUrKConPmymRtX
        MWsHu3TySefuEJJFMIbJs0b3+hZAjwWZxw==
X-Google-Smtp-Source: ABdhPJzWnv5fxPQCVL1GHd8lwgnr8LBmnTiZBTyOSq2mG7mOKMlndScjR/s94pTdgc3Y3P0K4NZ3Wg==
X-Received: by 2002:a92:ba82:: with SMTP id t2mr9982574ill.139.1610707486266;
        Fri, 15 Jan 2021 02:44:46 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id x22sm3765408ion.3.2021.01.15.02.44.45
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 02:44:45 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id q2so15568084iow.13
        for <keyrings@vger.kernel.org>; Fri, 15 Jan 2021 02:44:45 -0800 (PST)
X-Received: by 2002:a05:6e02:10cf:: with SMTP id s15mr2073950ilj.285.1610707485712;
 Fri, 15 Jan 2021 02:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20210114204035.2046219-1-andrew.zaborowski@intel.com>
 <YAFQBT/pKw4PDenV@kernel.org> <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
In-Reply-To: <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
Date:   Fri, 15 Jan 2021 11:44:34 +0100
X-Gmail-Original-Message-ID: <CAOq732LmvspqeGwWWM_qpxxR9oEs468ibHsON=nMk1BR6JBuZA@mail.gmail.com>
Message-ID: <CAOq732LmvspqeGwWWM_qpxxR9oEs468ibHsON=nMk1BR6JBuZA@mail.gmail.com>
Subject: Re: [PATCH v2] keys: X.509 public key issuer lookup without AKID
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 15 Jan 2021 at 11:40, Andrew Zaborowski
<andrew.zaborowski@intel.com> wrote:
> > Why are key ID 2 and key ID 3 handled differently? They are both
> > optional.
>
> This is to minimise the impact of having a new ID added.  I guess the
> danger is that it could add ambiguity in the lookup, i.e. a different
> key could be returned for an existing search query.
>
> There's a specific logic in how ID 1 and 2 interact documented as
> follows in restrict.c:
>
>                         * The first auth_id is the preferred id, and
>                         * the second is the fallback. If only one
>                         * auth_id is present, it may match against
>                         * either signer_id. If two auth_ids are
>                         * present, the first auth_id must match one
>                         * signer_id and the second auth_id must match
>                         * the second signer_id.
>
> I'm not sure what the use case motivates this.  For the
> x509_public_key subtype you'd expect that ID 1 in the signature
> matches subject ID 1 of the issuer and ID 2 matches ID 2.  Most of the
> time both will be present for a CA certificate.
>
> I imagine restrict.c only tries to mirror the logic that was already
> implemented in find_asymmetric_key when the restrict functions were
> added.
>
> For ID 2, only ever filled in by the x509_public_key subtype (right
> now), we only have any use for it being matched against the issuer's
> ID 2.

Sorry, I meant the new ID 3 here (ID 1 meaning auth_ids[0], and so on...)

Best regardds
