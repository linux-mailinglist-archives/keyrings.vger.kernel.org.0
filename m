Return-Path: <keyrings+bounces-3747-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC6D02E44
	for <lists+keyrings@lfdr.de>; Thu, 08 Jan 2026 14:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A22316D687
	for <lists+keyrings@lfdr.de>; Thu,  8 Jan 2026 13:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1510468009;
	Thu,  8 Jan 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0vSrc+9"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF338B7D4
	for <keyrings@vger.kernel.org>; Thu,  8 Jan 2026 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877176; cv=none; b=puVkamu8aYPCW4Y5S7OTEryfPtX0SeWev0/t32EpzFBF/7+UxgwOcy3c1oU6OPH4R1V9J4+RVLDaT3wKvxaKIy5ZmdfVADqsAQvK8p3UTtd743Rml7BMqtW5TxNfbxB8odpM0rPL+nPezQJiZmzi3/a2AQ6ZYPDVobTksGIzdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877176; c=relaxed/simple;
	bh=18WWCjK5uRjL2olTa1iGNdhtGtcDRKsvvzJu8hPc9fM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=JQMzdrfOEnlEQyhraPE/4u8l1rgJcSODx6dU/WjYtJ3U7IzqlwQRSW+93DOSHO0K6Zf69bTab2ZyyIC/tfRDemHW5bU2KxDh3Uyb9osUzyDJL90phY2CwSH0jrWNGySqPflBsEPWNjJOTmlz7b2uypfAakNZ3HB6WgyIQ+UedoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0vSrc+9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767877173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6tQKj5VL5m7x4z2sWqdHCKJpBbowO2LzE5Mj6nNallc=;
	b=O0vSrc+947cgupU19YWDI6/uDyEucZsZXqhadKtZkazg9PJFIdvv02r7/oav4u4ZCN3NA4
	2WlqvAuUdm76680NdLVswXxAUNNG8EKcVrPDT5NJR2Ma/swk1xQmZQwgkMLYy/IEq7Sast
	gq4/FHnNV1W6eKJVFnQjPyS5Cxi7ByI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-F-tWggeSN9elGONc19tWrQ-1; Thu,
 08 Jan 2026 07:59:29 -0500
X-MC-Unique: F-tWggeSN9elGONc19tWrQ-1
X-Mimecast-MFC-AGG-ID: F-tWggeSN9elGONc19tWrQ_1767877167
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F14F41954B0B;
	Thu,  8 Jan 2026 12:59:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1423B30002D8;
	Thu,  8 Jan 2026 12:59:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2366240.1767794004@warthog.procyon.org.uk>
References: <2366240.1767794004@warthog.procyon.org.uk> <CALrw=nFj9OEsREJ8Kxox3U6N8y=e00ZawxEkCPOb5-6_k=7+nQ@mail.gmail.com> <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-3-dhowells@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/8] pkcs7: Allow the signing algo to calculate the digest itself
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2727728.1767877161.1@warthog.procyon.org.uk>
Date: Thu, 08 Jan 2026 12:59:21 +0000
Message-ID: <2727729.1767877161@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

David Howells <dhowells@redhat.com> wrote:

> Also, we probably don't actually need to copy the authattrs, just retain a
> pointer into the source buffer and the length since we don't intend to keep
> the digest around beyond the verification procedure.  So I might be able to
> get away with just a flag saying I don't need to free it.

Actually, we probably do need to copy it.  The problem is that we have to
modify the tag on the authenticatedAttributes (PKCS#7)/signedAttrs (CMS) blob
before we digest it, e.g. in pkcs7_digest():

	memcpy(sig->digest, sinfo->authattrs, sinfo->authattrs_len);
	((u8 *)sig->digest)[0] = ASN1_CONS_BIT | ASN1_SET;

as specified in RFC9882 and other places:

	3.2.  Signature Generation and Verification
	...
	When signed attributes are included, ML-DSA (pure mode) signatures are
	computed over the complete DER encoding of the SignedAttrs value
	contained in the SignerInfo's signedAttrs field.  As described in
	Section 5.4 of [RFC5652], this encoding includes the tag and length
	octets, but an EXPLICIT SET OF tag is used rather than the IMPLICIT
	[0] tag that appears in the final message. ...

We might be able to get away with modifying it in place - but I don't know
that that's true for all users.

David


