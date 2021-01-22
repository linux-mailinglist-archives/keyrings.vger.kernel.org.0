Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53031300A40
	for <lists+keyrings@lfdr.de>; Fri, 22 Jan 2021 18:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbhAVRua (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Jan 2021 12:50:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:48312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729637AbhAVR2r (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 22 Jan 2021 12:28:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B640523A79;
        Fri, 22 Jan 2021 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611336484;
        bh=qograiY/OI118ejGLn4e+elJSIu4pDglPAwQTSxygBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASC22rUQ6F1mze35vdN/Kd9824BPv20g9OmZI2mOB0q13+WB8hRG0dN4MwvBvXfMt
         cLAl7UXdsh/+t58kF/PpRPUZGYjfV5L+quWQgzcUWvcDFE7YBxXZ5+9was59ZDu16N
         /SCfnkUdfq7NQ8z9H4teoF8+CtAxr3EMmhjNppvPlhHMni33hd5USMTh088u1Vqhb2
         Pn44quDLeIu2cuh5J5o+H4C5s7az+m/bP8q6+g+N0vo7huJ7kDJmVEarBQIHqjysDH
         VO4qaMQvMZBSvnGCm64mWhfb76ttp4pwv4hV4UBdWgdw9AHVhhBJXEdTvQfTKrPb9y
         op6umPB7H2dGg==
Date:   Fri, 22 Jan 2021 19:28:01 +0200
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
Message-ID: <YAsLIZ7QOiR4sl9E@kernel.org>
References: <20210120090517.23851-1-jlee@suse.com>
 <20210120090517.23851-2-jlee@suse.com>
 <YAi/gERomykYZqKZ@kernel.org>
 <20210121042353.GA4730@linux-l9pv.suse>
 <YAmQeiM0EHNrjyES@kernel.org>
 <20210121152306.GE4730@linux-l9pv.suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121152306.GE4730@linux-l9pv.suse>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 21, 2021 at 11:23:06PM +0800, joeyli wrote:
> On Thu, Jan 21, 2021 at 04:32:26PM +0200, Jarkko Sakkinen wrote:
> > On Thu, Jan 21, 2021 at 12:23:53PM +0800, joeyli wrote:
> > > Hi Jarkko,
> > > 
> > > On Thu, Jan 21, 2021 at 01:40:48AM +0200, Jarkko Sakkinen wrote:
> > > > On Wed, Jan 20, 2021 at 05:05:14PM +0800, Lee, Chun-Yi wrote:
> > > > > This patch adds the logic for parsing the CodeSign extended key usage
> > > > > extension in X.509. The parsing result will be set to the eku flag
> > > > > which is carried by public key. It can be used in the PKCS#7
> > > > > verification.
> > > > > 
> > > > > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > > > > ---
> > > > >  crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
> > > > >  include/crypto/public_key.h               |  1 +
> > > > >  include/linux/oid_registry.h              |  5 +++++
> > > > >  3 files changed, 30 insertions(+)
> > > > > 
> > > > > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > > > > index 52c9b455fc7d..65721313b265 100644
> > > > > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > > > > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > > > > @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrlen,
> > > > >  	struct x509_parse_context *ctx = context;
> > > > >  	struct asymmetric_key_id *kid;
> > > > >  	const unsigned char *v = value;
> > > > > +	int i = 0;
> > > > > +	enum OID oid;
> > > > >  
> > > > >  	pr_debug("Extension: %u\n", ctx->last_oid);
> > > > >  
> > > > > @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdrlen,
> > > > >  		return 0;
> > > > >  	}
> > > > >  
> > > > > +	if (ctx->last_oid == OID_extKeyUsage) {
> > > > > +		if (v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> > > > > +		    v[1] != vlen - 2)
> > > > > +			return -EBADMSG;
> > > > > +		i += 2;
> > > > > +
> > > > > +		while (i < vlen) {
> > > > > +			/* A 10 bytes EKU OID Octet blob =
> > > > > +			 * ASN1_OID + size byte + 8 bytes OID */
> > > > > +			if (v[i] != ASN1_OID || v[i + 1] != 8 || (i + 10) > vlen)
> > > > > +				return -EBADMSG;
> > > > > +
> > > > > +			oid = look_up_OID(v + i + 2, v[i + 1]);
> > > > > +			if (oid == OID_codeSigning) {
> > > > > +				ctx->cert->pub->eku |= EKU_codeSigning;
> > > > > +			}
> > > > > +			i += 10;
> > > > > +		}
> > > > > +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> > > > 
> > > > With eBPF around, does this make any sense?
> > > >
> > > 
> > > I think that the dynamic debug log is still easier for checking the EKU
> > > setting.
> > 
> > Why?
> 
> There have some certificates may loaded when system boot. In booting stage,
> using dynamic debug log for checking EKU is easier than eBPF. 
> 
> I am not good on eBPF. Correct me if I missed anything, please!

I think it's fine have it, thanks.

/Jarkko
