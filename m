Return-Path: <keyrings+bounces-3941-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IWJOUdPd2n0dwEAu9opvQ
	(envelope-from <keyrings+bounces-3941-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 12:25:59 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A2C879F6
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 12:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D1F43004DE2
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 11:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFE9332912;
	Mon, 26 Jan 2026 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0O90VrP"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3D332EAD
	for <keyrings@vger.kernel.org>; Mon, 26 Jan 2026 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426755; cv=none; b=jiL4QG2GO73XQQvczjPqOkpak5QwViKJhFZIvYnlZYuSnW3xSQ1MyXMBqlQt1kzozXmzkcl24oOYEVR+YT6b6oJT6x+xoT3ebOZexmz7lW6/g7YEi8OoIMLV+PNVWWceuQzNOYZEuT1uZ183fR120+aL8yyvpzx16+bG6heYjTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426755; c=relaxed/simple;
	bh=qbabzOBct0raWmkfNNwqKkzge9KEKM7B+e5ggwjjto8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=EoJRZuRL9OytHFZ9wgB/TnG9psWdm1dl7oIpARtHuPIhiid3jtJ/1ZPkzxThX5y/HCAa+pf2kWxQoys1C3l0nTB8nQIsmTisiZSdZ0ea8rDsyHpyRHM0Lxe78MT1Bnro2SMgznOnar7+hn5Z7nvV3XvEKH8ZEQJHbDNjoO1JcDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0O90VrP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769426753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNLEmaMi6ah7uFVlqTiBOf87rjmNddmz1tzblx3XG20=;
	b=d0O90VrPgZzPrhcD3G0C56pP03nSQOelQTvCDfYRlA2CY8bni+x1XNBp8ISUTbkp25gK57
	74gTmD17ktrkIT9UMCmRIk0eH8ZsunkLi49FBvrw0mmCtC08NXlEessD3ZmRSaqFk7Tm4r
	zJgcA6xFq66eWu493pgjMGfXET5P8YI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-gilud1t_NHeKUDoSkiCCBQ-1; Mon,
 26 Jan 2026 06:25:48 -0500
X-MC-Unique: gilud1t_NHeKUDoSkiCCBQ-1
X-Mimecast-MFC-AGG-ID: gilud1t_NHeKUDoSkiCCBQ_1769426746
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 837201944EB7;
	Mon, 26 Jan 2026 11:25:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.186])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DFD6E1800665;
	Mon, 26 Jan 2026 11:25:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aXYrvMpaQ2rHmFrw@kernel.org>
References: <aXYrvMpaQ2rHmFrw@kernel.org> <20260121223609.1650735-1-dhowells@redhat.com> <20260121223609.1650735-5-dhowells@redhat.com>
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
Subject: Re: [PATCH v14 4/5] pkcs7, x509: Add ML-DSA support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1903447.1769426738.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jan 2026 11:25:38 +0000
Message-ID: <1903448.1769426738@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3941-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 89A2C879F6
X-Rspamd-Action: no action

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Why don't we have a constant for "none"?
> =

> $ git grep "\"none\"" security/
> security/apparmor/audit.c:      "none",
> security/apparmor/lib.c:        { "none", DEBUG_NONE },
> security/security.c:    [LOCKDOWN_NONE] =3D "none",
> =

> $ git grep "\"none\"" crypto
> crypto/asymmetric_keys/public_key.c:                                    =
hash_algo =3D "none";
> crypto/asymmetric_keys/public_key.c:                            hash_alg=
o =3D "none";
> crypto/testmgr.h: * PKCS#1 RSA test vectors for hash algorithm "none"
> =

> IMHO, this a bad practice.

You'd think that the compiler and linker ought to be able to deal with
read-only string sharing within compilation units.  I don't particularly w=
ant
to deal with combining every "none" string within the kernel into one with=
in
this patchset.

I could move back to using an enum of algorithms, I suppose - though again=
,
I'd rather not do that in this patchset.

David


