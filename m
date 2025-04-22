Return-Path: <keyrings+bounces-2652-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C1CA96007
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 09:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3EB17800F
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 07:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4150E1EE7B7;
	Tue, 22 Apr 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IsbAgfN2"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC52D15B115;
	Tue, 22 Apr 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308410; cv=none; b=mQDKMdSpj+/ZCo2Cl055M295z2Lyu/XKanFAEQ0jrreCzLUoUJaz7KuVbKaB79/PcrxyZNBL5rGLg/HoB4jbmluHOiBvRbf4W48YoCG41UcO/kLC0Qlf22lpz6XbulGlFFZx8LEFCV2gSu9+rQSeEmIk5qX+h5r4BUUNcOMzF+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308410; c=relaxed/simple;
	bh=kwB0a86wE2nShYbf16A4URlr365wNayqQZSZU/CPmQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjdrQlLpC6yHH1yB1e1A6fq4Vayx20YPTThAoQBBzEndDfUJsK6NRf1O23aoVgxi2Sq/PS8FuGUeX8kogjFy0SwoOt9lPfrE4qx4tl7Ir9TpszsAvbi+Hb5+tptqJPbIy0H5m1jW9QVqTzP0pXQ61ZjbiN4S4Daj8StYpFSECBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IsbAgfN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95A2C4CEE9;
	Tue, 22 Apr 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745308409;
	bh=kwB0a86wE2nShYbf16A4URlr365wNayqQZSZU/CPmQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsbAgfN2P8M1IJl09b9TIBsWTYvYi5JK6s3EtlQbIJ66/YL/S6+CnrzO5NW2mJPfK
	 RQDX/80InlSw904V57fGVCo0+fS/VkstWRjbOn/tVUi5u9c2sPV2gqM8NVWolF1QLG
	 G1O5jRi67SEqJ7qjExqKsD8oZ2cfNipfepiXfSKk=
Date: Tue, 22 Apr 2025 09:53:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jan Stancek <jstancek@redhat.com>, Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org, David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
Message-ID: <2025042213-throttle-destruct-004b@gregkh>
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn>
 <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s>
 <2025031942-portside-finite-34a9@gregkh>
 <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com>
 <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
 <CAASaF6zvEntqKZUzqRjw4Pp5edsRHdd0Dz7-RD=TTMc1n_HMPA@mail.gmail.com>
 <CAAhV-H7h5SW40jDyJs2naBQ3ZLH9S_PLNeq=19P5+75jwT5eYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7h5SW40jDyJs2naBQ3ZLH9S_PLNeq=19P5+75jwT5eYQ@mail.gmail.com>

On Mon, Apr 14, 2025 at 09:52:35PM +0800, Huacai Chen wrote:
> Hi, Greg and Sasha,
> 
> On Sun, Mar 30, 2025 at 9:40 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > On Sun, Mar 30, 2025 at 3:08 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > On Thu, Mar 20, 2025 at 12:53 AM Jan Stancek <jstancek@redhat.com> wrote:
> > > >
> > > > On Wed, Mar 19, 2025 at 5:26 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > > > > > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > > > > > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > > > > > From: Jan Stancek <jstancek@redhat.com>
> > > > > > > >
> > > > > > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > > > > > >
> > > > > > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > > > > > Distros have started dropping support from headers and in future
> > > > > > > > it will likely disappear also from library.
> > > > > > > >
> > > > > > > > It has been superseded by the PROVIDER API, so use it instead
> > > > > > > > for OPENSSL MAJOR >= 3.
> > > > > > > >
> > > > > > > > [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
> > > > > > > >
> > > > > > > > [jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
> > > > > > > >
> > > > > > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > > > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > > ---
> > > > > > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
> > > > > > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> > > > > > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > > > > > >
> > > > > > > This seems to differ from what is upstream by a lot, please document
> > > > > > > what you changed from it and why when you resend this series again.
> > > > > >
> > > > > > Hunks are arranged differently, but code appears to be identical.
> > > > > > When I apply the series to v6.6.83 and compare with upstream I get:
> > > > >
> > > > > If so, why is the diffstat different?  Also why are the hunks arranged
> > > > > differently,
> > > >
> > > > He appears to be using "--diff-algorithm=minimal", while you probably
> > > > patience or histogram.
> > > Hi, Jan,
> > >
> > > I tried --diff-algorithm=minimal/patience/histogram from the upstream
> > > commit, they all give the same result as this patch. But Sasha said
> > > the upstream diffstat is different, so how does he generate the patch?
> >
> > Hi,
> >
> > I don't know how he generates the patch, but with git-2.43 I get noticable
> > different patches and diff stats for minimal vs. histogram. "minimal" one
> > matches your v3 patch. I don't know details of Greg's workflow, just offered
> > one possible explanation that would allow this series to progress further.
> >
> > $ git format-patch -1 --stdout --diff-algorithm=minimal 558bdc45dfb2 |
> > grep -A3 -m1 -- "---"
> Could you please tell me how you generate patches? I always get the
> same result from the upstream repo.a

A simple 'git show' is all I use.  Try it again and submit what you have
if you can't get anything different here.

Note, my algorithm is set to "algorithm = histogram" in my .gitconfig
file.

thanks,

greg k-h

