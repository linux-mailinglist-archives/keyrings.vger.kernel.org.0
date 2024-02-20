Return-Path: <keyrings+bounces-702-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054A85C2FB
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 18:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51B621C22209
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C2476C73;
	Tue, 20 Feb 2024 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiuJwl1H"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9676C6C
	for <keyrings@vger.kernel.org>; Tue, 20 Feb 2024 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708451356; cv=none; b=m11FOTgNelp6U/cO4EcN1fq4I5eMEIkCEx91YhCsQ9NMQ653uWXlkDWZZoBndI/KOTk4jWOHxasuzxVCWSqFGYm2mIHWB0EJgz3jJDmWRiYyQWbb2onqfhqoZS19h2gVlXJ5bqscdTxX5Tba77vaVB6FojLGzMejjDhM/fqOtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708451356; c=relaxed/simple;
	bh=IOo9Mqihj8ODazWdT5+lgF8E2m7teaFO28X0xWsSWnI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=N5nrAX3tHNpqIrStKkDD9Hx0LYTT1msZ8nOnIh+E/Nv0q6q5l65di9og+x/dYkKSAluyDce/EH080G3Kb38VpnSbam7wQTITXHo8CtM22zEJsgNCLbT17ZzJYL/29TkJVtrz3a/3CxcQQRp2WZBAJ0vsSBmCvGvtkJT0NAZ/Qjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiuJwl1H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA52C433F1;
	Tue, 20 Feb 2024 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708451356;
	bh=IOo9Mqihj8ODazWdT5+lgF8E2m7teaFO28X0xWsSWnI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=tiuJwl1HGZFf6ik5Nh0bzNVKg/YyelxstjEJsfCma/bC2lPCoKxEifdNOhvS2PAZH
	 QFtgSWuiuqoMwHme8D5+hInZt/qvY0qdtuqJHrwntxIKp6LYEJuPi+aOmZmrK3Hvyc
	 FNaGZevMRCYZkkBpRs7DArXZxcPrZIjd+bQ2nEWZRLwDII/+LalZjDCzrfkFEhcFeA
	 bKv7hRW2vj4pkCkeAnM95RiwKlSJ/q3vWnK6G+pGTCROUhLTF9r12GmgAyvU5uJz9N
	 sv61ahLMBDffEpx+/kNx5BOEO8ZqQFi/wvuIgrd6AgLEl1muUYGOxrzyB7kz2C8ViG
	 FeLMI1VmZu9/A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Feb 2024 17:49:13 +0000
Message-Id: <CZA3GKLCWG7B.1Q1JLDVN989B1@seitikki>
Cc: <maximilian@mbosch.me>
Subject: Re: Allowing empty keys? or: setting attributes on keys safely
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Linus Heckemann" <linus@schreibt.jetzt>, <keyrings@vger.kernel.org>,
 "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.15.2
References: <ygar0hbrm05.fsf@localhost>
 <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki> <ygale7fscvy.fsf@localhost>
In-Reply-To: <ygale7fscvy.fsf@localhost>

On Tue Feb 20, 2024 at 9:28 AM UTC, Linus Heckemann wrote:
> "Jarkko Sakkinen" <jarkko@kernel.org> writes:
>
> > On Sat Feb 17, 2024 at 6:20 PM UTC, Linus Heckemann wrote:
> >> Hi all,
> >>
> >> We've been fiddling with the keyring functionality; I want to set up a
> >> key with an expiry time safely -- i.e. the key data should never be
> >> loaded without the expiry time being set.
> >
> > Something prevents you setting invalid payload first, and appropriate
> > one later with keyctl_update?
>
> Nothing, and this is the approach we're taking for now, but having a
> zero-length payload feels more semantically appropriate than e.g. a
> single NUL byte.

What is the actual problem then, other than feelings?

BR, Jarkko

