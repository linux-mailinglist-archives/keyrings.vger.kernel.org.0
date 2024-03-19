Return-Path: <keyrings+bounces-926-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF58880479
	for <lists+keyrings@lfdr.de>; Tue, 19 Mar 2024 19:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5417B24552
	for <lists+keyrings@lfdr.de>; Tue, 19 Mar 2024 18:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1802BAF0;
	Tue, 19 Mar 2024 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swWCCn3Y"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081638F9B;
	Tue, 19 Mar 2024 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710871952; cv=none; b=grAljBCgUipjPrpBTe3hkNH5QhabfxuSy5fd7t70Kh5rYhdPp0lDIZpVKEoBxccU468OVYw101hoKJrGLPcEYHZbLKvpcdZBIi/KJWexcUlHbQ4COyLxyamGYUA3iu4wEy29i7Zy0wiwFVQwD9LCCZyJnIHYU/2YTfqctFbs3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710871952; c=relaxed/simple;
	bh=Atcxj90hTF+zxrJlwSGVzi+lpYqnTHj82OPJjJr/fpc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NH/f1NhsFKZAAa5qXpbA6ZUnGrEd/8y+D0BVcvk6TZDBGWCiEUBLcPiUTc8mXCKLXfgrbA5tawWS1mFORU529UZ95BswoMmSc7hQQI/B4RKhAuo6+SjkNuxMMoW9r1GRmU5EdxT2JefM6PWsA+1qosN17xG09FYnL5hsNCTib4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swWCCn3Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0640C433F1;
	Tue, 19 Mar 2024 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710871951;
	bh=Atcxj90hTF+zxrJlwSGVzi+lpYqnTHj82OPJjJr/fpc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=swWCCn3YjhWpcbRhKwXi6lQMfdcw+V2TnlNtcjw+3rqqCc0GqYkx+iRPfAjpxvtEe
	 Z8LAW92UtslUF8R34qBtQhF/TZ8OTcNfosxYm4vhUVOMdyOzR/fslPNxihdnyc4GhH
	 dAT91c8Snem5ZKgueZFzflacmds3x4ABxyih7gcKkQNdpeVxs0c9UZPXNp2VOjJH38
	 a3M8he9LGm7YMhAtLRCJL4vICo5/RLjws+7piZHmvii71pbfjvBA0Yaiqv3YTJkySL
	 //m9pptx0GcX1tXFs5T1Y+/VFuZmPGjCQNV/NQGUsYaaC/UJcE4BnGS7ilHn2LFTls
	 b9D9bGh08DEtQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Mar 2024 20:12:28 +0200
Message-Id: <CZXXHMPCCCE5.2SSZ17WVZPGRX@kernel.org>
Cc: "Hazem Mohamed Abuelfotoh" <abuehaze@amazon.com>,
 <linux-afs@lists.infradead.org>, <linux-cifs@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <netdev@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] keys: Fix overwrite of key expiration on instantiation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Silvio Gissi"
 <sifonsec@amazon.com>, "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240315190539.1976-1-sifonsec@amazon.com>
 <CZX9KHAO8163.2IASOXWIT4OZ5@kernel.org>
In-Reply-To: <CZX9KHAO8163.2IASOXWIT4OZ5@kernel.org>

On Tue Mar 19, 2024 at 1:27 AM EET, Jarkko Sakkinen wrote:
> On Fri Mar 15, 2024 at 9:05 PM EET, Silvio Gissi wrote:
> > The expiry time of a key is unconditionally overwritten during
> > instantiation, defaulting to turn it permanent. This causes a problem
> > for DNS resolution as the expiration set by user-space is overwritten t=
o
> > TIME64_MAX, disabling further DNS updates. Fix this by restoring the
> > condition that key_set_expiry is only called when the pre-parser sets a
> > specific expiry.
> >
> > Fixes: 39299bdd2546 ("keys, dns: Allow key types (eg. DNS) to be reclai=
med immediately on expiry")
> > Signed-off-by: Silvio Gissi <sifonsec@amazon.com>
> > cc: David Howells <dhowells@redhat.com>
> > cc: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
> > cc: linux-afs@lists.infradead.org
> > cc: linux-cifs@vger.kernel.org
> > cc: keyrings@vger.kernel.org
> > cc: netdev@vger.kernel.org
> > cc: stable@vger.kernel.org
> > ---
> >  security/keys/key.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/security/keys/key.c b/security/keys/key.c
> > index 560790038329..0aa5f01d16ff 100644
> > --- a/security/keys/key.c
> > +++ b/security/keys/key.c
> > @@ -463,7 +463,8 @@ static int __key_instantiate_and_link(struct key *k=
ey,
> >  			if (authkey)
> >  				key_invalidate(authkey);
> > =20
> > -			key_set_expiry(key, prep->expiry);
> > +			if (prep->expiry !=3D TIME64_MAX)
> > +				key_set_expiry(key, prep->expiry);
> >  		}
> >  	}
> > =20
>
> I checked the original commit and reflected to the fix:
>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> David, I can pick this one too as I'm anyway sending PR for rc2?
>
> [1] https://lore.kernel.org/keyrings/CZX77XLG67HZ.UAU4NUQO27JP@kernel.org=
/

I've applied this to my tree. Can drop on request but otherwise
including to rc2 PR.

BR, Jarkko

