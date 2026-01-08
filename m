Return-Path: <keyrings+bounces-3744-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2302AD03DDE
	for <lists+keyrings@lfdr.de>; Thu, 08 Jan 2026 16:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 669D6302741D
	for <lists+keyrings@lfdr.de>; Thu,  8 Jan 2026 15:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FA13A89D7;
	Thu,  8 Jan 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GuSsvJqi"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DF73A962D
	for <keyrings@vger.kernel.org>; Thu,  8 Jan 2026 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871787; cv=none; b=fGTQAA2+AecbPwLuA9apkKRM3BqV1txv9PpdVBYy2rCoOH1wjLEg7kIsEjSWD2s1opizP0I1cDN2OVYP3/b0gcvTrz/6YGerbu7ppW6PtQQIehIvCf3keDlJC6eiQRUvJ2TUxjr5NXHUmMF9UzOU7VVcjNnAYjSEtaxgpRZjkS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871787; c=relaxed/simple;
	bh=DgkWQnj485Cdlj0s6OaAmvJGF615eW9UFZIJZgLGdOs=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=APljF7IGTPKcLG71A44yVT/ZN+tVar3DrGXIvWQidi/amo67YFCFVIGilGzJw46RbVhKBAXv9OaUQ+Q0MhtZOvUxJm2DyXYJLxUG7N+3ylNzIrCjdsQqT7pFAzOAnkBm/PhESnAzBNZyuD1ga1qwnlOW5oQnGG1n4UbI66jBa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GuSsvJqi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767871783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BY4QFtk8w05Z2iDasTM1yxyFxo3qpga8FzQxbaR04dE=;
	b=GuSsvJqicLh+YKN4HYkPhg6PeGPYgppc0lIh/oL/8gmEc2NxT1ttTdCciUQr/028lyikBa
	rE00fQGdcS7d34I6/7npYIsRXfVxw06GDIwzakUf24xafNL2JmZlKJrYyLNNfr48wN4Qa1
	tnVv/2rTACBB++adYFKXgnzR26LFRnY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-0DGUIbRDOL2xf5vLaO_vQg-1; Thu,
 08 Jan 2026 06:29:39 -0500
X-MC-Unique: 0DGUIbRDOL2xf5vLaO_vQg-1
X-Mimecast-MFC-AGG-ID: 0DGUIbRDOL2xf5vLaO_vQg_1767871777
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FF5318005B6;
	Thu,  8 Jan 2026 11:29:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7598430002D1;
	Thu,  8 Jan 2026 11:29:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALrw=nHhs61yqkLkK9F4UGU_ujnniMzrkbhjRDc+Aa69XTFTvg@mail.gmail.com>
References: <CALrw=nHhs61yqkLkK9F4UGU_ujnniMzrkbhjRDc+Aa69XTFTvg@mail.gmail.com> <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-7-dhowells@redhat.com>
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
    linux-kernel@vger.kernel.org,
    Tadeusz Struk <tadeusz.struk@intel.com>,
    "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v11 6/8] crypto: Add RSASSA-PSS support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2708429.1767871770.1@warthog.procyon.org.uk>
Date: Thu, 08 Jan 2026 11:29:30 +0000
Message-ID: <2708430.1767871770@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Ignat Korchagin <ignat@cloudflare.com> wrote:

> A lot of pointers and arithmetic here. Wouldn't it be easier to do
> something like in [1]?

Fair point.

> > +DEFINE_FREE(crypto_free_shash, struct crypto_shash*,
> > +           if (!IS_ERR_OR_NULL(_T)) { crypto_free_shash(_T); });
> 
> Is this useful enough to go into some commonly used header for shash?

Maybe - I guess there's no actual cost to doing so as it generates an inline
function.

> > +       struct crypto_shash *hash_tfm __free(crypto_free_shash) = NULL;
> > +       struct shash_desc *Hash __free(kfree) = NULL;
> 
> So even though x509/pkcs7 code now has a counterexample (partially due
> to my fault) seems the consensus [2] is to declare and initialise the
> variable with the __free attribute at the same time meaning it is OK
> to declare the variables later and not follow the "declaration at the
> top" rule.

Ok, I'll move the decls.

David


