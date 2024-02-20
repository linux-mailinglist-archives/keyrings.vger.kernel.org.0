Return-Path: <keyrings+bounces-703-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39885C2FF
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 18:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4941C22ACB
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 17:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C81A77650;
	Tue, 20 Feb 2024 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjiHG8Xm"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042977764B
	for <keyrings@vger.kernel.org>; Tue, 20 Feb 2024 17:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708451529; cv=none; b=SXA31W38g6LUoQcNdaFLuwOB/7V/VB5xBqnoPQzJ7B8iXEclc7N012ogdARqbkj6jm8/W8Qc1rWSJBiYiY6i/s840NhSD796+mfFqc56GgslBJTxu4lb/Ab3SuP0uU9UWR/at0cT9qGpk9WQM6PbHH9MDrjXk73ij93hC5tpWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708451529; c=relaxed/simple;
	bh=4jYBMEi9sXIvXr9ggBtiPRCSWmRIgytekn5nyAFlaMI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uvlhYjWZLt5EPh1eHDTVSW3lY4jOpygzJceAVLrNVr47YJhWXa94wI9dZDhxmUUQyyAJCR+oR0lhwiMzYjjelpALrZULCYyPn5q9O7eQp2lkdpL5aRmmq0s4NwUt+IGDuKruOyEMUXYsvXDrdTGD2HNOFfZPIv3iLlk4pvMZzYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjiHG8Xm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5EAC433C7;
	Tue, 20 Feb 2024 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708451528;
	bh=4jYBMEi9sXIvXr9ggBtiPRCSWmRIgytekn5nyAFlaMI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hjiHG8XmLg6NUrPDJePs8F/0jNd2eOEdnEOTLLOd2WDQY/1GIy3+Ss+wqn6fD3463
	 7STcjqbP5QMbtsL8O/fOC6C68p+pb7bfqlcvz/TNEVPg6p04rZIlSH7zLzSSM1+O6q
	 eGZ4fjgEBJD4IoHNqqdJ7LS+epLNEqCwV1eXwrHFuMhnebAHdBxSJoMqurQC6KUxQI
	 o9TgOjzLtGHNvgns+s1dx3Qaq4sB4U7urFYZCwl5WkKDg6c79kiGRkJhXC2Pg/9P+d
	 thTA1+zczwuYqMW8G5iPWDSEY/DzUGjdFH+KuPm/074Z30QmGv6r2qVIdyMZp8r9TI
	 ud//VzDacFsvQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Feb 2024 17:52:05 +0000
Message-Id: <CZA3IRO5XQW5.L44X8CN9S3T@seitikki>
Subject: Re: Allowing empty keys? or: setting attributes on keys safely
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Linus Heckemann"
 <linus@schreibt.jetzt>, <keyrings@vger.kernel.org>, "David Howells"
 <dhowells@redhat.com>
Cc: <maximilian@mbosch.me>
X-Mailer: aerc 0.15.2
References: <ygar0hbrm05.fsf@localhost>
 <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki> <ygale7fscvy.fsf@localhost>
 <CZA3GKLCWG7B.1Q1JLDVN989B1@seitikki>
In-Reply-To: <CZA3GKLCWG7B.1Q1JLDVN989B1@seitikki>

On Tue Feb 20, 2024 at 5:49 PM UTC, Jarkko Sakkinen wrote:
> On Tue Feb 20, 2024 at 9:28 AM UTC, Linus Heckemann wrote:
> > "Jarkko Sakkinen" <jarkko@kernel.org> writes:
> >
> > > On Sat Feb 17, 2024 at 6:20 PM UTC, Linus Heckemann wrote:
> > >> Hi all,
> > >>
> > >> We've been fiddling with the keyring functionality; I want to set up=
 a
> > >> key with an expiry time safely -- i.e. the key data should never be
> > >> loaded without the expiry time being set.
> > >
> > > Something prevents you setting invalid payload first, and appropriate
> > > one later with keyctl_update?
> >
> > Nothing, and this is the approach we're taking for now, but having a
> > zero-length payload feels more semantically appropriate than e.g. a
> > single NUL byte.
>
> What is the actual problem then, other than feelings?

I mean API semantics almost never should not been changed, even if
it is "stupid" one way or another. So threshold to do anything at=20
all should have bar set to quite high...

BR, Jarkko

