Return-Path: <keyrings+bounces-2421-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AACA4A7C2
	for <lists+keyrings@lfdr.de>; Sat,  1 Mar 2025 03:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98AE6189C894
	for <lists+keyrings@lfdr.de>; Sat,  1 Mar 2025 02:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DCC7082E;
	Sat,  1 Mar 2025 02:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/7rVFOX"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E83D288A5;
	Sat,  1 Mar 2025 02:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740794404; cv=none; b=VZVBfY3lu53L+FqLX2hIgi89YJ4wx6UwwjKyrEUp8vE2cZmJ/ZN4jumnY5gXA4RWMuVugdcXem1cKYvyaUeUs25/MfyWZ5pJOt7HnXeeQA3Ay0+4Wy1xetyaNDgGgNPW5JeGPtw4TgkOX5eJ8AMmGoW0n9YX5HLG8wQMK3kqsgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740794404; c=relaxed/simple;
	bh=tfCtY5NJ5BOE0sjZ7QUWMS4vQMbSN7d9BCF5Jk0nH2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPlRqmtMCKFB4feHfYDQDF4/xEVQcTuYgPMTwQX1I2jb+IiN47z94xzyk569KhJDp4uQmOzXG9QxZmwdqqoUgYVrBO6TPkPvbpzDdfn5rN+OwUjWR59v+7OU3TTgeRY+kkLmFwwn6tY444O6UF4+Qn1ip+CXM4FEPHkfX9ZcEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/7rVFOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EB5C4CED6;
	Sat,  1 Mar 2025 02:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740794403;
	bh=tfCtY5NJ5BOE0sjZ7QUWMS4vQMbSN7d9BCF5Jk0nH2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/7rVFOX8vtqiNkIjCdVugpNQNe7eEURb4EocMuBmpL0q/3lIoEfQ7kreZotvXsrU
	 AT/auXa1M9oSI0aBDncu+RAmlSTeRrb8mMEGYUMvFHacLvj5wB0BW8ybs6rtFyYYLP
	 z8rmcr9UTxWn9TytVlWxZjqYWcwUQUiRfmxJD/Vh1xJCXvaA9BOquAx67stlIOt1Xd
	 QdSg/iEPrLXwZ2GxxTGLbmUw/70I1rraRR1pAz99enq9SwgB0XTO/ncbAwJv3zgPeb
	 iRcK/YCNMR1SQCtKQ8vOYboIlfZKnIsFKZwmSXbAtTmKLtOQpnIVPaiX+OS0oqhfQ4
	 6q4x8JO84PBVQ==
Date: Sat, 1 Mar 2025 03:59:59 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: "Ricardo B. Marliere" <ricardo@marliere.net>,
	David Howells <dhowells@redhat.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	"Ricardo B. Marliere" <rbm@suse.com>
Subject: Re: [PATCH] security: keys: Make sysctl table const
Message-ID: <Z8JqHy6IDOR_X-RJ@kernel.org>
References: <20250123-sysctl_const-pcmoore-v1-1-d9f918dbb0be@suse.com>
 <CAHC9VhQpkyqaJsxj9_d4d6Vpc+FVbSnH_HeAFAVEdj0trGCh1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhQpkyqaJsxj9_d4d6Vpc+FVbSnH_HeAFAVEdj0trGCh1g@mail.gmail.com>

On Wed, Feb 26, 2025 at 07:21:39PM -0500, Paul Moore wrote:
> On Thu, Jan 23, 2025 at 2:50 PM Ricardo B. Marliere
> <ricardo@marliere.net> wrote:
> >
> > Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
> > ctl_table"), the sysctl registration API allows for struct ctl_table to be
> > in read-only memory. Move key_sysctls to be declared at build time, instead
> > of having to be dynamically allocated at boot time.
> >
> > Cc: Thomas Weißschuh <linux@weissschuh.net>
> > Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> > Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
> > ---
> >  security/keys/sysctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Looks fine to me.  David or Jarkko, this looks like something for the
> keys tree, yes?
> 
> Reviewed-by: Paul Moore <paul@paul-moore.com>

I can pick this after back from holiday on next week.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

