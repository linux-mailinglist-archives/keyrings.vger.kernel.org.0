Return-Path: <keyrings+bounces-2454-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8FA62E41
	for <lists+keyrings@lfdr.de>; Sat, 15 Mar 2025 15:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258DD179ADA
	for <lists+keyrings@lfdr.de>; Sat, 15 Mar 2025 14:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580E71F76C6;
	Sat, 15 Mar 2025 14:37:46 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2956183CA6;
	Sat, 15 Mar 2025 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742049466; cv=none; b=Eicp84ruyDwfsf6qQMIztiXMo6AA3ehwP6MD8nBUZTQD9m7TqduwD9wyFvY0E2nyc488xICzn6V9IH2C4PtC/SgZF+I7pRhprlTIXnmkFFooYTCpc98XWKA3cHk9HtzLSl69/8F4q98kSXpbJKOTFs1faZTc58J/HQoA2m2VUBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742049466; c=relaxed/simple;
	bh=jpADu190tb8714QcgIjuTGFjpKfdzkZjJmaLP5umKFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kk5WhxFWXCtxHl6xlAPnDRJNJUVVWS8V4Su2QNumIlv9iPp+SVUAiNrXUsZfBb8BHQSBfNip06q5Z2DlT0BA6yG8aV12ksQ3Y8aMszKnp5lTWzOLsP/rNUvaBDUJzMsB3+arf7LoBiDhvx0ryfLlrzr8DRN+zrUh6W5Va7q+UTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id CA8A2300002A5;
	Sat, 15 Mar 2025 15:37:40 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B48BE1D667; Sat, 15 Mar 2025 15:37:40 +0100 (CET)
Date: Sat, 15 Mar 2025 15:37:40 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z9WQtFEbSYuat42Y@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>

Hi Herbert,

patches [3/4] and [4/4] of this series have not been applied and
are marked "Changes Requested" in patchwork...

https://patchwork.kernel.org/project/linux-crypto/patch/3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de/

https://patchwork.kernel.org/project/linux-crypto/patch/c9d465b449b6ba2e4a59b3480119076ba1138ded.1738521533.git.lukas@wunner.de/

...however it's unclear to me what needs to be changed in order to
make them acceptable.  I think the objection was that asymmetric keys
need to be maintained, but that's since been addressed.

Are there further objections?  Should I resend?

Thanks!

Lukas

