Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5AA2D745C
	for <lists+keyrings@lfdr.de>; Fri, 11 Dec 2020 11:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394166AbgLKK6H (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Dec 2020 05:58:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:56070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393728AbgLKK5l (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 11 Dec 2020 05:57:41 -0500
Date:   Fri, 11 Dec 2020 12:56:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607684219;
        bh=JQgPPAmT7DRTzUhQSxk8DoihZoXAUexH1Vni3RHrF3I=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=EqRTZljfKlFK/yxKgXLKsQ/1wXIGGKXMt9QKB7+Ilvu+DZxjphhcDWNlyayarJ9Jp
         kjqZUyrujQfU50xQfnVVmVy/yFASp3oL5MxhLjVBj6qu/Ei5LCDAeASDmxacfsdglD
         lSvk0wHyvOGD0GWM9hYYhiUPy4idYLuYnI6izKf05WAmi2948EZoa8pp6ad3nfAZbZ
         FoUKwToKSTKCGn5csWmZXO321P/lfTg2KxClMDQhzMlqSmBYCER3qgn2ffzqN6/3m6
         URkFY9DMIUuw0+DdhQtiLXIRniEljNNUiblE/qf1tBQqtzSupUOD7yT6zs1EMoA0RD
         KfiRdyDBN1p/Q==
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Petko Manolov <petkan@mip-labs.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jann Horn <jannh@google.com>, linux-crypto@vger.kernel.org,
        Ben Boeckel <mathstuf@gmail.com>, keyrings@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        linux-security-module@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Tom Rix <trix@redhat.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        James Morris <jmorris@namei.org>,
        Denis Efremov <efremov@linux.com>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH 00/18] keys: Miscellaneous fixes
Message-ID: <20201211105651.GA12534@kernel.org>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
 <20201211105146.GF12091@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211105146.GF12091@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Dec 11, 2020 at 12:51:46PM +0200, Jarkko Sakkinen wrote:
> On Wed, Dec 09, 2020 at 12:14:24PM +0000, David Howells wrote:
> > 
> > Hi Jarkko,
> > 
> > I've extended my collection of minor keyrings fixes for the next merge
> > window.  Anything else I should add (or anything I should drop)?
> > 
> > The patches can be found on the following branch:
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes
> > 
> > David
> 
> Looks good to me.

Ugh, responded accidentally twice.

/Jarkko
