Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8819368867
	for <lists+keyrings@lfdr.de>; Thu, 22 Apr 2021 23:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239574AbhDVVET (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Apr 2021 17:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239483AbhDVVES (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 22 Apr 2021 17:04:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019A0C06174A
        for <keyrings@vger.kernel.org>; Thu, 22 Apr 2021 14:03:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g8so74346352lfv.12
        for <keyrings@vger.kernel.org>; Thu, 22 Apr 2021 14:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aAJ3wIqxiqvlLWO7wV14Gxdne6FOxL4p89moI9+JwaM=;
        b=Le2cwmRFqg0tNhBF8yyb98ti3+8Tx7DQ6AIZX+DqlqrvIOehpmd6KTW+o2YLvfmuIU
         HOWDpiEc9I7ZQR/qRq1IKWF1K8GAIFf5CtTKfR+sIs3GPl+8qla1Im8VX2+G8Ym6xJ9W
         jbFaNVnKN3/ziZLkZKOfJD/vRDjJPcHXcM284=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aAJ3wIqxiqvlLWO7wV14Gxdne6FOxL4p89moI9+JwaM=;
        b=fCXUahta6gGqlJ2nLLo9jGFpd4HD9KxOhnTOILLGmea9gBgdq9wJUuCS0V57eAn2nR
         Gy47Gj2LsOxSTUNVRO8hP8SduNXss29GNqHc8ENr6SoUi1cac7RW6Mor2YVoWPuJJynl
         yu/K/gZctR/1lb3g2RvBNgOwUxaabBVBa5EAF21jLWXipWswlwk6TOwVQuYQJc+dpXIn
         PiRKbCJapbVfd5EZj6ndLZbwY6GrpYUA3zfq6Pl2HHKF/bm7q9LF5YmyapNfhmrvIm4H
         Pvx84yYUfV4KJ1flE3NPMowXq2Fg5ra4FXiUBdDxQKeyfp4SWj61AE6SeObwBSBPYorb
         pi2Q==
X-Gm-Message-State: AOAM5327Sd0Wt8Mdx7ovlZMkGo1r91eKkyqnxfti9C3/GT/Kf+/2erjT
        o0vcR4zBQ6PprywDldLr75cGHrAgZwtLDNLo
X-Google-Smtp-Source: ABdhPJysYWWl8K+R2fZTDbaS7Wl/g1XjpSSeEWhk9i3e0Im2STTnZF8zSPwuCjOITVjXYsdSnmYfTQ==
X-Received: by 2002:ac2:4e84:: with SMTP id o4mr180249lfr.557.1619125421205;
        Thu, 22 Apr 2021 14:03:41 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id h12sm378437ljh.21.2021.04.22.14.03.40
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 14:03:40 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id x19so43914840lfa.2
        for <keyrings@vger.kernel.org>; Thu, 22 Apr 2021 14:03:40 -0700 (PDT)
X-Received: by 2002:a05:6512:3763:: with SMTP id z3mr178740lft.487.1619125419929;
 Thu, 22 Apr 2021 14:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <3315246e429b385bbd08c8a509843e99dcc829e3.camel@HansenPartnership.com>
In-Reply-To: <3315246e429b385bbd08c8a509843e99dcc829e3.camel@HansenPartnership.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Apr 2021 14:03:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLnjAaiXfbdNLtJYYyNLyp-Sz2_4XbfjTzKW7M8jzb3Q@mail.gmail.com>
Message-ID: <CAHk-=wjLnjAaiXfbdNLtJYYyNLyp-Sz2_4XbfjTzKW7M8jzb3Q@mail.gmail.com>
Subject: Re: [GIT PULL] KEYS: trusted fixes for 5.12-rc7
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Apr 22, 2021 at 1:26 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> I'm sending this in agreement with Mimi (as joint maintainers of
> trusted keys) because Jarkko is off communing with the Reindeer or
> whatever it is Finns do when on holiday.

"Communing with Reindeer" is unlikely except possibly as a euphemism
for "drinking".

The traditional Finnish thing would be to go to a small cottage by a
lake ("m=C3=B6kki") and relax while fishing, going to the sauna, and just
getting away from it all.

But whether that's what Jarkko does, who knows? It's not quite the
season for lake cottages yet - April in Finland is not generally the
most pleasant weather...

Pulled.

          Linus
