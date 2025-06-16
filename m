Return-Path: <keyrings+bounces-2841-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4FDADB2EF
	for <lists+keyrings@lfdr.de>; Mon, 16 Jun 2025 16:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6874D3A7D72
	for <lists+keyrings@lfdr.de>; Mon, 16 Jun 2025 14:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F19155757;
	Mon, 16 Jun 2025 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pfi9SNo7"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B81519AC
	for <keyrings@vger.kernel.org>; Mon, 16 Jun 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082565; cv=none; b=Vyk3eI4lsJ++mjRZHwoKrmuboEdSTpuezKC1RTb6I5bfL/nK9KScPS+A/ukTuhvuQXGORf1bq1L/wFCqzqFxvP4IzYBr+DAmLEXqRvzv6s+REQFtPjC4im7vCRIk8yJTfbrY+62IBFhzOt0oY4hSIK8ZIfIaQ2jUgKtc4Q21OtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082565; c=relaxed/simple;
	bh=d0ARDgvB9SsiJbkPZbgooQRX1EUc9fd8sBsLDXLnLXk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhWDo6IAJgYQ6TpST9KgMHSTv8gO5GwhvsgnWy0rKUVg4ikIFABXJ7lwqrA/9JA1iw1b18QZVtfsKHRfy1KRKwdhRGOh4PAzf7RxvG377BFWhMV8RxQcKZh7PJZb13jD4I8vitns8a+PK+OzaBKGeSzI6ZxPJSTmEZv+p3ssRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pfi9SNo7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0ARDgvB9SsiJbkPZbgooQRX1EUc9fd8sBsLDXLnLXk=;
	b=Pfi9SNo7Igw4OBRYPFIGJMRZ//5jNQjjYpSDiCnLDwzTpb8LFvcrHLq3Ku6i6mhlJ0ibnU
	9btEFdojKi5Q3ziE/iubNfAi79NHVxcRWZHFV5yGaeatzELzbh5jkp8Pj4oI01clhZAipb
	NQyMc1vXWp/t94mhytK5hiP44zzRNKg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-T0YZ-vNhM4OQ7_zj70Cmjw-1; Mon, 16 Jun 2025 10:02:41 -0400
X-MC-Unique: T0YZ-vNhM4OQ7_zj70Cmjw-1
X-Mimecast-MFC-AGG-ID: T0YZ-vNhM4OQ7_zj70Cmjw_1750082561
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb1f84a448so43257816d6.0
        for <keyrings@vger.kernel.org>; Mon, 16 Jun 2025 07:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082561; x=1750687361;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0ARDgvB9SsiJbkPZbgooQRX1EUc9fd8sBsLDXLnLXk=;
        b=CcuvX2S43tRVpL7DxYVzkXWouAYRy/Tekr5hsd3XW96T8f/1/sOBpgkrbJF1OOw/gn
         yHnKAoVdIYVqNzL69v3v2mXBSg1BpydM/yFj6lNArwt7vyw0FKImbCB9Bfr9i1IDCJR+
         utrlyIrnLmrVb+9pk9PQ05hxNWJtRMJMApjvix7NxMnOMBWViyxkEVJ/NrFZ0Yb8WdZB
         38kwSQi8X9ToCte3qTp0BKWsjIfDefMz1B9HnSBHWRYRhmjJJNpL7idz3dB/dTsC6yoV
         3AGrrIw6LZZAepTubzq/BAZmgnan9sOQd9X7RnbIDVhoc/tom1ETnX+Njghp+0b2HNGo
         OlCw==
X-Forwarded-Encrypted: i=1; AJvYcCVT77kryZHO55PkVl2kT5ke0ktRED7jzGzNse0OGoyptQowMUz6Qqi1m46GurGjAQkffeD31oEfLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5u7L4ZIX4sEt2IebOl7ugR6zF0bhDAimbGsVjWEWnyMHggI4I
	ZGE1z4i8wcn27Hby1q5sAcYHUPypZgQ2VmBPKp+59Dgpq17dJ2YoQ2Ax2gcoEGLZ6BTfqTQl9S4
	PrmKmWibK8OE9hvLRzn3l0fUcxpWd65Co55maZyAdKXBqY4gtZ00rhfNWyO8i
X-Gm-Gg: ASbGncuPTa+5gwA0PORVFMm2osAUkBX1MnAfZHG9uTUxbAx0JZh5y+8y1makfs9/dmh
	2nGlEcOTorsh0KsfWBOc94arYC5m4hawzGiaccxPteJXRVOPKvFrZUPeBfyn8Iic0TTzHN4LncN
	kto3HGNNah6kRa0+PqjjaTopAygsjKsk5WIVs80kipPQsqqxdFP2qkdlIbaej4yNQ+wDHSqaA69
	aJYKB2wMrLfTmjC8rNZ4je6xZOp7xd3binixn+QPCaccIfsln5C9uPHjDbVj3I1U+3TTa/4h4oM
	PkxFuR6h/VLt4YIL
X-Received: by 2002:a05:6214:5707:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb47725e9emr140484826d6.12.1750082560759;
        Mon, 16 Jun 2025 07:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBcR/KFEr6tqTnCHltQ+VrJiT6moThRhF0UozL35I/ow0X/uSWOEQ9XgxjQtT6GjShaQTWUA==
X-Received: by 2002:a05:6214:5707:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb47725e9emr140484276d6.12.1750082560204;
        Mon, 16 Jun 2025 07:02:40 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::baf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb525553c3sm16042316d6.104.2025.06.16.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:02:39 -0700 (PDT)
Message-ID: <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
From: Simo Sorce <simo@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Ignat Korchagin
	 <ignat@cloudflare.com>, David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller
	 <smueller@chronox.de>, torvalds@linux-foundation.org, Paul Moore
	 <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>, Clemens Lang
	 <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>, Roberto Sassu
	 <roberto.sassu@huawei.com>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 16 Jun 2025 10:02:38 -0400
In-Reply-To: <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
References: <501216.1749826470@warthog.procyon.org.uk>
		 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
		 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
	 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-13 at 13:50 -0400, James Bottomley wrote:
> I agree it's coming, but there's currently no date for post quantum
> requirement in FIPS, which is the main driver for this.

The driver is the CNSA 2.0 document which has precise deadlines, not
FIPS. That said ML-KEM and ML-DSA can already be validated, so FIPS is
also covered.

> Current estimates say Shor's algorithm in "reasonable[1]" time requires
> around a million qubits to break RSA2048, so we're still several orders
> of magnitude off that.

Note that you are citing sources that identify needed physical qbits
for error correction, but what IBM publishes is a roadmap for *error
corrected* logical qbits. If they can pull that off that computer will
already be way too uncomfortably close (you need 2n+3 error corrected
logical qbits to break RSA).

> Grover's only requires just over 2,000 (which
> is why NIST is worried about that first).

Grover can at most half the search space, so it is not really a
concern, even with the smallest key sizes the search space is still
2^64 ... so it makes little sense to spend a lot of engineering time to
find all places where doubling key size break things and then do a
micro-migration to that. It is better to focus the scarce resources on
the long term.

>=20
> Regards,
>=20
> James
>=20
> [1] you can change this by a couple of orders of magnitude depending on
> how long you're willing to wait

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc


