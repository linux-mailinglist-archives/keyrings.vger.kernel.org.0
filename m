Return-Path: <keyrings+bounces-3827-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKu0MbFocGkVXwAAu9opvQ
	(envelope-from <keyrings+bounces-3827-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 06:48:33 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338251B0B
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 06:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 153A2744C49
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 14:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1516A43C076;
	Tue, 20 Jan 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="PYoULEK4"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0650843C064
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917978; cv=pass; b=SeKXVDqdK20mYGh8EHf3xrEvW+p+ZfXnOpK1OTXjl0gAubW6P1W63e+FkjguybrhamsfbraS0+m94B71kGy7vHagj+V9IMVjKXE+fIZJf7V6ha26OvqKo7r+SKStTds002nEypJyiszOmR9BbYmB34J2dSqhfDYyGhwqr4IQvaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917978; c=relaxed/simple;
	bh=YK2c/N6z+9ArDdm+zc44ynJ17RZ2p78JcQ4HLMIlkFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3bGkkjPXWizQ+9Sh6xfP2uhaZE1k+GR4mIkwO1GIF5lel4YBVc8SI0wAeCMvFEq5cIqq5RyrHHpwEVPoo8BOD0Kc+rR5q70188gU9MeF9OBGC1Q+sX+JyOCjyVvWZKsoS8Ucceid3ef2Vdx7IVQHUl1JKH3cDQzwS6B4LVWQtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=PYoULEK4; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38305d006faso47260011fa.3
        for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 06:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768917974; cv=none;
        d=google.com; s=arc-20240605;
        b=hJYoIUHYD2AvE/3GAMuuuMIgMv36rPSWlSTJPHSX4szrNbw5qa7q4fvrBg3/uW6G15
         PKk9igLbKA9iI9Iu4+fAl7rwJ0mR+swu9827OqIXxz9MuwQTNkDrMmMtn6QvxtiKmTYN
         OnDjuQN1r+uNgIRJ9NcO+vaOKcHvtv7XzrCgaga+VcttkFZStGAP/soiG/OI87fYL3NP
         1rVHP+NYslLqW6ebLqUQCmHWepB0YphMh9RKN7PKkJhmxvzj3sIzmLac3Uv/Ntpwv0Gc
         E802ztGXCxDQutZvJuBmXvBAnF80RPXHQNFcvIn+BOV+cRLbBuGUiGz9xogO8L4/uz8D
         GQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=coebzWgpCcGie0B0iLVoXdMDPnL95oM6P6x36fKk/EY=;
        fh=buSAmIirBH1qPXghMVZtAJrTHBsVSZNq35+5XQl/vBE=;
        b=K5De8bdN5jshFBW9S/qh+Pm7wBC4phxHIIM7aElXDFvb5TOO6zEEJiyWGN6GRrm7Mv
         s4Fg9b1rBG1Ca2+zIwCN5mO9lnFHb/5aRtylOUeZI3SQiur+mbfA7eTrT4Dz2y+S9G9w
         fspbK0PYu+UENT7It1b75W8qKA0XrRDwmBuZ6ePc9xVECwS/hOHIQ8dMjMQ1eCbs6il6
         /kGHQ5G2fe8EGcvym/F7E7Ebfy4b0hP8lU1AbHEZWhxmwdZeIcgtf9kjPqS7xfHcEsjD
         5IMbFRj/FOo8mTOCj0CQZAP/wpUMvlasZFP6JvbPXId5QxJHKLnN7EKNv/RQyNdTI2cD
         gpJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1768917974; x=1769522774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coebzWgpCcGie0B0iLVoXdMDPnL95oM6P6x36fKk/EY=;
        b=PYoULEK4cqitfrBlIQZhi3kBTcJ+4N1ROiEDanbo1dg1WfyOIkx6t5rW2nuJUV9UjM
         dy7Iz80h/Q8OrjKMs0wAC29Ed/+tYt8l3KFLwSUhWbYdWR0/UPdJDh5vOHAD6PGVLt4Z
         wFGwr7plHN1/0MWWvVGoF0P2Ycb+Pnj3JVRNtgfTZmsS+6j+xW+lF3nM+7GcDY18knjA
         mbl6pYs3dt+9c6N0OPuAZ1ScUp2RKzD0RUDmz2GyoKmSnMA8jvzrM5aRMvjWWTHO5dox
         2CHvvcz/jF/yOMCKU/9q35LF1xXj8m7iQUC4MiFwXTnoKXwk2Dx5StR/NS0HDUD4sll/
         VslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917974; x=1769522774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coebzWgpCcGie0B0iLVoXdMDPnL95oM6P6x36fKk/EY=;
        b=eZ+ZW6Wa7VxRszaqjTADs8zBh5eFbqcg4pKGKumbX+Ei6XLTtNZDBb4yQRSSzBsTKX
         KeXSy0YfCQD0AzStka1wPVWPvcYMUI4ZvHTFPvxziwp/azil0XOBS949R3og4rLvNe+1
         /dJLewrLabSpK+KbjfAwKz0K8XG56svR9gPnY+v53m9YNgLUOEz/XUQ202+N491tlaDq
         rcZ9LD9hRxeK6CmgKyrHIO8kzYhpy+bgs8vXUeRXAJHcteHyZ2YzwciFgYkLybd37aSV
         /fEHOEUUjuSGpVXcfKjQOn6pVTjVBP4JK+wJ+pxwG9G9jgCP2pB1Ea8KkCb7bP3GVu9V
         6WXg==
X-Forwarded-Encrypted: i=1; AJvYcCWNGXI318Nvc4dOTZ5cVFzrLgbqRfx2VWIy9D3CquJ/8aC8nzRC1PhdvstIUKGxr4aGzF4BqShSHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEfu4tk766tt3yvfH1PNDKViNbX8csUlFEkSSPZ/rWk5doF/u
	aPhXS/n4kNKLwOAu5lixFeKiQ+Kv14HEJHYRb+nOxjFCaybAJaxBtonaZbu1wQeCYa0aTUXwG36
	cgrve8l9oJwt72ccsfczanBuJ3+zd00dEskxnr1p7Kg==
X-Gm-Gg: AZuq6aLlXFn+fdNC0kbKUEUraVjB27D6GXpedcaJD7Un5Yi0xi3tgekwv00It7uKrtv
	AsB6iBZnIj+n3IPdjDPHoCSEbpt51IzcY0l1bcDsrOe1bbZyIOn73hRoXOr82c5MOqWNVJo8Iae
	ZGlkg3lArs1znvvEmXrwJ1JGyGUjKoH78Y0J2Tc7DietYLqGEN/2zlUjFQ6YbJePbxjkcAnJYQz
	gn1F6M+2rjQ3diyGARQ8N7ZVpI25UloVKxBfV+OXTz3bQgGHuvaWpjE5QEzucx09fVUlo5Wlqv9
	Kt6kfusA+9Y=
X-Received: by 2002:a05:651c:31cd:b0:383:20cd:530d with SMTP id
 38308e7fff4ca-38384147aa6mr58209661fa.7.1768917973945; Tue, 20 Jan 2026
 06:06:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115215100.312611-1-dhowells@redhat.com> <20260115215100.312611-3-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-3-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 20 Jan 2026 14:06:02 +0000
X-Gm-Features: AZwV_Qig-WseM1AqWnFAmAYc7N-AnkJS9PkeaesylQLn3vd-pGi7_2LyqZ5fUb8
Message-ID: <CALrw=nH8zOXiyiCGkx1A533ijM=pyVebbhYCFpUyvP0bnjrXzA@mail.gmail.com>
Subject: Re: [PATCH v12 02/10] pkcs7: Allow the signing algo to calculate the
 digest itself
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, 
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-8.96 / 15.00];
	WHITELIST_DMARC(-7.00)[cloudflare.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[cloudflare.com:s=google09082023];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3827-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[cloudflare.com,reject];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cloudflare.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ignat@cloudflare.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[keyrings];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid,cloudflare.com:email,cloudflare.com:dkim,wunner.de:email,chronox.de:email,apana.org.au:email]
X-Rspamd-Queue-Id: 7338251B0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Thu, Jan 15, 2026 at 9:51=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> The ML-DSA public key algorithm really wants to calculate the message
> digest itself, rather than having the digest precalculated and fed to it
> separately as RSA does[*].  The kernel's PKCS#7 parser, however, is
> designed around the latter approach.
>
>   [*] ML-DSA does allow for an "external mu", but CMS doesn't yet have th=
at
>   standardised.
>
> Fix this by noting in the public_key_signature struct when the signing
> algorithm is going to want this and then, rather than doing the digest of
> the authenticatedAttributes ourselves and overwriting the sig->digest wit=
h
> that, replace sig->digest with a copy of the contents of the
> authenticatedAttributes section and adjust the digest length to match.
>
> This will then be fed to the public key algorithm as normal which can do
> what it wants with the data.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/asymmetric_keys/pkcs7_parser.c |  4 +--
>  crypto/asymmetric_keys/pkcs7_verify.c | 48 ++++++++++++++++++---------
>  include/crypto/public_key.h           |  1 +
>  3 files changed, 36 insertions(+), 17 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_ke=
ys/pkcs7_parser.c
> index 423d13c47545..3cdbab3b9f50 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -599,8 +599,8 @@ int pkcs7_sig_note_set_of_authattrs(void *context, si=
ze_t hdrlen,
>         }
>
>         /* We need to switch the 'CONT 0' to a 'SET OF' when we digest */
> -       sinfo->authattrs =3D value - (hdrlen - 1);
> -       sinfo->authattrs_len =3D vlen + (hdrlen - 1);
> +       sinfo->authattrs =3D value - hdrlen;
> +       sinfo->authattrs_len =3D vlen + hdrlen;
>         return 0;
>  }
>
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_ke=
ys/pkcs7_verify.c
> index 6d6475e3a9bf..0f9f515b784d 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -70,8 +70,6 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>          * digest we just calculated.
>          */
>         if (sinfo->authattrs) {
> -               u8 tag;
> -
>                 if (!sinfo->msgdigest) {
>                         pr_warn("Sig %u: No messageDigest\n", sinfo->inde=
x);
>                         ret =3D -EKEYREJECTED;
> @@ -97,20 +95,40 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>                  * as the contents of the digest instead.  Note that we n=
eed to
>                  * convert the attributes from a CONT.0 into a SET before=
 we
>                  * hash it.
> +                *
> +                * However, for certain algorithms, such as ML-DSA, the d=
igest
> +                * is integrated into the signing algorithm.  In such a c=
ase,
> +                * we copy the authattrs, modifying the tag type, and set=
 that
> +                * as the digest.
>                  */
> -               memset(sig->digest, 0, sig->digest_size);
> -
> -               ret =3D crypto_shash_init(desc);
> -               if (ret < 0)
> -                       goto error;
> -               tag =3D ASN1_CONS_BIT | ASN1_SET;
> -               ret =3D crypto_shash_update(desc, &tag, 1);
> -               if (ret < 0)
> -                       goto error;
> -               ret =3D crypto_shash_finup(desc, sinfo->authattrs,
> -                                        sinfo->authattrs_len, sig->diges=
t);
> -               if (ret < 0)
> -                       goto error;
> +               if (sig->algo_does_hash) {
> +                       kfree(sig->digest);
> +
> +                       ret =3D -ENOMEM;
> +                       sig->digest =3D kmalloc(umax(sinfo->authattrs_len=
, sig->digest_size),
> +                                             GFP_KERNEL);

I'm still bothered by this "reallocation". You mentioned we need to do
some parsing for attributes, but it seems by the time this function is
called we have all the data to do something like
kmalloc(sig->algo_does_hash ? umax(sinfo->authattrs_len,
sig->digest_size) : sig->digest_size, GFP_KERNEL) during the initial
allocation. Or am I missing something?

> +                       if (!sig->digest)
> +                               goto error_no_desc;
> +
> +                       sig->digest_size =3D sinfo->authattrs_len;
> +                       memcpy(sig->digest, sinfo->authattrs, sinfo->auth=
attrs_len);
> +                       ((u8 *)sig->digest)[0] =3D ASN1_CONS_BIT | ASN1_S=
ET;
> +                       ret =3D 0;
> +               } else {
> +                       u8 tag =3D ASN1_CONS_BIT | ASN1_SET;
> +
> +                       ret =3D crypto_shash_init(desc);
> +                       if (ret < 0)
> +                               goto error;
> +                       ret =3D crypto_shash_update(desc, &tag, 1);
> +                       if (ret < 0)
> +                               goto error;
> +                       ret =3D crypto_shash_finup(desc, sinfo->authattrs=
 + 1,
> +                                                sinfo->authattrs_len - 1=
,
> +                                                sig->digest);
> +                       if (ret < 0)
> +                               goto error;
> +               }
>                 pr_devel("AADigest =3D [%*ph]\n", 8, sig->digest);
>         }
>
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 81098e00c08f..e4ec8003a3a4 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -46,6 +46,7 @@ struct public_key_signature {
>         u8 *digest;
>         u32 s_size;             /* Number of bytes in signature */
>         u32 digest_size;        /* Number of bytes in digest */
> +       bool algo_does_hash;    /* Public key algo does its own hashing *=
/

nit: still do not like this name, but have no better alternatives so far

>         const char *pkey_algo;
>         const char *hash_algo;
>         const char *encoding;
>

Ignat

