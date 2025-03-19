Return-Path: <keyrings+bounces-2482-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF216A68ED2
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 15:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6A6A4268ED
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 14:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD73E1957FF;
	Wed, 19 Mar 2025 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WBcjEcFd"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC75487BE;
	Wed, 19 Mar 2025 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393673; cv=none; b=MtCTnm04s+0uRiFI5IaQz/25Fnamf9n5AlRanS3UODlmQSt3OCOOzEeQnTuciK8kzlizQg8lQS/BAJTo1a/LnGjIKBh7IGcnufuAMPw3rrmqBmn0jYq7AbKPPnVsGR1IIfpz2GpymSkE0a5X5qVY+GL201UzgN3LkxQTUc7nduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393673; c=relaxed/simple;
	bh=qIcPp8H5gf08YqzNoTkeysvaahBDyB8+b1U/Q5PfK0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkn98e8wHTZ0B0Je+cAj3/qLjnwEl6Crw8JYmbBG+JEF22nYaURpXiSuf86TSuLz4P6PjlDPGyywZAvel3WEE5oJq+6sXVOq3RFie/kaXuHyJmeBGhNxpoeFmemG0NJSdzC62GelUAobl2yh0vkDBUL8Sr88PDzlYihUtaLlmL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WBcjEcFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA50C4CEE4;
	Wed, 19 Mar 2025 14:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742393673;
	bh=qIcPp8H5gf08YqzNoTkeysvaahBDyB8+b1U/Q5PfK0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBcjEcFdCTYOC0ayb3ZQAqjRafd9NrXRnYHSJlm415Bfqvba8LylTp+qFkmbba1AD
	 Q7DT0djqfPTJ+cYdo0YPtiYxIWrPIFaCSU6MRUZXk33EgheDMDxKf4Bsp3QXqj7pCR
	 gD5pR1GH4Y1Q2symCAUrXlBkOzujJfk38EmFwtCc=
Date: Wed, 19 Mar 2025 07:13:13 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Stancek <jstancek@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
Message-ID: <2025031943-disparity-dash-cfa3@gregkh>
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319064031.2971073-4-chenhuacai@loongson.cn>

On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> From: Jan Stancek <jstancek@redhat.com>
> 
> commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> 
> ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> Distros have started dropping support from headers and in future
> it will likely disappear also from library.
> 
> It has been superseded by the PROVIDER API, so use it instead
> for OPENSSL MAJOR >= 3.
> 
> [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
> 
> [jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
>  2 files changed, 138 insertions(+), 58 deletions(-)

This seems to differ from what is upstream by a lot, please document
what you changed from it and why when you resend this series again.

thanks,

greg k-h

