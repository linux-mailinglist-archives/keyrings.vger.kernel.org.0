Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB76E2662C8
	for <lists+keyrings@lfdr.de>; Fri, 11 Sep 2020 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgIKQAm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Sep 2020 12:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgIKQAT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Sep 2020 12:00:19 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC96EC061757;
        Fri, 11 Sep 2020 09:00:12 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so11935664wrn.13;
        Fri, 11 Sep 2020 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hEkzMObtlMCjl5OEUQI4JjhybRui5jJdjA+tfo7mycI=;
        b=LSMifRT1kg+usml3PAv79ANoIxBDJRqAoGNiI6Mq8IPk82w7BxifHlH4UcVtAutAch
         yIV0jMswvurJWUTn/9ybFmA9yX+AFk83n7Z04v8sLZlsqUPyQuGGGtP5NDWsfM4H7Ql4
         W0ukiCcAQRlSeTs9NlrYYH7VgqPMrP1XfLVwQE/Tz0rIQVPDMZ+FtNxUiiGluZmIEPp1
         Omk0BMpU1JDC5vwHr9X1Vk+eZBmeu4jMwm6KINVWDLTrXpXnwimpSHLs6I8uoO7wDVLi
         oFLSMNluuDc8SBvg6uQrhzL3+NekyIUkEDneLbQATvWEGTHpOSZ5xBZgsYK5jymUCdxl
         G38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hEkzMObtlMCjl5OEUQI4JjhybRui5jJdjA+tfo7mycI=;
        b=siStZd3Nnc3FvcykoStcVvjDMhDvT356SvLdLjmzdoS5Vw52G/ZNvkQElLDr5lQv4X
         HjOGOLJAjNaN7iK6k9z6uQsrkUu1L9B732NKxHGESmJvwrpfrdBxULVatCBhhq5q5x+Y
         dOR/KBn9mgRbHiM5s/VCHRZH8h3ateFNIx7ji+p4aUFlpKSrcyquLD2WegJM5h6nsiIv
         Dnu02klKdA9279TIPQHwhbE9DCTML91WIulqVQ/FSv5N0zm/G9Gx/Um1NiqUXLKmD6Zt
         P7/L+3Vl83ZgNJxYEuQ8qBzwwRF580kPjZNBQjVM0wHhymDVySIOYslWH5hTMlbIWt6v
         IZfQ==
X-Gm-Message-State: AOAM530rk9Silw8aO1tbT5cN3xjlPcmDJpGaLO0G2yNrujT4mcD3R7Dt
        BQ1KF/BmvqwVk5abXyANHH0=
X-Google-Smtp-Source: ABdhPJxu0LW3DrbznN/sdzLJi1Fi0CjGquTIOvBpI/QIUkHmDPzdFiiFMk4owJLxlRsg5Mw9cpOloA==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr2675691wrv.418.1599840011391;
        Fri, 11 Sep 2020 09:00:11 -0700 (PDT)
Received: from lenovo-laptop (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id t1sm4843370wmi.16.2020.09.11.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 09:00:10 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date:   Fri, 11 Sep 2020 17:00:09 +0100
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] security: keys: Use kvfree_sensitive in a few places
Message-ID: <20200911160009.n2drvcjpzrsloxcj@lenovo-laptop>
References: <20200911114400.82207-1-alex.dewar90@gmail.com>
 <1599836664.4041.21.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599836664.4041.21.camel@HansenPartnership.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Sep 11, 2020 at 08:04:24AM -0700, James Bottomley wrote:
> On Fri, 2020-09-11 at 12:44 +0100, Alex Dewar wrote:
> > In big_key.c, there are a few places where memzero_explicit + kvfree
> > is used. It is better to use kvfree_sensitive instead, which is more
> > readable and also prevents the compiler from eliding the call to
> > memzero_explicit. Fix this.
> 
> That last bit is untrue: the compiler can't elide memzero_explicit ...
> that's why it has the explicit suffix.
> 
> The original problem was a lot of people do memset(.., 0, ..); kfree()
> which the compiler can elide if it understands the memory is going out
> of scope.  Or the even more problematic memset(..., 0, ...) on a stack
> variable before it goes out of scope.
> 
> We can argue about readability but there's no secret leak here.

Ahh, my mistake. Thanks for the explanation.

I'll send a v2 with an updated commit message. I think it would still
make sense to use kfree_sensitive here as on next-20200911 this is the
last use of kzfree in the tree and it would be nice to excise it
altogether.

Best,
Alex

> 
> James
> 
