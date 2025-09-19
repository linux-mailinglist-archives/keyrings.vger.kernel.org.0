Return-Path: <keyrings+bounces-3022-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018AB87BDD
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 04:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2B2D4E0C0B
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 02:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7415E251793;
	Fri, 19 Sep 2025 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="nmZKtH2N"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB17B2512DE;
	Fri, 19 Sep 2025 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758249949; cv=pass; b=Owksg8t/Gy72NkIrq97dj6dYL8TXZ69ok5osP6fpncw37I7VOB+U8iAWG4XMwvyIKRsRezLaXIhAOw3o6yOAR0fKzZFvBP2puKdCwfa2k1eIaoMqUUfWZQIk1kv2uRSbBYVMNTC22jn1/ssMP8x7T9EqrkX8KwvZkVz75ZU26C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758249949; c=relaxed/simple;
	bh=s/t2Wxrg+mbF7K5Pyum3QBpF+g+FSOPlAlQsbnljWzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+aqBYmLQLGtPwqk96jy7GnTU1ToPGEnAmQh+u/CLn7CI4QwF2K/iNPdukQ7LXbF0CTYvAReeL6ZBC2VgsGQKqV8EPFgr766GpNaFHZvL0J6mIuusFGCUBIx+Chdw8tHLRDTp8MUUMca035Uoyq7rTAbDw2xDbP9x5fzVJCgTsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=nmZKtH2N; arc=pass smtp.client-ip=81.169.146.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1758249755; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FO+JDYqEfQhY5yJDCBt4iFDPV8ofMfSy3Q88N/xQQYWhtQR6g4iG95pYHZ151lwKoS
    8p2irwBmW8azrqf1r00IvQ51PdCw35E8pLW47vxESR/zVbF3i1eiCvzkRjMMi9S+MMjH
    TyYeE5KmD52vJkg1U2AUz10Qdd7PQppYmmjbLLnqfUcRaa99Nmr5Rzu5jYL9WMsIQjER
    zAhSohRqe6iQJx7+kuGXmJE6G7NXIHdf2SmGxCrvnjKvZQ0wTHsYZBcOgsaekz2PCPtL
    q+7gvAGrUo6yZhsEzcw9VShWSyBrW73L7TyQIz0jXvSuXRv9q4b4td35L/uHFORUflY5
    ja1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1758249755;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DwpWtLn/k646AVPru0zB96UTBYAxfzxxROtH+P666Hg=;
    b=fWEKhP6Yov3Ho35zZCw0Modmgk6/aHWG9mMxbXxQIYVDCS8VLJjGv/6nkf35fXh5lI
    panCBrfzsEG/fKbiPvqSYI+rWcrhZFJLDf7TsOHwUJbW8lomoLRi0Kp5Od+53chCSlaV
    l65A+6WbXiPRylYq27dVL2pk3Da8JaC7HQSueCzB1K8IvfQCbnlyEhcxYe21rJxOZUj5
    hNteejoM9A79ayW739on0DfNyVDJ6vw6HV+eczektRVrAsRkwJ+qW08gDXJ7OMfsVT+F
    Z1CuRPh6TG+3NEt9jhoJJCra3+hd8VbaW+pufyOLWJriP1me1yaq3phJwgmZi7hSnE8z
    NlgQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1758249755;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DwpWtLn/k646AVPru0zB96UTBYAxfzxxROtH+P666Hg=;
    b=nmZKtH2NOSNDD7UnjwsbVrIRaJFI7RrXJ7VlDwEB6FPluxhkjmn2bF5aeVEkGQ3dvY
    r1gkaEJRSWKhpg0IwvxYYWW8qsowCiAnMwHq8asehCtPgHn1+XO7SnAQCuaVJzJnMpeR
    3eBQ98q4CctFSXxRDdV7LnSWobJau7hGvDRPCsHfSbjyJcHoCDbTHh/IdqgCA/UlPsi+
    DxUsc9HYw1579IHjK/aTKYsrH6SusWZ9QjasnOgwWnwpfN3jdv0aG6xmgczJ28MSoxeu
    vMLiSdwpHNBqLRUs6DrJJ8dIbu+VNhTFS4BtY2+feiU7dbKCTkRl+Z0BWRyOdbkFpD++
    fspQ==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zm0FKX05o/ir7Vyg9+o="
Received: from graviton.chronox.de
    by smtp.strato.de (RZmta 52.1.2 DYNA|AUTH)
    with ESMTPSA id f01e6318J2gWHl9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 19 Sep 2025 04:42:32 +0200 (CEST)
From: Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>
To: Eric Biggers <ebiggers@kernel.org>, David Howells <dhowells@redhat.com>
Cc: dhowells@redhat.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512,
 SHAKE128, SHAKE256
Date: Fri, 19 Sep 2025 04:42:29 +0200
Message-ID: <2952535.lGaqSPkdTl@graviton.chronox.de>
In-Reply-To: <3605112.1758233248@warthog.procyon.org.uk>
References: <3605112.1758233248@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=smueller@chronox.de;
 keydata=
 mFIEZZK4/xMIKoZIzj0DAQcCAwTDaDnchhDYEXH6dbfhyHMkiZ0HPYDF5xwHuMB8Z24SuXYdMfh
 pnovdsgwpi6LNAvnI/lGPrvDc/Mv0GQvHDxN0tCVTdGVwaGFuIE3DvGxsZXIgPHNtdWVsbGVyQG
 Nocm9ub3guZGU+iJYEExMIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQQ0LE46O
 epfGZCb44quXQ2j/QkjUwUCZZK6YwIZAQAKCRCuXQ2j/QkjU/bVAP9CVqPG0Pu6L0GxryzpRkvj
 uifi4IzEoACd5oUIGmUX7AD8DxesdicM2ugqAxHgEZKl9xhi36Eq7usa/A6c6kFmyHK0HVN0ZXB
 oYW4gTcO8bGxlciA8c21AZXBlcm0uZGU+iJMEExMIADsWIQQ0LE46OepfGZCb44quXQ2j/QkjUw
 UCZZK6QgIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRCuXQ2j/QkjU8HNAQDdTmzs+
 Cls6FMoFrzoWdYtOGCW5im7x1G5M/L0L3VOvgEA6m9edpqCc0irbdNXVjoZwTXkSsLOxs2t7aDX
 2vFX54m0KVN0ZXBoYW4gTcO8bGxlciA8c211ZWxsZXJAbGVhbmNyeXB0by5vcmc+iJMEExMIADs
 WIQQ0LE46OepfGZCb44quXQ2j/QkjUwUCZb+zewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBw
 IXgAAKCRCuXQ2j/QkjU1pIAQDemuxTaZdMGsJp/7ghbB7gHwV5Rh5d1wghKypI0z/iYgEAxdR7t
 6KrazO07Ia9urxEAQWqi0nf6yKluD0+gmOCmsW4UgRlkrj/EwgqhkjOPQMBBwIDBBo6QjEMU/1V
 DD+tVj9qJ39qtZe5SZKFetDzXtyqRpwL+u8IbdIjv0Pvz/StziFMeomh8chRB7V/Hjz19jajK3C
 IeAQYEwgAIBYhBDQsTjo56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsgAAoJEK5dDaP9CSNTLQwA/1
 WxGz4NvAj/icSJu144cMWOhyeIvHfgAkG9sg9HZXGdAPsGzKo4SezAYCwqgFKnyUIAjKYl1EW79
 pSCOFS36heQvbhWBGWSuP8SCCqGSM49AwEHAgMEiEhJatNBgxidg8XJFTy8Ir7EsTCeoVY2vJAN
 rysZeAAmSaUWFD4pvXE5RYQFeCYTWTG419H7ocNGUz5u1dgKhAMBCAeIeAQYEwgAIBYhBDQsTjo
 56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsMAAoJEK5dDaP9CSNTGCAA/A2i1CxhQJmYh2MwfeM5Hy
 Wk6EeWruSA1OgSWmaJaoGaAP4mARD2CviJgz8s3Gw07ZTk8SYHOTnv70hUbaziZ3/tjA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 19. September 2025, 00:07:28 Mitteleurop=C3=A4ische Sommerzeit =
schrieb=20
David Howells:

Hi David,

as you mentioned that this patch as a basis for ML-DSA then may I outline t=
he=20
following: the ML-DSA code requires a multi-staged squeeze operation. For=20
example:

squeeze(state, 10 bytes);
squeeze(state, 10 bytes);

must be identical to

squeeze(state, 20 bytes);

With this in mind, may I highlight that potentially the following code does=
=20
not support this notion:

> +/**
> + * sha3_final() - Finish computing a SHA3 message digest of any type
> + * @ctx: the context to finalize; must have been initialized
> + * @out: (output) the resulting message digest
> + *
> + * Finish the computation of a SHA3 message digest of any type and perfo=
rm
> the + * "Keccak sponge squeezing" phase.  The digest is written to @out
> buffer and + * the size of the digest is returned.  Before returning, the
> context @ctx is + * cleared so that the caller does not need to do it.
> + */
> +int sha3_final(struct sha3_ctx *ctx, u8 *out)
> +{
> +	struct sha3_state *state =3D &ctx->state;
> +	unsigned int digest_size =3D ctx->digest_size;
> +	unsigned int bsize =3D ctx->block_size;
> +	u8 end_marker =3D 0x80;
> +
> +	sha3_absorb_xorle(ctx, &ctx->padding, 1);
> +	ctx->partial =3D bsize - 1;
> +	sha3_absorb_xorle(ctx, &end_marker, 1);
> +	sha3_keccakf(ctx->state.st);

This logic above should only be invoked for the first squeeze operation.

May I suggest you consider the code at:

https://github.com/smuellerDD/leancrypto/blob/master/hash/src/sha3_c.c#L625

> +
> +#ifdef __LITTLE_ENDIAN
> +	for (;;) {
> +		unsigned int part =3D umin(digest_size, bsize);
> +
> +		memcpy(out, state->st, part);
> +		digest_size -=3D part;
> +		if (!digest_size)
> +			goto done;
> +		out +=3D part;
> +		sha3_keccakf(ctx->state.st);
> +	}

This loop needs to honor a starting offset in case the previous call only=20
requested a subset of the rate.

May I suggest to consider the code at:

https://github.com/smuellerDD/leancrypto/blob/master/hash/src/sha3_c.c#L643


> +#else
> +	__le64 *digest =3D (__le64 *)out, *s;
> +
> +	while (digest_size >=3D bsize) {
> +		for (int i =3D 0; i < bsize / 8; i++)
> +			put_unaligned_le64(state->st[i], digest++);
> +		digest_size -=3D bsize;
> +		if (!digest_size)
> +			goto done;
> +		sha3_keccakf(ctx->state.st);
> +	}
> +
> +	s =3D state->st;
> +	for (; digest_size >=3D 8; digest_size -=3D 8)
> +		put_unaligned_le64(*s++, digest++);
> +
> +	u8 *sc =3D (u8 *)s;
> +	u8 *dc =3D (u8 *)digest;
> +
> +	for (; digest_size >=3D 1; digest_size -=3D 1)
> +		*dc++ =3D *sc++;
> +#endif
> +done:
> +	digest_size =3D ctx->digest_size;
> +	memzero_explicit(ctx, sizeof(*ctx));

=46or a multi-stage squeeze, it is perhaps not helpful to zeroize the conte=
xt=20
here.

Ciao
Stephan



