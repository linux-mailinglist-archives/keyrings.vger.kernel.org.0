Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8396EA2835
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfH2Ul3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:41:29 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35663 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Ul3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:41:29 -0400
Received: by mail-qk1-f195.google.com with SMTP id c189so2674556qkg.2
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QD/vjkbPkLhT/x7Isy/PLFSJHeh8T/M00d4LkGYBNnE=;
        b=ksd/U1zMHERVY2gBkw4DEaSIRVGloJzqkHAQjN80xy01mWp7m2YUNoaC+HYMKg2DBj
         POYumHol3tme8SMicIofoR5Ty/l15HrlUPb+nf+LnCO0spYSQXoSzYcdaEiE3bBswNiE
         y/d1Q+DGKx3EQSX9DibjRKlBzEQO+44BEGQalTiOioXEFnkTL1bheY7F7EVptjVhtc74
         JcG7rsGPU2jD5zsyYM98EQD7sHHYIPDxEp+ZC+u9QSn41je66qi+A6BBYi+ptk3p9yoV
         Lh+Q9r2izyHWQoDDHIZm7l3yS22W4jr/DNEJWzgZxUD4jHQPkQxjWdiKW40lOjeUIY5K
         znVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QD/vjkbPkLhT/x7Isy/PLFSJHeh8T/M00d4LkGYBNnE=;
        b=bIV/rxyeczMNBx79adnT0MYg7yPhIw01HflF7PUgdG3qPCECx201CeNZ4GLr1KzkBE
         jIXVvdyGlHBp1lvRqXzZA5ot7UmzvaSwQPHLw2VqwfA+tiMZoNyuvVaCYvYVp4wB88g5
         +qKU7TqO3+gmUB7NTR8N1Rqbb2mdhDSlP75r1ax2GMEUtrUCzoBxNW/YWBJyqv1FnfI2
         CtTb85Zfgd3SMEnU+yupfXpY24KVR2iIEo85kCrCc/FFdkKvt69W+wQtXVzZdRCkq65f
         lin6Ce1kUCtk3FXFKHBV7rmzDnQ99K8sH3ZxJcMOogdr/GJC5dg14YQ7rbIeZ5FCZ77c
         fyTQ==
X-Gm-Message-State: APjAAAWxeRQPZKKMOUUoWMnWTRIvcUIZ0feM4s0OScZxc6RPUtaidCoU
        zG1dH+9moiY+kf5VTMLH6zmdZE8Q
X-Google-Smtp-Source: APXvYqyGhhm2k3EffIyePWu7wuq7oZosuJF7A0bMKOtelt64dhdp9pMJJ9mYyBalHNFuNzVTpuGXnw==
X-Received: by 2002:a05:620a:15e5:: with SMTP id p5mr11832066qkm.409.1567111288542;
        Thu, 29 Aug 2019 13:41:28 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id d3sm1654981qtq.32.2019.08.29.13.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:41:28 -0700 (PDT)
Date:   Thu, 29 Aug 2019 16:41:27 -0400
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com
Subject: Re: [PATCH 00/13] Test suite tidiness
Message-ID: <20190829204127.GA6592@rotor.kitware.com>
Reply-To: mathstuf@gmail.com
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Aug 29, 2019 at 16:35:23 -0400, Ben Boeckel wrote:
> A collection of minor patches to the test suite I discovered while
> porting to the Rust bindings I've been working on:
> 
>     https://github.com/mathstuf/rust-keyutils
>     https://github.com/mathstuf/rust-keyutils/pull/34 (for the porting of the test suite)
> 
> Mostly typos, relocating some tests to what seems to be more sensible
> location, fixing some copy/pasta, and adding some missed test cases.
> The patches were developed against master, but have been rebased here
> against `next` to make it easier to add to it. If that is incorrect, I
> can rebase onto `master` and respin.
> 
> Note that I'm sending these for review now, but I'll be on vacation for
> a few weeks. Feel free to leave review comments; I'll act on them once I
> return.

Ah crap, used a dirty directory where I had staged a set of patches
previously. Sorry, will resend.

--Ben
