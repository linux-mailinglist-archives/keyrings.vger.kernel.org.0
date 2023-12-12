Return-Path: <keyrings+bounces-253-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E40C80E26B
	for <lists+keyrings@lfdr.de>; Tue, 12 Dec 2023 04:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1766B20EEC
	for <lists+keyrings@lfdr.de>; Tue, 12 Dec 2023 03:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68757481;
	Tue, 12 Dec 2023 03:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcOPdWev"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CA7465
	for <keyrings@vger.kernel.org>; Tue, 12 Dec 2023 03:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F68C433C7;
	Tue, 12 Dec 2023 03:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702350186;
	bh=V6aKJvuenIIPeYtYC/2j963aubdSI2b0OSCD3ucQPBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcOPdWevTHR2NUgEZZhGgvvqpu55ol3BkhpdrzGG8CV2x/D4T7pc0qj+dbicbmv2H
	 vLbeHrFmJpv0oXlqhVynTTAoIBxZ0ySpvi6iBZjbxnSi2zodAwqHxXK32t7tTSRFkZ
	 m/b4HDwsWJMH5nd/qRhdYByw8u7LDzJ8AaPlDuP5GW5Q8Cz6J9BpB3p7mk/rzMZVFm
	 OSyR+HTdc9ejXom2U6xJTHNDsVhBFHkF7i3Upk1Qyvebz/CdPOqjYHCqC0m4KFk6BT
	 1LVXuuFkiaKHRQwPvakKQd4oW6dZV+AQ6M9CtH7xhHkWWMRkZL7d5V2vynsX5Bk+X6
	 cMoPE+6WfyVfA==
Date: Mon, 11 Dec 2023 19:03:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Luis Henriques <lhenriques@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] keys: flush work when accessing /proc/key-users
Message-ID: <20231212030304.GA39443@sol.localdomain>
References: <20231207024323.GA1994@sol.localdomain>
 <20231206145744.17277-1-lhenriques@suse.de>
 <498294.1701878642@warthog.procyon.org.uk>
 <87bkb3z047.fsf@suse.de>
 <2744563.1702303367@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2744563.1702303367@warthog.procyon.org.uk>

On Mon, Dec 11, 2023 at 02:02:47PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > If there was a function that fully and synchronously releases a key's quota,
> > fs/crypto/ could call it before unlinking the key.  key_payload_reserve(key,
> > 0) almost does the trick, but it would release the key's bytes, not the key
> > itself.
> 
> Umm...  The point of the quota is that the key is occupying unswappable kernel
> memory (partly true in the case of big_key) and we need to limit that.
> Further, the key is not released until it is unlinked.

Well, fs/crypto/ no longer uses the keyrings subsystem for the actual keys, as
that was far too broken.  It just ties into the quota now.  So what's needed is
a way to release quota synchronously.

That might just mean not using the keyrings subsystem at all anymore.

> Do we need faster disposal of keys?  Perhaps keeping a list of keys that need
> destroying rather than scanning the entire key set for them.  We still need to
> scan non-destroyed keyrings, though, to find the pointers to defunct keys
> unless I have some sort of backpointer list.

If it's still asynchronous, that doesn't solve the problem.

- Eric

