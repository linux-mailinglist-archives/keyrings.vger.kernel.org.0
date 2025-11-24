Return-Path: <keyrings+bounces-3434-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D0C826F6
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 21:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBF154E3262
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 20:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8792D2E2840;
	Mon, 24 Nov 2025 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPWYbuJ/"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1A2D5950
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764017042; cv=none; b=FkXJhIYBGdk/5Q0Mgoig89V/aM4NJxmgk50Y8ucEkdejMjibH8+G9ItGeVidwYq/fS1uWIwvTVeu8pusTME6YR+x+5hkyue00fJ4ggq2RnFyd74YqajMkFY2oNEWp0xixU97Hig4mOxyn/8uuWbf5FRTHxT5QP0bDd8DlvkxZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764017042; c=relaxed/simple;
	bh=RJ34FRF7FGg3+vVFmOGcJ+CKhErRprR4490B7OJanzw=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=lFCU9KpQojaLYO704Ujbmzsdj33tbxjHtEX0xrffBWXZPxBL6f3b/mTkB/PNGQcN4ikhOeYOfGuqwPN/PBnerL4h1q1MyokQgpD61yVd7ui/XLJQWbZqw41UDhFfRiBydPO8aRU7qNdUSIHwKfUUUkK7FClZGktb2aDDt/uQjzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPWYbuJ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764017039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EHke2mMBf9LSOWdNXkDmM7fIXvTthmtv6HRZAznbTZQ=;
	b=GPWYbuJ/C3LUGX84lMIeC3nIMieuG6aBAcbWnFO0FmVNnD2MyfKEm89TtQv3ynttPlC5TL
	ZpQAWg9ucPUZBuodUM3PWYQfPtEhgRtZ/C3FYXWoZYcANh31ZbmyX4MKVCqTiHNbair9fy
	QaYXu4Dv6EWfxmr9BZ3wu55I2BTQcjg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-GciO3M7hPaqBcqmZ9l-ZvA-1; Mon,
 24 Nov 2025 15:43:56 -0500
X-MC-Unique: GciO3M7hPaqBcqmZ9l-ZvA-1
X-Mimecast-MFC-AGG-ID: GciO3M7hPaqBcqmZ9l-ZvA_1764017034
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0ECD01800343;
	Mon, 24 Nov 2025 20:43:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52BCD1800451;
	Mon, 24 Nov 2025 20:43:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251124202702.GA43598@google.com>
References: <20251124202702.GA43598@google.com> <20251120104439.2620205-6-dhowells@redhat.com> <20251120104439.2620205-1-dhowells@redhat.com> <3374841.1763975577@warthog.procyon.org.uk> <20251124164914.GA6186@sol> <3647621.1764005088@warthog.procyon.org.uk> <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com> <3649785.1764014053@warthog.procyon.org.uk> <CAHmME9oK-e2BOXspf89McOFOiq8wp2-QgHsumK6r9kL5FyeMig@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3651798.1764017029.1@warthog.procyon.org.uk>
Date: Mon, 24 Nov 2025 20:43:49 +0000
Message-ID: <3651799.1764017029@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Eric Biggers <ebiggers@kernel.org> wrote:

> It should also become the recommended algorithm anyway, right?

It's used for more than just module signing.  IMA, for example.

David


