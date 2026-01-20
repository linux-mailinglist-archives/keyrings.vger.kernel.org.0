Return-Path: <keyrings+bounces-3858-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MUEGCHub2m+UQAAu9opvQ
	(envelope-from <keyrings+bounces-3858-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:05:37 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BD4BF0B
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E365490ED04
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 20:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD8147AF4E;
	Tue, 20 Jan 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHl86lUh"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54E478869;
	Tue, 20 Jan 2026 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768942373; cv=none; b=V5NEJaBgPtUPzHDSFiMmXdc3IVqa0bmzUrC85DM4PNUATu9SNh6qtzBFXTPhH1kMm+RsUrg+Sej01WO4w58Ff1rvhmNT4DY1hFvRFAOZ+k9HZgS4G4qcb5eZYsa/ZfyE7j7P/CCT/26ba++JtvJ9qJzadD0ABfkHTFm3+RhdZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768942373; c=relaxed/simple;
	bh=cWBmd+6SVqCMDlWlRDRyy1mmdiX760SlRrPD4p0g28o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stFqBtX2hkZ2p6pmErGlYEndvLYY6geUENH5QGg6CKSzVd/yrtOQYtKl6LBJ2AjV6uGiAmG43bMGeR88RaU9SZXVZOX04a2oBatkCZ22JIpCV+FyZHqWAnWl26Vs7j75p/WMnc9vPoZqlyCeiJVHcQEc0J86kUTVRl5Cdx+sNzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHl86lUh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9B0C16AAE;
	Tue, 20 Jan 2026 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768942371;
	bh=cWBmd+6SVqCMDlWlRDRyy1mmdiX760SlRrPD4p0g28o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHl86lUhY0auHqalxqSkh8KfGqaWm2aDNOCB5QCqfGX2RGydBdJi/QXetiwhA9ObL
	 cUl/0gsQws6Ck8C/OhTzY078OVX6uLp5D5iXT2rLdNZacqIoDXrGy/mRXbTQcWe0jq
	 +l7DCmWtmdRocejG6UUu46R5foCZGqBRhiql743qMYSdMaAG9tb5ZhNS88uzQqr5qf
	 442pqt/7QoBU9bJ4OqUnw+ANiGXdw/ZIeiLeXjEc0QgSwBhdQVQTGqJuydvdckybD4
	 8DgXiqY7eWwO+m7RQBXuyFo5SWxMBCcqkxO5ZZw+gLhNWf+VszWbJ0VZOe0fufHO7e
	 nGIJ1F09daVVQ==
Date: Tue, 20 Jan 2026 12:52:49 -0800
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
Subject: Re: [PATCH v13 01/12] crypto: Add ML-DSA crypto_sig support
Message-ID: <20260120205249.GA2657@quark>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-2-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-2-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3858-lists,keyrings=lfdr.de];
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
X-Rspamd-Queue-Id: F14BD4BF0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:47PM +0000, David Howells wrote:
> +config CRYPTO_MLDSA
> +	tristate "ML-DSA (Module-Lattice-Based Digital Signature Algorithm)"
> +	select CRYPTO_SIG
> +	select CRYPTO_LIB_MLDSA
> +	select CRYPTO_LIB_SHA3
> +	help
> +	  ML-DSA (Module-Lattice-Based Digital Signature Algorithm) (FIPS-204).

The selection of CRYPTO_LIB_SHA3 is unnecessary.

> +struct crypto_mldsa_ctx {
> +	u8 pk[MAX(MAX(MLDSA44_PUBLIC_KEY_SIZE,
> +		      MLDSA65_PUBLIC_KEY_SIZE),
> +		  MLDSA87_PUBLIC_KEY_SIZE)];
> +	unsigned int pk_len;
> +	enum mldsa_alg strength;
> +	u8 key_set;
> +};

'key_set' should have type 'bool'.   Or just use pk_len == 0 to mean the
key hasn't been set yet.

- Eric

