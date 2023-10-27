Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8137D95B7
	for <lists+keyrings@lfdr.de>; Fri, 27 Oct 2023 12:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345692AbjJ0K4n (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 27 Oct 2023 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345598AbjJ0K4m (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 27 Oct 2023 06:56:42 -0400
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4329C;
        Fri, 27 Oct 2023 03:56:39 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qwKVK-00Bece-Dv; Fri, 27 Oct 2023 18:55:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Oct 2023 18:55:56 +0800
Date:   Fri, 27 Oct 2023 18:55:56 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-spdx@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Tadeusz Struk <tadeusz.struk@linaro.org>,
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
Message-ID: <ZTuXPAZWVkLvVPHq@gondor.apana.org.au>
References: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Oct 21, 2023 at 01:23:44PM +0200, Lukas Wunner wrote:
> Per section 4.c. of the IETF Trust Legal Provisions, "Code Components"
> in IETF Documents are licensed on the terms of the BSD-3-Clause license:
> 
> https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/
> 
> The term "Code Components" specifically includes ASN.1 modules:
> 
> https://trustee.ietf.org/documents/trust-legal-provisions/code-components-list-3/
> 
> Add an SPDX identifier as well as a copyright notice pursuant to section
> 6.d. of the Trust Legal Provisions to all ASN.1 modules in the tree
> which are derived from IETF Documents.
> 
> Section 4.d. of the Trust Legal Provisions requests that each Code
> Component identify the RFC from which it is taken, so link that RFC
> in every ASN.1 module.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  I'm adding a new IETF ASN.1 module for PCI device authentication, hence
>  had to research what the correct license is.  Thought I'd fix this up
>  treewide while at it.
> 
>  Not included here is fs/smb/client/cifs_spnego_negtokeninit.asn1,
>  which is similar to fs/smb/client/ksmbd_spnego_negtokeninit.asn1,
>  but contains a Microsoft extension published as Open Specifications
>  Documentation.  It's unclear to me what license they use:
>  https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-spng/
> 
>  crypto/asymmetric_keys/pkcs7.asn1            | 7 +++++++
>  crypto/asymmetric_keys/pkcs8.asn1            | 6 ++++++
>  crypto/asymmetric_keys/x509.asn1             | 7 +++++++
>  crypto/asymmetric_keys/x509_akid.asn1        | 5 +++++
>  crypto/rsaprivkey.asn1                       | 7 +++++++
>  crypto/rsapubkey.asn1                        | 7 +++++++
>  fs/smb/server/ksmbd_spnego_negtokeninit.asn1 | 8 ++++++++
>  fs/smb/server/ksmbd_spnego_negtokentarg.asn1 | 7 +++++++
>  net/ipv4/netfilter/nf_nat_snmp_basic.asn1    | 8 ++++++++
>  9 files changed, 62 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
