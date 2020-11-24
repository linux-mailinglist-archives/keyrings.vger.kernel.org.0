Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F8A2C29A5
	for <lists+keyrings@lfdr.de>; Tue, 24 Nov 2020 15:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388928AbgKXOaA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 24 Nov 2020 09:30:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:54910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388014AbgKXO37 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 24 Nov 2020 09:29:59 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73B192076E;
        Tue, 24 Nov 2020 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606228199;
        bh=WVnMFGVgDwBYzrdi0QU1bU9tavRmGvM2q9lX3BwdRMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cyrn05kV9I3Ovr0jbD56E7qkiHgiFipxQB3vtHIO6UguzFxDsrtYBK6iy5NucPGDI
         haAqgEbZRoGYcExkJ648Areu/FBuy0pQv6JzILwRSvy9PLfW5MA6o8+hcuRQOW0xPN
         /k4l2rZ/zPaYiaSVt6OK2RBZCssHgRwslE89yHzk=
Date:   Tue, 24 Nov 2020 08:30:14 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 052/141] security: keys: Fix fall-through warnings for
 Clang
Message-ID: <20201124143014.GA16084@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <412e11590b667712c03c1e4d4c7573fda3a4b1cb.1605896059.git.gustavoars@kernel.org>
 <20201123225402.GB19839@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123225402.GB19839@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Nov 24, 2020 at 12:54:02AM +0200, Jarkko Sakkinen wrote:
> On Fri, Nov 20, 2020 at 12:32:20PM -0600, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  security/keys/process_keys.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
> > index 1fe8b934f656..e3d79a7b6db6 100644
> > --- a/security/keys/process_keys.c
> > +++ b/security/keys/process_keys.c
> > @@ -783,6 +783,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
> >  				if (need_perm != KEY_AUTHTOKEN_OVERRIDE &&
> >  				    need_perm != KEY_DEFER_PERM_CHECK)
> >  					goto invalid_key;
> > +				break;
> >  			case 0:
> >  				break;
> >  			}
> > -- 
> > 2.27.0
> > 
> > 
> 
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Thank you, Jarkko.
--
Gustavo
