Return-Path: <keyrings+bounces-1417-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E34388CD4D4
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2024 15:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0E41C20E54
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2024 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3080A14A4F7;
	Thu, 23 May 2024 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ih0EWF7D"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B726C14A4F0
	for <keyrings@vger.kernel.org>; Thu, 23 May 2024 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716471402; cv=none; b=PW1mDklnLQ/7lw05ijj0pzjDf8szL6JdvqqjZRrUQEEg/i6Pm4Qf7hPUdKCzlGeUfJ6Waagq39Om08flrKZIBsRovP+wAcqSvX1Vd+dJ4doMPmxusYM+hpmYrFSWLRnvJBlcRQ9vtYSD0RZ4bNZOE6n24MOLRyT14zKz6F2M6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716471402; c=relaxed/simple;
	bh=CM8wHWsQhb6nBkI5sT6VghNmVLSsK1SRVpym/X9/WnE=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ZGijtwVYbVLAb/6VxeZUrUwrcu2VkCO4XimEdQoYND+Yxa/Zil9kxKDb0dcDLeHfObISGzLreQmOIWfEvp8A4U6ufSa3XPrXYXxhUBdwRBjYELpxMMPlza1fhFR+VWM1y3ELyAizkpxLXGwoT32gKGBHZcKgy7FTV88ITVnBdac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ih0EWF7D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716471399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXxBSHmoAMy4p5FvXFciFTuZOZzNT/zIajI6dPFeaA8=;
	b=ih0EWF7D+BEpLBwXJQKPHEQjR2mUbGoT+fJzR9Gy6K+X9N43RTVUN87KAhIvgJ4GrC5EkD
	Cyr66Beq7DG2LHnv0uY5pDYSbhc4GOp0YCGnTnTtt4iPa+KcftkhroGa54MiuQmWhtC+I3
	XTcZv3Q88QjBraAwJszbYKVvPRjEjoc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-9ybZC16bMV-pSc_RjrjyHA-1; Thu,
 23 May 2024 09:36:33 -0400
X-MC-Unique: 9ybZC16bMV-pSc_RjrjyHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D6903801EC7;
	Thu, 23 May 2024 13:36:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D52C51C0654B;
	Thu, 23 May 2024 13:36:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240523132341.32092-1-jarkko@kernel.org>
References: <20240523132341.32092-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, linux-integrity@vger.kernel.org,
    keyrings@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
    Eric Biggers <ebiggers@kernel.org>,
    James Bottomley <James.Bottomley@hansenpartnership.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Andrew Morton <akpm@linux-foundation.org>,
    Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
    James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    linux-crypto@vger.kernel.org (open list:CRYPTO
                         API),
    linux-kernel@vger.kernel.org (open list),
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM)
Subject: Re: [PATCH v2] KEYS: trusted: Use ASN.1 encoded OID
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <575952.1716471389.1@warthog.procyon.org.uk>
Date: Thu, 23 May 2024 14:36:29 +0100
Message-ID: <575953.1716471389@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> There's no reason to encode OID_TPMSealedData at run-time, as it never
> changes.
> 
> Replace it with the encoded version, which has exactly the same size:
> 
> 	67 81 05 0A 01 05
> 
> Include OBJECT IDENTIFIER (0x06) tag and length as the epilogue so that
> the OID can be simply copied to the blob.

This seems reasonable.  We have a limited set of OIDs we can generate
(currently 1).  Better to store the BER-encoded form and copy that in rather
than trying to turn a pretty-printed OID into the BER encoding unless we
absolutely have to.

David


