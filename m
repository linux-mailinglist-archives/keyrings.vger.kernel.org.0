Return-Path: <keyrings+bounces-1860-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFF946903
	for <lists+keyrings@lfdr.de>; Sat,  3 Aug 2024 12:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4831C20B8E
	for <lists+keyrings@lfdr.de>; Sat,  3 Aug 2024 10:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BF31292CE;
	Sat,  3 Aug 2024 10:14:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD61876;
	Sat,  3 Aug 2024 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722680041; cv=none; b=QGqxSeDBBVu7qZIMxYFVQQY9+PA85zDpoVgDPvh4HmwE6LCGgu+zn/mW7cjGGP3kIqTiaVifz9DF4h8FNy2qNE/wxytDD16qp1V2GrXhA1ZCqxoBSM/h8pTOPFzWfRIS1OC/ec/TKhDrl9Eo0XpLF330pmQvF3fkHLZQeGIqnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722680041; c=relaxed/simple;
	bh=1aQjbh6NKOPEEYuJ2MtJGsDXhlZA6uP2LqxxcK079ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmttQKpkFB5HKHXUfQ3U47K6u+8g67UfU3f9cCUUcKJCazsAs8GCEiwcJ97Q+yPeJXXTpucP2ynoW82opjzwGEwP60RdKcLQ+DR0th5lQqHsget5wndG9EugkldMSmOmShWx8fcCAHJvSHM4MkmvXQh28XEQpUgX4r0u6QqGuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 138782800B3CC;
	Sat,  3 Aug 2024 12:13:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F0A8139043A; Sat,  3 Aug 2024 12:13:54 +0200 (CEST)
Date: Sat, 3 Aug 2024 12:13:54 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH 4/5] crypto: ecdsa - Move X9.62 signature decoding into
 template
Message-ID: <Zq4C4ujIZWFnjxJ5@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
 <0d360e4c1502a81c48d74c8cd6b842cc5e6dbd9e.1722260176.git.lukas@wunner.de>
 <20240801175813.000058ad@Huawei.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801175813.000058ad@Huawei.com>

On Thu, Aug 01, 2024 at 05:58:13PM +0100, Jonathan Cameron wrote:
> On Mon, 29 Jul 2024 15:50:00 +0200 Lukas Wunner <lukas@wunner.de> wrote:
> > +static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
> > +				  const void *value, size_t vlen,
> > +				  unsigned int ndigits)
> > +{
> > +	size_t bufsize = ndigits * sizeof(u64);
> > +	const char *d = value;
> > +
> > +	if (!value || !vlen || vlen > bufsize + 1)
> 
> Assuming previous musing correct middle test isn't needed.
> Maybe want to keep it though. Up to you.

The kernel wouldn't crash in the !vlen case because
ecc_digits_from_bytes() can cope with a zero length argument.

However an integer ASN.1 tag with zero length would be illegal I think.
The integer R or S could be very short, but ought to be at least 1 byte
long.  asn1_decoder.c does not seem to error out on zero length,
I assume that would be legal at least for *some* tags.

So it does seem prudent to keep the !vlen check.


> > +	err = -EINVAL;
> > +	if (strncmp(ecdsa_alg->base.cra_name, "ecdsa", 5) != 0)
> > +		goto err_free_inst;
> > +
> 
> 	if (cmp(ecdsa_alg->base.cra_name, "ecdsa", 5) != 0) {
> 		err = -EINVAL;
> 		goto err_free_inst;
> 	}
> 
> Seems more readable to me.

I'm aware that it looks unusual but in the crypto subsystem
it appears to be a fairly common pattern, so I followed it
to blend in:

  First set the return variable to an error code,
  then check for an error condition followed by goto.

See e.g.:

  __crypto_register_alg() in crypto/algapi.c
  software_key_eds_op() in crypto/asymmetric_keys/public_key.c
  x509_get_sig_params() in crypto/asymmetric_keys/x509_public_key.c
  x509_check_for_self_signed() in crypto/asymmetric_keys/x509_public_key.c


> > +	err = akcipher_register_instance(tmpl, inst);
> > +	if (err) {
> > +err_free_inst:
> > +		ecdsa_x962_free(inst);
> > +	}
> > +	return err;
> 
> I'd rather see a separate error path even if it's a little more code.
> 
> 	if (err)
> 		goto err_free_inst;
> 
> 	return 0;
> 
> err_free_inst:
> 	ecdsa_x862_free(inst)
> 	return err;
> > +}

It seems all the existing crypto_templates uniformly follow that
pattern of jumping to an "err_free_inst" label in the
*_register_instance() error path:

$ git grep -C 4 "err_free_inst:" -- crypto/

It seemed unwise to go against the current, so I followed the
existing pattern.  Upstream diplomacy. ;)

Thanks,

Lukas

