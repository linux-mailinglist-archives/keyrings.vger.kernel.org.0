Return-Path: <keyrings+bounces-1155-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C378B6659
	for <lists+keyrings@lfdr.de>; Tue, 30 Apr 2024 01:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C38283787
	for <lists+keyrings@lfdr.de>; Mon, 29 Apr 2024 23:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD16199E86;
	Mon, 29 Apr 2024 23:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNMBtWxc"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177D199E80;
	Mon, 29 Apr 2024 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714433680; cv=none; b=pbTl278U3+2NzlDHMZHVt7/plRA4rEhEIZALGuQkJDfL+dyrbtf6j/EJZ9uU9YsZZEIl4Z07AG3Y46kMEE5bNrIjBYl+s5Ij1jSJFYOLSae0s+L7TIYvfYle6mZ2V/pkWSTHP+DQMtCYlhVjsxhHqxGNZJqXwfWQz+4QqM/dip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714433680; c=relaxed/simple;
	bh=FPdYETdjKmhlDQ/emE0zg12AELcOr00AnZ5pjRFUtb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=KrIOZlATqxcmlIwL5lNn7iqcbqIgLPRgsfaC+nj/9BtazT3dB+JgmctWVUHla93L8TuYtI/h6moShNdfjV+tsqJ0FsKyOVU7TZ9snGOR0mLdoTq2+XHQk8lcixvuvKdOzcpzWYOI07yDZiAXZrFAYi44b4sq0A6A3uhizVf/4U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNMBtWxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A97C113CD;
	Mon, 29 Apr 2024 23:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714433679;
	bh=FPdYETdjKmhlDQ/emE0zg12AELcOr00AnZ5pjRFUtb4=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=vNMBtWxc4vNIUT1VKpBOQ1Egv06NpLTBgqsyjU9B8vqc5wqSYq3PHmwt0F8vL+I7r
	 xMpsXsczt+wDBKh+3I0Lu48s1VfgOoDIo0f5v9tGIdQw7+Cx/KLqpx1nkTr10ARmjD
	 JOlceqNFdNUvFQt6DUHFqB4t2B1KB4fXq38biQJIe+ahRQe6CHGbon/CdB2gJRsZ6e
	 Qpq0w+4iORV5Q25UgQQzGPwcr2p0EmHXCpGAv5Hmj4rP9VYLdzUaRvyeI0pMyHvW1U
	 E/w/nYZq+m3uO0/upUDlF1/to5TKzgS7tgTT/jXA+/3nKjD63wmNewzXI6Icl0+Ag1
	 m9b08/Tx7CZrg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Apr 2024 02:34:36 +0300
Message-Id: <D0X00LTUCCC8.X8LKLJHZZRGP@kernel.org>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>,
 <linux-integrity@vger.kernel.org>
Cc: <keyrings@vger.kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>
Subject: Re: [PATCH v8 22/22] tpm: disable the TPM if NULL name changes
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240429202811.13643-1-James.Bottomley@HansenPartnership.com>
 <20240429202811.13643-23-James.Bottomley@HansenPartnership.com>
In-Reply-To: <20240429202811.13643-23-James.Bottomley@HansenPartnership.com>

On Mon Apr 29, 2024 at 11:28 PM EEST, James Bottomley wrote:
> +	if (chip->flags & TPM_CHIP_FLAG_DISABLE)
> +		return rc;
> +

s/DISABLE/ACCESS_DENIED/ as it is more to the point.

Further, tpm_open() should fail right off the bat after ending up to
this situation.

BR, Jarkko

