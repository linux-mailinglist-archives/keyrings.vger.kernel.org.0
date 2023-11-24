Return-Path: <keyrings+bounces-150-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2ED7F6A04
	for <lists+keyrings@lfdr.de>; Fri, 24 Nov 2023 02:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D298CB20BF0
	for <lists+keyrings@lfdr.de>; Fri, 24 Nov 2023 01:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE23646;
	Fri, 24 Nov 2023 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="AdqQszBo";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="AdqQszBo"
X-Original-To: keyrings@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4561DD48;
	Thu, 23 Nov 2023 17:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1700787913;
	bh=s9SKoVd6sdnEnEA2415LDa12idYEiEDjdTjzypXYR+E=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=AdqQszBonguXvlEMtiDDg0SoW3MeKa7twOHRGFzgd0tnzfY99la/UrKAgBm+pONsK
	 FhrM++V32eJtqlZZMTa7uCFyPI8Dq41rfAnOwIDWeNVHgqY58eeozKZ7zbVtpjzepf
	 hZajl7u0+CCVi1tjl16Zi1GsQXdMzJoWlfXN9Y6o=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 8D2E212869A4;
	Thu, 23 Nov 2023 20:05:13 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id uUK3h_duTxhG; Thu, 23 Nov 2023 20:05:13 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1700787913;
	bh=s9SKoVd6sdnEnEA2415LDa12idYEiEDjdTjzypXYR+E=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=AdqQszBonguXvlEMtiDDg0SoW3MeKa7twOHRGFzgd0tnzfY99la/UrKAgBm+pONsK
	 FhrM++V32eJtqlZZMTa7uCFyPI8Dq41rfAnOwIDWeNVHgqY58eeozKZ7zbVtpjzepf
	 hZajl7u0+CCVi1tjl16Zi1GsQXdMzJoWlfXN9Y6o=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6F3321285F91;
	Thu, 23 Nov 2023 20:05:12 -0500 (EST)
Message-ID: <ce0c752cd1ed482bff97c6c62266440e3ff8f937.camel@HansenPartnership.com>
Subject: Re: Fwd: sign-file.c:149:17: warning: implicit declaration of
 function =?UTF-8?Q?=E2=80=98ENGINE=5Fload=5Fbuiltin=5Fengines=E2=80=99?=
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dennis Clarke <dclarke@blastwave.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Kernel Build System
 <linux-kbuild@vger.kernel.org>, Linux Kernel Keyrings
 <keyrings@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>,  Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Nov 2023 20:05:06 -0500
In-Reply-To: <7fce272f-65f5-9aa8-5f28-aeecb98a8ab4@blastwave.org>
References: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
	 <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
	 <164a4d4434e77ba1b65624a081799a073a3aced7.camel@HansenPartnership.com>
	 <7fce272f-65f5-9aa8-5f28-aeecb98a8ab4@blastwave.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2023-11-23 at 18:42 -0500, Dennis Clarke wrote:
> On 11/23/23 09:53, James Bottomley wrote:
> > On Fri, 2023-11-17 at 00:34 -0500, Dennis Clarke wrote:
> > > On 11/16/23 18:41, Bagas Sanjaya wrote:
> > > > Hi,
> > > > 
> > > > I notice a bug report on Bugzilla [1]. Quoting from it:
> > > > 
> > > <snip>
> > > > > Not related to
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=215750 but I
> > > > > *feel* that this code needs a hug.
> > > > 
> > > > See Bugzilla for the full thread.
> > > > 
> > > > AFAIK, this looks like a bug when the kernel is compiled
> > > > against custom (non-system) version of OpenSSL library.
> > > > 
> > > 
> > > I do not know what you could possibly mean. There is nothing
> > > "custom" about OpenSSL. For that matter the gcc compiler I am
> > > using was also built by me. Works fine. The sign-file.c source
> > > compiles fine.
> > 
> > This has all the hallmarks of an openssl compiled without engine
> > support; is the symbol OPENSSL_NO_ENGINE set?  And which distro did
> > you get this library from?
> > 
> > James
> > 
> 
> I am looking into this. The code will likely age into some deprecated
> calls and I think that I may be way out on the edge here.

So you did build without engine support ...
 
>  However the code will need a pile of ifndef stuff and then call the
> correct future looking calls for OpenSSL 3.x etc etc etc ... the
> usual stuff

Well, not really: openssl is highly configurable and if it gets
configured wrongly, stuff like this happens.  That's why distros have a
fairly inclusive configuration and they stick to it.  No-one can cope
with the combinatoric explosion of openssl configuration possibilities
(even though they have ifdefs for most of them) so the only way is
really to fix a standard configuration and assume you're building for
it.

Openssl has been talking for ages about removing engine support, but
they've been unable to do so due to the rather slow pace of conversion
of their own engines.  I anticipate this code can be removed in favour
of the pkcs11 provider long before openssl actually manages to remove
engines.

James


