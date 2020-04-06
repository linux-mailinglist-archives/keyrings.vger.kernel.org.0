Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A908519FC2C
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDFR6w (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:58:52 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38063 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgDFR6u (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:58:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id v16so683457ljg.5
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rwJPlRCUFnxKeScoq9dq7EwMroxlXzzHMUmRogd2GBw=;
        b=KNwNWy4PqTz3d8ivjq4Wv2SVKLUlrGcnZzRu5TWm1tL4bj+xqqAC2eb1HfogpT8GzY
         awqOimgf5tSIhuRneuYUClX/pzpekyMMK3wJtqt8VBs7OdIkv3s/sLCnBMlTYKNxgYQu
         l6FhxVKpYjqBSeFRzCii+BTz3gnKU9IF2qOXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rwJPlRCUFnxKeScoq9dq7EwMroxlXzzHMUmRogd2GBw=;
        b=o1dabCvLdZHUsfr8/LssQw+q/GdKC+rGYXwBxAJnBVpj+4LCyIQ9MfVybmd5r6H4YR
         cBYR6u1OPz7vSsh8PxYCYMps9YNBjMi+bgpFb99i7L6Kph5add90FaWG21AKZr77RDzv
         xPQdNNSZB+MrirVOU1lvL026XvzMCfVgvqz4X4c0jjUT4rNC3T8x1pNO/9k5WK1nTSr8
         13btDptucGL52KGv2lj0a9tvKdFju/f1joQpEPtlEBRljF3oFbxdVR6/yoLypHnMD9Yc
         pb0S3QXvyiNLtaW7mip/QwKIsXNmDC9W6cXZ1WzksNaL8vkIbfeZpmEXrEuntnkVcRYt
         2k1Q==
X-Gm-Message-State: AGi0PubD7GyHx81zYRuOH8Hq77IEqI7T4hF01v7XCnF7dtffLv6XEn3K
        1OOVeeqaDs8SK9u0mN+lczyDB+U32MA=
X-Google-Smtp-Source: APiQypLwZI8eC8d2PfPOZo19bbHn/A3aO6/Fc17hU8j8DdTPqx6ijfBiH6iFE9qC9mLr2kVnF6yGAA==
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr278913ljo.59.1586195926630;
        Mon, 06 Apr 2020 10:58:46 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id v10sm11832731lfb.61.2020.04.06.10.58.44
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 10:58:45 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id p10so713366ljn.1
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:a2e:b4cb:: with SMTP id r11mr273540ljm.201.1586195924658;
 Mon, 06 Apr 2020 10:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
 <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
 <334933.1586190389@warthog.procyon.org.uk> <dbfcbbd55c63fc87bfb31af3cae1b15e04d8a821.camel@perches.com>
 <CAHk-=wiPHA4XbL-CVTDBwjYzUJwaGYriGD44uvOaqQai+zOw6A@mail.gmail.com> <354824.1586195497@warthog.procyon.org.uk>
In-Reply-To: <354824.1586195497@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 10:58:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgT6W7z-ZUB=hqx96tp+u2Hg-0KbnnWWufwVWbVgXXHXg@mail.gmail.com>
Message-ID: <CAHk-=wgT6W7z-ZUB=hqx96tp+u2Hg-0KbnnWWufwVWbVgXXHXg@mail.gmail.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     David Howells <dhowells@redhat.com>
Cc:     Joe Perches <joe@perches.com>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 6, 2020 at 10:51 AM David Howells <dhowells@redhat.com> wrote:
>
> The allocation might be by vmalloc rather than kmalloc.  I'm not sure if that
> makes things more difficult.

It does add yet another place where we'd have to save the "this
allocation is special", but it's not insurmountable.

That said, I think the short-term and simple solution is to just teach
people that sensitive free's are different, and at least have the key
subsystem with sane naming.

And yes, then eventually convert the existing crypto subsystem uses
too for consistency.

            Linus
