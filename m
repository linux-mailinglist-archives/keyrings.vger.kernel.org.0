Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AD42CC29C
	for <lists+keyrings@lfdr.de>; Wed,  2 Dec 2020 17:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgLBQoP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Dec 2020 11:44:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:53516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgLBQoP (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 2 Dec 2020 11:44:15 -0500
Date:   Wed, 2 Dec 2020 18:43:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606927412;
        bh=wijw0esZ82fBGAydteF7NxnnMyjnWjn71iroLETMnDY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=yEn2kee0fUZj4NMPSs028YRICiogsgLwyFY7/X04ciLrsxk+v4OlkNYRXdKZJYjQz
         hEOoallMKD9iKQrQbvG52cRLo3aKwBbEhWeOd/Q2u98EOq3EOuE7rd3yRaQLqWKbEi
         8jDP1/T2QUOfsREqpO0lLA1CbE6mO5bIuUb4MbkI=
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Jann Horn <jannh@google.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Ben Boeckel <mathstuf@gmail.com>,
        linux-security-module@vger.kernel.org,
        Denis Efremov <efremov@linux.com>, keyrings@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tom Rix <trix@redhat.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] keys: Miscellaneous fixes
Message-ID: <20201202164325.GA89981@kernel.org>
References: <20201129033859.GG39488@kernel.org>
 <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
 <3093311.1606728092@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3093311.1606728092@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Nov 30, 2020 at 09:21:32AM +0000, David Howells wrote:
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > I think that looks good, thank you. I'm sending PR next week. Should I
> > bundle those to that?
> 
> I've updated the branch to include an ack from you, plus added the
> semicolon-removal patch and a #include-removal patch.
> 
> You can try sending them on, though I don't think any of them are really
> critical patches (and we are in -rc6).
> 
> David

I think I'll pass then and focus on SGX for the time being. Getting that
to the mainline will release quite a lot of bandwidth, i.e. on average
the best way to go forward.

I'll test this patch set once we are in 5.11-rc1:

https://lore.kernel.org/keyrings/20201120180426.922572-1-mic@digikod.net/

/Jarkko
