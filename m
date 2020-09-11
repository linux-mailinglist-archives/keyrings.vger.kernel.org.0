Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE47266546
	for <lists+keyrings@lfdr.de>; Fri, 11 Sep 2020 18:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgIKQ5k (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Sep 2020 12:57:40 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:42218 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726305AbgIKPE3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Sep 2020 11:04:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id DA4558EE21C;
        Fri, 11 Sep 2020 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1599836666;
        bh=yhrDiYi9c8FE4wC2C86eKSK5/tP+mtNUZsOBeMc7Vzc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=GG9RMhwBXb3CICZQMZm9a4wVWVt6Ol3eFNMBxAfJmWq4hQgPx+g1bhEuf5tVSH43W
         CpQhW2TTOG3WcIxLq77wP6UHE55ai2mZF2pqByFiubhxsRQLwRsy7j/UAQirc+n/ov
         Hz0RaVNlD904A1y9gLwulrhpgULCyeDAi5xevVSw=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FWbnV69cVc6j; Fri, 11 Sep 2020 08:04:26 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0BF3A8EE0F8;
        Fri, 11 Sep 2020 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1599836666;
        bh=yhrDiYi9c8FE4wC2C86eKSK5/tP+mtNUZsOBeMc7Vzc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=GG9RMhwBXb3CICZQMZm9a4wVWVt6Ol3eFNMBxAfJmWq4hQgPx+g1bhEuf5tVSH43W
         CpQhW2TTOG3WcIxLq77wP6UHE55ai2mZF2pqByFiubhxsRQLwRsy7j/UAQirc+n/ov
         Hz0RaVNlD904A1y9gLwulrhpgULCyeDAi5xevVSw=
Message-ID: <1599836664.4041.21.camel@HansenPartnership.com>
Subject: Re: [PATCH] security: keys: Use kvfree_sensitive in a few places
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 11 Sep 2020 08:04:24 -0700
In-Reply-To: <20200911114400.82207-1-alex.dewar90@gmail.com>
References: <20200911114400.82207-1-alex.dewar90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 2020-09-11 at 12:44 +0100, Alex Dewar wrote:
> In big_key.c, there are a few places where memzero_explicit + kvfree
> is used. It is better to use kvfree_sensitive instead, which is more
> readable and also prevents the compiler from eliding the call to
> memzero_explicit. Fix this.

That last bit is untrue: the compiler can't elide memzero_explicit ...
that's why it has the explicit suffix.

The original problem was a lot of people do memset(.., 0, ..); kfree()
which the compiler can elide if it understands the memory is going out
of scope.  Or the even more problematic memset(..., 0, ...) on a stack
variable before it goes out of scope.

We can argue about readability but there's no secret leak here.

James

