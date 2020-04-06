Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD8719FA6E
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 18:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgDFQlx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 12:41:53 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42753 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729617AbgDFQlw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 12:41:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so356095ljp.9
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Imdp89Sb0+OtYzgCpw3IcqTUqEKq3zexZbxvNKGejvc=;
        b=TUDiV7orONaSuZs35BQ1mawth0kHmPPUSDaWUc61FjLb/6pFGQBIyQceMCqczVlLuF
         mQUZ4NQktXHOHP07O9tK8dQGGfgRoZsmJ5GzKHbZpqurg7mKkrY7MYTCAAZGVXJrRCHG
         ddaqR5NSXTSjop3RFyga75kOxzIQpqbjG4OKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Imdp89Sb0+OtYzgCpw3IcqTUqEKq3zexZbxvNKGejvc=;
        b=uNou5pCTagGcqW1ps2Q5Qs1K912sMa3iT+HZ3Y8f/RnUqN32Rdf86d8+RiTU0MG8w5
         jG4jQiuAGZTMVoY59Dia4PqGwVR97XyfPCGdB+BrtLZnh36WaeXegtwlCvk31CooU2V2
         bY5AwizjE9S0EBwQX+TUud+rYRE/aiPWwbSZxn+dM8qFM+q4Jw0J4Yy2BzyDftu+mc0z
         XJzChxPxlz6tl1y6k0gL4XU6IfZU+6Nbm0vjcGDU1/hQvJXY23EjaR68hThWN7OyHgc+
         ditDKxj/rDQOD3nb0PzNZvKVYcZW+gpiYOXkmsIffhcQ7N52a6mnx1dLCRygM991rIiG
         6kIg==
X-Gm-Message-State: AGi0PuZ3SLpO4ACAf3NglshHbNVbsIo88gcGduqnQRkzdvdiJMweeHNd
        nutecJEVp2cigjWdI/NiHjxR4uLXA4E=
X-Google-Smtp-Source: APiQypJPm57gsbXrwti/3mnymrsF/GNKt+S2FniEpwYCMSC8ulE7SpXAdkDrY6WUWRvtrNIAYOQDFg==
X-Received: by 2002:a2e:9585:: with SMTP id w5mr87380ljh.178.1586191308941;
        Mon, 06 Apr 2020 09:41:48 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id r21sm10839180ljp.29.2020.04.06.09.41.47
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 09:41:48 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id r7so327231ljg.13
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 09:41:47 -0700 (PDT)
X-Received: by 2002:a2e:8911:: with SMTP id d17mr101988lji.16.1586191307660;
 Mon, 06 Apr 2020 09:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
 <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
In-Reply-To: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 09:41:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com>
Message-ID: <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Joe Perches <joe@perches.com>
Cc:     David Howells <dhowells@redhat.com>,
        Waiman Long <longman@redhat.com>,
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

On Mon, Apr 6, 2020 at 9:12 AM Joe Perches <joe@perches.com> wrote:
>
> While I agree with Linus about the __ prefix,
> the z is pretty common and symmetric to all
> the <foo>zalloc uses.

Yes, we have a pattern of 'z' for zero.

But the _operation_ isn't symmetric.

"kzalloc()" has absolutely _nothing_ to do with "kzfree()". They are
not some kind of "opposite symmetric operation".  They are totally
different. They have absolutely nothing in common.

So using the same naming is wrong. They have one implementation detail
that looks superficially similar ("zero the area"), but even that
superficial similarity is actually completely false. They may both use
"memset()", but in one case it is correct and makes sense, and in the
other case it's actually a bug waiting to happen, and you really
should use that "memzero_explicit()", which is a very very different
operation from a normal memzero().

So even the implementation isn't really validly similar, but even if
it had been, the _reason_ for doing so is completely different.

They simply don't really pair up in any way.

             Linus
