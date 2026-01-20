Return-Path: <keyrings+bounces-3869-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACRxATYTcGlyUwAAu9opvQ
	(envelope-from <keyrings+bounces-3869-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:43:50 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9E4E02E
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 58EA69A7C29
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130423BBA05;
	Tue, 20 Jan 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9ylFyXw"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CDB2FC006;
	Tue, 20 Jan 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952181; cv=none; b=e1N0EMSrKguAK4oPvGQ8ySY0pn+aMR+THo/Jv8awmWAePRtHva/I1qdR/zSPSPouPLjYQavhgVKmBkpEoQ9lUCwaaMzc50E8ABNPQX+5l6P846gQuSbHQ2CflU5lEmpbZe4iPHkCDgJnDTV3H3B23vP1JSmYsebdiiPAnJMFHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952181; c=relaxed/simple;
	bh=JVNRNACa6TPDv+p2Lh7rEWsnCHi0OceJ8r+6RO13z1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngbnof2iNC6hipbJoyiQzH0M08AgB8ew0f+PgSW/t8YBXbK0wLRpBveChuTSiePDCexltaMBdrdGI/khlxKlxybG5pdperC3bkeGey4S+LmrmDZVt2z+wo+748ED6qCMtr1pWVMrh1cpbT80HEp9t4WsYYUCT/1gjCpAeee1rsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9ylFyXw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A69C16AAE;
	Tue, 20 Jan 2026 23:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768952180;
	bh=JVNRNACa6TPDv+p2Lh7rEWsnCHi0OceJ8r+6RO13z1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9ylFyXwSjMfE3Z3hk40VK7m2MA5EX9mMkwaieMGFAa8ayfMJxbyg02z8mPY6dIRK
	 OE5kutW5Hn5oV/giBZhWciSHV/CwHGlAi0TfUjtHEClQjQs/RPyUP4wrlCqaFArflh
	 DVYg399eMsK127AXIijiT2YYpBr5VD0QdHjDlav6onmp8FJnxCO7fZOcnONMiFDhnY
	 ajyOCb3EdTEi053uzWxNuJgMIGVXlqFxP0h6zMOLcMrvX0Mdmiy92wiTzbzRhvjiCm
	 zKPktv7FEJ+cFvG91enu0XxFgC+/nxtBKHPviBv5MbVfo++FwjoqYmodZZzJj8vEQi
	 rZDFBaf89qu6A==
Date: Tue, 20 Jan 2026 15:36:17 -0800
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
	Tadeusz Struk <tadeusz.struk@intel.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v13 07/12] crypto: Add RSASSA-PSS support
Message-ID: <20260120233617.GA10653@quark>
References: <20260120224108.GC6191@quark>
 <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-8-dhowells@redhat.com>
 <1416722.1768950957@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1416722.1768950957@warthog.procyon.org.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3869-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 57E9E4E02E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:15:57PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > As I mentioned in another reply, error-prone string parsing isn't a
> > great choice.  C has native support for function parameters.
> 
> But is constrained that it has to work with KEYCTL_PKEY_VERIFY's info
> parameter.

The cover letter of this patchset summarizes it as "These patches add
ML-DSA module signing and RSASSA-PSS module signing."  Adding
KEYCTL_PKEY_VERIFY support for these algorithms would be a significant
new UAPI feature that would need its own justification and its own
documentation and test updates.

However, it was established pretty clearly in past discussions that
KEYCTL_PKEY_* are a mistake and basically exist only for backwards
compatibility with iwd.

So I don't understand why you're advocating for adding new features to
them.

- Eric

