Return-Path: <keyrings+bounces-2422-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B7A4A7C9
	for <lists+keyrings@lfdr.de>; Sat,  1 Mar 2025 03:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 892B73B9021
	for <lists+keyrings@lfdr.de>; Sat,  1 Mar 2025 02:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836B62E630;
	Sat,  1 Mar 2025 02:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxAIsB3X"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E122087;
	Sat,  1 Mar 2025 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740794461; cv=none; b=eA4lFGWBlV4lVQRM+VNHbFhuzCElMo+MFmReeqj3UF6+6WCq/xrZHRhlErH7oyJFyjho3ejE96ep7TGfm9Kqxn00CTLN4b589XTh9YFUFER3Hz73ftMgrmeaL22VCjJlzTdHz7bsrUzGN8iqW4Ks45UWS+kQz4pXnRl8ovggs7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740794461; c=relaxed/simple;
	bh=gGs2GfVRCLLjRlbngighgDlPCdV29Jl8gnNktBervmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF5MC+VfEExY9pxw9KjXxvZQ70BuWw9t4jij97FNumMx308iGVo71icWRT88zizqkoQDCyelGTuncrKm5BlMW0ug3mgdfzIV+JsSATwC6llYljS6lZ4kD3ik0AqUHY8J8om/1CDn/bXrOpDiQM4izDuz4RZvpF56cdZFfvql2lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxAIsB3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8EBC4CED6;
	Sat,  1 Mar 2025 02:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740794460;
	bh=gGs2GfVRCLLjRlbngighgDlPCdV29Jl8gnNktBervmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxAIsB3XfD6rhkCmTjZEVcxoUktxe1oqCjCC8NopYvACp/0VFAB2HOyaX29YIwfgb
	 JHxDHAWsZfG3s5vEVBl86aigMJcIajmdmi94M6iiyaKa9zjoYMTpmuNZ8qvzeW/yEI
	 4lFQmiNvHmx49kyqpfNhcVthStN2vID05fwXNzCRvfBZQB2Zg3EEY+a+yyVxJNtd8a
	 3dnPDNNpTi4EQm8sGsz7Zi3D4ek0UOn0t9YUHhGEQNFWrljU/savARY2GtxWuVQo//
	 qxB2lStRArYdQve7Ls+rJSMb2//f4PEa2GdLlSJOwc8mPPljUbtBE+J5UxhZpOTArr
	 7FzjaZW2fr/WQ==
Date: Sat, 1 Mar 2025 04:00:57 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	David Howells <dhowells@redhat.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] security: keys: Make sysctl table const
Message-ID: <Z8JqWQ-oxyJy0goW@kernel.org>
References: <20250123-sysctl_const-pcmoore-v1-1-d9f918dbb0be@suse.com>
 <CAHC9VhQpkyqaJsxj9_d4d6Vpc+FVbSnH_HeAFAVEdj0trGCh1g@mail.gmail.com>
 <D8362ZV7Y4YI.PJTF4OC88RQK@suse.com>
 <CAHC9VhQfC3kXt39qBS3NEHtGNqNhD1SpJ103_kUtOCi0HTMDHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhQfC3kXt39qBS3NEHtGNqNhD1SpJ103_kUtOCi0HTMDHg@mail.gmail.com>

On Thu, Feb 27, 2025 at 11:45:09AM -0500, Paul Moore wrote:
> On Thu, Feb 27, 2025 at 5:47 AM Ricardo B. Marlière <rbm@suse.com> wrote:
> > On Wed Feb 26, 2025 at 9:21 PM -03, Paul Moore wrote:
> > > On Thu, Jan 23, 2025 at 2:50 PM Ricardo B. Marliere
> > > <ricardo@marliere.net> wrote:
> > >>
> > >> Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
> > >> ctl_table"), the sysctl registration API allows for struct ctl_table to be
> > >> in read-only memory. Move key_sysctls to be declared at build time, instead
> > >> of having to be dynamically allocated at boot time.
> > >>
> > >> Cc: Thomas Weißschuh <linux@weissschuh.net>
> > >> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> > >> Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
> > >> ---
> > >>  security/keys/sysctl.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > Looks fine to me.  David or Jarkko, this looks like something for the
> > > keys tree, yes?
> > >
> > > Reviewed-by: Paul Moore <paul@paul-moore.com>
> >
> > Thank you for the review, but I believe this has been done here:
> >
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1751f872cc97f992ed5c4c72c55588db1f0021e1
> 
> Even better :)  Thanks for the update Ricardo.

+1 

BR, Jarkko

