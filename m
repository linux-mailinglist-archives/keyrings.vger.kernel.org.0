Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD462FE8DB
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 12:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbhAULdA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 Jan 2021 06:33:00 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:46908 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730485AbhAULcx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 21 Jan 2021 06:32:53 -0500
Received: by mail-io1-f44.google.com with SMTP id q2so3193522iow.13
        for <keyrings@vger.kernel.org>; Thu, 21 Jan 2021 03:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DCSPKSO0qO+HqH6iIXAB4om+Gpo/bgKdgHRfF6iT1sY=;
        b=aPhdIEeS4WvcFX0G+oEAv94I7Stj8ayYUns+CGOytLh1SzGDGlx6ju69zzzMJ+Qea9
         bKbZHXYxFxslIRxQkkdThpqiAinWHNmVMWfOcy2oB2nBAg8eDVyxpXDeVcsj+IE/XAFD
         khq+E0rvu3L1FiCZ62hHOlar+HldCFyF00rz//TyMnx9ZWg1O7bBeht1Sbn4qQcU37iz
         2eDydPHdeu7kUJ025d3PlGp4qBDARsTuRKlePcVOpC8GGIEhb6NhVY/E3AitJskczhVY
         myvH75SvbES7r6u9V0pkc7OzqUIj8hyYTXaK/cvqtqSjVDvFYDWiTWCUR1nFQg73ELOn
         2h2w==
X-Gm-Message-State: AOAM531xuj+xQ4aEwZrWVR1Jxy6ns/0CGKj10VVD+MTbO0GkmsjQfGPB
        fS9otZo3TlpLEkW0caq8JaUg/JCLe7sW+g==
X-Google-Smtp-Source: ABdhPJw0xEdKCPq0n8JYsLHWWzeMvt5/Xyt9FaMNGAw6RBV3QjwwRy6eY0/1Yk9gJxJskKCzGbd/Bg==
X-Received: by 2002:a6b:7f45:: with SMTP id m5mr10103839ioq.180.1611228731807;
        Thu, 21 Jan 2021 03:32:11 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id f9sm2777214ilu.36.2021.01.21.03.32.11
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 03:32:11 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id z22so3245811ioh.9
        for <keyrings@vger.kernel.org>; Thu, 21 Jan 2021 03:32:11 -0800 (PST)
X-Received: by 2002:a02:a58d:: with SMTP id b13mr11406307jam.115.1611228731035;
 Thu, 21 Jan 2021 03:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20210114204035.2046219-1-andrew.zaborowski@intel.com>
 <YAFQBT/pKw4PDenV@kernel.org> <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
 <YAeNa6vqLGLfTRbw@kernel.org>
In-Reply-To: <YAeNa6vqLGLfTRbw@kernel.org>
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
Date:   Thu, 21 Jan 2021 12:31:59 +0100
X-Gmail-Original-Message-ID: <CAOq732KJMWRED1Zz3ZR-7=KAJMKGseKA2r0a97prNFCbB1K+DQ@mail.gmail.com>
Message-ID: <CAOq732KJMWRED1Zz3ZR-7=KAJMKGseKA2r0a97prNFCbB1K+DQ@mail.gmail.com>
Subject: Re: [PATCH v2] keys: X.509 public key issuer lookup without AKID
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 20 Jan 2021 at 02:57, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Fri, Jan 15, 2021 at 11:40:18AM +0100, Andrew Zaborowski wrote:
> > Note: asymmetric_match_key_ids can be used as part of a generic key
> > API query, or as part of a find_asymmetric_key call (only used in
> > crypto/asymmetric_keys/ for trust verification and similar) but
> > find_asymmetric_key will then perform an extra check.  In any case
> > without more background I think it's preferable to minimize the
> > matching logic changes, and even assuming that the logic could be
> > improved it may be best to keep it as is because existing tools may
> > rely on it.
>
> You could give a couple of usage examples, by using this cert
>
> https://letsencrypt.org/docs/certificates-for-localhost/
>
> That is good information to store in the commit log for future and
> also works as a tested-by criteria.

Ok, resending the patch rebased on top of the BUG_ON fix (applied
locally) and adding the command line example.

Best regards
