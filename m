Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBD11418CC
	for <lists+keyrings@lfdr.de>; Sat, 18 Jan 2020 18:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgARRvJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 18 Jan 2020 12:51:09 -0500
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:50640 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726413AbgARRvJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 18 Jan 2020 12:51:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7F9CB8EE2AB;
        Sat, 18 Jan 2020 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1579369868;
        bh=iOvyNSq9Kzh/eopgdFe9RsgpmBo+xMCLWSBUBjdsrJE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=tRAbpDIaDZAivtB027RilhxjW7zuX+PIk5mkf2KqYSPb2blQ5eqwpwH3j2I4uCz3l
         VQgkvMrpraUC8hDtEw2FKrKu6+1B590oroFqJJjuXdyTMzQN3nLtycoV6+dvQKEfY6
         9oz/Ol3omlGe7++r56LXryRPPm1DUg2hkILhteTw=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4aWzOveehLuA; Sat, 18 Jan 2020 09:51:08 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E43F88EE17D;
        Sat, 18 Jan 2020 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1579369868;
        bh=iOvyNSq9Kzh/eopgdFe9RsgpmBo+xMCLWSBUBjdsrJE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=tRAbpDIaDZAivtB027RilhxjW7zuX+PIk5mkf2KqYSPb2blQ5eqwpwH3j2I4uCz3l
         VQgkvMrpraUC8hDtEw2FKrKu6+1B590oroFqJJjuXdyTMzQN3nLtycoV6+dvQKEfY6
         9oz/Ol3omlGe7++r56LXryRPPm1DUg2hkILhteTw=
Message-ID: <1579369864.3421.16.camel@HansenPartnership.com>
Subject: Re: [RFC PATCH 0/2] Create CAAM HW key in linux keyring and use in
 dmcrypt
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Franck Lenormand <franck.lenormand@nxp.com>,
        David Howells <dhowells@redhat.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        Horia Geanta <horia.geanta@nxp.com>,
        Silvano Di Ninno <silvano.dininno@nxp.com>,
        "agk@redhat.com" <agk@redhat.com>,
        "snitzer@redhat.com" <snitzer@redhat.com>,
        "dm-devel@redhat.com" <dm-devel@redhat.com>,
        "jmorris@namei.org" <jmorris@namei.org>,
        "serge@hallyn.com" <serge@hallyn.com>
Date:   Sat, 18 Jan 2020 09:51:04 -0800
In-Reply-To: <AM6PR04MB54473C2D30DDD7CDC8522DF9924C0@AM6PR04MB5447.eurprd04.prod.outlook.com>
References: <1551456599-10603-1-git-send-email-franck.lenormand@nxp.com>
         <11177.1551893395@warthog.procyon.org.uk>
         <AM6PR04MB54473C2D30DDD7CDC8522DF9924C0@AM6PR04MB5447.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2019-03-07 at 13:17 +0000, Franck Lenormand wrote:
> > -----Original Message-----
> > From: David Howells <dhowells@redhat.com>
> > Sent: Wednesday, March 6, 2019 6:30 PM
> > To: Franck Lenormand <franck.lenormand@nxp.com>
> > Cc: dhowells@redhat.com; linux-kernel@vger.kernel.org; linux-
> > security-
> > module@vger.kernel.org; keyrings@vger.kernel.org; Horia Geanta
> > <horia.geanta@nxp.com>; Silvano Di Ninno <silvano.dininno@nxp.com>;
> > agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com;
> > jmorris@namei.org; serge@hallyn.com
> > Subject: Re: [RFC PATCH 0/2] Create CAAM HW key in linux keyring
> > and use in
> > dmcrypt
> > 
> > Franck LENORMAND <franck.lenormand@nxp.com> wrote:
> > 
> > > The capacity to generate or load keys already available in the
> > > Linux
> > > key retention service does not allows to exploit CAAM
> > > capabilities
> > > hence we need to create a new key_type. The new key type
> > > "caam_tk"
> > 
> > allows to:
> > >  - Create a black key from random
> > >  - Create a black key from a red key
> > >  - Load a black blob to retrieve the black key
> > 
> > Is it possible that this could be done through an existing key
> > type, such as the
> > asymmetric, trusted or encrypted key typed?
> > 
> > David
> 
> Hello David,
> 
> I didn't know about asymmetric key type so I looked it up, from my
> observation, it would not be possible to use it for the caam_tk as
> we must perform operations on the data provided.
> The name " asymmetric " is also misleading for the use we would have.
> 
> The trusted and encrypted does not provides the necessary
> callbacks to do what we would need or require huge modifications.
> 
> I would like, for this series to focus on the change related to
> dm-crypt. In effect, it is currently not possible to pass a key
> from the asymmetric key type to it.

What you're performing are all bog standard key wrapping operations
which is why we're asking the question: do we have to expose any of
this to the user?  Can this whole thing not be encapsulated in such a
way that the kernel automatically selects the best key
escrow/accelerator technology on boot and uses it (if there are > 1
there would have to be an interface for the user to choose).  We make
all the accelerator device key formats distinguishable so the kernel
can figure out on load what is supposed to be handling them.  That way
the user never need worry about naming the actual key handler at all,
it would all be taken care of under the covers.

The one key type per escrow/accelerator has us all going ... "aren't
there hundreds of these on the market?"  which would seem to be a huge
usability explosion because a user will likely only have one, but they
have to figure out the type instructions for that one.  I really think
a better way is to have a more generic key type that's capable of
interfacing to the wrap/unwrap and crypto functions in such a way that
the end user doesn't have to know which they're using: most platforms
only have one thing installed, so you use that thing.

James

