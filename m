Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340C17BA813
	for <lists+keyrings@lfdr.de>; Thu,  5 Oct 2023 19:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjJERaO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 5 Oct 2023 13:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjJER32 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 5 Oct 2023 13:29:28 -0400
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1053AA1;
        Thu,  5 Oct 2023 10:27:03 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qoLXS-003l7w-JB; Thu, 05 Oct 2023 18:25:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 05 Oct 2023 18:25:06 +0800
Date:   Thu, 5 Oct 2023 18:25:06 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH] X.509: Add missing IMPLICIT annotations to AKID ASN.1
 module
Message-ID: <ZR6PAjwmLiusu022@gondor.apana.org.au>
References: <be8ab09429d55c6cfc52ee0e43bf021ffb384152.1695720715.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be8ab09429d55c6cfc52ee0e43bf021ffb384152.1695720715.git.lukas@wunner.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Sep 26, 2023 at 11:46:41AM +0200, Lukas Wunner wrote:
> The ASN.1 module in RFC 5280 appendix A.1 uses EXPLICIT TAGS whereas the
> one in appendix A.2 uses IMPLICIT TAGS.
> 
> The kernel's simplified asn1_compiler.c always uses EXPLICIT TAGS, hence
> definitions from appendix A.2 need to be annotated as IMPLICIT for the
> compiler to generate RFC-compliant code.
> 
> In particular, GeneralName is defined in appendix A.2:
> 
> GeneralName ::= CHOICE {
>         otherName                       [0] OtherName,
>         ...
>         dNSName                         [2] IA5String,
>         x400Address                     [3] ORAddress,
>         directoryName                   [4] Name,
>         ...
>         }
> 
> Because appendix A.2 uses IMPLICIT TAGS, the IA5String tag (0x16) of a
> dNSName is not rendered.  Instead, the string directly succeeds the
> [2] tag (0x82).
> 
> Likewise, the SEQUENCE tag (0x30) of an OtherName is not rendered.
> Instead, only the constituents of the SEQUENCE are rendered:  An OID tag
> (0x06), a [0] tag (0xa0) and an ANY tag.  That's three consecutive tags
> instead of a single encompassing tag.
> 
> The situation is different for x400Address and directoryName choices:
> They reference ORAddress and Name, which are defined in appendix A.1,
> therefore use EXPLICIT TAGS.
> 
> The AKID ASN.1 module is missing several IMPLICIT annotations, hence
> isn't RFC-compliant.  In the unlikely event that an AKID contains other
> elements beside a directoryName, users may see parse errors.
> 
> Add the missing annotations but do not tag this commit for stable as I
> am not aware of any issue reports.  Fixes are only eligible for stable
> if they're "obviously correct" and with ASN.1 there's no such thing.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Found this while bringing up PCI device authentication, which involves
> validating the Subject Alternative Name in certificates.
> 
> I double-checked all ASN.1 modules in the tree and this seems to be
> the only one affected by the issue.
> 
>  crypto/asymmetric_keys/x509_akid.asn1 | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
