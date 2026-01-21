Return-Path: <keyrings+bounces-3871-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEeTDnkYcGkEVwAAu9opvQ
	(envelope-from <keyrings+bounces-3871-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 01:06:17 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DED4E477
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 01:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F212D7CADAE
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B955A1D5151;
	Wed, 21 Jan 2026 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7LGzDff"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D21D555;
	Wed, 21 Jan 2026 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768953970; cv=none; b=XbUHK69c7g6PmkwifjWC8UXvnQgyQB+dEoYpmZKVPoiT+H/fXTMqxa5YNB+akx4FPB3bzXJNLFQT1Y8UCIWis83hahW4fICeHN/7NpsWk86c0QtP8/75FKFTZbYO8UkPS2hLR+8WTh3JGTc9FZrR39qxCaGjhl94nYJBx/3BC9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768953970; c=relaxed/simple;
	bh=Zr0dKdI8zxsaxfaFyAG1kkUBLfApTCk9CJiwbxwsKCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhEdwKD059aXmngLVnmJ1llIGebx20vlzX7sybyE9PeoulDKYJbZ8WnThxs3DacQ8jb4+Sk46vqSNk8RUjs0nbvWPA/Ny1AzyEsgzf2o0R/jNpLivd4v+bXhyq0omZeHxB+J/UhTJ/j2O3QYWoVncKlNTlp8g6ffFq2h9g82jmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7LGzDff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616E7C16AAE;
	Wed, 21 Jan 2026 00:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768953970;
	bh=Zr0dKdI8zxsaxfaFyAG1kkUBLfApTCk9CJiwbxwsKCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7LGzDffzTRPU3xC6K6VXLfr0zWpDmVdO+arqxzcv3vHcE7AN0yPzRu0t0631o0iq
	 N6yL9Lz6qgNKqFqo6wFdduct9lwA1ckvgY1R7ZRJX9cX6kJNWw21uZH1nlSHuioEiF
	 qzEZ8Buk4v4zA16UzEGKM/CP8JjYlhw/MB7gNKtuGO11R/SkBA4agJpJLUJNI///2b
	 j3e4hZ+hmXtGbRzv+fxHYN+oKNy39/IsElmkRqQMIIsgLTAKX+h1kYvPxzvWDlKhuZ
	 HD8O/yEfL/+fHQscHM1IfpATmIMTZ/P6YXbwRFVle8pHe7YgRVZ3Zn44/ggnjOUWq9
	 tXOlQ2aFQ3rZw==
Date: Tue, 20 Jan 2026 16:06:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v12 06/10] crypto: Add supplementary info param to
 asymmetric key signature verification
Message-ID: <20260121000607.GA12110@quark>
References: <20260120220321.GA6191@quark>
 <20260115215100.312611-1-dhowells@redhat.com>
 <20260115215100.312611-7-dhowells@redhat.com>
 <1418295.1768952386@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418295.1768952386@warthog.procyon.org.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3871-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D8DED4E477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:39:46PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > As I'm sure you're aware, C has native support for function parameters.
> 
> And we have a syscall interface to honour that takes a parameter string *for
> this very purpose*.  It just wasn't threaded into the akcipher API.

This seems to be more of a bug than a feature, though.  It seems the
actual goals of this patchset are to add ML-DSA and RSASSA-PSS support
to kernel module signing.  But because of how the code is organized, as
a side effect it ended up extending the KEYCTL_PKEY_* UAPIs as well.
Linux's UAPI stability guarantee holds for these UAPIs; anything that we
add to them, including these ad-hoc and undocumented parameter strings,
will likely have to be supported forever.

Unless these keyctl UAPI extensions are well-justified and come with
documentation and tests, we should just hold off on them for now.
What's the hurry?

BTW, we got hit by this when there was an attempt to remove SHA-1
support from module signing.  Due to the design defect where the signing
is also exposed through KEYCTL_PKEY_*, it caused a UAPI regression as
well and had to be reverted.

- Eric

