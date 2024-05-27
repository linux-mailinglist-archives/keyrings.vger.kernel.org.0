Return-Path: <keyrings+bounces-1479-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125128D0969
	for <lists+keyrings@lfdr.de>; Mon, 27 May 2024 19:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1031281EFD
	for <lists+keyrings@lfdr.de>; Mon, 27 May 2024 17:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2EA26AE7;
	Mon, 27 May 2024 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU3FnkV0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CCB2628B;
	Mon, 27 May 2024 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716831252; cv=none; b=uY/ILbu6l3ws5PHEreLoaKjvFEptjoc/uqxcEoTjBdccm4Eh5FfjgxGhY7n+4xl9P6kDrr9j5dJqPxBIRIWh71h42l5EjMRDAWQxo3kFI/gbyxmndBWawxuHNOua/zjMbs+02im/XbTcRsJ+FVf7qIFFPjjzfeas6GDb39OLrBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716831252; c=relaxed/simple;
	bh=EkCcuQoEu2X7I/06oyPu6iBduaFvnvA2bE1UUNI0O3A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tJIQD8pfTvRuIfDOp0/Px710zVRqGi9wUiblaZbJI/wf7eSDKjpizmqMjFJCi9eqTiD1+d0f+PrGe7zn6S0/9Getpnb3HhuWMvJ8nQMf2q8Yudq2qZ83YNwpZEiJMN3gJoB/xL7OsGjXNJoAod1q8nQeOkZevFxk0FYZyU4vFTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU3FnkV0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9BCC2BBFC;
	Mon, 27 May 2024 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716831252;
	bh=EkCcuQoEu2X7I/06oyPu6iBduaFvnvA2bE1UUNI0O3A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PU3FnkV0A2antq7p5xHzQPo6q+Z0slZH5hh4+K9X+1QTlj1gHF0puBj/58mAuMI0c
	 bFjfXsMwalM51UzSBety/eCvqshnbn1FtFpl5TUWy48qLh7zQFqKtwZQGoUpvBHX4u
	 KR6xFRzv+/S4yJBzEXT/x3W8qouwhFdS/qhL/ATK6Us5cTnHuA+zilGVhKTn9sphgU
	 VCAudiKmKBmOH9DAqXnCEMN9D8yMRpIHGPk1JMwUgspOc3DD5wKGRtxlRGVW7i+qNj
	 31cpgj3DG3DQIqt0HqMoHdX0CY6m6HLlcqsYkuWkBEBK0OLBFbejPmv84ewXvcIUeR
	 BxmWPfpr+4iMA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 May 2024 20:34:08 +0300
Message-Id: <D1KLVVIGOUSM.27M0JU1DIX0FN@kernel.org>
Subject: Re: ecdsa_set_pub_key
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-crypto@vger.kernel.org>,
 "Stefan Berger" <stefanb@linux.ibm.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David Howells"
 <dhowells@redhat.com>, <keyrings@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <D1KLP7ML9T1B.1LHPTTWEANRJ3@kernel.org>
In-Reply-To: <D1KLP7ML9T1B.1LHPTTWEANRJ3@kernel.org>

On Mon May 27, 2024 at 8:25 PM EEST, Jarkko Sakkinen wrote:
> Hi,
>
> The documentation of ecdsa_set_pub_key() is the following:
>
> /*
>  * Set the public key given the raw uncompressed key data from an X509
>  * certificate. The key data contain the concatenated X and Y coordinates=
 of
>  * the public key.
>  */
>
> If you interpret this literally it would mean 64 bytes buffer for p256
> with two 32 byte blobs for x and y.
>
> With such buffer the function fails with -EINVAL, which is obvious from
> the code that does checks on the contents.
>
> Instead of responding to this, can you please fix the documentation bug?
>
> There was also badly documented stuff in akcipher that has been
> unreacted so far so putting also that one here:
>
> https://lore.kernel.org/keyrings/D1HCVOZ1IN7S.1SUZ75QRE8QUZ@kernel.org/
>
> BR, Jarkko

The best reference I could quickly find is Wikipedia:

"The older uncompressed keys are 65 bytes, consisting of constant prefix
(0x04), followed by two 256-bit integers called x and y (2 * 32 bytes).
The prefix of a compressed key allows for the y value to be derived from
the x value."

The documentation says absolutely nothing about the prefix byte, and
neither Wikipedia nor kernel documentation has a reference to this
"older format".

BR, Jarkko

