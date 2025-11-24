Return-Path: <keyrings+bounces-3431-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A4C825C2
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 20:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3414B347CB2
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 19:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4FC32D7DE;
	Mon, 24 Nov 2025 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SzyFR3oU"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA832D443
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014067; cv=none; b=sS4Z+p9/OMjCz7TXES0EAiqXglKnK/Wc6NCpMICyAKoLZJpvLxIjPxm4dUDiSpQApAUTaAJyamaU4QHklTMSHgAYvB6XeBWDMRb6o1q+lFrjUtT+J8qlLHsNUgzQFIEyY8hfLXMcmavnhZj8TG5SkzPMbX4jdXIkcrSy41gahME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014067; c=relaxed/simple;
	bh=Zm+q+l9qQx8Bba+OEMBC0euPoac6H638UyyPFc8BJZU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=clZcdHzkOYtbO01Fq2BIsDFQHw/OX1mkX9m/l652/ORSoF+WLDJYGrtvINQQzxLoSGhN2Gnk9+wURe0dV2FRX6oGPJFBGtiPp2bbG8UUrV0SlZzaBfeQ9HVD74wg7SWXPy2NpROYt4gR/WlljoBY+Sc41WE/3W1pK0K/xpNT3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SzyFR3oU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764014065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QkcIAl5r3oTz2YJkwOodI54A9txsGksKR1/Qewobb2Y=;
	b=SzyFR3oUz/o3w+eoCOPrKc5l4TZ8DkKI8psMMlHEiEfSiyfpHdIhAebllwvBLZU1Nbu/ar
	XC5EOt6e44yNn3V3vMbNXGaRl1v0JLi0QnPCf9vYDn7Il6EN0wn0EE8HABF5Ax8RqJf81A
	OLBcBqFyD586FLn+Yky/nKV39dZbQKI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-yADlOeZVMRSrgKh98eLfEw-1; Mon,
 24 Nov 2025 14:54:22 -0500
X-MC-Unique: yADlOeZVMRSrgKh98eLfEw-1
X-Mimecast-MFC-AGG-ID: yADlOeZVMRSrgKh98eLfEw_1764014059
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B34C18001D1;
	Mon, 24 Nov 2025 19:54:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C433195608E;
	Mon, 24 Nov 2025 19:54:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com>
References: <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com> <20251120104439.2620205-6-dhowells@redhat.com> <20251120104439.2620205-1-dhowells@redhat.com> <3374841.1763975577@warthog.procyon.org.uk> <20251124164914.GA6186@sol> <3647621.1764005088@warthog.procyon.org.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3649784.1764014053.1@warthog.procyon.org.uk>
Date: Mon, 24 Nov 2025 19:54:13 +0000
Message-ID: <3649785.1764014053@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> > > Still not really sure what the point is.  There's only one user of
> > > crypto_sig, and it could just call the ML-DSA functions directly.
> >
> > Is it your aim to kill off the crypto/ dir and all the (old) crypto API?
> 
> Probably entirely killing off the old API is going to be fraught
> because its abstraction has leaked out to userspace. But to the extent
> we can minimize its use over time, I think that's a good thing. Even
> for crypto usages that generalize to a few different ciphers of one
> variety or another, I think being explicit about which ciphers and
> having purpose-built dispatchers is usually a better route.

How are you proposing handling the autoloading feature of the old API?

David


