Return-Path: <keyrings+bounces-3856-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBzrJDjrb2m+UQAAu9opvQ
	(envelope-from <keyrings+bounces-3856-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 21:53:12 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A54BC8C
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 21:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0626476B3FD
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 18:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0471736C0B3;
	Tue, 20 Jan 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="VgVvSZc0"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9733CEAC
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933879; cv=pass; b=YQRpEsdasbwK0UoP6Fn9MhnOVKeQVW8ctu+4gYAyrkLwDCsiD1OP3o6fSWRxYCejwJQB+u7n8ppl/7JQLdDN++Uws51KWYgH/WuyMPtucwyFhIJrYzQ4qehAWJ1tFZGMi62cT868secr8SN/bVhI/2/XDCdoEGK8bo3+3MuG/mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933879; c=relaxed/simple;
	bh=5aDLW+mihRDd+VHWYR5OgufqUvUAlNEFwdP2RjlGovs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNYg0jEeUprilejKH20FGM9L+5KoUGdkqsaXuAaoc4gnA/knD2sZpD/ZbvUNhu1VCv8QMWOkoUIHOXk4Htjn1Enx5qV/m8pJ2JVR1W2HMFNaudSKUSFL7v7lJ762Oz0/sxmJiwNUTxFF909YNhw349d9wg6Ck2dAniawNwfmZzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=VgVvSZc0; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b79f700a1so119448e87.0
        for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 10:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768933874; cv=none;
        d=google.com; s=arc-20240605;
        b=YEEB6iiVCSA9d/xoPEm5+8f8SwfkRB/GKtqYSCSlJkCmkYvGFYFIzSDsTS7RDdDNh7
         6ID7yzP6InssEQORIRj+JyQoexP7U0406XaR5pibp5r7TZYozz8e+3BjsCTHI6wHSfHh
         azY+u587JbPG2yIyC4K1O8GJn/BjnsBilKE4iNdJGkV+5nU61mV7/pbbkRotlWKbMHGi
         zVWgmiOqiZ6kxxP/uh14KcpP/n2aZ61B+C/sMJG0dDMLpRJzvzatX0f2p6JicEg42vMh
         FdycUZATr8yWYdGJ42F97KZGINiGD+sKuFz6VSJbI680Sw+dGCLPfJ4VosW/kC8evyG8
         k6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8tcAcp7uWuIjCj2SaccYzTy4fHKVPeO3zwjJJlV2b3I=;
        fh=gDplVDes5xsbtcD0pp+9PyYpZAnmsIfiH82LPWHxJ1U=;
        b=gCB5enmN8jQIVM/VwXNJGIKLvn48XMK1ZsHN9OxHabO5Bsvr3Ac7Ae8pselW0OKgke
         VYAP91xXSfqMRhIrwDnlnKXnSa50smhF9IN2TXsFiRM9Qb7B6ZTGFyzCsoJu6W7vXOfr
         dsmME+ogiPbMkS+RnoT+RQJPSQCBX3RKm0fwajLz9MzfNxELo998t2ly09GKSiyf+6+0
         B35658vit0o/crqO44MbC3/RsD4RU3mXuuREgrsMIGtHeywGnyngApKp2gIjsRTt7ERO
         ieLDpA8kotxvxN/WQ43T56oaaXF+cU2RTqHFv26ochUjQNlt3Zc3GJkKy+r6YPckUq+9
         TO3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1768933874; x=1769538674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tcAcp7uWuIjCj2SaccYzTy4fHKVPeO3zwjJJlV2b3I=;
        b=VgVvSZc0FA9yVqTMeBkFcuMee8+jql/WBmKjN/WM+DgrzA9BtUy5gryv8ATjmG1ayW
         etp6RHV78kaBPPUuL2HqjoOYVWIrg88To7tqa8gJmomxI9dMQ3qZBxWDhcGCfGe3AT5h
         l4+qCU4j4rKBM786tSqUFfJ/mJatVcZV5+pY5AaL/YErmBmYhbsuhculkbPT1Gk10hUR
         Gg496OKMN/SGBr4GMiygPfkLriSfy+2Fk85veLCOuc98m7cPNkT2wOTUba0Ku6o7hwLz
         1ZNwQXW++IEoVWrO8Gxcv/6AT6tev77G5WuhgshjB6Gg5TJNqX8/tG/lQJxh5rAN1NFH
         KGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768933874; x=1769538674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tcAcp7uWuIjCj2SaccYzTy4fHKVPeO3zwjJJlV2b3I=;
        b=u5SmeyaNzu7m+M1y4FMcGejPmCI9KuJbqDv1TX2+BCzhenCJnqs/fOBHDKeO5ehItX
         1/gL2FZHKzY3J9xZ+4D5IakMINiZciYi8/eAlhiy/2VwXfgUwsh/HsZovP8LfjVAWzjN
         VCFILtBBOTesWQfVMIvQnHdc4dP7+1UsALbzD6ff9C5EzXgt7p77QrQDiCGyf/tce6/v
         xjgQZHcCJrJhRN7QXfDEfcXt3rOtFHW2dxDJAbkPriixni5LOSDT+5xDJgXqWChS81c4
         lgL8+wcZhZpvyvf1Y2m9g2UKquGpiHTcWh8NYT1kMS/TrmxlbRhDaPDhyPeOUP1/FFqC
         3Xzw==
X-Forwarded-Encrypted: i=1; AJvYcCVc2IFapZxVAoHBR2Zpr0L3IKbNh+iAR9k/SsCqaji/lAC1Gt0Wg+NI07tr0NFtLnWwy4zFuwPNmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5lke5qAc+oG00v69RXEX+17k/+RFe+uzYuKuAYdJIFZgWD6rN
	DDPhtl+QrDnqGDBL4F747QEQyRKr9Gug2WkgpSEqONEKhXeULRjo17q958ocF3zCKnK5V7yFbre
	7vHAWAwao9SlLaxU+Jl3lNRbspz6rJ1zB6RdXC8g5tw==
X-Gm-Gg: AZuq6aLx3hpkVBlUAn9WK670ll3a4Z2Atk25t4j6d8ArohspaRqCK08zYlZ9ENhJHWv
	icmCTdsv7Lf4CADq0l1frkUMlnWSyjNVgI/BMQpKrQj9PeCuKEfjMFCJaN6civcPx95vGCc+9NX
	NYuptUhmoT7tKbav0UKH4EpGyBAZMuhSjnxpd9GHz3Ng1hA3A3ldasUDjKt1Fc5Su1w6gDf0Bim
	MbNiuBKXgBBuzhzQhe37fjAtr3rHl9PfITG/Hd0yCs1nBcbHs+fQjNlz+0tAWFko8T8QuloKqFq
	y/npvMROGuo=
X-Received: by 2002:a05:6512:12c8:b0:59b:6f90:bb9b with SMTP id
 2adb3069b0e04-59ba7194a04mr7131150e87.19.1768933874345; Tue, 20 Jan 2026
 10:31:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120145103.1176337-1-dhowells@redhat.com> <20260120145103.1176337-12-dhowells@redhat.com>
In-Reply-To: <20260120145103.1176337-12-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 20 Jan 2026 18:31:02 +0000
X-Gm-Features: AZwV_QgHfD8HrBxrEOZbsSwT8PQCZski9dDNQ5llHPcq36JCOcYwlSptleCn6M0
Message-ID: <CALrw=nGSr7F-NJri+UFgBVz5J+KFAS6OXa9EFvYo-qitX9R2bg@mail.gmail.com>
Subject: Re: [PATCH v13 11/12] x509, pkcs7: Limit crypto combinations that may
 be used for module signing
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
	TAGGED_FROM(0.00)[bounces-3856-lists,keyrings=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[keyrings];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,cloudflare.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,chronox.de:email]
X-Rspamd-Queue-Id: 0D9A54BC8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Tue, Jan 20, 2026 at 2:52=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> Limit the set of crypto combinations that may be used for module signing =
as
> no indication of hash algorithm used for signing is added to the hash of
> the data, so in theory a data blob hashed with a different algorithm can =
be
> substituted provided it has the same hash output.
>
> This also rejects the use of less secure algorithms.
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
>  crypto/asymmetric_keys/public_key.c | 55 +++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys=
/public_key.c
> index 13a5616becaa..90b98e1a952d 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -24,6 +24,52 @@ MODULE_DESCRIPTION("In-software asymmetric public-key =
subtype");
>  MODULE_AUTHOR("Red Hat, Inc.");
>  MODULE_LICENSE("GPL");
>
> +struct public_key_restriction {
> +       const char      *pkey_algo;     /* Signing algorithm (e.g. "rsa")=
 */
> +       const char      *pkey_enc;      /* Signature encoding (e.g. "pkcs=
1") */
> +       const char      *hash_algo;     /* Content hash algorithm (e.g. "=
sha256") */
> +};
> +
> +static const struct public_key_restriction public_key_restrictions[] =3D=
 {
> +       /* algo                 encoding        hash */
> +       { "rsa",                "pkcs1",        "sha256" },
> +       { "rsa",                "pkcs1",        "sha384" },
> +       { "rsa",                "pkcs1",        "sha512" },
> +       { "rsa",                "emsa-pss",     "sha512" },

Don't we want to allow sha256 for emsa-pss?

> +       { "ecdsa",              "x962",         "sha256" },
> +       { "ecdsa",              "x962",         "sha384" },
> +       { "ecdsa",              "x962",         "sha512" },
> +       { "ecrdsa",             "raw",          "sha256" },
> +       { "ecrdsa",             "raw",          "sha384" },
> +       { "ecrdsa",             "raw",          "sha512" },
> +       { "mldsa44",            "raw",          "sha512" },
> +       { "mldsa65",            "raw",          "sha512" },
> +       { "mldsa87",            "raw",          "sha512" },
> +       /* ML-DSA may also do its own hashing over the entire message. */
> +       { "mldsa44",            "raw",          "-" },
> +       { "mldsa65",            "raw",          "-" },
> +       { "mldsa87",            "raw",          "-" },
> +};
> +
> +/*
> + * Determine if a particular key/hash combination is allowed.
> + */
> +static int is_public_key_sig_allowed(const struct public_key_signature *=
sig)
> +{
> +       for (int i =3D 0; i < ARRAY_SIZE(public_key_restrictions); i++) {
> +               if (strcmp(public_key_restrictions[i].pkey_algo, sig->pke=
y_algo) !=3D 0)
> +                       continue;
> +               if (strcmp(public_key_restrictions[i].pkey_enc, sig->enco=
ding) !=3D 0)
> +                       continue;
> +               if (strcmp(public_key_restrictions[i].hash_algo, sig->has=
h_algo) !=3D 0)
> +                       continue;
> +               return 0;
> +       }
> +       pr_warn_once("Public key signature combo (%s,%s,%s) rejected\n",
> +                    sig->pkey_algo, sig->encoding, sig->hash_algo);
> +       return -EKEYREJECTED;
> +}
> +
>  /*
>   * Provide a part of a description of the key for /proc/keys.
>   */
> @@ -391,12 +437,17 @@ int public_key_verify_signature(const struct public=
_key *pkey,
>         bool issig;
>         int ret;
>
> -       pr_devel("=3D=3D>%s()\n", __func__);
> -
>         BUG_ON(!pkey);
>         BUG_ON(!sig);
>         BUG_ON(!sig->s);
>
> +       ret =3D is_public_key_sig_allowed(sig);
> +       if (ret < 0)
> +               return ret;
> +
> +       pr_devel("=3D=3D>%s(%s,%s,%s)\n",
> +                __func__, sig->pkey_algo, sig->encoding, sig->hash_algo)=
;
> +
>         /*
>          * If the signature specifies a public key algorithm, it *must* m=
atch
>          * the key's actual public key algorithm.
>

Ignat

