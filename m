Return-Path: <keyrings+bounces-3859-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD64Atv6b2mUUgAAu9opvQ
	(envelope-from <keyrings+bounces-3859-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:59:55 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EBD4CA45
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39D8E9262B8
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 21:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA533E95B5;
	Tue, 20 Jan 2026 21:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlfGpW5t"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4640D3B8D68;
	Tue, 20 Jan 2026 21:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943555; cv=none; b=FdTUNoCEyWP4vgz61KskpN30OCwSPH5bJ2f+tcUaHDvKRvIfWJAup432sWB0ecTu3oAslBdNpL6gkxCsPrbNCQAgYpd49iqvyT1ZaU4jXCre1fwzxgnjCDxT7/kMs85sCbTo4LJ7MHjft3mdNozCRfjzVJyxRO05W21WrQE2gx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943555; c=relaxed/simple;
	bh=EjTJZz3QAncMdQfiVyB8kJwhYsBN1P9XfIJbtmpj6PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxBeu9nSIztfihAe1sEFzKi7MmZkHRLpSj/vNupKCpexa0MURenXE+WTqvGVdzcB7xyiRF/TGVu2w9YlJ2NyXR9z1gmbaihkJ+hsHw2i6Rl14JLzB3/pE4XeNQQZKAGo9SpjpzIuB9j5hpZn/CEK5lALkuHjSITMx8Al4ccvL2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlfGpW5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31CBC16AAE;
	Tue, 20 Jan 2026 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768943554;
	bh=EjTJZz3QAncMdQfiVyB8kJwhYsBN1P9XfIJbtmpj6PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlfGpW5tJc83mFO8S3Plauah4xYEux8tc53vC6rTsEDdzj7ejsSJxXdDd4Xp7O6cV
	 8fT80cHVWpMss2Cw/W2JxsfAASaO34ip0ORKcEaPirdhrCN6yTeUwyGzh1gjPTpMFx
	 9cNZQHE4qoIvhZXoNZRs7gjaSBQcmya9mj4w6QK9Oo1C+qOzdubzGsCnQxwMD3atEj
	 G06YqPEE7UIqBQE0cM46iDjifIva4cVhvsXcUWMIAThcHqfmSu8SJaRBII+06ULkcT
	 Hjiv/LXzbpdX0rno3gsGjp2TVTC3jvcmg9YT46/uuqHwaiTK5koz6ii+W8znIPa7wq
	 bSfMQM2q+MdaQ==
Date: Tue, 20 Jan 2026 13:12:32 -0800
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 02/12] pkcs7: Allow the signing algo to calculate the
 digest itself
Message-ID: <20260120211232.GB2657@quark>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-3-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3859-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: D9EBD4CA45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:48PM +0000, David Howells wrote:
> replace sig->digest with a copy of the contents of the
> authenticatedAttributes section and adjust the digest length to match.

As I mentioned on v11, it's misleading to start using the term digest
for something that isn't a digest.

Naturally, this confusing introduction of non-digest digests seems to
have already caused a bug: IMA calls pkcs7_get_digest() to calculate the
digest of the module.  But now that's no longer necessarily a digest.
It could be the entire signed attributes.

For security-critical code like this we need to have a clear design, not
just patch in hacks that overload existing code like this.

I'll also note that this commit doesn't fully implement "Allow the
signing algo to calculate the digest itself" as claimed, since only the
signed attributes case is handled.  It looks like the next patch is
intended to handle the other case.  But it's not made clear at all that
it's a two-part thing; this patch implies that it's complete.

- Eric

