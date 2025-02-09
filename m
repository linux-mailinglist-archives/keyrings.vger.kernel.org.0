Return-Path: <keyrings+bounces-2389-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7EEA2DD1C
	for <lists+keyrings@lfdr.de>; Sun,  9 Feb 2025 12:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68BB7165343
	for <lists+keyrings@lfdr.de>; Sun,  9 Feb 2025 11:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA391AF0AF;
	Sun,  9 Feb 2025 11:30:07 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28F1BCA19;
	Sun,  9 Feb 2025 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100607; cv=none; b=JWHTmijGA+pxtQKGNny+OHL7B4grNMHpDQh3Kley33QhY+MoNpMKNeUZCebWBBK3TnETh7T2ihL4JRdXpC6uSGjlTe4+IP09LksTxhiYze4aw+ar/15pv3wnTYd6kNRAqoYpaBCFvM3dqWzMWvSqBhcklCct6yj+TozLYeEn2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100607; c=relaxed/simple;
	bh=HYhQtMTxrgkfp4UMJQvWW1+/MVULt9Tc51IyKRo2I3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kH5z7Rha1gXAlTEFqDw1kJRjh/2H6Gxs+F7QqouGXIUenKVmxc6bL0ysWY2nWRcl7zej66lYgqiWVAjpYJTVRfPcGpNhC74eunz0XV6Jd/LOvYS98bhAizO3LjhIChc00ATdFPOKlSgqgaKZhz5AZFccROBO9gcASyhyYfGwWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id D859D102949F8;
	Sun,  9 Feb 2025 12:29:54 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7788A331C4F; Sun,  9 Feb 2025 12:29:54 +0100 (CET)
Date: Sun, 9 Feb 2025 12:29:54 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z6iRssS26IOjWbfx@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>

On Sun, Feb 09, 2025 at 05:58:07PM +0800, Herbert Xu wrote:
> On Sun, Feb 02, 2025 at 08:00:53PM +0100, Lukas Wunner wrote:
> > KEYCTL_PKEY_QUERY system calls for ecdsa keys return the key size as
> > max_enc_size and max_dec_size, even though such keys cannot be used for
> > encryption/decryption.  They're exclusively for signature generation or
> > verification.
> > 
> > Only rsa keys with pkcs1 encoding can also be used for encryption or
> > decryption.
> > 
> > Return 0 instead for ecdsa keys (as well as ecrdsa keys).
> 
> I think we should discuss who is using these user-space APIs
> before doing any more work on them.  The in-kernel asymmetric
> crypto code is not safe against side-channel attacks.  As there
> are no in-kernel users of private-key functionality, we should
> consider getting rid of private key support completely.
> 
> As it stands the only user is this user-space API.

Personally I am not using this user-space API, so I don't really
have a dog in this fight.  I just noticed the incorrect output
for KEYCTL_PKEY_QUERY and thought it might be better if it's fixed.

One user of this API is the Embedded Linux Library, which in turn
is used by Intel Wireless Daemon:

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/key.c
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-tls.c

Basically IWD seems to be invoking the kernel's Key Retention Service for
EAP authentication.  It's still maintained and known to have active users,
so removing the user-space keyctl ABI would definitely cause breakage.

I've just checked for other reverse dependencies of the "libell0" package
on Debian, it lists "bluez" and "mptcpd" but looking at their source code
reveals they're not using the l_key_*() functions, so they would not be
affected by removal.

There's a keyring package for go, so I suppose there may be go applications
out there using it:

https://pkg.go.dev/pault.ag/go/keyring

Then there's the keyutils library...

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git

...and listing the reverse dependencies for "libkeyutils1" on Debian
reveals a slew of packages which are using it:

  gdm3 samba-libs sssd-common python3-keyutils nfs-common ndctl
  mokutil kstart libkrb5-3 kafs-client ima-evm-utils ceph-common
  libecryptfs1 ecryptfs-utils cifs-utils

And "python3-keyutils" in turn has this reverse dependency:

  udiskie

Finally, folks at cloudflare praised the kernel's Key Retention Service
and encouraged everyone to use it... :)

https://blog.cloudflare.com/the-linux-kernel-key-retention-service-and-why-you-should-use-it-in-your-next-application/

In short, it doesn't seem trivial to drop this user-space API.

Thanks,

Lukas

