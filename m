Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C837E2FED07
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 15:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbhAUOdr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 Jan 2021 09:33:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:34042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731094AbhAUOdh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 21 Jan 2021 09:33:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3669E20897;
        Thu, 21 Jan 2021 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611239549;
        bh=7LcSyLbJf0dlJv1At01hxj+I6o7NhrEPAVw8kSdv1FQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SvjE1+A402FAAf9lDmILVQ9+oegkeyrwaN+6l1FYseKo8RkfdrkbESP2KVwLMxhK7
         7pwL9lVwnpsKzgB2AQD7V6sujxZLOUQeKIzTE6t8vXlnpvkVH5v/cgBN6svODqUwFE
         3VcYOcAxoyP6ki5q3zhwUWsJG0t0Z3JN4erXIBwtVzZefg3J4O7VQPvw1IxX8dgFbI
         BfmVbpCXDP8am/l9uXDTotTfSQnLJcUlwSzdD3CoLdl7yIe5juhrRSPmSfciUNg7kH
         dY7D9iClUfKW1t0vfBZ70D4pA3ORwQd3grj7S/pgz/28Ww+YuDxZGUlrl5Q1BqQlvm
         v6DmH2Qf0ZQeA==
Date:   Thu, 21 Jan 2021 16:32:26 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     joeyli <jlee@suse.com>
Cc:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <YAmQeiM0EHNrjyES@kernel.org>
References: <20210120090517.23851-1-jlee@suse.com>
 <20210120090517.23851-2-jlee@suse.com>
 <YAi/gERomykYZqKZ@kernel.org>
 <20210121042353.GA4730@linux-l9pv.suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121042353.GA4730@linux-l9pv.suse>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 21, 2021 at 12:23:53PM +0800, joeyli wrote:
> Hi Jarkko,
> 
> On Thu, Jan 21, 2021 at 01:40:48AM +0200, Jarkko Sakkinen wrote:
> > On Wed, Jan 20, 2021 at 05:05:14PM +0800, Lee, Chun-Yi wrote:
> > > This patch adds the logic for parsing the CodeSign extended key usage
> > > extension in X.509. The parsing result will be set to the eku flag
> > > which is carried by public key. It can be used in the PKCS#7
> > > verification.
> > > 
> > > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > > ---
> > >  crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
> > >  include/crypto/public_key.h               |  1 +
> > >  include/linux/oid_registry.h              |  5 +++++
> > >  3 files changed, 30 insertions(+)
> > > 
> > > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > > index 52c9b455fc7d..65721313b265 100644
> > > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > > @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrlen,
> > >  	struct x509_parse_context *ctx = context;
> > >  	struct asymmetric_key_id *kid;
> > >  	const unsigned char *v = value;
> > > +	int i = 0;
> > > +	enum OID oid;
> > >  
> > >  	pr_debug("Extension: %u\n", ctx->last_oid);
> > >  
> > > @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdrlen,
> > >  		return 0;
> > >  	}
> > >  
> > > +	if (ctx->last_oid == OID_extKeyUsage) {
> > > +		if (v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> > > +		    v[1] != vlen - 2)
> > > +			return -EBADMSG;
> > > +		i += 2;
> > > +
> > > +		while (i < vlen) {
> > > +			/* A 10 bytes EKU OID Octet blob =
> > > +			 * ASN1_OID + size byte + 8 bytes OID */
> > > +			if (v[i] != ASN1_OID || v[i + 1] != 8 || (i + 10) > vlen)
> > > +				return -EBADMSG;
> > > +
> > > +			oid = look_up_OID(v + i + 2, v[i + 1]);
> > > +			if (oid == OID_codeSigning) {
> > > +				ctx->cert->pub->eku |= EKU_codeSigning;
> > > +			}
> > > +			i += 10;
> > > +		}
> > > +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> > 
> > With eBPF around, does this make any sense?
> >
> 
> I think that the dynamic debug log is still easier for checking the EKU
> setting.

Why?

> Thanks
> Joey Lee

/Jarkko
