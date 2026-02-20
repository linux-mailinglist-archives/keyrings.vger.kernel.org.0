Return-Path: <keyrings+bounces-4068-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPXbCFSomGmvKgMAu9opvQ
	(envelope-from <keyrings+bounces-4068-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Fri, 20 Feb 2026 19:30:44 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B999516A101
	for <lists+keyrings@lfdr.de>; Fri, 20 Feb 2026 19:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED8A53007491
	for <lists+keyrings@lfdr.de>; Fri, 20 Feb 2026 18:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0CE30E0ED;
	Fri, 20 Feb 2026 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qK35Zxs"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1361923C4F2
	for <keyrings@vger.kernel.org>; Fri, 20 Feb 2026 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612241; cv=pass; b=lTalD0WEmaeur+Zo8muFe7/aFdfgLutIV3I0ZZ0+3NlXcvJ/QlfNi0j2kYrDaWkrLuLQHZPnC1dday8xr8wmv+GZwrmQk0H4owdDOwz7kcycO7++F2IgZ6+/Z3LMRkyMbz/8iJhHiJ/uHiRxTNhbggALAQCeqbBfZUbx5LMymtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612241; c=relaxed/simple;
	bh=i/XkIiKCZ10kdPMCUX6PC3bB1lsMgrfAPEq1MVPtP8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwErNiUdHDnlbJYy9U2rr8I7pLnGcGNiFaRCttcdrty+WPscix8DrNhEDQ/Z9PbZrWHZ9TZGo4+HYUf95PsupfrPH5pusG8XuMSdg8eEMEAK9GuzY3kRGTiv7x62Hf+qBmL7LxlHFkMTCyFFNPmm1J6bhoPNLJ3DmBKcCSKp1cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qK35Zxs; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124afd03fd1so3306876c88.0
        for <keyrings@vger.kernel.org>; Fri, 20 Feb 2026 10:30:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771612239; cv=none;
        d=google.com; s=arc-20240605;
        b=ctKCQzdvrQ0wjZ5APwIjcQd/sscBzzFeX5xCPsBPXt1u8KHpX7PehHkWa5W2d2Tsqp
         LXVqXGkvJepOZEdl8sXt1CLrPX2la3YyulinMoapTPjm5u9y7LbzjpDUao8rNEGUcXds
         V5rUVb861FM852Chbg2yiGj2Agx61aOuJLbmurlO28iGvzZCFt7b8HTW7HRfIasBCQG9
         elGVlXG+ydaA3u92qOFTyeiYqO0bNi3cDT3sGlbiV1IAqaUzeT35u2hG+owqu8JAAj8x
         yf1kUekPP3Of8kn0uPhCklKfDJLTsK1pE3tWKN4eVNAhvXg5monVpusbOfDotsIid4D8
         nboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jf9LumeETLRd4Q+S7TnWTRR4BmxsyhjwKcm4GLmlrxQ=;
        fh=pDk0bcE90M/NR1Xz1/5oDdmqfJzsrNxIJ21dU4VeTIM=;
        b=DWlnN/byvtp7PjziVFMuavomctj6xEeu4qa3dppgo9DOE3ajr9EHu5hyiZ0YJ/GiL5
         qp4rFjjRs77gl3ybNVKK7VlnyDUw7oXzuivJnfO2F2v7CPFGBTAWUr8B8944NMliQc03
         REA1chBRCw844g1tb66TUQsBalWkJDDusATYHRHAK1WccckKgh2mRh3DYWwcM0n/yyNj
         mkNoNBnYdq8keR4FRrowFbTnXOb6JRrWcvHHEJxiGnwhknyDcAkZKSaPowaPQII9f3rh
         qf9gMlgYlSFlhJgsGx+FOiL0Do2JM5UhkOncbwC3X6oXqZsvL0R79GwTRo3Okv5uOsUO
         AbaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771612239; x=1772217039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf9LumeETLRd4Q+S7TnWTRR4BmxsyhjwKcm4GLmlrxQ=;
        b=4qK35Zxs6ncmFgMTMXVM3Jgn69RzaY+vmVv9ngotqZ37INtv8lx6jlgMkTfC1XQ2zP
         kt5kIz+sPnO4+hVVNncCDTaqWYBsoVTosMiQuWVQSSr51MXs8yBNc9oOY1TuBTXNt/Uj
         MeRnZ0BvQhwKNs+cFIt3kRETNXI1gvXy+ZNkS5j8VYg1mGa/nu/VSJP7lYqjKVh30zSk
         8yF2n72tC5bZNIvK3V1NaW2Q34VkOTabpDZvpM/CVpkvTWHyVnnKoymWL9i3qWGCPJO+
         lMIz62bX4P4zhXxLoUbzjVgvDEGXZC0Ag2MhFYy+b494UiKSGPEiCwu20TJVvMAE9O40
         rRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612239; x=1772217039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jf9LumeETLRd4Q+S7TnWTRR4BmxsyhjwKcm4GLmlrxQ=;
        b=ewjf4uAwJVd9F0Oy5Tet8VtoJf7AGkW3MrsaxlgLPlzV+j1O0zhU6lwbAJ+bpqfiWe
         72t9z+YC4tLTeWNR1xOogTu4LcY2/dLNT6Fy+2McABWDBoP47gLLrY7xlEXG/cD6giXj
         ytKdJID7lov6MDTihYZojDVynZwJs03axcIm8ZqZbZ58mzvUy/u1PMvKDCfm+XqKtfxG
         ZEAIR1/2dENbBUMNwgy6Nu07hYdz1ytF4HdroiooCB7vf5CRpcbWdJD12QOhyKvg8Lgh
         gHUT1lT7KGpgy8HEzQhWCs3A6JUpx1gRsZ+qOeUi9uQlmbVJ2Fmq4a30JcFDjuK8CUmX
         D7WA==
X-Forwarded-Encrypted: i=1; AJvYcCXkhc5H54zAweuQZgztrUACe21xbqspHmJ3bOZfuq8W9ZhQxMcM3cWODWGtmJ+0uB6yyR1XgXEEUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVk7C2i/WsqgR4+ipXtfto5Vgf3OJomPzITxHjdyQQo3BbI2F3
	DFc5+u7Jg7La+V32W0DbZiKisfD89Z4cvDUTHXxv/el8ubye5rKiklplyG8n7Wom+fgcZK7ZSwI
	q6Sv64H7TH8bpg7J9ttPOf6K3n48P+fJXBwoovGFMpeXHX2LjAabjQA+tbG0=
X-Gm-Gg: AZuq6aJxlPmbFgf9aKvjFuGGyZiTwWi4p0YiG2LC01Jk+NfKJX5ValS50SxfpIAuS0o
	V3YSGDXKLLydApa8ZfMpVuJriSOEN+DMHxiyRzbALEnEBKrd8nmZGt9cMqzs4Fk7Cy0yD5EfuES
	CX/B7WzCuAvgVXhy44YXtFe/VK84/2z7chHBjLCAbmwbrk8l6xR5+5XN+0EA/0cc1wDlrKB04Xy
	5VScTZynEeLVD1j2ZTM0tyQ1AEulohMvj5dmxKWK31dFLm6Xf+sYwpgzhNDq2gmRwCRjOerSGTY
	uxoy72HaPE1BoBr4UmwxDWbJvMTHVrclaL8ODw==
X-Received: by 2002:a05:7022:628c:b0:11d:fc64:9562 with SMTP id
 a92af1059eb24-1276acb7d4fmr205670c88.1.1771612238525; Fri, 20 Feb 2026
 10:30:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192526.782202-1-jarkko@kernel.org> <20260125192526.782202-2-jarkko@kernel.org>
 <06a08cbbe47111a1795e5dcd42fb8cc4be643a72.camel@linux.ibm.com>
In-Reply-To: <06a08cbbe47111a1795e5dcd42fb8cc4be643a72.camel@linux.ibm.com>
From: Chris Fenner <cfenn@google.com>
Date: Fri, 20 Feb 2026 10:30:26 -0800
X-Gm-Features: AaiRm52JS0oQZAXHG6_Gu7bOcgYYVkEln_usNB3YNMY_WcEL-1j3ijEwzY-7EWQ
Message-ID: <CAMigqh1H1NKP9gddjhf4M1v-aM=+EpW9O4KJmu=UysOWhn4ryA@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] KEYS: trusted: Use get_random-fallback for TPM
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-integrity@vger.kernel.org, 
	Jonathan McDowell <noodles@earth.li>, Eric Biggers <ebiggers@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, "open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4068-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfenn@google.com,keyrings@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B999516A101
X-Rspamd-Action: no action

My conclusion about TCG_TPM2_HMAC after [1] and [2] was that
TPM2_TCG_HMAC doesn't (or didn't at the time) actually solve the
threat model it claims to (active interposer adversaries), while
dramatically increasing the cost of many kernel TPM activities beyond
the amount that would have been required to just solve for
passive/bus-sniffer interposer adversaries. The added symmetric crypto
required to secure a TPM transaction is almost not noticeable; the big
performance problem is the re-bootstrapping of the session with ECDH
for every command.

My primary concern at that time was, essentially, that TCG_TPM2_HMAC
punts on checking that the key that was used to secure the session was
actually resident in a real TPM and not just an interposer adversary.
I wrote up my understanding at
https://www.dlp.rip/decorative-cryptography, for anyone who wants a
long-form opinionated take :).

Unless I'm wrong, or TCG_TPM2_HMAC has changed dramatically since
August, I don't think "TPM2_TCG_HMAC makes this too costly" is a
compelling reason to make a security decision. (There could be other
reasons to make choices about whether to use the TPM as a source of
randomness in the kernel! This just isn't one IMHO.)

The version of TCG_TPM2_HMAC that I'd like to see someday would be one
that fully admits that its threat model is only passive interposers,
and sets up one session upon startup and ContextSaves/ContextLoads it
back into the TPM as needed in order to secure parameter encryption
for e.g., GetRandom() and Unseal() calls.

[1]: https://lore.kernel.org/linux-integrity/CAMigqh2nwuRRxaLyOJ+QaTJ+XGmkQ=
j=3DrMj5K9GP1bCcXp2OsBQ@mail.gmail.com/
[2]: https://lore.kernel.org/linux-integrity/20250825203223.629515-1-jarkko=
@kernel.org/

Thanks
Chris

On Fri, Feb 20, 2026 at 10:04=E2=80=AFAM Mimi Zohar <zohar@linux.ibm.com> w=
rote:
>
> [Cc: Chris Fenner, Jonathan McDowell, Roberto]
>
> On Sun, 2026-01-25 at 21:25 +0200, Jarkko Sakkinen wrote:
> > 1. tpm2_get_random() is costly when TCG_TPM2_HMAC is enabled and thus i=
ts
> >    use should be pooled rather than directly used. This both reduces
> >    latency and improves its predictability.
>
> If the concern is the latency of encrypting the bus session, please remem=
ber
> that:
>
> - Not all environments expose the TPM bus to sniffing.
> - The current TPM trusted keys design is based on TPM RNG, but already al=
lows it
> to be replaced with the kernel RNG via the "trusted_rng=3Dkernel" boot co=
mmand
> line option.
> - The proposed patch removes that possibility for no reason.
>
> Mimi & Elaine
>
>

