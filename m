Return-Path: <keyrings+bounces-2612-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB5A862C3
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 18:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1FC7ABE8E
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 15:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E532220683;
	Fri, 11 Apr 2025 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAfL9Itd"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF043221FAC
	for <keyrings@vger.kernel.org>; Fri, 11 Apr 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387171; cv=none; b=cR6FcHbpCRMDMbL+QBuU5s1Bzu9P3AQ9gvOblrmxpUrKMH+wWlHIWILWZlWwQTlsawJPncxOVC4Thi4o+rT+DHAtwsH2SMSWMZMXkMU/Pltv5y9odkuk1tBylnZ4gWjZkTjl3rgPn+YMR21IiLs78ymW7dzSRK/BQOgNY2TBDbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387171; c=relaxed/simple;
	bh=fZlIPKzYCfS3JWZkzUhx6xvi3UjrSnLayoxpbPfvozY=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=plbF4ycXZG9XmOgwwW7L9NFtZM4tFloWK1msCXigLMYK/oxGZGhfS8hr89Xmdqiv2tW9yOVaVXbjt1MKb7eMfnrTlvB+5GE383fN/ksqT53qK9ijYxv+V9f1zrVLIl5YWBhWH/OlTOq41hnqCy07j94XY5XcMv5biilZ8ktgP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAfL9Itd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744387168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1YGwsbANdm5+UipwPPrI05eTBmxw+TZxLni/YQ7Hx4Q=;
	b=gAfL9Itd+sYQsLVZLz6rR2vsOPpTWBbUPpDFa5y0Yna2AkbPJ9IIt8VaoQ/pJlh9X/3pPb
	Pv/jGrvbTwT+dXRiI1UpaJGf9w2puQ5Eh4k2QGlHUU4m5nakSRwxkqSUJJWn1DxsctU+br
	IqWn5zro9sWtq6rRCqZ1ixooTqyTJs4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-1LNp5UCTODWVVEnUWP054A-1; Fri,
 11 Apr 2025 11:59:23 -0400
X-MC-Unique: 1LNp5UCTODWVVEnUWP054A-1
X-Mimecast-MFC-AGG-ID: 1LNp5UCTODWVVEnUWP054A_1744387160
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 743D21801A00;
	Fri, 11 Apr 2025 15:59:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 62EF11808882;
	Fri, 11 Apr 2025 15:59:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250407125801.40194-1-jarkko@kernel.org>
References: <20250407125801.40194-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
    stable@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E.
 Hallyn" <serge@hallyn.com>,
    James Bottomley <James.Bottomley@HansenPartnership.com>,
    Mimi Zohar <zohar@linux.ibm.com>, linux-crypto@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
    linux-security-module@vger.kernel.org
Subject: Re: [PATCH v8] KEYS: Add a list for unreferenced keys
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2426185.1744387151.1@warthog.procyon.org.uk>
Date: Fri, 11 Apr 2025 16:59:11 +0100
Message-ID: <2426186.1744387151@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> +	spin_lock_irqsave(&key_graveyard_lock, flags);
> +	list_splice_init(&key_graveyard, &graveyard);
> +	spin_unlock_irqrestore(&key_graveyard_lock, flags);

I would wrap this bit in a check to see if key_graveyard is empty so that we
can avoid disabling irqs and taking the lock if the graveyard is empty.

> +		if (!refcount_inc_not_zero(&key->usage)) {

Sorry, but eww.  You're going to wangle the refcount twice on every key on the
system every time the gc does a pass.  Further, in some cases inc_not_zero is
not the fastest op in the world.

> +			spin_lock_irqsave(&key_graveyard_lock, flags);
> +			list_add_tail(&key->graveyard_link, &key_graveyard);
> +			spin_unlock_irqrestore(&key_graveyard_lock, flags);
>  			schedule_work(&key_gc_work);

This is going to enable and disable interrupts twice and that can be
expensive, depending on the arch.  I wonder if it would be better to do:

			local_irq_save(flags);
			spin_lock(&key_graveyard_lock);
			list_add_tail(&key->graveyard_link, &key_graveyard);
			spin_unlock(&key_graveyard_lock);
			schedule_work(&key_gc_work);
			local_irq_restore(flags);

David


