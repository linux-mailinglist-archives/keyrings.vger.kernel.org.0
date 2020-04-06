Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBAD91A0188
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 01:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDFXUP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 19:20:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40950 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDFXUO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 19:20:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id c20so8368559pfi.7
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 16:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Zy9jOR3FEHibqt+rwh6SfI22BV7Ing5bU84+BN00rNw=;
        b=Vy3ZrVa/Ni/8KnrxqiUwWfKPPhdXuDRGfUImo5iYAADPRayaJ+EUfF37ttrOwVRcWP
         bWT3PuAEHyYlL7rT0ylAoFAmthfWjqZjby+RPm88xojLHEy2Ih2ong0+3AOVmz1/s4Kn
         NGe6JAqA9FnKdPJnDMNWXHSVzW+UFJGofnJqMqiXNIkuKTnaNK/Zf0FjB+Db5P82JVNd
         qOP6n6cb5yVnUlnNjBg+ZklcqkDUWXxwXZwBPsLQp2zETZPewlXOjDTnDzGwbjsIaomN
         pgOh96a/mMXIX5tcHKxyenKzvWKRXYg4gHRXJRm8Flz9q7colzH3b+7kImcTXlJE+Dl2
         KXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Zy9jOR3FEHibqt+rwh6SfI22BV7Ing5bU84+BN00rNw=;
        b=qG/Y2/s0A3bV1ZXGQc1sJZPFdNqnZ+9KkmBWlcX17UlGB//SrcfiwVCKgAfy7a+hu/
         n9TbckHNfkHLoNYVWmJibS3mfhmln8UEckDumkAhnycN2vIgNgZ/uKRHIRKjZkzZM096
         XaSRcZxKmanDMhXrBEMudtGauKUbTFeT6k657PEtoZaHHPhb26KuT1VliEpwcHJOL3MS
         WfUIbrT10IjizBSvEklxDmiXtveLT0D6SEBA4BkXzdeENd7WqlmxRHQJdOKpvUDXoeUU
         Rit1DHXQDGd/pYCiGlVyTMi9XH12zE2SFIAlZzpvAeKU6TNZVNjg+iDse+FYAsWOUOHL
         srBA==
X-Gm-Message-State: AGi0PuZ7Z3aSDmbOgFp+pEufSJDGhUb+Lyb+Kq7JVV8FBxYy1yvDpWqN
        hkHIt7uxc99jz/8BOYEm3KtReg==
X-Google-Smtp-Source: APiQypLsaTUFaOPT9CXZo9RFi5Ei4O5u7vftOcbwlI7jEvEVk+ydbIpJPPLduNdR9tBuA3ImrEDjDA==
X-Received: by 2002:a62:520a:: with SMTP id g10mr1757591pfb.271.1586215213567;
        Mon, 06 Apr 2020 16:20:13 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id c190sm12367290pfa.66.2020.04.06.16.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:20:12 -0700 (PDT)
Date:   Mon, 6 Apr 2020 16:20:12 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     David Howells <dhowells@redhat.com>
cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
In-Reply-To: <6504.1586159053@warthog.procyon.org.uk>
Message-ID: <alpine.DEB.2.21.2004061618580.45667@chino.kir.corp.google.com>
References: <alpine.DEB.2.21.2004052119530.243304@chino.kir.corp.google.com> <20200406023700.1367-1-longman@redhat.com> <6504.1586159053@warthog.procyon.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 6 Apr 2020, David Howells wrote:

> David Rientjes <rientjes@google.com> wrote:
> 
> > > +static inline void kvfree_sensitive(const void *addr, size_t len)
> > > +{
> > > +	if (addr) {
> > 
> > Shouldn't this be if (unlikely(ZERO_OR_NULL_PTR(addr))?
> 
> You've reversed the logic - it needs a '!' there.
> 

Ah lol, yeah.  Probably just better to do

	if (unlikely(ZERO_OR_NULL_PTR(addr)))
		return;

but I agree that mm.h is likely not the right spot.
