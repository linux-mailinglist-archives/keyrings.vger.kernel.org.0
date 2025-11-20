Return-Path: <keyrings+bounces-3406-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF49C74688
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 15:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4565A3020B
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 13:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D946344056;
	Thu, 20 Nov 2025 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KysYYDvq"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDB32D0D5
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646933; cv=none; b=MmGekhEtT5t4jIXMVlurCRqID3v8pecAGAymRMWJGnwvO1D+BUrqKE9vv252rpaovGM+f8TIR6GDzR9NEpFY87NR5a9Zh+UafEYSGziaq/C3FyC7GE7e6MRQxL6T9UBqp0Onzqa4uHijA0EvRsiXvOLzQhF274Ka93lRyBUj4Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646933; c=relaxed/simple;
	bh=emfT4JXRXejRJxV18S/z18iLUjgMJbsFUVn1IaRCxg0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=fuC0NlqWxtvU5C3x9Hm1FpTQLet6fcwVm4qZKx+l/hcEHBq1x9060XubKEkk7Ip0T6oG81r/2U6sMZMveQbDmKrVKIXmvfmJdiC6UVm2PvJMEnjwEa4WAf8twpCepAo/7HqGxi621mGKSduHYDnmMGcP6thSa8g64Ur/xeibX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KysYYDvq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763646930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1C8+LrjU0KzWq9emHiCsxm0TlrKfuklcXtM1rteIByw=;
	b=KysYYDvq5q7EtNh+fK9bN4C3/Nyy7g53VyKeWcO7m3PpDOFm4I9d9nWi2gfs6NrEjh8kVR
	VsF+DJ7jkiB01TJyU33n8SvTmQcrzDz33CzWO8XwGNolLWgCmbHCNlGMDJX3nmIMs8Rgaz
	CHR5orE+nKjoSDR9t41AXjCgDnyIxms=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-QkHHSkW8Ouy8-NP7xFcggQ-1; Thu,
 20 Nov 2025 08:55:26 -0500
X-MC-Unique: QkHHSkW8Ouy8-NP7xFcggQ-1
X-Mimecast-MFC-AGG-ID: QkHHSkW8Ouy8-NP7xFcggQ_1763646924
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 573871800358;
	Thu, 20 Nov 2025 13:55:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 109A41955F2C;
	Thu, 20 Nov 2025 13:55:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251120003653.335863-2-ebiggers@kernel.org>
References: <20251120003653.335863-2-ebiggers@kernel.org> <20251120003653.335863-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2624663.1763646918.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Nov 2025 13:55:18 +0000
Message-ID: <2624664.1763646918@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Eric Biggers <ebiggers@kernel.org> wrote:

> +	/* Compute d =3D (c mod 2^32) * (q^-1 mod 2^32). */
> +	s32 d =3D (s32)c * QINV_MOD_R;

Hmmm...  is "(s32)c" actually "(c mod 2^32)"?  Should that be:

	u32 d =3D (u32)c * QINV_MOD_R;

This is followed up by casting 'd' to "s64".  I don't think that should
sign-extend it, but...

> +	for (int m =3D 0, len =3D 128; len >=3D 1; len /=3D 2) {

Can you put "int m =3D 0" outside of the for-statement?  I know putting it
inside saves a line or two, but 'm' is not the loop counter - which it see=
ms
like it should be by virtue of being listed first.

> +	for (int m =3D 256, len =3D 1; len < 256; len *=3D 2) {

Ditto.

> +static const u8 *decode_t1_elem(struct mldsa_ring_elem *out,
> +				const u8 *t1_encoded)

I think this is (more or less) pkDecode()?  Can you put something like:

  * Decode the vector 't1' from the public key.
  * Reference: FIPS 204 Algorithm 23, sigDecode.

in the comment before it?

> +/*
> + * Use @seed to generate a ring element @c with coefficients in {-1, 0,=
 1},
> + * exactly @tau of them nonzero.  Reference: FIPS 204 Algorithm 29, Sam=
pleInBall
> + */
> +static void sample_in_ball(struct mldsa_ring_elem *c, const u8 *seed,
> +			   size_t seed_len, int tau, struct shake_ctx *shake)

Should "seed" actually be labelled "rho"?  I know a seed is what it is, bu=
t
the algo description has a different label - and the caller passes it ctil=
de,
not rho:-/.

> +	u8 (*h)[N]; /* The signer's hint vector, length k */
> +	h =3D (u8 (*)[N])&ws->z[l];

C is weird sometimes.

> +		/* Reduce to [0, q), then tmp =3D w'_1 =3D UseHint(h, w'_Approx) */

Bracket mismatch.  "[0, q]"

> +		/* w1Encode(w'_1) */
> +		w1_pos =3D 0;
> ...

Given you put the decode functions into helpers, don't you want to do that
with this?

> +	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) !=3D 0)
> +		return -EBADMSG;

Actually, this should return -EKEYREJECTED, not -EBADMSG.

I guess you don't need to use crypto_memneq() as timing doesn't matter.

The maths look okay, I think.  You can add:

	Reviewed-by: David Howells <dhowells@redhat.com>

David


