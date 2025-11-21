Return-Path: <keyrings+bounces-3417-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E6C7BC57
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 22:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4CDF4E81AA
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 21:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7B73043D5;
	Fri, 21 Nov 2025 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aPFy/2NA"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167D280A20
	for <keyrings@vger.kernel.org>; Fri, 21 Nov 2025 21:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761187; cv=none; b=Z/m4alDLALM1jMbSAJ4cT47MU/gDhZ7kwmEOqyN8XYaW6XDDtSmAX7DtAuhYydV+GE3CVDu1YkEJl9/ntJHzXoJpG1BTjLjg3fBH1GRypYw6cxE7m5kTkBzoZDg7pGpbZeghuPVtggdyLup9tZ8o1K3QFvHP/OoP0TzB9N13+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761187; c=relaxed/simple;
	bh=d3AT3ddMoh1u+LDtdAxryVOKhRl/PETqnjQv6J8dCsw=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=S4Q42gAThuJb3J5Ugtkki9Smecl+0yWWSjEy0ci1dnfOUMIbTUZ3s0QrgO3v4qHs6tjZEbFWtPIfsIPF87aCyYtN2wEvd5vhkrIrreJ2SKR7mb1NuDv6HrdIc2zs9DB8AubegeF4D1fVvrJ5yRTKTDBCIBhCzJ7LekpWDBlRJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aPFy/2NA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763761184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KsegSUWlISFxZQIy32vo3FpaD/D5ERkTWDl0/e5Zy8Q=;
	b=aPFy/2NAnBZm3gZpfx4XOp2xX0QPcbysiXJeag08zOLkoEyp4DWIRI0AEkQzGFLlBJxhHL
	nWwb4ImJ1U9Yw3U8qpmRyWLgVJkynNclSFtzh9+GHzMazn+ttGjoce85RCmBXocnofLOJX
	XtPG92akIDZPwflVjPYe9NB0S+TMfwc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-bucdvOSxO26gfGqjppemeA-1; Fri,
 21 Nov 2025 16:39:39 -0500
X-MC-Unique: bucdvOSxO26gfGqjppemeA-1
X-Mimecast-MFC-AGG-ID: bucdvOSxO26gfGqjppemeA_1763761177
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2BFC180047F;
	Fri, 21 Nov 2025 21:39:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7BC951940E82;
	Fri, 21 Nov 2025 21:39:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251121005017.GD3532564@google.com>
References: <20251121005017.GD3532564@google.com> <20251120003653.335863-2-ebiggers@kernel.org> <20251120003653.335863-1-ebiggers@kernel.org> <2624664.1763646918@warthog.procyon.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3067068.1763761171.1@warthog.procyon.org.uk>
Date: Fri, 21 Nov 2025 21:39:31 +0000
Message-ID: <3067069.1763761171@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Eric Biggers <ebiggers@kernel.org> wrote:

> > > +	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) != 0)
> > > +		return -EBADMSG;
> > 
> > Actually, this should return -EKEYREJECTED, not -EBADMSG.
> 
> Who/what decided that?

I did.  When I added RSA support in 2012 for module signing.  Note that it
was originally added as part of crypto/asymmetric_keys/ and was not covered by
a crypto API.  The RSA code has since been moved to crypto/ and is now
accessed through the crypto API, but it has retained this error code and this
is also used by other public key algos.

> A lot of the crypto code uses -EBADMSG already.
> crypto_aead uses it, for example.

ecdsa.c:60:	return -EKEYREJECTED;
ecrdsa.c:111:		return -EKEYREJECTED;
ecrdsa.c:139:		return -EKEYREJECTED;
ecrdsa.c:239:		return -EKEYREJECTED;
rsassa-pkcs1.c:293:		return -EKEYREJECTED;
rsassa-pkcs1.c:295:		return -EKEYREJECTED;

David


