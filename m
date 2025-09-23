Return-Path: <keyrings+bounces-3080-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B3B96D58
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 18:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4EAE7A1A8D
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628BA327A0A;
	Tue, 23 Sep 2025 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NpXj9/wa"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FE18A956
	for <keyrings@vger.kernel.org>; Tue, 23 Sep 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645093; cv=none; b=Y5+tCztbacOIGuaCPaMqbdRfkgQT3y+kPzk+YxLs15djSXjlyZs3ocD9zUta+EWXwtIOtsGZt/W8YTNYFVZ715sTXjLycgi2WbuwwuXX5j4OeJ6dBH/DlvTzFfhHpfa2mvgNR94Kg5azR4SfJrFX1tkt+b/JyMd1DV3YV9Ya8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645093; c=relaxed/simple;
	bh=8gpgB9krcgBlyteR9tCAHO5d8oJyWBI/UU/Aw1H8BR0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=iLnsLbO1ttGCSLMgcJdmUnn+SiejxwcZxHcWdgcD+ZTyjT0RBao1Z6g2V4iWFA3yDDfX0MqYeqPrzgnylG4QDGIP6DSrBF3q9rTYbB07A1qeiAHK3vieJNaaCvhF/Gwh+bFe+PJsDXvf7+Tdd7qzO+fBuNXjMvfhEvSCpCQoDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NpXj9/wa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758645090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwlmPK3UG+oIIpSf2yvcGnvIBVSerhRFYtDaAohmy7U=;
	b=NpXj9/wapIFuM2R//5QfG9H/az3r0XceUb/tJeGzNiodrXwcQyitdtelIOr1dCKXe+CznN
	QfFJ0Kb8PaknG7Kge4EzFMrfkk2PS4Lztp8skVuPGu0QQXkHrnCOBCE3vUfO9ihp0zPRMt
	UVtp48onylm8jXqye+jP4zPyieGLoiA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-dr9SHAYUNr6hjxgHNREwig-1; Tue,
 23 Sep 2025 12:31:25 -0400
X-MC-Unique: dr9SHAYUNr6hjxgHNREwig-1
X-Mimecast-MFC-AGG-ID: dr9SHAYUNr6hjxgHNREwig_1758645083
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 092EF1956089;
	Tue, 23 Sep 2025 16:31:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88A7A180044F;
	Tue, 23 Sep 2025 16:31:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <529581.1758644752@warthog.procyon.org.uk>
References: <529581.1758644752@warthog.procyon.org.uk> <20250923153228.GA1570@sol> <20250921192757.GB22468@sol> <3936580.1758299519@warthog.procyon.org.uk> <506171.1758637355@warthog.procyon.org.uk>
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
Content-ID: <530339.1758645078.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Sep 2025 17:31:18 +0100
Message-ID: <530340.1758645078@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

David Howells <dhowells@redhat.com> wrote:

> Eric Biggers <ebiggers@kernel.org> wrote:
> =

> > > I assume that pertains to the comment about inlining in some way.  T=
his
> > > is as is in sha3_generic.c.  I can move it into the round function i=
f
> > > you like, but can you tell me what the effect will be?
> > =

> > The effect will be that the code will align more closely with how the
> > algorithm is described in the SHA-3 spec and other publications.
> =

> I meant on the code produced and the stack consumed.  It may align with =
other
> code, but if it runs off of the end of the stack then alignment is irrel=
evant.

See commit 4767b9ad7d762876a5865a06465e13e139a01b6b

"crypto: sha3-generic - deal with oversize stack frames"

For some reason (maybe Ard can comment on it), he left the Iota function o=
ut
of the keccakf_round() function.

David


