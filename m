Return-Path: <keyrings+bounces-2487-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BFA694E2
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 17:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65BA8887430
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 16:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699521E25E8;
	Wed, 19 Mar 2025 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RU546Tmt"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0D1E22E6;
	Wed, 19 Mar 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401603; cv=none; b=dQOyILWUIfNveEly4gY6Fwt9WoWhmTL77bkEIya66h8R8qU43Z8Q6sHcEHv5PKEH+HqDmPwv4wHxh2U6SElbzP5VzHoyQTQEq5X8+45AphbMVbunJha94Kyp7ejKY543BDYIu6KBywcBlMP9MEhMFcrjlomeiv9ea3tJrrZswDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401603; c=relaxed/simple;
	bh=JCbo+OS7gMMD21BCxObdIbmZlgvKor9/I7YYo+EWd8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRFGGr50sZZDKzecH02NYPJLZncErv2G0ihTvK2bkbR7LjLh/P5/UDQP6d9/PECQr4gxMRlvkHCQxZkx6YDCLiQ1U4LQLRNBpczBDprRDG13SzInC+LFFtHFo7Z1ouvCWLQtBGuQzs8v3pZ3qJaU0Rdph5fXbLUbxTK6u9JeoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RU546Tmt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72132C4CEF2;
	Wed, 19 Mar 2025 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742401602;
	bh=JCbo+OS7gMMD21BCxObdIbmZlgvKor9/I7YYo+EWd8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RU546TmtxW7igIPls9r3Zo2C2gj+nuETcfSKlpfj3UJlrT+NljckqclVA+lahyqTZ
	 pPuy8q7UkIlZHlEZ4eBRToW1THp1HqOuYpoYXYBhnCDr4xGr/kwB9PQKITkgHitB5Q
	 XanQWM4D2x58kUCCv/YIwno+IgVQB15kQSu+969E=
Date: Wed, 19 Mar 2025 09:25:23 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
Message-ID: <2025031942-portside-finite-34a9@gregkh>
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn>
 <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9rYQy3l5V5cvW7W@t14s>

On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > From: Jan Stancek <jstancek@redhat.com>
> > > 
> > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > 
> > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > Distros have started dropping support from headers and in future
> > > it will likely disappear also from library.
> > > 
> > > It has been superseded by the PROVIDER API, so use it instead
> > > for OPENSSL MAJOR >= 3.
> > > 
> > > [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
> > > 
> > > [jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
> > > 
> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
> > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > 
> > This seems to differ from what is upstream by a lot, please document
> > what you changed from it and why when you resend this series again.
> 
> Hunks are arranged differently, but code appears to be identical.
> When I apply the series to v6.6.83 and compare with upstream I get:

If so, why is the diffstat different?  Also why are the hunks arranged
differently, that's a hint to me that something went wrong and I can't
trust the patch at all.

thanks,

greg k-h

