Return-Path: <keyrings+bounces-920-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4087F3FB
	for <lists+keyrings@lfdr.de>; Tue, 19 Mar 2024 00:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDAEDB2171B
	for <lists+keyrings@lfdr.de>; Mon, 18 Mar 2024 23:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02AA5F544;
	Mon, 18 Mar 2024 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZ9De5F4"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24755EE8D;
	Mon, 18 Mar 2024 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710804468; cv=none; b=gngeMNvp/MNcy7RWXZnlPO+hM7mbtjg4+AIAprnoyxWAtOSnlV+8ujBEjWgUUBwdOqb5aqyEBONNhgC1tHiaxBJ+DfC3gsy5TKKYyN93zK4twzLuMaMA6pFuqvaSCZqDzv1nA5grXQIAgTZelw7D4Jz/KP0Zqci55cu8cY21m2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710804468; c=relaxed/simple;
	bh=0S9Y9rj/bpBXjc+MXn4SjJDwIYcQoHrs8PTRftXmKbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=V2Y/KHeTLFzPKE2S6FWtLfJLE4H2258bRkqD2SvE87WkEH7kahyIp/ARats6j5vFT4lWSJ+7TDD8Dgd3o4qLC796DatVMESZlYFVzUTgVRsWrhnvVbWy9SxQluBUDjnqdhMUpQ9usi4jcGYImqNLYFMBlzaFlFjQ4zK9uLOyuPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZ9De5F4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89F4C433C7;
	Mon, 18 Mar 2024 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710804468;
	bh=0S9Y9rj/bpBXjc+MXn4SjJDwIYcQoHrs8PTRftXmKbg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sZ9De5F4jx9EWCCKHHN68q69J893Wu0LXedrHo0Pd7sshJ4F0LaIa1U2P1QAKLPou
	 fnz7dOYTgXxkorf/6bxIhpwstJRGMjqRkJYndfWtOmPOR5zPr6hRSAPB7XExg+vL01
	 /yS9SZWixBhulgLuF2um2WOovtaOAMINgbfuOzO8PQwYBnJvk1ixED+ZR7gA+5m8nu
	 ESkRmitczgmM8K9NgH5/qK+SKrcIBHJd8ELdV1GHURKz7VGQTpAeLQ7poja+1txgOz
	 x7jw+0f+PlxJoAqj7cfi7iFbZ9aCJ5/Dd4U9A/lyBcWxrDS21sRV0cNX8bKOKOPkC6
	 AGS6ByrRim3SA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Mar 2024 01:27:45 +0200
Message-Id: <CZX9KHAO8163.2IASOXWIT4OZ5@kernel.org>
Subject: Re: [PATCH] keys: Fix overwrite of key expiration on instantiation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Silvio Gissi" <sifonsec@amazon.com>, "David Howells"
 <dhowells@redhat.com>
Cc: "Hazem Mohamed Abuelfotoh" <abuehaze@amazon.com>,
 <linux-afs@lists.infradead.org>, <linux-cifs@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <netdev@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20240315190539.1976-1-sifonsec@amazon.com>
In-Reply-To: <20240315190539.1976-1-sifonsec@amazon.com>

On Fri Mar 15, 2024 at 9:05 PM EET, Silvio Gissi wrote:
> The expiry time of a key is unconditionally overwritten during
> instantiation, defaulting to turn it permanent. This causes a problem
> for DNS resolution as the expiration set by user-space is overwritten to
> TIME64_MAX, disabling further DNS updates. Fix this by restoring the
> condition that key_set_expiry is only called when the pre-parser sets a
> specific expiry.
>
> Fixes: 39299bdd2546 ("keys, dns: Allow key types (eg. DNS) to be reclaime=
d immediately on expiry")
> Signed-off-by: Silvio Gissi <sifonsec@amazon.com>
> cc: David Howells <dhowells@redhat.com>
> cc: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
> cc: linux-afs@lists.infradead.org
> cc: linux-cifs@vger.kernel.org
> cc: keyrings@vger.kernel.org
> cc: netdev@vger.kernel.org
> cc: stable@vger.kernel.org
> ---
>  security/keys/key.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 560790038329..0aa5f01d16ff 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -463,7 +463,8 @@ static int __key_instantiate_and_link(struct key *key=
,
>  			if (authkey)
>  				key_invalidate(authkey);
> =20
> -			key_set_expiry(key, prep->expiry);
> +			if (prep->expiry !=3D TIME64_MAX)
> +				key_set_expiry(key, prep->expiry);
>  		}
>  	}
> =20

I checked the original commit and reflected to the fix:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

David, I can pick this one too as I'm anyway sending PR for rc2?

[1] https://lore.kernel.org/keyrings/CZX77XLG67HZ.UAU4NUQO27JP@kernel.org/

BR, Jarkko

