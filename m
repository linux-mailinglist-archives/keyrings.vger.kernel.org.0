Return-Path: <keyrings+bounces-3737-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89705CFE1F9
	for <lists+keyrings@lfdr.de>; Wed, 07 Jan 2026 15:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7F2730039C3
	for <lists+keyrings@lfdr.de>; Wed,  7 Jan 2026 14:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C034D330640;
	Wed,  7 Jan 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dev1HGF6"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6332E125
	for <keyrings@vger.kernel.org>; Wed,  7 Jan 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794018; cv=none; b=PoK3hyKJmoVGeQX7WyUI7X1njpWp5Ps9tnckeG1afgtsinqkqd59Z6imoF1I7Vc0kNl7JkgcC9s9U6CWFni0USC9NeqdJMevvRVx0zo9G1/5vcL7Uc5bvbbs6/eyHOZeBpzrJT23V9KG/u/6cq4JsvUXCbo15OQSKpUC+To4Nns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794018; c=relaxed/simple;
	bh=Saoed4Dc0jee0b/UVY9YgHw7inzzEj3jNE7uJVi9Qqc=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Fs5378MIuE50IvMzllcnEaDjHptEIJtO4YoBKSCFX7H0aC+qrh/omHRHWWcRIFp4RNoK2OLWJaq77yfPQ4DwyXG3HLrzPKuMP3FTZ/rbWlbnQlcHTnDBl13VhMW+ThvDzfN+VWp4gqkqG8oenqCWYNl6WRSdAhI4bTofKraMHCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dev1HGF6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767794015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vrzn+Ssn7p217lIFP+Z2b99FMmHrz8aKK4bxB98oF7g=;
	b=dev1HGF6q0Gf6k7TXH+GIwAT65Mnk4KjSRy1U60ERQ9HlWvuJaqoGhP3w2bQa7/8pksHAn
	KEJElqq3i8V2cMxMB08U1Zw74wqENvM0ZR0lxOAakYqJr/QEQufjQycPF3TxtHxw9KcdyO
	4qrQQ07AYDpTYkyC8H2u7aYUqXnobC4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-8Lk2NEKkMymD6xf9Lhi8pA-1; Wed,
 07 Jan 2026 08:53:32 -0500
X-MC-Unique: 8Lk2NEKkMymD6xf9Lhi8pA-1
X-Mimecast-MFC-AGG-ID: 8Lk2NEKkMymD6xf9Lhi8pA_1767794010
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89EEB18002C2;
	Wed,  7 Jan 2026 13:53:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43EF818004D8;
	Wed,  7 Jan 2026 13:53:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALrw=nFj9OEsREJ8Kxox3U6N8y=e00ZawxEkCPOb5-6_k=7+nQ@mail.gmail.com>
References: <CALrw=nFj9OEsREJ8Kxox3U6N8y=e00ZawxEkCPOb5-6_k=7+nQ@mail.gmail.com> <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-3-dhowells@redhat.com>
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
Content-ID: <2366239.1767794004.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jan 2026 13:53:24 +0000
Message-ID: <2366240.1767794004@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Ignat Korchagin <ignat@cloudflare.com> wrote:

> > +                       ret =3D -ENOMEM;
> > +                       sig->digest =3D kmalloc(umax(sinfo->authattrs_=
len, sig->digest_size),
> > +                                             GFP_KERNEL);
> =

> Can we refactor this so we allocate the right size from the start.

The problem is that we don't know the right size until we've tried parsing=
 it.

> Alternatively, should we just unconditionally use this approach
> "overallocating" some times?

In some ways, what I'd rather do is push the hash calculation down into th=
e
crypto/ layer for all public key algos.

Also, we probably don't actually need to copy the authattrs, just retain a
pointer into the source buffer and the length since we don't intend to kee=
p
the digest around beyond the verification procedure.  So I might be able t=
o
get away with just a flag saying I don't need to free it.

However, there's an intermediate hash if there are authattrs, so I will ne=
ed
to store that somewhere - though that could be allocated on demand.

David


