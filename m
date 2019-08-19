Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 749B594AB4
	for <lists+keyrings@lfdr.de>; Mon, 19 Aug 2019 18:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfHSQov (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 19 Aug 2019 12:44:51 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34885 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfHSQou (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 19 Aug 2019 12:44:50 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so1890751lfa.2
        for <keyrings@vger.kernel.org>; Mon, 19 Aug 2019 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTgEEhnQW7rA7Swk7XmZoE/TVWKiM/rYLloBH44I1Y4=;
        b=HXYiO3uvFIJxP8AzLPiB1vCojk2HYF1PHjHSec/oU/g4xnNPfhabSnJiKWyvKhdvPL
         PSTBApqcqrNATd12uSC/OSvm8TCRNPUsxfylRETL95enFuQ/shakvQqEAneNqGoKLzuq
         zpeeR8Q32NiN+R8GM+dAc/To+08EVo1OrugEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTgEEhnQW7rA7Swk7XmZoE/TVWKiM/rYLloBH44I1Y4=;
        b=DOJkd/yAjaSd9pqKUVDk4z1dPuqH9VhLqJ5Seh1e+DTakNWzFvmqO2PtUll61p5V8t
         whY8XPSVTCCI9yEEyMEwYsV9ZtaE2vnFJ+psHK2KGEwxSS9ARttXVpCTi8OrJjKUNMdL
         oGiSp+hkqqnrNLFINTgLhKJeFBazjTyIx5s7CEoTCm/BBenw30dyubu8LPVgoOLw8qVQ
         aqMoytqElluK40GGZQBoPiZ/AVL/0SwgAaiLRrBMjeC88qRxwb2+5fYYBo+wBkwCp1YF
         zLwPgxNE+il27b+Dafx4cv6WtYi2JZBqmKeJExNv+DnTLimnz0padJxtXHUfouushKvb
         smdQ==
X-Gm-Message-State: APjAAAWC2lqbw6k2eQYkFm7qvsBnXvUvUyifq/xmgyhIonojzvWhy/A5
        5uVgRBmoLawYe8nvFXqwug2ZUkubw6s=
X-Google-Smtp-Source: APXvYqxDhyWxrsA8QkNKOEPqUyQA4EaO46iz1V4YLyQk3mHpb+xibo8PeWu9IRuTvJRbz0TpnmCFAw==
X-Received: by 2002:a19:4c88:: with SMTP id z130mr12913294lfa.149.1566233088147;
        Mon, 19 Aug 2019 09:44:48 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id a20sm2386656ljk.34.2019.08.19.09.44.47
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2019 09:44:47 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id z17so2406018ljz.0
        for <keyrings@vger.kernel.org>; Mon, 19 Aug 2019 09:44:47 -0700 (PDT)
X-Received: by 2002:a2e:88c7:: with SMTP id a7mr11508843ljk.72.1566233086820;
 Mon, 19 Aug 2019 09:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <156622692131.21558.12335114959426121841.stgit@warthog.procyon.org.uk>
In-Reply-To: <156622692131.21558.12335114959426121841.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Aug 2019 09:44:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP7j+vzthU+wokF-PfR-CtA1YnwT6tYeNO9HK1KWUpiQ@mail.gmail.com>
Message-ID: <CAHk-=wiP7j+vzthU+wokF-PfR-CtA1YnwT6tYeNO9HK1KWUpiQ@mail.gmail.com>
Subject: Re: [PATCH] keys: Fix description size
To:     David Howells <dhowells@redhat.com>
Cc:     kernel test robot <rong.a.chen@intel.com>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Aug 19, 2019 at 8:02 AM David Howells <dhowells@redhat.com> wrote:
>
> This can be fixed by simply increasing the size of desc_len in struct
> keyring_index_key to a u16.

Thanks, applied.

              Linus
