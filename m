Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E40D8381
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2019 00:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731816AbfJOWVJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 15 Oct 2019 18:21:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41049 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730625AbfJOWVI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 15 Oct 2019 18:21:08 -0400
Received: by mail-lf1-f68.google.com with SMTP id r2so15701669lfn.8
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 15:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=igJfeABa6M5mmcDSZ9XAWyfxDlpeT34TBKS5Vu4WYQ8=;
        b=LIYdbK/WEFGMNdD+uIGw2BasCdPDikOSk/1C31c/6KJAoWeweWvBbkEnJF4PHN8TkH
         BgZdUCf/ZYXj115hlOqd/koyMkdZG6Il9yGalmukOiV4kTIOYCVZSlLQpLqR2NWtyVYg
         nGZ/n1OZmV0DBw+aQ4pzCSwYlzFEdDM+SUZEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=igJfeABa6M5mmcDSZ9XAWyfxDlpeT34TBKS5Vu4WYQ8=;
        b=OOqOQcLcMEZcIQjn76vADGFGiPaGDx2BZZf/8K7AXavMB5a2ZZwSB/r6ZAD5sfJNmq
         qebXt/9OxVdQ7lPniVbfUynKCNhE7u4NyZtEMVx9zGJc4BJj8d8UjpKOxYx1zce/k9Uj
         HunbxaNuSLuxQstek2GTIa9GwNRK/Veag4DmnSdcvpBAVS4Ha4z6V/cHl6wq2GMYgo3C
         Vj2ecOA8ShyjhGBfxEo+IwNmvr/oLZl26BorX6ej8X7EqOHLxP10by8bvp/+uEKsNhQW
         Fs8sOXp+Jo0yYJZ3lKtvttRh2EFzgbTUkjNGmNxzDtx1t+LEkTpJlmhRdjJt4AoXrpwi
         uxJw==
X-Gm-Message-State: APjAAAV3RFVUZklGSrhtv2/OpZSTMmbsf4kYq7yYPureuIJIVbCc1hXF
        e7lmLGEX9EbYd+FhncgIcdn6v7qVzRk=
X-Google-Smtp-Source: APXvYqx3NPl7MJ7K5dJxOiB8kbjdXNhxhuu0rtOf+WmuE9RJf1rIjPcryl1aERf+ADZGqkDBDppTiA==
X-Received: by 2002:ac2:4283:: with SMTP id m3mr2586598lfh.41.1571178064944;
        Tue, 15 Oct 2019 15:21:04 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id l7sm5288030lji.46.2019.10.15.15.21.03
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2019 15:21:03 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id u16so3151662lfq.3
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 15:21:03 -0700 (PDT)
X-Received: by 2002:ac2:43a8:: with SMTP id t8mr22573654lfl.134.1571178063150;
 Tue, 15 Oct 2019 15:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
 <157117614109.15019.15677943675625422728.stgit@warthog.procyon.org.uk>
In-Reply-To: <157117614109.15019.15677943675625422728.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Oct 2019 15:20:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivjB8Va7K_eK_fx+Z1vpbJ82DW=eVfyP33ZDusaK44EA@mail.gmail.com>
Message-ID: <CAHk-=wivjB8Va7K_eK_fx+Z1vpbJ82DW=eVfyP33ZDusaK44EA@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] pipe: Check for ring full inside of the
 spinlock in pipe_write()
To:     David Howells <dhowells@redhat.com>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 15, 2019 at 2:49 PM David Howells <dhowells@redhat.com> wrote:
>
> +                       if (head - pipe->tail == buffers) {

Can we just have helper inline functions for these things?

You describe them in the commit message of 03/21 (good), but it would
be even better if the code was just self-describing..

           Linus
