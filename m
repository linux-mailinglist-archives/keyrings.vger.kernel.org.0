Return-Path: <keyrings+bounces-3723-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D5CF7480
	for <lists+keyrings@lfdr.de>; Tue, 06 Jan 2026 09:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15B43300CF16
	for <lists+keyrings@lfdr.de>; Tue,  6 Jan 2026 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE75A309EE4;
	Tue,  6 Jan 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaVNs+9q"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3732BE7A7;
	Tue,  6 Jan 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687763; cv=none; b=V1a6iMC+2kb9VtHfHMMn8maaR0prLzFLNPRJ/lSHMsTHE4UutAZdKPyw1pWe2qYlCc7nAPSXc4jp5QZih5m8DGIQVpk23lb7kH/q2n/vUCTkHWkdaBUTOq+0DhhmoR1ZqBYCDIzECFKTdoHQFsTCQfZ/HGiGaJgsdVJyUYTWp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687763; c=relaxed/simple;
	bh=zUCkUyE6k3iHJ7NjEEtR7oYS69LNRpO0sGSAGr7AO14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIMXecfD/+hSswcspjbwUagQMjRGV32d+v36wk0pMiI5ShxABXD8Uh44CtBYl4/iRGih6G9V5PetUAb0Ux+RhdcBsWRhDlLCKiQ2rbJ1+OqEA56EYz1edS0UkIr/V38m/i8EXiz6WG1ZfaQOKCKYu0FXpoewm5X3BCOehPluliQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaVNs+9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AF1C116C6;
	Tue,  6 Jan 2026 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767687763;
	bh=zUCkUyE6k3iHJ7NjEEtR7oYS69LNRpO0sGSAGr7AO14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaVNs+9qS9dzSVC2/J00PBerRWZrDkr3hBogTQQOh8l6DmTRUcWV5IeE1GzMIR75b
	 jn4IB2aYMsUdLotWVKovQou/UK5tbRzbMvLaeD92fetpLnIop08FQh2AM66uyWI4ER
	 oGLXNScpgY+wd+/qlzQCwrL4gZ62N8bpPqEbKG7Tzzc6XmKPDaTSaI2mG0JtAxTpYI
	 +5Ioh1r7U5dYqi4f0qUlB+98y7UvsVQLAdm/ETsrm1kpehZC402spCXZdGi/vjcMgi
	 ZRNN2kF8eFwIpgzPoUPfRint6sGguPlWUpI/Oxbb3E/4SNrqMVrGrxUNszW8CpwWsn
	 B8tjmkTQw3dbg==
Date: Tue, 6 Jan 2026 00:22:24 -0800
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
Subject: Re: [PATCH v11 3/8] pkcs7, x509: Add ML-DSA support
Message-ID: <20260106082224.GF2630@sol>
References: <20260105152145.1801972-1-dhowells@redhat.com>
 <20260105152145.1801972-4-dhowells@redhat.com>
 <20260106080251.GD2630@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106080251.GD2630@sol>

On Tue, Jan 06, 2026 at 12:02:51AM -0800, Eric Biggers wrote:
> For simplicity and to avoid this issue entirely, I suggest just allowing
> SHA-512 only.  That's the only one that RFC 9882 says MUST be supported
> with ML-DSA.

That being said, this is only applicable for the case where signed
attributes are used.  If you can get the other case working properly and
just support that case, where the real user message is what is passed to
ML-DSA, that would also avoid this issue and be much simpler.

- Eric

