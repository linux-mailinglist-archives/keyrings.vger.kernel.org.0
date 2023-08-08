Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9E0774AE1
	for <lists+keyrings@lfdr.de>; Tue,  8 Aug 2023 22:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235070AbjHHUhf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Aug 2023 16:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbjHHUhU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Aug 2023 16:37:20 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AB54201
        for <keyrings@vger.kernel.org>; Tue,  8 Aug 2023 13:05:05 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-40c72caec5cso19311cf.0
        for <keyrings@vger.kernel.org>; Tue, 08 Aug 2023 13:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691525104; x=1692129904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Gse/n1KcESVWhM7B7IDywbevkkJ8BX6XkqzvAh2wo=;
        b=h8CiTiA6oKfcPqnb/eqNMeSqNLiCOaqNFez8+Yi+QiIgsfxaNoRzSX2cNlNFaBDTTe
         tzcRf8KweTwO0zkVmd/rgBAGEbu2QxslkUsoI3YKuQ6IqWcdhjcM1Ij9vyiToE4x9VfT
         WjgWRuvhRH5cmPucD+OlPbphWq27dCD4iHPYn024y85zR35FKQiCWbu4mc6zz3AJ9a57
         qIS7cMPDA3DxGRdBE7eeNwlJDeMPV1+k7IIiAM8cUuXFEjbsC8SWoJtzt8wYoBrUtmdg
         fVXf0+JpGrdKfe+NYxVBSFh8EjYp3eF+uYe+9nkdPwAYuwg7YXNlCBbEFxeZzAlmkBSQ
         l5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691525104; x=1692129904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3Gse/n1KcESVWhM7B7IDywbevkkJ8BX6XkqzvAh2wo=;
        b=gLq9TPXNzVaiVT4rBzT1bnOmyiPyvg1eZdVOivfR06Ny7Ji1gwqENNeoOSgSX+VCer
         xWLYdMpKe7ClcnSoWuvaukKUfbhKjZC+f0rzbPQP3xd7zJ2rfR+0vh+ejYlwWl6/VMVW
         uvsdUim5uJ8LEDT1ii44j+2uU3YMB0pHV/ISYrZb66pOdQnxAt9mXqq2KlbJ9Fev2chy
         tMgG4tftuQbgQxtoXg/c3VZxWmsImM9z9r7rhoUnrala9+l6JWmg6RJH4t3LQdc3Xqnt
         U2jsp6VDBpa8hTatI1TVTpJI+tDq2fxDP3WSiq8FnVAjRaQj9qFdtoV3X3kqAbV7uQc/
         WBbw==
X-Gm-Message-State: AOJu0YxJP/8KADVb2xKSHHJA6kc2w+dbvPf9IzKLcHBJ0S5oS8w5lOTZ
        wwMCrdu+2SfpnCnX0aTVbQwF84Y72PpFo4U0PTQ2IQ==
X-Google-Smtp-Source: AGHT+IGNBE6dFnyFADf1Zm7XSPB1CUPxxwK5Lk++7K/zWHyetI7bdc4dFgm5ZygS1qde1KTXi7lUYgHUEzLhJ2FPsoE=
X-Received: by 2002:ac8:5b85:0:b0:40f:d387:65d0 with SMTP id
 a5-20020ac85b85000000b0040fd38765d0mr82670qta.16.1691525104516; Tue, 08 Aug
 2023 13:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch>
 <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
 <2425e00b-defb-c12b-03e5-c3d23b30be01@linux.intel.com> <64d263e44e401_2138e29486@dwillia2-xfh.jf.intel.com.notmuch>
 <CAAH4kHamob7g_+BRd0JW76cM7_vS=jzXzRjrgCPDxZ29VnzdCQ@mail.gmail.com>
 <f95d75c513c081d5bb8b5d1fd3b0a5d5e24ab467.camel@HansenPartnership.com>
 <CAAH4kHYJrKPgWXn7+G_sZXoAs8fq2sDEyT-tyECPthdaaoXyDw@mail.gmail.com> <9c9c62f9243595a1faa3b0745fa8a1f8f018d9b8.camel@HansenPartnership.com>
In-Reply-To: <9c9c62f9243595a1faa3b0745fa8a1f8f018d9b8.camel@HansenPartnership.com>
From:   Dionna Amalie Glaze <dionnaglaze@google.com>
Date:   Tue, 8 Aug 2023 13:04:53 -0700
Message-ID: <CAAH4kHYLPP5ehLBDkXxJQmnuFTjjRp+1tON5T9HqSxCvD1mSxA@mail.gmail.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>, dhowells@redhat.com,
        Brijesh Singh <brijesh.singh@amd.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Samuel Ortiz <sameo@rivosinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-coco@lists.linux.dev, keyrings@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

> Trusting the vTPM is a one time thing.  Once trust in the TPM is
> established, you don't need to be worried about replay and you can just
> use standard TPM primitives for everything onward, even when doing
> point in time runtime attestation.
>

It's a one time thing for who? It seems like you're still only looking
at the 1. use case and not the 2. use case. Every different person
establishing a connection with the service will need to independently
establish trust in the TPM.


-- 
-Dionna Glaze, PhD (she/her)
