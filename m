Return-Path: <keyrings+bounces-2996-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B3B55E6E
	for <lists+keyrings@lfdr.de>; Sat, 13 Sep 2025 06:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 958DF7A14A1
	for <lists+keyrings@lfdr.de>; Sat, 13 Sep 2025 04:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD15F2D7DF7;
	Sat, 13 Sep 2025 04:38:26 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8162D7DC7;
	Sat, 13 Sep 2025 04:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757738306; cv=none; b=DDjJaNgT9Cn3b57v3cnmIRkGqu8gXY4QGzCsgdZatctaezx2dTY7x4OAw54dH8hKuM9f7TuV2ULhtzb8vdFhMnIocrKvxkLkUkMXbtHDEkmesodYMZU9ynjT5BPdfGbn1augMSRsGhpU4D8kjn2amL81hrmlz37ZVtdtZhHBtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757738306; c=relaxed/simple;
	bh=75761QhkuOh+OYz3o1aRpc1dOJzZbG0KgGq7fc0wlmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp04ZN0zkcSnCi1Y9m8orB/Y9zpKAr9mGve4lT9I1bkaHYZU+NQHmvQDPiotwzQSpJcX+zUF9JwqAtAuior7/csQjrF1PLfyEn1cI5WTbEZwqlqQmchsUxsAEG+owL4t+dNikUq46jzi7sVP6oycLgkOYNVFWrxCwoWwCCtlh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 8616020212B6;
	Sat, 13 Sep 2025 06:38:19 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7F09D120C6B; Sat, 13 Sep 2025 06:38:19 +0200 (CEST)
Date: Sat, 13 Sep 2025 06:38:19 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Fan Wu <wufan@kernel.org>
Cc: dhowells@redhat.com, ignat@cloudflare.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, jarkko@kernel.org, zohar@linux.ibm.com,
	eric.snowberg@oracle.com, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: X.509: Fix Basic Constraints CA flag parsing
Message-ID: <aMT1O9PPhLHT-MZJ@wunner.de>
References: <20250911225356.2678-1-wufan@kernel.org>
 <aMQcnoETIt4t4Tqz@wunner.de>
 <CAKtyLkExV9dqMWa5j9O5n8oTHXh8McwVbjjCm6L9L=eFsH3HNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKtyLkExV9dqMWa5j9O5n8oTHXh8McwVbjjCm6L9L=eFsH3HNw@mail.gmail.com>

On Fri, Sep 12, 2025 at 02:14:49PM -0700, Fan Wu wrote:
> On Fri, Sep 12, 2025 at 6:14 AM Lukas Wunner <lukas@wunner.de> wrote:
> > On Thu, Sep 11, 2025 at 10:53:56PM +0000, wufan@kernel.org wrote:
> > > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > > @@ -623,7 +625,7 @@ int x509_process_extension(void *context, size_t hdrlen,
> > >               if (v[0] != (ASN1_CONS_BIT | ASN1_SEQ))
> > >                       return -EBADMSG;
> > >               if (vlen < 2)
> > >                       return -EBADMSG;
> > >               if (v[1] != vlen - 2)
> > >                       return -EBADMSG;
> > > -             if (vlen >= 4 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1)
> > > +             if (vlen >= 5 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1 && v[4] != 0)
> > >                       ctx->cert->pub->key_eflags |= 1 << KEY_EFLAG_CA;
> > >               return 0;
> > >       }
> >
> > Your patch is correct, however the conditions ...
> >
> >   vlen >= 5 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1
> >
> > ... all check well-formedness of the BasicConstraints object,
> > so it seems if any of those checks fails, -EBADMSG should be returned.
> >
> > The check "if (vlen < 2)" could be changed to "if (vlen < 5)" because
> > 5 bytes seems to be the minimum size of a well-formed BasicConstraints
> > object.  Then the "vlen >= 5" and "v[1] != 0" checks can be dropped.
> 
> Actually, we need to be careful here. OpenSSL produces
> BasicConstraints with CA:FALSE as just an empty SEQUENCE:
> 
> 06 03 55 1d 13 | 01 01 ff | 04 02 | 30 00
> [----OID------] [critical] [OCTET] [empty SEQ]

I see, thanks for the explanation.

This behavior of OpenSSL doesn't seem spec-compliant, or is it?
RFC 5280 sec 4.2.1.9 says the pathLenConstraint is optional,
but the cA boolean is not optional.  Is there a rule that booleans
need not be rendered if they are false?

BTW, I note that X.690 sec 11.1 says that for DER encoding,
all bits of a "true" boolean must be set, hence the 0xff value.
But I'm fine with your more permissive approach which checks for
a non-zero value, hence also allows BER encoding per X.690 sec 8.2.2.

Thanks!

Lukas

