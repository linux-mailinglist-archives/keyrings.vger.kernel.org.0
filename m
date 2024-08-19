Return-Path: <keyrings+bounces-1910-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D64957281
	for <lists+keyrings@lfdr.de>; Mon, 19 Aug 2024 19:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D7D1F22001
	for <lists+keyrings@lfdr.de>; Mon, 19 Aug 2024 17:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565F5188CA3;
	Mon, 19 Aug 2024 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScqkOAn+"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27002D531;
	Mon, 19 Aug 2024 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090168; cv=none; b=oZOw/C7EtfYxrmV8rTeStIThSeeLM+jhSsg1yJ19htAZ+3fYWc4XJXB0ipKCpntpZlHfAjyC/x87pKFO/Srjxlh8LmdIIxuMgfwBIMOCqXeWasdSvGFz+NbwZoi8kvYLDiTx4EFQH9X7SgXK7gWE06pjGWOXH+DsrYh0SeMykd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090168; c=relaxed/simple;
	bh=mmODq+TZhWuJQ5d98mEb9sY1bqTu6zYLV5Bks5epVCA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AW9bWGziRaTtc51rYSdbPze5ndPZIFJo/bOle8eAkanrpltiUvJxEWsRMvuaZuVSyarHGQcm4zq10Mfeh3QG9c9pALd933ky3rmKiPEPwRNa8PBp1g9OBPeGKTtAjxk/ac152UJ1ixmvuaeMY55xwij3uBVu2numQ63ZkU4fFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScqkOAn+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B84FC32782;
	Mon, 19 Aug 2024 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724090168;
	bh=mmODq+TZhWuJQ5d98mEb9sY1bqTu6zYLV5Bks5epVCA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ScqkOAn+7oBUmnlRdsXQf73YyqpgKX3dBbwThQcGbkVRActWgjx5MBHTfEfRmv5P2
	 /gFVplAAbMOUqSdYNgV41/+DhxOnI74U83ZI/PXAyrz1D/CsA+5eLlXLfQr+m0ZDUu
	 3LSuzPbWVqfJ85lDtuLIfoVgdkxbvFI9xisFAIPO0FvwhITxaD1EENmxUoZYHqlU29
	 jOShlhKwuJt3bP2EUck+qmMCWmuH7CYlndnhSJgDi1tgoC4bhoFdnHgzhaESZYFpu1
	 OurUubG4OgiLidulpmYD6GMcEryfU/eTs3DD64p5HT4+ptNnaWdHjs4USb6Q45pyRS
	 MKqJGBm7rgvYg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Aug 2024 20:56:04 +0300
Message-Id: <D3K2YF6WOIPS.Y9VHQLJ375WP@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <zohar@linux.ibm.com>,
 <linux-integrity@vger.kernel.org>, "Roberto Sassu"
 <roberto.sassu@huawei.com>
Subject: Re: [PATCH v2 02/14] rsa: add parser of raw format
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Roberto Sassu" <roberto.sassu@huaweicloud.com>, <dhowells@redhat.com>,
 <dwmw2@infradead.org>, <herbert@gondor.apana.org.au>, <davem@davemloft.net>
X-Mailer: aerc 0.18.2
References: <20240818165756.629203-1-roberto.sassu@huaweicloud.com>
 <20240818165756.629203-3-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240818165756.629203-3-roberto.sassu@huaweicloud.com>

On Sun Aug 18, 2024 at 7:57 PM EEST, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> Parse the RSA key with RAW format if the ASN.1 parser returns an error.

Why? Please finish the commit message properly.

BR, Jarkko

