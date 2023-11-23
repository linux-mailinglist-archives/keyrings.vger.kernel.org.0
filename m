Return-Path: <keyrings+bounces-148-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37D7F6210
	for <lists+keyrings@lfdr.de>; Thu, 23 Nov 2023 15:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C521C21182
	for <lists+keyrings@lfdr.de>; Thu, 23 Nov 2023 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A816224CE;
	Thu, 23 Nov 2023 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="WBAil4xU";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="WBAil4xU"
X-Original-To: keyrings@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F13D5A;
	Thu, 23 Nov 2023 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1700751185;
	bh=kh8MN+tohcYad5prvT/b0FWzLXPRU8fWPeJHBzGWwvc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WBAil4xUcYdR4k7+silgIJWW/sui/d8QxHDvGmYlsyNgS4GLXMoirr7t3Dwr+PDxC
	 H4+kc6UuZBOxSLAOVO23jmoenQ13e5PHr3sTGFt9Eq4Ln000dLvyQOW+tdI08nCn9Y
	 ZcbGWDYho5XGDOt9dsEhnYzFCPHXIkYLSRk57KKk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B31BF1281379;
	Thu, 23 Nov 2023 09:53:05 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Ozg8Q6Lac-23; Thu, 23 Nov 2023 09:53:05 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1700751185;
	bh=kh8MN+tohcYad5prvT/b0FWzLXPRU8fWPeJHBzGWwvc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WBAil4xUcYdR4k7+silgIJWW/sui/d8QxHDvGmYlsyNgS4GLXMoirr7t3Dwr+PDxC
	 H4+kc6UuZBOxSLAOVO23jmoenQ13e5PHr3sTGFt9Eq4Ln000dLvyQOW+tdI08nCn9Y
	 ZcbGWDYho5XGDOt9dsEhnYzFCPHXIkYLSRk57KKk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9D90212809DB;
	Thu, 23 Nov 2023 09:53:04 -0500 (EST)
Message-ID: <164a4d4434e77ba1b65624a081799a073a3aced7.camel@HansenPartnership.com>
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
Date: Thu, 23 Nov 2023 09:53:02 -0500
In-Reply-To: <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
References: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
	 <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2023-11-17 at 00:34 -0500, Dennis Clarke wrote:
> On 11/16/23 18:41, Bagas Sanjaya wrote:
> > Hi,
> > 
> > I notice a bug report on Bugzilla [1]. Quoting from it:
> > 
> <snip>
> > > Not related to
> > > https://bugzilla.kernel.org/show_bug.cgi?id=215750 but I *feel*
> > > that this code needs a hug.
> > 
> > See Bugzilla for the full thread.
> > 
> > AFAIK, this looks like a bug when the kernel is compiled against
> > custom (non-system) version of OpenSSL library.
> > 
> 
> I do not know what you could possibly mean. There is nothing "custom"
> about OpenSSL. For that matter the gcc compiler I am using was also
> built by me. Works fine. The sign-file.c source compiles fine.

This has all the hallmarks of an openssl compiled without engine
support; is the symbol OPENSSL_NO_ENGINE set?  And which distro did you
get this library from?

James


