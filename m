Return-Path: <keyrings+bounces-3750-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C830AD0369C
	for <lists+keyrings@lfdr.de>; Thu, 08 Jan 2026 15:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB0373016BB7
	for <lists+keyrings@lfdr.de>; Thu,  8 Jan 2026 14:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EF83E8C7F;
	Thu,  8 Jan 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CpfYEq1L"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3E3E8C7D
	for <keyrings@vger.kernel.org>; Thu,  8 Jan 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883116; cv=none; b=alshOeBv4SWsyEsni+EVUQIEP66zLZ0SKuwUXDbymNtyKJVBhvXJrKJMNEfvBxAxKRTUJnjva0cMNBTnV6TOtG96WAF3HKIPFr1FceyNqcjbzAboOLHLuLngTIiu9PQRX2HzEEdXiws0KXfwBWbCtfnbi9+p028+LpG+t09y/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883116; c=relaxed/simple;
	bh=p+WpUe61Uf/9zsVuhMKn5/zWYHwkJX9Z0uAkX0tmoM0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=UzlVgtg7fm/IzmriD0g1G9VYbvtoigmJiMVyZFhxjZ4Xn/nJIi9cUMhOjZHESMjrHkgyRIo3Ni7xQAv5Sx4EcM2RAiQ2AHfzLJoUf5r49AdnlVl9o+Ykq7oXbPFJuSFsn5uJErxWrVEHVTEZ1ZaYaY5P9xB5Hry0IO3ASbxMBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CpfYEq1L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLV+b8wRoDeQA2Nas8F4iCfGEiK/r85r+1LvNr8tJ1Y=;
	b=CpfYEq1L3M2Tb7L985BABPY3nOxtl5TnMRzzyfwHIjnV2htR3eT/0jpeKbYhStGFFFH8Ni
	DS6gRu4VkE1V1s73u2T0pJHezF5CuDGcsQPfX3nQrtHzLHL66bS4ID/Zkj8xRXeSkbF2oW
	9S9jlghJG1Jqf2mBUOQ30a6fXlhv7e4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-96nE0lGHMHWWZwJmSEH8kQ-1; Thu,
 08 Jan 2026 09:38:30 -0500
X-MC-Unique: 96nE0lGHMHWWZwJmSEH8kQ-1
X-Mimecast-MFC-AGG-ID: 96nE0lGHMHWWZwJmSEH8kQ_1767883108
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA09219560AA;
	Thu,  8 Jan 2026 14:38:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47A2130002D1;
	Thu,  8 Jan 2026 14:38:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260106080251.GD2630@sol>
References: <20260106080251.GD2630@sol> <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-4-dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/8] pkcs7, x509: Add ML-DSA support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2745002.1767883099.1@warthog.procyon.org.uk>
Date: Thu, 08 Jan 2026 14:38:19 +0000
Message-ID: <2745003.1767883099@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Eric Biggers <ebiggers@kernel.org> wrote:

> 
> 1.) If the CMS object doesn't include signed attributes, then it's a
>     digest of the real message the caller provided.

Yeah - that needs fixing, but I need to be able to test it.

openssl-4.0 (at least that's what appears to be on the master branch) will
have a fix for ML-DSA CMS_NOATTR support (it was committed in November), but
it's not available yet unless you want to build your own.

sign-file would would normally use CMS_NOATTR, and this is worked round by
patch 4 in this series by using signed attributes for ML_DSA.

David


