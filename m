Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E200F773DED
	for <lists+keyrings@lfdr.de>; Tue,  8 Aug 2023 18:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjHHQYO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Aug 2023 12:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjHHQW5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Aug 2023 12:22:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9668A274
        for <keyrings@vger.kernel.org>; Tue,  8 Aug 2023 08:49:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f14865fcc0so2760e87.0
        for <keyrings@vger.kernel.org>; Tue, 08 Aug 2023 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691509771; x=1692114571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYFtx4ud5fCrvWexAI48MPArlVJb6tLM8jICYj1zTuc=;
        b=DK04zHCRIe33ca0ssupfP+aFjdlhr/YppmrM2di0x9aNEQNCIVZp/p7QGyaxIYUxR+
         YwQ/itfwahkuF4AcriVwZuL6py0ltTabtGj4c7Y1fHS1afETdfBpgpinKu2HdxgYnHfY
         F76YjgFxAf1bKkqF0Nvb/ZATZ/KfeRG5MP4ZmvLYOQONsetWStJ3tGusUt3lzK60ViPE
         dYXZUI1fj//NJQkdTSC8hAE5XEIHdCnKL+/TGOmZxNUC+SXANbu3L2BT4xNjow+BYVNJ
         3gwgCu015IfWvs0p77VWHqvB5kYOosdnhIKB0MIpOj0Rr9x7iYWTzUzpcx3cWXtUpatT
         gUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509771; x=1692114571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYFtx4ud5fCrvWexAI48MPArlVJb6tLM8jICYj1zTuc=;
        b=Ou60AF+YgxKy1IaRJrNbVwX05LSZFWyILAesiJisM4K7v+WHtq4dI8c35jme6Ey92I
         oyX5h5Gx2y9EsJdS9HtVqwvj4tdxaekRnT84t/hP8IbDkd7s+PVW5Rbsev/lxD7Naabh
         sB/lUPnIyzOzRA6vW2X4XiqJ/I9m02qgDEzEsHMg1NzoUAPtpMhvi6gDrSZUcum5aRO0
         vbtF3fWzCivT59vUZO2BZ+0/2k5Xy96GsPkhZk+idqabeRsEQjHMLChhVKFYxY50iNoN
         HFYolf7LTdKr8i6+40nO3J9Pg1dWpn69lXVnDCfR+Q5o7h7zOkqcI7j+GAT7fE7O45+g
         8Nkw==
X-Gm-Message-State: AOJu0YyFafWnLFCZMae1AFX5ClF/qdFnGEPddjmHpAZJ2yyd1DDIilxm
        cWNA8HrcQHCb4GPDm4XaS+UZMmMhBkUEy669pMU5TPWJfPjOoHccy8yyNemc
X-Google-Smtp-Source: AGHT+IHXofmTgeoT9iEjMO8JFm6sbPvTIzEx7RL9riM6LfIxs3FGlE/MJkc4/QP6ZasO18twdmBYNvWNMUhDdDxpilQ=
X-Received: by 2002:ac2:4a74:0:b0:4fe:3fb3:902d with SMTP id
 q20-20020ac24a74000000b004fe3fb3902dmr257035lfp.5.1691506444373; Tue, 08 Aug
 2023 07:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
 <a507ef3302d3afff58d82528ee17e82df1f21de0.camel@HansenPartnership.com>
 <64c5ed6eb4ca1_a88b2942a@dwillia2-xfh.jf.intel.com.notmuch>
 <c6576d1682b576ba47556478a98f397ed518a177.camel@HansenPartnership.com>
 <64cdb5f25c56_2138e294f1@dwillia2-xfh.jf.intel.com.notmuch>
 <1180481830431165d49c5e64b92b81c396ebc9b1.camel@HansenPartnership.com>
 <64d17f5728fbc_5ea6e2943f@dwillia2-xfh.jf.intel.com.notmuch> <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
In-Reply-To: <c7d6e953a4b36014ea0c7406531b24bb29d6127e.camel@HansenPartnership.com>
From:   Peter Gonda <pgonda@google.com>
Date:   Tue, 8 Aug 2023 08:53:52 -0600
Message-ID: <CAMkAt6q6iysxdDKphp4W2mVM_pn8kd5YRTAAQi+ck2xQ_SFYag@mail.gmail.com>
Subject: Re: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dhowells@redhat.com,
        Brijesh Singh <brijesh.singh@amd.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Dionna Amalie Glaze <dionnaglaze@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Samuel Ortiz <sameo@rivosinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-coco@lists.linux.dev, keyrings@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 8, 2023 at 8:19=E2=80=AFAM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2023-08-07 at 16:33 -0700, Dan Williams wrote:
> > James Bottomley wrote:
> > > On Fri, 2023-08-04 at 19:37 -0700, Dan Williams wrote:
> > > > James Bottomley wrote:
> > > > [..]
> > > > > > This report interface on the other hand just needs a single
> > > > > > ABI to retrieve all these vendor formats (until industry
> > > > > > standardization steps in) and it needs to be flexible (within
> > > > > > reason) for all the TSM-specific options to be conveyed. I do
> > > > > > not trust my ioctl ABI minefield avoidance skills to get that
> > > > > > right. Key blob instantiation feels up to the task.
> > > > >
> > > > > To repeat: there's nothing keylike about it.
> > > >
> > > > From that perspective there's nothing keylike about user-keys
> > > > either.
> > >
> > > Whataboutism may be popular in politics at the moment, but it
> > > shouldn't be a justification for API abuse: Just because you might
> > > be able to argue something else is an abuse of an API doesn't give
> > > you the right to abuse it further.
> >
> > That appears to be the disagreement, that the "user" key type is an
> > abuse of the keyctl subsystem. Is that the general consensus that it
> > was added as a mistake that is not be repeated?
>
> I didn't say anything about your assertion, just that you seemed to be
> trying to argue it.  However, if you look at the properties of keys:
>
> https://www.kernel.org/doc/html/v5.0/security/keys/core.html
>
> You'll see that none of them really applies to the case you're trying
> to add.
>
> > Otherwise there is significant amount of thought that has gone into
> > keyctl including quotas, permissions, and instantiation flows.
> >
> >
> > > > Those are just blobs that userspace gets to define how they are
> > > > used and the keyring is just a transport. I also think that this
> > > > interface *is* key-like in that it is used in the flow of
> > > > requesting other key material. The ability to set policy on who
> > > > can request and instantiate these pre-requisite reports can be
> > > > controlled by request-key policy.
> > >
> > > I thought we agreed back here:
> > >
> > > https://lore.kernel.org/linux-coco/64c5ed6eb4ca1_a88b2942a@dwillia2-x=
fh.jf.intel.com.notmuch/
> > >
> > > That it ended up as "just a transport interface".  Has something
> > > changed that?
> >
> > This feedback cast doubt on the assumption that attestation reports
> > are infrequently generated:
> >
> > http://lore.kernel.org/r/CAAH4kHbsFbzL=3D0gn71qq1-1kL398jiS2rd3as1qUFnL=
TCB5mHQ@mail.gmail.com
>
> Well, I just read attestation would be called more than once at boot.
> That doesn't necessarily require a concurrent interface.
>
> > Now, the kernel is within its rights to weigh in on that question
> > with an ABI that is awkward for that use case, or it can decide up
> > front that sysfs is not built for transactions.
>
> I thought pretty much everyone agreed sysfs isn't really transactional.
> However, if the frequency of use of this is low enough, CC attestation
> doesn't need to be transactional either.  All you need is the ability
> to look at the inputs and outputs and to specify new ones if required.
> Sysfs works for this provided two entities don't want to supply inputs
> at the same time.
>
> > > [...]
> > > > > Sneaking it in as a one-off is the wrong way to proceed
> > > > > on something like this.
> > > >
> > > > Where is the sneaking in cc'ing all the relevant maintainers of
> > > > the keyring subsystem and their mailing list? Yes, please add
> > > > others to the cc.
> > >
> > > I was thinking more using the term pubkey in the text about
> > > something that is more like a nonce:
> > >
> > > https://lore.kernel.org/linux-coco/169057265801.180586.10867293237672=
839356.stgit@dwillia2-xfh.jf.intel.com/
> > >
> > > That looked to me designed to convince the casual observer that
> > > keys were involved.
> >
> > Ok, I see where you were going, at the same time I was trusting
> > keyrings@ community to ask about that detail and was unaware of any
> > advocacy against new key types.
>
> I'm not advocating against new key types.  I'm saying what you're
> proposing is simply a data transport layer and, as such, has no
> properties that really make it a key type.
>
> > > > The question for me at this point is whether a new:
> > > >
> > > >         /dev/tsmX
> > > >
> > > > ...ABI is worth inventing, or if a key-type is sufficient. To
> > > > Peter's concern, this key-type imposes no restrictions over what
> > > > sevguest already allows. New options are easy to add to the key
> > > > instantiation interface and I expect different vendors are likely
> > > > to develop workalike functionality to keep option proliferation
> > > > to a minimum. Unlike ioctl() there does not need to be as careful
> > > > planning about the binary format of the input payload for per
> > > > vendor options. Just add more tokens to the instantiation
> > > > command-line.

But given that on the other end of an attestation quote is an
attestation verifier. I would actually much prefer the ability to
carefully plan the binary format. Since that attestation verifier will
need to do so in any case.

> > >
> > > I still think this is pretty much an arbitrary transport interface.
> > > The question of how frequently it is used and how transactional it
> > > has to be depend on the use cases (which I think would bear further
> > > examination).  What you mostly want to do is create a transaction
> > > by adding parameters individually, kick it off and then read a set
> > > of results back.  Because the format of the inputs and outputs is
> > > highly specific to the architecture, the kernel shouldn't really be
> > > doing any inspection or modification.  For low volume single
> > > threaded use, this can easily be done by sysfs.  For high volume
> > > multi-threaded use, something like configfs or a generic keyctl
> > > like object transport interface would be more appropriate.
> > > However, if you think the latter, it should still be proposed as a
> > > new generic kernel to userspace transactional transport mechanism.
> >
> > Perhaps we can get more detail about the proposed high-volume use
> > case: Dionna, Peter?
>
> Well, that's why I asked for use cases.  I have one which is very low
> volume and single threaded.  I'm not sure what use case you have since
> you never outlined it and I see hints from Red Hat that they worry
> about concurrency.  So it's interface design 101: collect the use cases
> first.

I don't have a usecase in mind. I am just concerned with decisions
made here affecting the ability for CoCo users to come up with their
own use cases that might need high quote volume.

>
> > I think the minimum bar for ABI success here is that options are not
> > added without touching a common file that everyone can agree what the
> > option is, no more drivers/virt/coco/$vendor ABI isolation. If
> > concepts like VMPL and RTMR are going to have cross-vendor workalike
> > functionality one day then the kernel community picks one name for
> > shared concepts. The other criteria for success is that the frontend
> > needs no change when standardization arrives, assuming all vendors
> > get their optionality into that spec definition.

Since verifiers will need to understand each vendor's ABI to correctly
verify the quotes I am still not sure why having isolated drivers is a
bad thing.

>
> I don't think RTMR would ever be cross vendor.  It's sort of a cut down
> TPM with a limited number of PCRs.  Even Intel seems to be admitting
> this when they justified putting a vTPM into TDX at the OC3 Q and A
> session (no tools currently work with RTMRs and the TPM ecosystem is
> fairly solid, so using a vTPM instead of RTMRs gives us an industry
> standard workflow).

I'm not so sure about this statement. ARM's CCA already has Realm
Extendable Measurements (REMs) which seem to be exactly RTMRs in all
but name. Maybe we need a vendor agnostic term for these 'Measurement
Registers'? Since we now have 3 different vendors for them: CCA's REM,
TDX's RMTRs, TPM's PCRs.
