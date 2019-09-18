Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30591B678C
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2019 17:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731786AbfIRPyW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Sep 2019 11:54:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54822 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbfIRPyW (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Sep 2019 11:54:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6A6048A1C99;
        Wed, 18 Sep 2019 15:54:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com [10.10.125.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 315F91001B23;
        Wed, 18 Sep 2019 15:54:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAMuHMdVHZ9srJcK+PY=YoP55z1NSjBAtkSr2ROA8i84C75v0zQ@mail.gmail.com>
References: <CAMuHMdVHZ9srJcK+PY=YoP55z1NSjBAtkSr2ROA8i84C75v0zQ@mail.gmail.com> <278d9706-162d-28a4-4640-31b697924473@physik.fu-berlin.de> <c5acb1c0-7a5b-ce42-8b2f-5fd30cbdab6e@physik.fu-berlin.de> <6304acd1-7b71-b1fb-f8d8-298cb3025e69@physik.fu-berlin.de> <6725b972-05d4-fed4-7094-16401e86b452@gmail.com> <578d8a91-aaee-087f-1742-65e64001b8fa@physik.fu-berlin.de> <CAMuHMdUU6ejc168-ksqXrkE+PjCXFJumaRaWjRtj12NjG_TFSg@mail.gmail.com> <CAMuHMdWfTrx8VuJoifEEBc1n+3MiiuwKNWcRnUw+TgWJCtOWag@mail.gmail.com> <fea74ca3-4b24-780f-af74-a786646b1668@physik.fu-berlin.de> <CAMuHMdVeedJZE6mrGdYqRgawUtfu_ww5p-Qg1rLXNmGWiY7Nxg@mail.gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     dhowells@redhat.com,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Can KEY_DH_OPERATIONS become tristate? (was: Re: Kernel 5.3.0 stuck during boot on Amiga)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16475.1568822057.1@warthog.procyon.org.uk>
Date:   Wed, 18 Sep 2019 16:54:17 +0100
Message-ID: <16476.1568822057@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 18 Sep 2019 15:54:22 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> CC crypto keys people
> 
> TL;DR: CONFIG_CRYPTO_DH=y is reported to cause boot delays of several
> minutes on old and slow machines.

Why is it doing that?  It doesn't do anything unless it is called, so
something must be calling it.

> Can KEY_DH_OPERATIONS be made tristate?

Um.  It's non-trivial since it's implementing a keyctl() function for
userspace to call and there's currently no ops table to jump through.

David
