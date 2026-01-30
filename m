Return-Path: <keyrings+bounces-3978-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B1dHkOpfGkVOQIAu9opvQ
	(envelope-from <keyrings+bounces-3978-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Fri, 30 Jan 2026 13:51:15 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9861BAB48
	for <lists+keyrings@lfdr.de>; Fri, 30 Jan 2026 13:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05C0D301F9BC
	for <lists+keyrings@lfdr.de>; Fri, 30 Jan 2026 12:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD4F376BF8;
	Fri, 30 Jan 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQnVS/MY"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD52FBE1C;
	Fri, 30 Jan 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777363; cv=none; b=Ft/bxMa/vYIWAzNu1bCHwqRhCDQ2IuCEJA6u1633g63SS/7s7bpALI9UxSK+VzsiTuG5DrNjmfW1jNOhCerqhX4PeuN2IVlGZUnvFx9RkU7AwlIIvOjosRnxG6k26Jq3dIIq7kMNkucICerd9QDOsN+2qcKY0m+vULohqmOiIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777363; c=relaxed/simple;
	bh=cAX2yMpHCzbcKbcgdb9q0rgQh4WMr5xY/ZQPAOFUx5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfrHggI/woOnuRTQANUBir4wGU0TV5SDhD7WGind+5EBnUOU3fyrWI3LUbt6k2rpw7UmHGCO5jD9RluJ9KCOhdnvN/UbgaY9LWAgxosArISgr61wOWJWCM88i6Uxt2DVDkUu8zlQGB9/RGfvMTYJcDbGJZ9vrpvbp1uZlTi96eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQnVS/MY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29A0C116D0;
	Fri, 30 Jan 2026 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769777363;
	bh=cAX2yMpHCzbcKbcgdb9q0rgQh4WMr5xY/ZQPAOFUx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQnVS/MY94zvVXcqxpPESkFLKApvATe6Zaj4fGsLJ1eMtOS5AKEogzH6nkCdLBM2B
	 XFElEGiEnRyGYf8Tb50LdpWk9oFEAE3tNKOZ88TfYwFM46f2g9djJ8fG/Cm6bVVIVC
	 P6PLJJtYZOt/AKeO1b9CmtzES2KOSGGFZEEwHfOXXLjHttbUi69FjfdCh2GUBokq24
	 Ntp/ypY65vPeClkGaUcC50guUqt3XnNlejlfj/f0Ifv50yHuxQMQXzjjZ7KfRFuhvK
	 A19DbmH0qGH5KWC7fI160Za+MJBOEpI1o/NVUOYJRqGRqdSrfQdGDePOUiOa2FqjWi
	 bIxbezZ7+vkhA==
Date: Fri, 30 Jan 2026 12:49:18 +0000
From: Mark Brown <broonie@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Pick up keys-next branch for linux-next?
Message-ID: <daf8d8d0-60e4-4f0a-b535-25b99559aa79@sirena.org.uk>
References: <2261418.1769775448@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+lGDKZdOwVpbLOWc"
Content-Disposition: inline
In-Reply-To: <2261418.1769775448@warthog.procyon.org.uk>
X-Cookie: War is an equal opportunity destroyer.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3978-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: D9861BAB48
X-Rspamd-Action: no action


--+lGDKZdOwVpbLOWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 12:17:28PM +0000, David Howells wrote:

> Can you pick up my keys-next branch for linux-next please?  It can be found at:

> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
> 	keys-next

> Note that it's based on part of Eric Bigger's libcrypto/libcrypto-next branch
> which I believe you already have in order to get ML-DSA support.

I'll add this from today, called "keys-next", with you as the contact -
anyone else?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--+lGDKZdOwVpbLOWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8qM0ACgkQJNaLcl1U
h9AbNAf9GOugPnvrCKzHbhNTJQc+43n7GS+0TdUTBtMMAJr0SD9rcJ4wSAjf/1wl
pTkZgkMyddvNH5GAdbL0qQdf4+9IH83yaH9hTV609LLgj9/KLUAdyzSJMW6EN45M
vhHBbIBU176X57yfdk5flfWXfzjoYIcGc39vXPDsoGQtUIh/+rr/fsByGT7cyzjV
3kdU3DldSbEWVlEF+U3xhAVxO4KWGJwGbRWiS/P4L4ic1qhDj3ry0FkIMKrWEu7K
3clXUYFgLz60HSFO9DsXV812KrcT4hNTJGasY5P3y5JX3L+15sI/FrTCYB4Xc5GI
qzEcEsWTvFWl/JbBhKAn8T7he+IWlA==
=890+
-----END PGP SIGNATURE-----

--+lGDKZdOwVpbLOWc--

