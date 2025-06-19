Return-Path: <keyrings+bounces-2846-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E553BAE05F2
	for <lists+keyrings@lfdr.de>; Thu, 19 Jun 2025 14:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9080B188F6CB
	for <lists+keyrings@lfdr.de>; Thu, 19 Jun 2025 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8650123ED5A;
	Thu, 19 Jun 2025 12:31:51 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E9023D2A5;
	Thu, 19 Jun 2025 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336311; cv=none; b=hqr6SnWMfHFaPDYIRjvyT/mXkZnN5G6QX96YlfA99c9WbGWqa26jdqLEmj8PN2NT+WhggGx2YBGDhJuLBG5hGGpvWsfxtlZWZsBTM4Kf0fELMVGIpFLtRSDQqVihapsudRC/0d7bRG9FSG+Cf+f4540SA51zA27Gd9imqOHog9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336311; c=relaxed/simple;
	bh=FHJKzlnEQQqv5/RHU8cRM4LVX+71p8k/NOpMFy86sKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk5v8eczlpstozfroO4uVPUBTeL/37j04o4UHcTABCOZ89XuLyuNSO+GY6Q79OTvRZp7y2U/TuotbPiJUMFxCQ4T99EeMBWCHyRB7i4xfsxsi/9y6+SrMLn7tM7qXleljqLbxkOIQ2jAPSHK0bVl/qEnHwtVOg8ZsoKD2KqKOoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 8FD0B2C000B7;
	Thu, 19 Jun 2025 14:31:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3DCA93A07F9; Thu, 19 Jun 2025 14:31:40 +0200 (CEST)
Date: Thu, 19 Jun 2025 14:31:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
	torvalds@linux-foundation.org, Paul Moore <paul@paul-moore.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Clemens Lang <cllang@redhat.com>,
	David Bohannon <dbohanno@redhat.com>,
	Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
Message-ID: <aFQDLCvTs8IaAQI_@wunner.de>
References: <501216.1749826470@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <501216.1749826470@warthog.procyon.org.uk>

On Fri, Jun 13, 2025 at 03:54:30PM +0100, David Howells wrote:
> The good news is that Stephan Mueller has an implemementation that includes
> kernel bits that we can use, or, at least, adapt:
> 
> 	https://github.com/smuellerDD/leancrypto/

I assume Herbert will insist that any new algorithm is hardened
against side channel attacks.  Thankfully, Stephan seems to have
put some effort into that:

   "side-channel-resistant: A valgrind-based dynamic side channel
    analysis is applied to find time-variant code paths based on
    secret data."

> However!  Not everyone agrees with this.  An alternative proposal
> would rather get the signature verification code out of the kernel
> entirely.  Simo Sorce's proposal, for example, AIUI, is to compile
> all the hashes we need into the kernel at build time, possibly with
> a hashed hash list to be loaded later to reduce the amount of
> uncompressible code in the kernel.

Module signing isn't the only motivation to add PQC algorithms to
the kernel.  Another is SPDM, a protocol for device authentication,
measurement and secure channel setup.

The DMTF has finally published SPDM 1.4.0 on May 25th and this
revision adds support for PQC algorithms (see list on page 216):

https://www.dmtf.org/sites/default/files/standards/documents/DSP0274_1.4.0.pdf

An in-kernel implementation is being worked on by Jonathan (+cc) and me:

https://github.com/l1k/linux/commits/doe

We haven't added SPDM 1.4 support yet, but will have to eventually.
So far we only support RSA and ECDSA, because that's the baseline
mandated by the PCIe Base Specification for PCI device authentication.
I expect there'll be an ECN sooner rather than later to extend the
baseline to PQC algorithms.

Thanks,

Lukas

