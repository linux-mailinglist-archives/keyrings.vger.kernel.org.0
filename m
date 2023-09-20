Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A93F7A7D6F
	for <lists+keyrings@lfdr.de>; Wed, 20 Sep 2023 14:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbjITMJO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Sep 2023 08:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbjITMJM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Sep 2023 08:09:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF39E5
        for <keyrings@vger.kernel.org>; Wed, 20 Sep 2023 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695211702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9gjTDHVASAKCokWMOtiChMaZbc6RktsbuYFIDgKDVpo=;
        b=BKxbzL9FaiAJapTF5bzD7IQ678Umf/xe70t8O22gDwMFxLHjVR2v2ccGJjX3JuSBAFsoFT
        YadroJTFgGTqaxD8V2qBFKeGKAHCzn1j39Pp4KoPVHQZZi69i0EMpjkRCx/S/ZMcAdwPXl
        QgwzHxReph+ZN5LAIJoi27ffUJcdJbk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-Yqhb5mmcOTCuCmSnA4Kkfg-1; Wed, 20 Sep 2023 08:08:21 -0400
X-MC-Unique: Yqhb5mmcOTCuCmSnA4Kkfg-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-35002db700dso620205ab.0
        for <keyrings@vger.kernel.org>; Wed, 20 Sep 2023 05:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695211699; x=1695816499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gjTDHVASAKCokWMOtiChMaZbc6RktsbuYFIDgKDVpo=;
        b=AcbmjKY+Qa7S9wErWe2H/IwUVTXOdvgLBtrDZ7jqxuybr5xEND5KlzpxvHZ3KI3ZKX
         bHyujeDKfgPceRAxM1xGw49KnYczvBfUV6Fj2+XnZcM6SJXIuEfADehxfECpRxNt+/f6
         oQMPUmlro3tcDaUu9D9yqDLXaHOf2tKe/2ZO8/oWpd8i/RJST3EYjHXl7t1gZuA0gx9R
         auKnl8h+VCkTx64nXFrvxxqfC44V+60mNFBpr7+u3KRyOHTSop8r3Y76v9aPeKEIdcbK
         SZqwEmDRmKze2AT1KsBpEpORJABYcwMHJ3JUFY6pjHk2YES0TWo3b5YtWVjnT+lfOl+m
         snuA==
X-Gm-Message-State: AOJu0YwIPAjK+KuJ4q6eps+NTpQiITKgRZs/N2vkcoS3rdjOZJLDXunk
        q2hzbQuZgY6yPLbv+4E/67YSQAM3Zmu21bJLRHciFF5eYKrUt4TfeXlaaspX9iPB1/+UTZh9PH3
        6ipvEsga7MMu4XDlb5Nzx8tawhNgM1fjVHcs=
X-Received: by 2002:a92:d58d:0:b0:34c:d535:9f9d with SMTP id a13-20020a92d58d000000b0034cd5359f9dmr2779635iln.1.1695211699045;
        Wed, 20 Sep 2023 05:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEndobUX1kqTE6fsmuTy1rK/EW3Xe3ZPyXIJ4TN3BgZiZSImYUMvuETvHMY+D4sdfIqWtrCxyByQJkrBu0Nu0k=
X-Received: by 2002:a92:d58d:0:b0:34c:d535:9f9d with SMTP id
 a13-20020a92d58d000000b0034cd5359f9dmr2779602iln.1.1695211698772; Wed, 20 Sep
 2023 05:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230911052535.335770-1-kernel@jfarr.cc> <20230913160045.40d377f9@rotkaeppchen>
 <63952cb0-5217-42a8-9b62-8be6d03f5844@app.fastmail.com> <CALu+AoTAUWWtx8yChQMKF9J5X_Qd8+x0hz0jzVwoOvAvh5VmHA@mail.gmail.com>
 <CALu+AoRiok-bzM4OQbiix44O-PUgO2N6Yi+_qTOn4iWtk_u4cg@mail.gmail.com> <CAMj1kXFkQ+T9OjK6NkKjfyR8gW4EZKFw5rEk0rgrzkHyK2BNXQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFkQ+T9OjK6NkKjfyR8gW4EZKFw5rEk0rgrzkHyK2BNXQ@mail.gmail.com>
From:   Dave Young <dyoung@redhat.com>
Date:   Wed, 20 Sep 2023 20:07:58 +0800
Message-ID: <CALu+AoTwqL3y=NhojN2Sb=Ms33id9Nco9QU8JccFrJ_nza5jAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] x86/kexec: UKI Support
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Jan Hendrik Farr <kernel@jfarr.cc>,
        Philipp Rudo <prudo@redhat.com>, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, x86@kernel.org, tglx@linutronix.de,
        dhowells@redhat.com, vgoyal@redhat.com, keyrings@vger.kernel.org,
        akpm@linux-foundation.org, Baoquan He <bhe@redhat.com>,
        bhelgaas@google.com, Luca Boccassi <bluca@debian.org>,
        lennart@poettering.net, "Liu, Pingfan" <piliu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 20 Sept 2023 at 18:50, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 20 Sept 2023 at 08:40, Dave Young <dyoung@redhat.com> wrote:
> >
> > On Wed, 20 Sept 2023 at 15:43, Dave Young <dyoung@redhat.com> wrote:
> > >
> > > > > In the end the only benefit this series brings is to extend the
> > > > > signature checking on the whole UKI except of just the kernel image.
> > > > > Everything else can also be done in user space. Compared to the
> > > > > problems described above this is a very small gain for me.
> > > >
> > > > Correct. That is the benefit of pulling the UKI apart in the
> > > > kernel. However having to sign the kernel inside the UKI defeats
> > > > the whole point.
> > >
> > >
> > > Pingfan added the zboot load support in kexec-tools, I know that he is
> > > trying to sign the zboot image and the inside kernel twice. So
> > > probably there are some common areas which can be discussed.
> > > Added Ard and Pingfan in cc.
> > > http://lists.infradead.org/pipermail/kexec/2023-August/027674.html
> > >
> >
> > Here is another thread of the initial try in kernel with a few more
> > options eg. some fake efi service helpers.
> > https://lore.kernel.org/linux-arm-kernel/ZBvKSis+dfnqa+Vz@piliu.users.ipa.redhat.com/T/#m42abb0ad3c10126b8b3bfae8a596deb707d6f76e
> >
>

Ard, thanks for the comments.

> Currently, UKI's external interface is defined in terms of EFI
> services, i.e., it is an executable PE/COFF binary that encapsulates
> all the logic that performs the unpacking of the individual sections,
> and loads the kernel as a PE/COFF binary as well (i.e., via
> LoadImage/StartImage)
>
> As soon as we add support to Linux to unpack a UKI and boot the
> encapsulated kernel using a boot protocol other than EFI, we are
> painting ourselves into a corner, severely limiting the freedom of the
> UKI effort to make changes to the interfaces that were implementation
> details up to this point.

Agreed, it seems UKI is more flexible and complex than the zboot,
we do need to carefully think about a better solution.

>
> It also means that UKI handling in kexec will need to be taught about
> every individual architecture again, which is something we are trying
> to avoid with EFI support in general. Breaking the abstraction like
> this lets the cat out of the bag, and will add yet another variation
> of kexec that we will need to support and maintain forever.
>
> So the only way to do this properly and portably is to implement the
> minimal set of EFI boot services [0] that Linux actually needs to run
> its EFI stub (which is mostly identical to the set that UKI relies on
> afaict), and expose them to the kexec image as it is being loaded.
> This is not as bad as it sounds - I have some Rust code that could be
> used as an inspiration [1] and which could be reused and shared
> between architectures.

Great!

>
> This would also reduce/remove the need for a purgatory: loading a EFI
> binary in this way would run it up to the point were it calls
> ExitBootServices(), and the actual kexec would invoke the image as if
> it was returning from ExitBootServices().
>
> The only fundamental problem here is the need to allocate large chunks
> of physical memory, which would need some kind of CMA support, I
> imagine?

Hmm, I thought that your idea is to write the efi stub code in "purgatory"
so kexec can jump to it while rebooting then it will be able to access the
whole usable memory, but it seems you want an efi app run under linux
and somehow provide services to kexec?  My EFI knowledge is incomplete
and outdated,  If my understanding of your proposal is true how can it keep
running after switching to the new kernel stub?

>
> Maybe we should do a BoF at LPC to discuss this further?

It does deserve more discussion, unfortunately I will not be able to join LPC,
Philipp Rudo (cced) planned attend the conf, so I think you guys can
discuss together with
other people interested. I think I will watch the recordings or
joining virtually if possible.

>
> [0] this is not as bad as it sounds: beyond a protocol database, a
> heap allocator and a memory map, there is actually very little needed
> to boot Linux via the EFI stub (although UKI needs
> LoadImage/StartImage as well)
>
> [1] https://github.com/ardbiesheuvel/efilite
>

