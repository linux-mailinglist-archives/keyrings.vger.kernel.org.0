Return-Path: <keyrings+bounces-3876-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFHcDx/IcGm3ZwAAu9opvQ
	(envelope-from <keyrings+bounces-3876-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 13:35:43 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BA56DC7
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 13:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FC825416FE
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 12:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0DE48167D;
	Wed, 21 Jan 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVgnBlZf"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF3848123E
	for <keyrings@vger.kernel.org>; Wed, 21 Jan 2026 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998709; cv=none; b=DNH0q4FdTE+b8ifqK26lauJcSKckyMjJHXQw93bxc0pHXYbSKYO2h/RPbkZ0dFXxaew8lP0FPwuOWKKSHkrrewEkuiYfh3s3FE5vlSzMJYvL94t4aqFISr7EeF37a2YEeVS9xinplYfP5m1q99TKQyHCWIHx8WHucKxMILMTt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998709; c=relaxed/simple;
	bh=XPAd4rGA3H2l/h9MxskZuWBwGfSZPyWPjoE+4jZFahw=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=t6ThqlhI5+/fd8l79WByA26ySIKAPkvFc/RuT48w5V+oXY7DLMzPB5JkLEli8aN3Zpb8kwTE41NkXrMkkfwy1R7blbcmjonKIElDbcf6GET2PbSm/4Gj8NHTRuyvVtZeOnZjVFQ1zm74EI62MUKUqy6+1FTvG0jTx42q9eRC3Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVgnBlZf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768998706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B1W93OR2XYiIiHVHo6/GIKwgMtIzbURml8eyAEBcndk=;
	b=SVgnBlZf0AY6IV+MfHt1trhrmGUgalQ3VlLbU9rkhDqVDuC+qA8370CLqhZFpsdufoSAgN
	nludMaDdMMeFoewvwLtkDSqyZt3EmQuAQRZ5rJR3ZBxuiHmvT/M+alc/oXa0ZrnR84Cwzc
	UBx5QrWXDrp4FwZny6PbGdgTVMU4oSQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-KrkrYFufPO6i1HmtP0ektA-1; Wed,
 21 Jan 2026 07:31:43 -0500
X-MC-Unique: KrkrYFufPO6i1HmtP0ektA-1
X-Mimecast-MFC-AGG-ID: KrkrYFufPO6i1HmtP0ektA_1768998701
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DF7E1954B0B;
	Wed, 21 Jan 2026 12:31:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A73F180049F;
	Wed, 21 Jan 2026 12:31:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aW_BAchcx2_TXASz@kernel.org>
References: <aW_BAchcx2_TXASz@kernel.org> <20260120145103.1176337-1-dhowells@redhat.com> <20260120145103.1176337-3-dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
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
Subject: Re: [PATCH v13 02/12] pkcs7: Allow the signing algo to calculate the digest itself
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1501915.1768998695.1@warthog.procyon.org.uk>
Date: Wed, 21 Jan 2026 12:31:35 +0000
Message-ID: <1501916.1768998695@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	TAGGED_FROM(0.00)[bounces-3876-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 244BA56DC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> I'd use the wording you used already in commit message, which
> factors more descriptive than what you have here. E.g., name
> it "external_digest".

ML-DSA uses "external" to mean that the caller does the
digestion/hashing/XOF-ing/whatever Eric wants to call it, but the caller also
has to put other stuff into the digest/hash/XOF/thing that then gets passed to
ML-DSA if it does this.

For added confusion, the NIST FIPS tests seem to consider what this patch does
as 'external' but an "external mu" as 'internal':

	"tgId": 1,
	"testType": "AFT",
	"parameterSet": "ML-DSA-44",
	"signatureInterface": "external",
	"preHash": "pure",

vs:

	"tgId": 7,
	"testType": "AFT",
	"parameterSet": "ML-DSA-44",
	"signatureInterface": "internal",
	"externalMu": true,

I haven't come up with a better name that particularly describes this.  Maybe
use "no_prehash" or "algo_takes_hash" or "algo_takes_data"?

Maybe better than using a true/false value, use an enum?

	enum public_key_hash {
		ALGO_SIGNS_HASH, /* RSA, ECDSA, ... */
		ALGO_SIGNS_DATA, /* MLDSA, ... */
	};

David


