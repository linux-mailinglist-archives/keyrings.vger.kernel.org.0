Return-Path: <keyrings+bounces-3984-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIeJKS8xf2k8lQIAu9opvQ
	(envelope-from <keyrings+bounces-3984-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 11:55:43 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D380BC5B33
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 11:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78086300EF91
	for <lists+keyrings@lfdr.de>; Sun,  1 Feb 2026 10:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8542F2905;
	Sun,  1 Feb 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="KZXxTBI6"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D182581
	for <keyrings@vger.kernel.org>; Sun,  1 Feb 2026 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769943340; cv=pass; b=LnXOCNF3DZAMoP8NUUb/SmVQ3+1cQODOMx0fSmrLqItqOY736afhuXluilfoqwEldlsnuCSbL9XmLs6d5JyAzdelDREGjEoU8qNBhYNnCmMaHd2p/N1JGGtSnPaAmp0lZYfkzIRS40wvobrneogzZlTRuNJ2ys2ZV69eIkVmGC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769943340; c=relaxed/simple;
	bh=1Swfe2etv/wNCLCtXc4nmkEHhtKTjFFzP3hrwHN72mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXsU76yFQPzx+vuPH4lMOwu595/U69P/OA42leKrzc7/oB3nd5rTJmnkRQxWwjBkFhfLFylup2EC9YKujHRpAuL5J4AXPKQCryf4ATzM6pSxVuiEwnd96S4IPgBVuF6pifsj9O4DonVVfUjIhJL6nl6ehmSxlOB4OrCa6Bl2Sos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=KZXxTBI6; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-385bdc72422so29812721fa.1
        for <keyrings@vger.kernel.org>; Sun, 01 Feb 2026 02:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769943337; cv=none;
        d=google.com; s=arc-20240605;
        b=EbEB7hIe1LcFOcIfiLgZrHf+5ppyK99TrVngMNv/Xamz6T6cJOUIRi+SqTedKwEzKd
         QqxPRXbOd7lH9hIgaRA9e3RxqSmIK7GtShaxfh029aTXo6kOTqbJEx4lLdoa/iT8tQdw
         u3XHbgS7rHyQbvNWNTjUgkJSt5Ot5kXdV0Xx69uD1NSBxVhrTzGBLLwGL1AjMhmlZ0uP
         ZG1qtXNwFHBnV/gVE6eZfj2Z1JG6JiNWqx7ho3ZnZMBNKRY2HYji2iaPJ4VhkxR497JN
         ELO6SIfCvGuvzww0aBgPyYTB2NtBnZymcq+hAmvhAmm5kViQqK/WX2hgy+T7PkHy1TF3
         13zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8GpgGKP5IZleqQddKeEio7KMhNEW9pWbymGbf+VxVuQ=;
        fh=iuQKaTDgBKU1kxeHalQdlWepERKXWjV7dByCgtuUo8Q=;
        b=QPF+kOgarxGCC2Y953gh7JvLbMF8aloupQ8d9zCtNL8t2ugq02h741i6Xgrg8zcFMj
         XCcYIKyoKv/Fz4KezieH4N2Xf95qhaVT4kHlhbDZ30FfqKS5B/ban/Vyp1Hq5wqxykHV
         k7aUFnZTwysHaOuVmWbG5Nf26MaOkEqrHpkGKUdsIQtqsyPCMoggjXWePZSU7w09nGpb
         dmUbYMFph/Z3PUi2Pw9wyqYkhaCK63uQxEMqZevHO9Ig0/keSM5DGyD0QuIEK8RVkzKF
         hIDU8FHFb7sH7w7aEGvyQqBuKOSyeJTpr3Ye1YIuJo5PI/zIzvZNNXyqoR3/xzBmZ3ed
         f8Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1769943337; x=1770548137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GpgGKP5IZleqQddKeEio7KMhNEW9pWbymGbf+VxVuQ=;
        b=KZXxTBI6Sg1e64M7h4Dz9YEEiKy/jVdTz/QQYpM3Y+iAFCt68s39O0l9gPSc1L8qYi
         61Aut5c8xYW/EUmb2FVEJgsJuXTdr7JA3ZLEbWvviwXHrwxfCAsmW/Myuj6vdxZhl48Q
         DCyg+38noI1eDFp1j4BfAGzb/bnegPX+zMLiW6vqOaQxrld4OgQqJxOlh6bX3mJaKP/j
         F7xdjYkY+3MHzTRkpvUVm3kS8Gut4NhVs0ybyT1Uy0pC/95qwDojh0ICUygWOxBAiNeG
         88Fiky9+060y6ifljT6IbrDKPLJphGBrdBTbT+y+oqzG/3HOyVrkN+5156sH1V0S/wRg
         CygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769943337; x=1770548137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8GpgGKP5IZleqQddKeEio7KMhNEW9pWbymGbf+VxVuQ=;
        b=kNJGd0QIMEBlT/ELvOGfPUiH+ikcB1tOgk7y8j8T5+CAZVyxzjXEW7rvUzlr4iChZy
         EL2m96hRN2vNmX2I0vA2tmPzLD7J+bQzeFiGp+8IqQdDuyEjY+TelcacWoOmHSQqF8MI
         oSpg53Ejw4Hf4Keer0MwuMZPAg2MadG87OwS94hI/xHfR/Fj4C/Jjt7K5mOk5gFg5lsc
         dfIdCdXDAF2xLTXo3K+rnIR7q0YOMxYCCLQu77DQNGr7u9toGDMFd2bXpSE4MILnhm27
         XpZov8TV4+XD4slR45SueHhdNufDtIUIHEir7DlvTiWZFrIcgFq4BK3MvBikpWtN23oj
         OOJg==
X-Forwarded-Encrypted: i=1; AJvYcCUuUPGGPmSQoAhOSI4b1u33eLbgu8tTf9iamDpU96RWvw7fmyoiXAS4ez1g8HbX/I9rKliwPjIrtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VsLWThKiBVB2Zw4zKuPAhCHxSCDsCO6YNZtyl0XrGlF9SUwv
	rI8ycPk+jFBHF9KdFo1XTzPBjVt7tN1Ht2pyDaqTKTZO0sK09wTzoqs6tqsXp30HEjkSyVPD1Oq
	jM5kwwBtSBXFhuKVdFggBI+k0T7xH9t1Prx9N42wCWTXR+MhaoWOy6cjIiA0Q
X-Gm-Gg: AZuq6aIyM3SAhy7q5X8/I63j1c4bms22CY4+5r+ug6u1So2Y/wdlmIQRM+6N3zc6pWO
	PfL4OBxTxzKRhe3SKhB4SoSXI7D/G5AYuIhU2z2FF+lqP/XExMi8qgLynmuMwbmwjjRHdvCjNWz
	NushPZUPiGOYwoF/7s6IE0HTJSefGB7i+wYgURhr42Ckb+WDRgh94zBsv/2WuPhfLmWVGy75grb
	aOv4hdp1syB4cNwdDBvD54H6/sS5drtTwifqGyc7VZwW0Zylj5hkPRnzuOsh41OUfFWhBYRvg2s
	NX33Q7SFo2Y=
X-Received: by 2002:a05:6512:39d4:b0:59d:d661:7918 with SMTP id
 2adb3069b0e04-59e16433cf6mr2997894e87.33.1769943337439; Sun, 01 Feb 2026
 02:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201035503.3945067-1-hodgesd@meta.com> <20260201044135.GA71244@quark>
In-Reply-To: <20260201044135.GA71244@quark>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Sun, 1 Feb 2026 11:55:26 +0100
X-Gm-Features: AZwV_QiiMQ-nKAcQSxRODo5dnWjw_Py087hLnp2WQPPd0C_t5npaQXViBAQcx60
Message-ID: <CALrw=nG0Pj1W-bZ6qQax0WnxSayCtYx97ivRuQMsVZHbsQZong@mail.gmail.com>
Subject: Re: [PATCH] crypto: pkcs7 - use constant-time digest comparison
To: Eric Biggers <ebiggers@kernel.org>
Cc: Daniel Hodges <hodgesd@meta.com>, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-9.16 / 15.00];
	WHITELIST_DMARC(-7.00)[cloudflare.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[cloudflare.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cloudflare.com:s=google09082023];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3984-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cloudflare.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ignat@cloudflare.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D380BC5B33
X-Rspamd-Action: no action

On Sun, Feb 1, 2026 at 5:41=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Sat, Jan 31, 2026 at 07:55:03PM -0800, Daniel Hodges wrote:
> > This creates a timing side-channel that could allow an
> > attacker to forge valid signatures by measuring verification time
> > and recovering the expected digest value byte-by-byte.
>
> Good luck with that.  The memcmp just checks that the CMS object
> includes the hash of the data as a signed attribute.  It's a consistency
> check of two attacker-controlled values, which happens before the real
> signature check.  You may be confusing it with a MAC comparison.

On top of that the CMS object and the hash inside is "public", so even
if you have state-of-the-art quantum computer thing you can just take
the object and forge the signature "offline"

> - Eric

