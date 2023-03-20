Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB63E6C20B6
	for <lists+keyrings@lfdr.de>; Mon, 20 Mar 2023 20:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjCTTC4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 20 Mar 2023 15:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjCTTCb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 20 Mar 2023 15:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A51811168
        for <keyrings@vger.kernel.org>; Mon, 20 Mar 2023 11:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679338371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Kv0uRYSpiY62UMD7L05z1f9N9eeNQrQl69d1BDZim0=;
        b=Cg98MIw8lu4jI92wSR63M+0vh4HvQ8/SaVhDjFuxNeK/RpISGz6QZlTpcW3X5EWjwqj4IO
        63/0pk6Pphjjkbc07nPVRWAAWRAKhMgy6dCDdMJyM89VjMuIgtrzD6c2B61QTHe41e5e9U
        Bf7rDHWoOu0UUPi5ZtaYA4X+uqXTv+E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-XLfIXWcCNt2iFTDb1BwUoQ-1; Mon, 20 Mar 2023 14:52:50 -0400
X-MC-Unique: XLfIXWcCNt2iFTDb1BwUoQ-1
Received: by mail-qv1-f71.google.com with SMTP id l18-20020ad44bd2000000b005a9cf5f609eso6557025qvw.15
        for <keyrings@vger.kernel.org>; Mon, 20 Mar 2023 11:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679338365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Kv0uRYSpiY62UMD7L05z1f9N9eeNQrQl69d1BDZim0=;
        b=UHY5rd77gM6kG73ywH4NQiVsCJZ/ZWSNDBpIzMXsOsvKLnR57XzMoRPhK+9tota93n
         jxLIQslt51BWLf57cehrRVtZZE7ZXkbor9TkgADlPfK5rkiMMi4pC0alAfudYViPjNYj
         pyXGjnRASDsdr/HFxPraCOAVvy/9nxghE+M6RAIb3sulQf60zLGCDvd89h1do3XxKgfX
         hUJcTLvQDqxfFMpsFt0A/bKmFsEsQQ3L08rXvV/Oi+4UcclWLrA74n7wHOi/hzArZh8l
         GSA1geElhP56myRkzB8Gmu3qWlrEXEvyrLIWQN3Gbcbnf2f4TcBg1lYXL2MSiitHi4O1
         xOkg==
X-Gm-Message-State: AO0yUKWjnj0wl9R3cgOOJH1Xp1NY2SqKe5dbSzFVkjif5yxQkp9qTNhp
        8K1KfFVqmgxI7sX6xtSm8G+XwHW25/naFGu9J4q3giPz+ccabMyK+RBAUYPmyjteVOGQbeIWkA9
        V5hLGmcqEcu7WJiGBCOg1ZeTJcMaHbOKBYf3TYX9C6JkD6g==
X-Received: by 2002:a05:622a:190b:b0:3bf:c33e:93a9 with SMTP id w11-20020a05622a190b00b003bfc33e93a9mr110858qtc.1.1679338365831;
        Mon, 20 Mar 2023 11:52:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set/hinzICRKIzgKU9IkGF11NqZu7I9ioHL904zgV6R0i3x/c9brupv5LVWZRJJWTbrECG7Rm5wynlQWseylwi4I=
X-Received: by 2002:a05:622a:190b:b0:3bf:c33e:93a9 with SMTP id
 w11-20020a05622a190b00b003bfc33e93a9mr110836qtc.1.1679338365619; Mon, 20 Mar
 2023 11:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220510110444.14192-1-vdronov@redhat.com> <2011814.1679330584@warthog.procyon.org.uk>
In-Reply-To: <2011814.1679330584@warthog.procyon.org.uk>
From:   Vladis Dronov <vdronov@redhat.com>
Date:   Mon, 20 Mar 2023 19:52:34 +0100
Message-ID: <CAMusb+S9u1pHFduq43aYjeOiMqxN_rbP1=Gdr8PCMN+PGyb_GQ@mail.gmail.com>
Subject: Re: [PATCH] man: fix a formatting on the keyctl.1 man page
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 20, 2023 at 5:43=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> Vladis Dronov <vdronov@redhat.com> wrote:
>
> > Fix a formatting and a command output on
> > the keyctl.1 man page in a couple of places.
> >
> > Signed-off-by: Vladis Dronov <vdronov@redhat.com>
>
> Applied.

Thanks, David, most appreciated.

Best regards,
Vladis

