Return-Path: <keyrings+bounces-3011-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D81B5A0E4
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 21:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10EB6521A21
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 19:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433442F5A1C;
	Tue, 16 Sep 2025 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnwkIszY"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4B2DFA5B
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758049410; cv=none; b=SZVzYWF14YivDUaKtwBSTc9hS2gFkijMlpUc88YWBvSDUVRLl14ARvRZZMd1bAQWRpfMeaI5051H0MEgPKqo+00T66jW02Y+UoaYHZt1Q4cTJuzkcDhTIByMthK+KygzBViRDL5nmUuJw8yFMZE8xyA52jo9WRCH8Fq/hTfs860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758049410; c=relaxed/simple;
	bh=1VNTL957WIhvioTfh4/tsp4JP4WAxr+HVfO9vcJE9mU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s9BHaQM3yGRfneLGjBzcUZxptrXqejpRDMRtlFOMv4Ukj1EyewPukQJukYljU5I9XLV2Gx7IVvw5iKk0QVdo1Z5lIf8SNY7OZo0IRg3M0bTbn/biYucQGU6r1g0Vy04Fw5r/sy/sxeZkR810kKr4h5dyAwpSThheA7N7OytHa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnwkIszY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758049407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VNTL957WIhvioTfh4/tsp4JP4WAxr+HVfO9vcJE9mU=;
	b=SnwkIszYkCKw3E9bOkdzlXkyvV8Oy2TrAfU27ASUOklSYFu1JUK9pNHDbjsqpEhYW/XnCo
	uSQnm1EimVvX0IUquyG8Gvm0I8vlzRah7Lzayj4kr+sewDZnII55aezPOfqI4EuaRztb+F
	2SbDnDcxxFcc9Y2XLKv0EqvqRfjKUYQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-eAmCExB6NvimSEIyjSKsSA-1; Tue, 16 Sep 2025 15:03:25 -0400
X-MC-Unique: eAmCExB6NvimSEIyjSKsSA-1
X-Mimecast-MFC-AGG-ID: eAmCExB6NvimSEIyjSKsSA_1758049404
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5448916dd51so1909210e0c.2
        for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 12:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758049404; x=1758654204;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VNTL957WIhvioTfh4/tsp4JP4WAxr+HVfO9vcJE9mU=;
        b=vzSrlJF+FaKxrfPi2cnnATEtI2pgvKmKZmMM4XP81RbHtMUV2EtDDh4h1iHt4qhhM0
         J42BBcCw7pHLKxUu2R3vlPslI1GZRRtJeQE9rZ3IVfi/olD4k28PpFNBKjnzquHRbD5T
         1RixFJ8zgTTgXduIPgU9vC3cUJ+5kKMToD/oJRlNrLjprwDMQH0QwBGe736Rob80hhW0
         KxjnU1EmS832VP9bPvEGW9yJm7EZ5bK1wNt/JyUecMQe56VavtqWEGohObtKYSyD+2/A
         U5t0NbZ0pLvzflYd3pLCKAm48ofp+YRzsjEHh0qOmDD9uEJhO2T/v6gDLPeDSW3tH2qC
         w1PA==
X-Forwarded-Encrypted: i=1; AJvYcCU51KFEayapKAKU1kj2+ZQzn0WPY5rcn641yyMWjt+ZfbIshvTnOy7IO99h9pyBVr/u3AFZndTSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzxero0kDuzL9E5v/LnQ6H4uEZb3Z46bc88GJ7LyXJ87orVuTw
	EgEeDr5qi5MXJrSD5/jK1n3Ptz9oiu+2p/Yn+JM3DidpcHxVolg9q7rz3Q2TgqIdpyjLSfSKEl8
	fL5PAYTXpNyYRpVYRawN6laj5XcucLooMeu+A1t3ZuX53ln8fl2TZum8dYkWeTtAF/mWs
X-Gm-Gg: ASbGncusEeagfkB1co6Jqhfhq2iE7LJxPV+RreSZ2KoEIxk50o5l9zwNn00xwIXL+Ok
	g6EJRrt18klOWInH2rbM0GUDAmR7E+04iAwmN3Usg2ZUw+PZ6VNsRQtdsIk7aMzbrD7MAHpYMtL
	jAP2/0byOw920RrjViXZ/08r/OLr1ThAEYnjzKZWtcKOA9bARFFob5rUXRD88tqFRJgWktL5n+L
	q36amBmrXRsv/j5aZyOInN6XfSMHdhnom30kQItGKLhU95MGvn0oqPXWQDCdF1n4Nyvx7xR5XZp
	cliKju+I3OYvuqdFKnMsYuCZo90ZlgRjQg==
X-Received: by 2002:a05:6122:1acd:b0:549:f04a:6ea8 with SMTP id 71dfb90a1353d-54a16c8a782mr5005448e0c.9.1758049404614;
        Tue, 16 Sep 2025 12:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUJaABKCnPu+9dAC9ObU7pvuXaGco2cLR7bJnObkQ9soP+eCsQOzFxULb3IY0kBcrWcvAahg==
X-Received: by 2002:a05:6122:1acd:b0:549:f04a:6ea8 with SMTP id 71dfb90a1353d-54a16c8a782mr5005300e0c.9.1758049403460;
        Tue, 16 Sep 2025 12:03:23 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::318])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c8bb8d9esm1025710285a.3.2025.09.16.12.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 12:03:22 -0700 (PDT)
Message-ID: <70efab856f0940cba715572c417e0b249388da14.camel@redhat.com>
Subject: Re: [V1 0/4] User API for KPP
From: Simo Sorce <simo@redhat.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Ignat Korchagin
	 <ignat@cloudflare.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers
 <ebiggers@kernel.org>, 	linux-crypto@vger.kernel.org, "David S . Miller"
 <davem@davemloft.net>, 	keyrings@vger.kernel.org, David Howells
 <dhowells@redhat.com>, Lukas Wunner	 <lukas@wunner.de>
Date: Tue, 16 Sep 2025 15:03:22 -0400
In-Reply-To: <ca36a11e-ca2e-41ee-b0d3-f56586d50fd4@enneenne.com>
References: <20250915084039.2848952-1-giometti@enneenne.com>
	 <20250915145059.GC1993@quark>
	 <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
	 <aMjjPV21x2M_Joi1@gondor.apana.org.au>
	 <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
	 <CALrw=nEadhZVifwy-SrFdEcrjrBxufVpTr0BSnnCJOODioE1WA@mail.gmail.com>
	 <ef47b718-8c6b-4711-9062-cc8b6c7dc004@enneenne.com>
	 <CALrw=nGHDW=FZcVG94GuuX9AOBC-N5OC2aXiybfAro6E8VNzPQ@mail.gmail.com>
	 <ca36a11e-ca2e-41ee-b0d3-f56586d50fd4@enneenne.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-09-16 at 14:33 +0200, Rodolfo Giometti wrote:
> I understand your point; however, I believe that allowing the AF_ALG deve=
loper=20
> to use a generic data blob (of the appropriate size, of course) as a key =
is more=20
> versatile and allows for easier implementation of future extensions.

The only thing something like this allow is huge foot guns.

The current trend in cryptography circles is the exact opposite, ie
strong typing where keys are defined such that they can be used for a
single purpose even when the general mechanisms allows different
operations.

Ie even if an algorithm that allows both encryption and signing the key
is specified to be used only for one or the other operation with
metadata that accompanies they key itself at all times
so the cryptographic implementation can enforce the binding and fail
the un-permitted operation.

In general using random blobs as asymmetric keys is just not possible,
the size alone is no guarantee you have a valid key, so you would have
to spend significant amount of CPU cycles to validate that the blob is
a valid key for the given algorithm, rendering any HW acceleration
effectively pointless by the time you cross all the layers, context
switch back and forth from the kernel, validate the blobs and all.

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc


