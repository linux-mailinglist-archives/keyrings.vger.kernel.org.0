Return-Path: <keyrings+bounces-2455-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0DA645BD
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 09:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EAFA188BBEB
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 08:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE22191499;
	Mon, 17 Mar 2025 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RPAHX8Fr"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F9721D3D6
	for <keyrings@vger.kernel.org>; Mon, 17 Mar 2025 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200603; cv=none; b=ZLtDVDcdXjNs6egvxL6ts3O5d5q77OGzC7O1eI+B1XK52QqVhEWHKzTcim9eZIrYb7I0A8oOMRpGeH7qBePDztsX7eeIYrk7PB3bsKSKsq/UEdSTZoO0uncvyb0VHa8uqz+o1EJJk/SrFCf7Q60Zoc8MA5aU4/p5wPasZdVyslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200603; c=relaxed/simple;
	bh=4Ja7e6U9yNhl+JrvSpvm42lU4+p2vsE/X83W7rD/14Q=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=pMOzbJ1IbUnz+n+uU0HSix/AORRxb+N8UTItZONfGxHomOxgD0GvOg4l5bxIaCvZH8ADoyU/mjnN2189tFpVTYl5kY/PQ2TP9eY0JS6BnYWhqn1wygJr5OOchFlQGCl+XDa3sYHIWGXlXR4nmnYRVrx1rKmPaxu3Xx5yhaBnLok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RPAHX8Fr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742200601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb2tWkutFdwW0BrIFMtAs6rVWFa189SNP9nOSQ9SGtg=;
	b=RPAHX8FrGzmmQcz620TQPKjDNHebRUuE/6RmV1z5ZeZhHkvsKq85cziVgNXMNsG9EsKurn
	fSvvGcBfV7CxoCRCCW3nbJuy4lNC204Cu8182D1GPGTdbt+lZBvW6ODF4kLNTiuC5ztqt2
	z0MIk98Z/JAnY/IgzUogCNeyFVlPeRc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-32CXKvvsP7OKdn_3Vs2QiA-1; Mon,
 17 Mar 2025 04:36:36 -0400
X-MC-Unique: 32CXKvvsP7OKdn_3Vs2QiA-1
X-Mimecast-MFC-AGG-ID: 32CXKvvsP7OKdn_3Vs2QiA_1742200594
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF3961955DCD;
	Mon, 17 Mar 2025 08:36:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 420DF1955DCD;
	Mon, 17 Mar 2025 08:36:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250314160543.605055-1-arnd@kernel.org>
References: <20250314160543.605055-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: dhowells@redhat.com, Boris Brezillon <bbrezillon@kernel.org>,
    Arnaud Ebalard <arno@natisbad.org>,
    Srujana Challa <schalla@marvell.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E.
 Hallyn" <serge@hallyn.com>,
    "Justin M. Forbes" <jforbes@fedoraproject.org>,
    "Jason A. Donenfeld" <Jason@zx2c4.com>,
    Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    James Bottomley <James.Bottomley@HansenPartnership.com>,
    linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
    keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2106119.1742200585.1@warthog.procyon.org.uk>
Date: Mon, 17 Mar 2025 08:36:25 +0000
Message-ID: <2106120.1742200585@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Arnd Bergmann <arnd@kernel.org> wrote:

> -	depends on CRYPTO_LIB_CHACHA20POLY1305 = y
> +	select CRYPTO_LIB_CHACHA20POLY1305

Doesn't that allow CRYPTO_LIB_CHACHA20POLY1305=m?

David


