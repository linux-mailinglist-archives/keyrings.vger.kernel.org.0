Return-Path: <keyrings+bounces-3917-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rHHcFSuxdGlB8wAAu9opvQ
	(envelope-from <keyrings+bounces-3917-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sat, 24 Jan 2026 12:46:51 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 987227D67C
	for <lists+keyrings@lfdr.de>; Sat, 24 Jan 2026 12:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FCC730078FD
	for <lists+keyrings@lfdr.de>; Sat, 24 Jan 2026 11:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B9E252292;
	Sat, 24 Jan 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBT4pz+b"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852DA86329;
	Sat, 24 Jan 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769255208; cv=none; b=Hhk+4Zan5285EubDbrz/eBGXhomOfH09Tz8cDKap2rQw0UPi1uxNOETMTeDgr2kUMheoGDhaaf3ggeHqYe/y7PEEELUT1O3pD2rgoI51jQHaLcPqN+VhVrBDF2w6l6hdO0slW78+kfhCUTi+MD9unp7vuH5GMKPPjSUirpGg2NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769255208; c=relaxed/simple;
	bh=RyO118+86YpQL7AQFPrSVezSkq7Zm44WNp7zns8Uylw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7hNmKMIKfnyFbSai28ScUawxcRXnt8+SiH8ECN/40NAh9VM/KFFtlUGpK0i0psiePopeexl+4IU3DkQaQ1G0oF2jQJpLYl221uMxNyEI000wDs8OOZK+tYmkdvXEx4JnmnG4WmeMueLB/wBRrN5Rg0Inf4wzkRk1Na3SDPvDZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBT4pz+b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C2BC116D0;
	Sat, 24 Jan 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769255208;
	bh=RyO118+86YpQL7AQFPrSVezSkq7Zm44WNp7zns8Uylw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBT4pz+bl9N+0Br0n65JXt6W01cYwXISr+4Ec71nA8s+MrXljQMXrq/x2bvb8GuDx
	 TH1BH/Q2vkyYyphIgfJZTPWwvtUzAKkk+l5qz9V9CzlkU32fCg/1DzMmMzSNScnbU1
	 77KfvcgQA4hHZYGFi0ujFErteEvrOHWvxf88y197ZPDcw63/pnmthkPK+yPHLCl/nA
	 A0gK6WhVCZnognZtxoLz/aefgA1ZqQWuMkVR22vUS85jucpLCncNinZaIA1IpGKfH/
	 XpYT35EjumgM8dS6m72H6QFukHznzTOvdEt7GMrG5d3J6cEoRBmnxLYvvecZK1GKGe
	 8VjHOXtbna3rQ==
Date: Sat, 24 Jan 2026 13:46:43 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
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
Message-ID: <aXSxI9dxfAJ0tj14@kernel.org>
References: <aW_BAchcx2_TXASz@kernel.org>
 <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-3-dhowells@redhat.com>
 <1501916.1768998695@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501916.1768998695@warthog.procyon.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3917-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 987227D67C
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 12:31:35PM +0000, David Howells wrote:
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > I'd use the wording you used already in commit message, which
> > factors more descriptive than what you have here. E.g., name
> > it "external_digest".
> 
> ML-DSA uses "external" to mean that the caller does the
> digestion/hashing/XOF-ing/whatever Eric wants to call it, but the caller also
> has to put other stuff into the digest/hash/XOF/thing that then gets passed to
> ML-DSA if it does this.
> 
> For added confusion, the NIST FIPS tests seem to consider what this patch does
> as 'external' but an "external mu" as 'internal':
> 
> 	"tgId": 1,
> 	"testType": "AFT",
> 	"parameterSet": "ML-DSA-44",
> 	"signatureInterface": "external",
> 	"preHash": "pure",
> 
> vs:
> 
> 	"tgId": 7,
> 	"testType": "AFT",
> 	"parameterSet": "ML-DSA-44",
> 	"signatureInterface": "internal",
> 	"externalMu": true,
> 
> I haven't come up with a better name that particularly describes this.  Maybe
> use "no_prehash" or "algo_takes_hash" or "algo_takes_data"?
> 
> Maybe better than using a true/false value, use an enum?
> 
> 	enum public_key_hash {
> 		ALGO_SIGNS_HASH, /* RSA, ECDSA, ... */
> 		ALGO_SIGNS_DATA, /* MLDSA, ... */
> 	};

I think this would be better idea, as it makes the states more explicit.

And I was actually considering to suggest enum so yeah, I'm on board
with this suggestion.

> 
> David
> 

BR, Jarkko

