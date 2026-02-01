Return-Path: <keyrings+bounces-3994-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBQTAxWDf2m6sQIAu9opvQ
	(envelope-from <keyrings+bounces-3994-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 17:45:09 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BCC68B4
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 17:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA9093007974
	for <lists+keyrings@lfdr.de>; Sun,  1 Feb 2026 16:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971FB2727F3;
	Sun,  1 Feb 2026 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9OP9cBr"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBB25524C
	for <keyrings@vger.kernel.org>; Sun,  1 Feb 2026 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769964298; cv=none; b=kzf2e70G4QRv215q/ehXIXWIAdpqKPUBCZi1pfimoXrUyTeCyZEUnq7d8KX4JvFc4iVN3YebE2ms9t9vfVm4qI3o4Ec/LK6uboB853zAW7zGcXBXQPnd6irizfzfAPkFHCs4hagU69mU037a4T755+630Qhfz2ScVajO66OcMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769964298; c=relaxed/simple;
	bh=giD2F5UNmFMG6o6l+i3XLP9MRphNPKugSUu8GN9qHPs=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=GFIf4br+ZifP3WMLR8fi6G/RPZMzz7z0TpL/VaAXtWEsOWlRDfIEtprozAAI1kByO968BBo9Yg/ZkimPFbH1e9C92JxlYwHHd59vT18w0zHLTW4P1cBZFKs6/bPw1r800jygOl3CPRfvSRrXwCGx4YLJKFojMN0mTMKhA4r4zw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9OP9cBr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769964296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbjcDMK0rcsgbZ0bOwqzZviKflLW8sOigcLXjjdEPsU=;
	b=Z9OP9cBr3lSY9qmjSal59GBC73K3ELKqSTrkgoi2/tUNJ+EPdxi6nFUGozX9L0xs+g7slO
	ARO5d2MSkQK5xm5cTgDI0k18NC7fP/G1Shkrx+om9YEYvCwV/vaQBrFr2mmaLcX9snk3Z5
	xNmdkc3wyZ4LTq0aZUpQ/zMrPYtdCiE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-zX-rT8bBOY-cMQsxbWZZig-1; Sun,
 01 Feb 2026 11:44:52 -0500
X-MC-Unique: zX-rT8bBOY-cMQsxbWZZig-1
X-Mimecast-MFC-AGG-ID: zX-rT8bBOY-cMQsxbWZZig_1769964290
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F2321956094;
	Sun,  1 Feb 2026 16:44:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D556E30001A7;
	Sun,  1 Feb 2026 16:44:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com> <20260126142931.1940586-1-dhowells@redhat.com> <20260126142931.1940586-7-dhowells@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>,
    Sami Tolvanen <samitolvanen@google.com>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    "Jason
 A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
    "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
    "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2315763.1769964282.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Feb 2026 16:44:42 +0000
Message-ID: <2315764.1769964282@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3994-lists,keyrings=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[outlook.com,google.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,warthog.procyon.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 753BCC68B4
X-Rspamd-Action: no action

Michael Kelley <mhklinux@outlook.com> wrote:

> I'm building linux-next20260130, which has this patch, and get the follo=
wing errors:
> =

>   HOSTCC  scripts/sign-file
> scripts/sign-file.c: In function 'main':
> scripts/sign-file.c:282:25: error: 'CMS_NO_SIGNING_TIME' undeclared (fir=
st use in this function)
> ...
> The problem is that I'm running on Ubuntu 20.04, with this openssl:
> =

> # openssl version
> OpenSSL 1.1.1f  31 Mar 2020 =


The problem probably isn't this patch, it's almost certainly due to:

  d7afd65b4acc7 ("sign-file: Use only the OpenSSL CMS API for signing")

in the modules tree.  It removes support for PKCS#7 signature generation.

Were you using PKCS#7 with SHA1?

David


