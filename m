Return-Path: <keyrings+bounces-3727-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07411CF8F76
	for <lists+keyrings@lfdr.de>; Tue, 06 Jan 2026 16:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37677304699C
	for <lists+keyrings@lfdr.de>; Tue,  6 Jan 2026 15:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF50334692;
	Tue,  6 Jan 2026 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sj9qwWzN"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784A3126A3;
	Tue,  6 Jan 2026 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711863; cv=none; b=T1igFjphpZEQxB7ksBFEzYRgOHLPhqXKjQabDN1/W0IHNCKpIEN/lFWqLhHTRoaua1KOOHucogMJpQWPH8AaV/fNM+zoGlVxDvawNGuarEFZXNcP18SD4M3pg3EBK6jTnZeHhPrFCbVrHFnCLXu4vphoOOD/Etib/gALgNTRWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711863; c=relaxed/simple;
	bh=J+gVVbZVInmDck1kvt20+mkZhJHCKcW/TRpma/nRcbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7CY6XCNK3XFAzZbcAH0UihbAVGSoIUfD9yM1XTP8X9fGOarVDuvxY5NzbN6HZ6fFPb5/9+i4lRoGcJqEQ7F3pAKd01GScSMzZWCKDB2MJcg0lJD1ISOCpFw5/teXQuD5TDUZo0ULAKhzB0nppCSinENv/038qp/aaEmcTtZgpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sj9qwWzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFE2C116C6;
	Tue,  6 Jan 2026 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767711863;
	bh=J+gVVbZVInmDck1kvt20+mkZhJHCKcW/TRpma/nRcbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sj9qwWzNr436nDRSoGVw6xfsOY4r+8baexuExMZLsEa+MPP2vAwxlt9HcsjCEQSnQ
	 ZY85/aCVwuhMdvovlMr4yGukNOmug2sA9pCupcj+F3Eic1lhqyLD1IX6bspnFmPznh
	 aOdFh8sxYyGuGJK8HGrrb2LRLOyPjFV0wWiNLtdbFjE+XsVWO4EqRWDwmSBU1G3N2d
	 8179pswgUPreP33OMqbKq2Od/Jz68ZM9SvJ92HUfWPhd3rfY23uO5GBMA4HmWeYJKk
	 aTg8FsX9IzbyKDzeowwEbZinAkSpvU3rxcK5CqzDIQk7DnJRG3y8KYUwL73xiCu95b
	 rmLwQ+4WiXjPg==
Date: Tue, 6 Jan 2026 09:04:20 -0600
From: Lucas De Marchi <demarchi@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] KEYS: replace -EEXIST with -EBUSY
Message-ID: <ronobnl7pkbfmg3e2zc52wnq4v5l6p4sowjkg6lmlqlxgjr5va@rjrq75cnxbcl>
References: <20251220-dev-module-init-eexists-keyring-v1-1-a2f23248c300@samsung.com>
 <1793804.1767607035@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1793804.1767607035@warthog.procyon.org.uk>

+Greg, to consolidate from the othe thread.

On Mon, Jan 05, 2026 at 09:57:15AM +0000, David Howells wrote:
>Daniel Gomez <da.gomez@kernel.org> wrote:
>
>> From: Daniel Gomez <da.gomez@samsung.com>
>>
>> The -EEXIST error code is reserved by the module loading infrastructure
>> to indicate that a module is already loaded.
>
>EEXIST means a file exists when you're trying to create it.  Granted we abuse
>that somewhat rather than add ever more error codes, but you cannot reserve it
>for indicating that a module exists.

EEXIST from [f]init_module() means "module is already loaded" and it
can't mean something else for this syscall. Other return codes are
explained in the man page, but aren't that special from the userspace
pov.

This doesn't mean we need to replace all the EBUSY throughout the call
chain with EEXIST,  but the return from the syscall needs to remain
consistent if that was the case for it failing. Ideally that mapping
would come from the module init (and not from other functions it calls)
because that is the place that has that knowledge.

If a generic EBUSY->EEXIST mapping is desired, as it seems to be the
case from
https://lore.kernel.org/all/2025122212-fiction-setback-ede5@gregkh/,
then do_init_module() can do it, but in practice that means reserving 2
error codes rather than 1.

>
>> When a module's init
>> function returns -EEXIST, userspace tools like kmod interpret this as
>> "module already loaded" and treat the operation as successful, returning
>> 0 to the user even though the module initialization actually failed.
>>
>> This follows the precedent set by commit 54416fd76770 ("netfilter:
>> conntrack: helper: Replace -EEXIST by -EBUSY") which fixed the same
>> issue in nf_conntrack_helper_register().
>>
>> Affected modules:
>>   * pkcs8_key_parser x509_key_parser asymmetric_keys dns_resolver
>>   * nvme_keyring pkcs7_test_key rxrpc turris_signing_key
>>
>> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>
>Please don't.  Userspace can always check /proc/modules (assuming procfs is
>enabled, I suppose).

EEXIST is already there with that meaning. Checking procfs (or sysfs as
kmod currently does) is racy and doesn't look like a good API - why
would userspace have to check if the module is loaded when the syscall
that loads the module failed? EEXIST is special exactly to resolve races
with 2 threads trying to load the same module.

Lucas De Marchi

>
>David
>

