Return-Path: <keyrings+bounces-3868-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KErBz8UcGlyUwAAu9opvQ
	(envelope-from <keyrings+bounces-3868-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:48:15 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017C4E167
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31239B65213
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9797315D33;
	Tue, 20 Jan 2026 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gf6nB1t/"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA23ED124
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951148; cv=none; b=uhDXmbFBneO43VaOYzICvEoPhYOGT0733Ik+UbHnyWE1tSyIyGgpXnj8/vmavFwomEWEblag4TAciD/SOewdcnL1EKn5vv+s8eCRKjHfogeFM0ucUQ26xOJNc8o0NV1Mu6J87aAdJyBLyjA3qXayRvpNqWPGE/xe4Qw1B4qS8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951148; c=relaxed/simple;
	bh=J0EaJR1XnsPND8DWqwZ9yMG4fEW3kmeM+FCLN/RkBuM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Z6/IYxF4kBiDS+JRNYRVZ6+CizEL7QZgUpvz19cenhX/OI4BH4bS2Z0IbjMbyzSbHXv6yPyngkqJvCl1+WH2yFJHYEGVwxKXUl2PQ/ATu70skUigSPa2wZW+dAmWD66HBLKJ9DYafIkBSRaFGc7rHx0oWvhQF4suXHw0PWqe124=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gf6nB1t/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768951145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AGibvz7VOIw/3aAThX1azRG3ckYGYAFSswoOwR4cTQQ=;
	b=Gf6nB1t/ltL3zXjZOAolDYEK68KVWhWatWMH4IYG1AhsncXPqPYSn2+wI94K3v/gZv/pLn
	PJFIdBfWjqd218Lz5HA7Sk3YQRAmzeB605E7O/bngu6VWZpT+9+oCc3KSxb6USJg3I8+Ds
	Ni9D+DZFBc6IGLHCxbYP76qUgMbEGTI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-tuNvAUuqOoyBMwRQNqq43Q-1; Tue,
 20 Jan 2026 18:19:00 -0500
X-MC-Unique: tuNvAUuqOoyBMwRQNqq43Q-1
X-Mimecast-MFC-AGG-ID: tuNvAUuqOoyBMwRQNqq43Q_1768951137
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41CF71956050;
	Tue, 20 Jan 2026 23:18:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C61319560AB;
	Tue, 20 Jan 2026 23:18:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aW_4T-o1eqgKtYVo@altlinux.org>
References: <aW_4T-o1eqgKtYVo@altlinux.org> <20260120145103.1176337-1-dhowells@redhat.com> <20260120145103.1176337-12-dhowells@redhat.com>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason
 A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 11/12] x509, pkcs7: Limit crypto combinations that may be used for module signing
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1417087.1768951131.1@warthog.procyon.org.uk>
Date: Tue, 20 Jan 2026 23:18:51 +0000
Message-ID: <1417088.1768951131@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	TAGGED_FROM(0.00)[bounces-3868-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 8017C4E167
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Vitaly Chikunov <vt@altlinux.org> wrote:

> > +static const struct public_key_restriction public_key_restrictions[] = {
> > +	/* algo			encoding	hash */
> > +	{ "rsa",		"pkcs1",	"sha256" },
> > +	{ "rsa",		"pkcs1",	"sha384" },
> > +	{ "rsa",		"pkcs1",	"sha512" },
> > +	{ "rsa",		"emsa-pss",	"sha512" },
> > +	{ "ecdsa",		"x962",		"sha256" },
> > +	{ "ecdsa",		"x962",		"sha384" },
> > +	{ "ecdsa",		"x962",		"sha512" },
> > +	{ "ecrdsa",		"raw",		"sha256" },
> > +	{ "ecrdsa",		"raw",		"sha384" },
> > +	{ "ecrdsa",		"raw",		"sha512" },
> 
> Why such hash choice? Aren't it should be streebog256 and streebog512?

Maybe?  I don't have any example ecrdsa (assuming you're talking about that
specifically), nor does it seem that it was added to the choice of module
signing.  Possibly I should drop the encoding column - or just have a list of
hashes that we accept - but we might want to limit the hashes that can use
with ML-DSA more strictly (ie. only allow SHA512).

David


