Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542DA7D21F9
	for <lists+keyrings@lfdr.de>; Sun, 22 Oct 2023 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjJVIx2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 22 Oct 2023 04:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbjJVIx1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 22 Oct 2023 04:53:27 -0400
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBFAE4;
        Sun, 22 Oct 2023 01:53:24 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id 7FF8D3000E301;
        Sun, 22 Oct 2023 10:53:19 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 6E8F211A868; Sun, 22 Oct 2023 10:53:19 +0200 (CEST)
Date:   Sun, 22 Oct 2023 10:53:19 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Richard Fontana <rfontana@redhat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-spdx@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Tadeusz Struk <tadeusz.struk@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Steve French <sfrench@samba.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
        Taehee Yoo <ap420073@gmail.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>, coreteam@netfilter.org,
        netfilter-devel@vger.kernel.org
Subject: Re: [PATCH] treewide: Add SPDX identifier to IETF ASN.1 modules
Message-ID: <20231022085319.GA25981@wunner.de>
References: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
 <CAC1cPGx-cb+YZ9KgEFvSjtf+fp9Dhcn4sm9qHmFFDRDxb=7fHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC1cPGx-cb+YZ9KgEFvSjtf+fp9Dhcn4sm9qHmFFDRDxb=7fHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Oct 21, 2023 at 09:23:55AM -0400, Richard Fontana wrote:
> On Sat, Oct 21, 2023 at 7:25???AM Lukas Wunner <lukas@wunner.de> wrote:
> >
> > Per section 4.c. of the IETF Trust Legal Provisions, "Code Components"
> > in IETF Documents are licensed on the terms of the BSD-3-Clause license:
> >
> > https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/
> >
> > The term "Code Components" specifically includes ASN.1 modules:
> >
> > https://trustee.ietf.org/documents/trust-legal-provisions/code-components-list-3/
> 
> Sorry if this seems super-pedantic but I am pretty sure the license
> text in the IETF Trust Legal Provisions does not actually match SPDX
> `BSD-3-Clause` because of one additional word in clause 3 ("specific"
> before "contributors"), so IMO you should get SPDX to modify its
> definition of `BSD-3-Clause` prior to applying this patch (or get IETF
> to change its version of the license, but I imagine that would be more
> difficult).

I've submitted a pull request to modify the SPDX definition of
BSD-3-Clause for the IETF variant:

https://github.com/spdx/license-list-XML/pull/2218

I assume this addresses your concern?  Let me know if it doesn't.

If anyone has further objections to this patch please speak up.

Thanks,

Lukas
