Return-Path: <keyrings+bounces-3040-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E3B8B1BD
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 21:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A735C1C80151
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 19:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F697266581;
	Fri, 19 Sep 2025 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZLDckmQ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F792C0265
	for <keyrings@vger.kernel.org>; Fri, 19 Sep 2025 19:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311297; cv=none; b=EJ5GAB42Bc+P6AA56LQRHvG5UmI/vGgCti5yJJ5HIEjkzsJrwHS8Gq2Ojsrv1b0BXGeOUYiblv8fSSMZVwJFpdf7KNgCNietGGJXfn6Zit7F1cLv54drOXCtXaNfwMl/JooCL5xCj9Da6UIdyibWeQaRY1e5MNXMyv54feNywRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311297; c=relaxed/simple;
	bh=Pom4Xkuz0DMB6rEXtZgW664Gj1jAMgDbNtRAXnfftjI=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Wgy5Ad/FqBVX9kn4TXKxxxVMFWNkWbE88Bz4RDqXF0oBqOCv7/etATKu/KK7dFRzdj7lcbJ+7WpyW4Dk/dQC/BCvvEXTGY8EGC0ywnGh3I5YxJ3+lGboRdUZhEfn1cS4MqJYm72OlB4ee2/x/PlZbJz6EP3rez1Y0rKLg598J1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZLDckmQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758311293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uoSOzIhr2wXKZ8q5IASaBEFOM22Jo0iIMuiQyH21SbA=;
	b=fZLDckmQpJuLCJGLIftvx03rfw497KW3Km89ffKv4EvNzGM/t5UwF0e29MQvB/tdyKDltG
	897uneqmKlGhfbi/GVg+xOe0MAuZ2nWPl/GX/282iOF+1GL0NEvZTTnYEmvgHLLDlwv3yr
	jkdSMW9AUcfNVPdxx/BuJSTPMg9kyrE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-zmfuKSxIMGu4F1VD7FrHwA-1; Fri,
 19 Sep 2025 15:48:07 -0400
X-MC-Unique: zmfuKSxIMGu4F1VD7FrHwA-1
X-Mimecast-MFC-AGG-ID: zmfuKSxIMGu4F1VD7FrHwA_1758311286
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCC701956089;
	Fri, 19 Sep 2025 19:48:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A63A1800446;
	Fri, 19 Sep 2025 19:48:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250919190413.GA2249@quark>
References: <20250919190413.GA2249@quark> <3936580.1758299519@warthog.procyon.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Harald Freudenberger <freude@linux.ibm.com>,
    Holger Dengler <dengler@linux.ibm.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
    linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
    keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128, SHAKE256
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3975734.1758311280.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Sep 2025 20:48:00 +0100
Message-ID: <3975735.1758311280@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Eric Biggers <ebiggers@kernel.org> wrote:

> This should be based on libcrypto-next.

This?

https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcryp=
to-next

> This should be split into three patches: (1) the arch/s390/ changes, (2)
> adding the library functions themselves, and (3) adding the tests.

Sure.  But I'll wait a bit to see if there are any other comments first.

> We'll also need to integrate the existing arch-optimized SHA-3 code, and
> reimplement the SHA-3 crypto_shash algorithms on top of the library.
> Let me know whether you're planning to do that to.  If not, I can do it.

I don't really have time at the moment.  Nor am I particularly familiar wi=
th
the optimised asm instructions for this on any arch.

> In kerneldoc comments, please make it clear that lengths are measured in
> bytes,

Sure.  The hash algos do love talking in terms of bits.  Possibly because
bytes aren't necessarily 8 bits in size on all arches?

> and that the functions can be called in any context.

"Context" as in?

> The testing situation looks odd.  This patch adds six KUnit test suites:
> one for each of the SHA-3 algorithms.  But they only include the
> hash-test-template.h test cases, and they don't test the unique behavior
> of SHAKE.  The KUnit tests need to fully test the library.

Yes, I'm aware of that.  The hash-test-template template is rather rigid a=
nd
not always correct in its assertions (for instance requiring the final
function to have zeroed the context - I had to modify my API to work aroun=
d
the testsuite).

> I see you also have a test in sha3_mod_init(), which doesn't make sense.
> The tests should be in the KUnit test suite(s).  If you intended for the
> sha3_mod_init() test to be a FIPS pre-operational self-test, then (1) it
> would first need to be confirmed with the people doing FIPS
> certifications that a FIPS pre-operational self-test is actually
> necessary here, (2) it would need to be fixed to actually fulfill the
> requirements for that type of test such as panicing the kernel on
> failure, and (3) it would need to come in its own patch with its own
> explanation.  But, unless you are sure you actually need the FIPS test,
> just omit it out for now and focus on the real tests.

I disagree.  It should have at least a single self-test.  If we fail to lo=
ad
any modules because the hash is broken on a particular CPU, it would be us=
eful
to have a note in dmesg.  Loading kunit test modules becomes tricky in suc=
h a
case.

> I also think that splitting the SHA-3 tests into six KUnit test suites
> is awkward.  I know I did something similar for SHA-2, but it made more
> sense for SHA-2 because (1) there are only four SHA-2 variants, (2)
> SHA-256 and SHA-512 don't share any code, and (3) there wasn't anything
> more to add on top of hash-test-template.h.  In contrast, SHA-3 has six
> variants, which all share most of their code, and there will need to be
> SHA-3 specific tests (for the XOFs).

Yes, but I believe you wanted me to use hash-test-template.  The problem i=
s
that it hard-encodes by macroisation of the #include's file various parame=
ters
including the hash size.

> I think what I'd recommend is creating a single sha3_kunit test suite.
> Make it instantiate hash-test-template.h once to test one of the
> algorithms, maybe SHA3-256.  Then add test cases (that is, additional
> KUnit test cases in the same KUnit test suite) that cover the code
> specific to the other variants, including the XOFs.

I could do that.  It would at least exercise the common engine.

Possibly all 5 different block sizes employed (128, 224, 256, 384 and 512)
need to be so tested - but that only affects how much of the state array i=
s
modified directly sha3_update() and how much can be extracted from by
sha3_squeeze().  The actual keccak mixing function doesn't care.

Other than that, the only differences between the algorithms are the paddi=
ng
char and how much digest is extracted by default.

On top of that, you can have a variety of different usage sequences: diffe=
rent
sequences of updating and squeezing with different amounts of data added a=
nd
extracted.  I wonder if a small sampling is sufficient or whether we need =
some
loopy thing that tries to exhaustively test a portion of the sample space.

David


