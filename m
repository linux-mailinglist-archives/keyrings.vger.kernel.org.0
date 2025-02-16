Return-Path: <keyrings+bounces-2403-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31AA373D5
	for <lists+keyrings@lfdr.de>; Sun, 16 Feb 2025 11:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495EB16BACE
	for <lists+keyrings@lfdr.de>; Sun, 16 Feb 2025 10:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9851914B959;
	Sun, 16 Feb 2025 10:45:17 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0310B17D346;
	Sun, 16 Feb 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739702717; cv=none; b=lpdmqfAcY3xJIYS8eG5j9ZRcidXyvg4Xr33vJdw8kaNwncqo36bbp83RKltv2Kq/N3kDKWS5/Voy3tKg9o3rbY6u5TtTbxUkgKH0wNevsRhyYKC3RSmwj+lqxdqAGO2x4xg0lmKvbcFNarjXYQuj7KEyUyMezDr3Eo+Cs/tdbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739702717; c=relaxed/simple;
	bh=fa/fmQSZpHAhnO4dBF2O3QM/qi0ngSjs4VtzmyARpnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mel3j2af2RYSq/Pc0YLu4NaDG17dcENjYw4JG2bWCx3eqlHhafMfZsd6BFW1Gb5i5tpcTCJ+WQ3lc+JfYC/uW5+NM64BpK/TRpxSjepBbEjKdyUghHRQ1fvQFMlyuIgD247lKI1B6FpKxpG/W28X/4DRaLiGRVHYOHTEzsb4V4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 1FD92100D587D;
	Sun, 16 Feb 2025 11:45:05 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E403C5CD8E8; Sun, 16 Feb 2025 11:45:04 +0100 (CET)
Date: Sun, 16 Feb 2025 11:45:04 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z7HBsONxj_q0BkJU@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
 <Z7FnYEN-OnR_-7sP@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7FnYEN-OnR_-7sP@gondor.apana.org.au>

On Sun, Feb 16, 2025 at 12:19:44PM +0800, Herbert Xu wrote:
> On Mon, Feb 10, 2025 at 07:53:57PM +0100, Lukas Wunner wrote:
> > > > https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/key.c
> > > > https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-tls.c
> > > 
> > > Surely this doesn't use the private key part of the API, does it?
> > 
> > It does use the private key part:
> > 
> > It takes advantage of the kernel's Key Retention Service for EAP-TLS,
> > which generally uses mutual authentication.  E.g. clients authenticate
> > against a wireless hotspot.  Hence it does invoke KEYCTL_PKEY_SIGN and
> > KEYCTL_PKEY_ENCRYPT (with private keys, obviously).
> 
> Does it really? I grepped the whole iwd git tree and the only
> use of private key functionality is to check that it matches
> the public key, IOW it encrypts a piece of text and then decrypts
> it again to check whether they match.
> 
> It doesn't make use of any other private key functionality AFAICS.

__eap_handle_request()                            [iwd src/eap.c]
  eap->method->handle_request()
    eap_tls_common_handle_request()               [iwd src/eap-tls-common.c]
      l_tls_handle_rx()                           [ell ell/tls-record.c]
        tls_handle_ciphertext()
          tls_handle_plaintext()
            tls_handle_message()                  [ell ell/tls.c]
              tls_handle_handshake()
                tls_handle_server_hello_done()
                  tls_send_certificate_verify()
                    tls->pending.cipher_suite->signature->sign
                      tls_rsa_sign()              [ell ell/tls-suites.c]
                        l_key_sign()              [ell ell/key.c]
                          eds_common()
                            kernel_key_eds()
                              syscall(__NR_keyctl, KEYCTL_PKEY_SIGN, ...)

... where tls_handle_server_hello_done() performs client authentication
per RFC 8446 sec 4.6.2:

  "When the client has sent the "post_handshake_auth" extension (see
   Section 4.2.6), a server MAY request client authentication at any
   time after the handshake has completed by sending a
   CertificateRequest message.  The client MUST respond with the
   appropriate Authentication messages (see Section 4.4).  If the client
   chooses to authenticate, it MUST send Certificate, CertificateVerify,
   and Finished."

   https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.2

I think the best option at this point isn't to aim for removal
but to wait for Cloudflare to beat their out-of-tree implementation
(which apparently isn't susceptible to side channel attacks)
into shape so that it can be upstreamed.

Thanks,

Lukas

