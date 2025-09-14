Return-Path: <keyrings+bounces-2998-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC3B56AC0
	for <lists+keyrings@lfdr.de>; Sun, 14 Sep 2025 19:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A4F189B2F8
	for <lists+keyrings@lfdr.de>; Sun, 14 Sep 2025 17:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069F92DCF45;
	Sun, 14 Sep 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gn8lK8zI"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4ADE571;
	Sun, 14 Sep 2025 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870060; cv=none; b=Uq9vdCrXukm8No+7Mx+oPLTk/GXr1Kwaqs+8f6Hkymq2HIu5yUsQWlv2uYg/TFxRqjA3rdKVSSc+tR6cSO83qHV6dIDnBoao9mBD4JJAs5bHn/2FvnBVEqrxV40Xq5cbEaTNExfKwa+aGz/LvUp2RNuPIAbTUD2mrBLCDq7toH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870060; c=relaxed/simple;
	bh=79hZ03aZ3ULIA5jNq7oCUuCVpZomDYMNWn6jgNL2fRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PS8ov+41UuVrdnoOzmIYZwqh5KBvL0/B6mX0BsDwiTXCsoJIifd9jJPNDw9KK68Wf1hFPe4XG+oLfiN1pALEw94d6gaCkDiDTCBmDOINoA6/gHl7ZtCE08SCevJRWRUCPKM4b1OrrHZjDDttc81OZIFqVflPJU18XKTMuvcqou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gn8lK8zI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0145C4CEF0;
	Sun, 14 Sep 2025 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757870060;
	bh=79hZ03aZ3ULIA5jNq7oCUuCVpZomDYMNWn6jgNL2fRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gn8lK8zITBNoujifAnN/YDL3jVvSwojtmH06N5sHIQ+vf93H/q66LbOKZ85V0oO69
	 RTjfbVwbgi52WdYyfxW6MmXiMNb2HVJ5y6ARcH7pfVikMs9Rf7A6MVzD1DSNxAKFme
	 Sa3iKOQHp6m3WxoRu+aqA4Uyce8QCQr7hwxeTq7M7HwHlxD6QG/1bN7CkbklRNakZ5
	 laTJ61rpOj0gkvXRSCKCW80hIGNh0FnQxEgq9T2Kv1vQDkJgsPu2tvGSwoF22GLX+U
	 P6AJfXjzIihiYFeHSwAyHRxV65CzfXA7PivWI+ESevcyfpfbgn+e3i7kbIwNlRYltw
	 YYRjv6SW2Whjw==
Date: Sun, 14 Sep 2025 20:14:16 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Paul Moore <paul@paul-moore.com>, David Howells <dhowells@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH] security: keys: use menuconfig for KEYS symbol
Message-ID: <aMb36LPkJgM29P7-@kernel.org>
References: <20250824222813.92300-1-rdunlap@infradead.org>
 <aKzot67f7F3wtHs7@kernel.org>
 <CAHC9VhQsVMKN6YyHFF81rPvxirtM7UwwAJSpOZdeybGCuO1c2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhQsVMKN6YyHFF81rPvxirtM7UwwAJSpOZdeybGCuO1c2g@mail.gmail.com>

On Thu, Sep 11, 2025 at 04:34:15PM -0400, Paul Moore wrote:
> On Mon, Aug 25, 2025 at 6:50 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Sun, Aug 24, 2025 at 03:28:13PM -0700, Randy Dunlap wrote:
> > > Give the KEYS kconfig symbol and its associated symbols a separate
> > > menu space under Security options by using "menuconfig" instead of
> > > "config".
> > >
> > > This also makes it easier to find the security and LSM options.
> > >
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > ---
> > > Cc: David Howells <dhowells@redhat.com>
> > > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > > Cc: keyrings@vger.kernel.org
> > > Cc: linux-security-module@vger.kernel.org
> > > Cc: Paul Moore <paul@paul-moore.com>
> > > Cc: James Morris <jmorris@namei.org>
> > > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > >
> > >  security/keys/Kconfig |   14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> ...
> 
> > I wote for this at least. Definitely an improvement:
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> I'm guessing you're planning to take this patch Jarkko?


I'm doing PRs early week to this can easily go to my queue
(neither mind if David picks it).

David?

> 
> -- 
> paul-moore.com

BR, Jarkko

