Return-Path: <keyrings+bounces-2476-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B7A6769E
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 15:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD9667ACC92
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 14:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFF520DD7B;
	Tue, 18 Mar 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IKYCs18s"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1120B81F;
	Tue, 18 Mar 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308707; cv=none; b=tuvtwPG07DY17FEyLp/PxVlVFXR2psXvxhs42j8M3NAptg5E3voChZZ9b6cCohBfG0Sx0ZlXaGDO5LhL4MYS3kcP8DcrUpVH01qNNnDVWQitEO7zWLX0iWjg+U/80Ye7QwVOcQ7HFH4N1+WHo1N1AmfY5uSJ29JnMHj+LW+svSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308707; c=relaxed/simple;
	bh=9umgKWqtZT/8YY/xdx8wzJAOM6nVJd/mLI1qP7HBUfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2+WBIZxAloP4lyMvhvIxiLLWNChuc8LgKRN+fVL36F5DEua3AQ6nGaPQ2bVYVbdbVBcz1Ck8grG//fEZXpzssGyZqq3XaxoWCHlA+Av/I44mgdq/6wieYqJe5myoGmqRpgsQ9YuKvU1CZEKkRzUozb83yH3Dfy2/BeHlGEHrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IKYCs18s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EF2C4CEDD;
	Tue, 18 Mar 2025 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742308707;
	bh=9umgKWqtZT/8YY/xdx8wzJAOM6nVJd/mLI1qP7HBUfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKYCs18sngJvAsnONKCxnwa78vZ7S2q7pckhV4HDARytrwlWG6TyVdfEApKEckyIu
	 Wz7lUyY8brABJ5uK8A1+rixIO7S1KWhmlHz5ekaF3Aev0yYsBkdov1AzHsYAXfbXU8
	 /VcoPes/EpYQESDqbkm0NZi/M90rrD3EopBhZbnQ=
Date: Tue, 18 Mar 2025 15:37:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Stancek <jstancek@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 1/3] sign-file,extract-cert: move common SSL
 helper functions to a header
Message-ID: <2025031852-angelfish-mouth-f455@gregkh>
References: <20250318110124.2160941-1-chenhuacai@loongson.cn>
 <20250318110124.2160941-2-chenhuacai@loongson.cn>
 <2025031834-spotty-dipped-be36@gregkh>
 <CAAhV-H4y88jfpKp1mFytEjX4L0CErF=XFashZ9dXfwM58dPGGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4y88jfpKp1mFytEjX4L0CErF=XFashZ9dXfwM58dPGGQ@mail.gmail.com>

On Tue, Mar 18, 2025 at 09:58:26PM +0800, Huacai Chen wrote:
> Hi, Greg,
> 
> On Tue, Mar 18, 2025 at 9:25 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 18, 2025 at 07:01:22PM +0800, Huacai Chen wrote:
> > > From: Jan Stancek <jstancek@redhat.com>
> > >
> > > commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
> > >
> > > Couple error handling helpers are repeated in both tools, so
> > > move them to a common header.
> > >
> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> >
> > Is this "v2" as well?  the threading is all confusing here.  This is
> > what my inbox looks like right now:
> Yes, this is also V2, I'm very sorry to confuse you.

Great!  Please resend them all as a "v3" so I'm not confused :)

thanks,

greg k-h

