Return-Path: <keyrings+bounces-4063-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C8UDl8mlGkcAQIAu9opvQ
	(envelope-from <keyrings+bounces-4063-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 09:27:11 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F359149EAD
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 09:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEDE7300AB37
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 08:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C502E040E;
	Tue, 17 Feb 2026 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="efC8bilG"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791562D8382
	for <keyrings@vger.kernel.org>; Tue, 17 Feb 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316825; cv=none; b=o2MoWMZ6DKRzujfmBATomZONkW067KZM4/UYD4Y2Hri4Cq5Glb12z9FMlC6GA2Y5HN5YrT3RxHWmJFVuAkrxCXFzxx5lkB5tBofyj4nkHmCunzukDGDt0i/xK9STzhNEVSsdPU2BrZE9nj13F9FcGAOPJ3rc+vca2BADLbNoJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316825; c=relaxed/simple;
	bh=MwAcjm4rUg9a3rz6rD0j81jEsYKCsZMd4yRroLuqIjY=;
	h=To:cc:Subject:MIME-Version:Content-Type:From:Date:Message-ID; b=p/cRTTPAzSWAQMmDRQxG7L9WCJi1LJ2NMRKP2Hrv+7SvHTLj0M+73vJWceEYuD35M4jcLbRkBc53MZLoyrVQ0WkGa1YIvz7hy0731O4+7jTzxUD1G+Z4hk5o69+0jGOngJ/HL1KAtCMqDLrs4wj5HmN9Vr2BTIju6Z/KDtbECxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=efC8bilG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771316822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SfsOPeqMEk/9t39NE41XsRGPuGr+cn1g6t+HMYa98o4=;
	b=efC8bilGVwuMgtwaehCmWgFV58qEbzios1umbdO5gPkkvlBeHGFeDt3E8of2qDrLr3TnU1
	fnSH5gthxjQQkxpEJ9laoyu8QkWraqLlA9ZpXT6hyB0aBnjBNUjwT+i0L2L0BOARdTp8iT
	h04Id/9J8dx2wPBBVlEk3VgoK9qCi7Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-QCsD-w1XOhC8taefQ9tCJg-1; Tue,
 17 Feb 2026 03:26:58 -0500
X-MC-Unique: QCsD-w1XOhC8taefQ9tCJg-1
X-Mimecast-MFC-AGG-ID: QCsD-w1XOhC8taefQ9tCJg_1771316817
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D3631800282;
	Tue, 17 Feb 2026 08:26:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.45.225.173])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3C9101955F43;
	Tue, 17 Feb 2026 08:26:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: dhowells@redhat.com, Arnd Bergmann <arnd@kernel.org>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Jarkko Sakkinen <jarkko@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
    keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] x509: select CONFIG_CRYPTO_LIB_SHA256
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1015746.1771316771.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
From: David Howells <dhowells@redhat.com>
Date: Tue, 17 Feb 2026 08:26:49 +0000
Message-ID: <1015832.1771316809@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4063-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F359149EAD
X-Rspamd-Action: no action

    =

The x509 public key code gained a dependency on the sha256 hash
implementation, causing a rare link time failure in randconfig
builds:

arm-linux-gnueabi-ld: crypto/asymmetric_keys/x509_public_key.o: in functio=
n `x509_get_sig_params':
x509_public_key.c:(.text.x509_get_sig_params+0x12): undefined reference to=
 `sha256'
arm-linux-gnueabi-ld: (sha256): Unknown destination type (ARM/Thumb) in cr=
ypto/asymmetric_keys/x509_public_key.o
x509_public_key.c:(.text.x509_get_sig_params+0x12): dangerous relocation: =
unsupported relocation

Select the necessary library code from Kconfig.

Fixes: 2c62068ac86b ("x509: Separately calculate sha256 for blacklist")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/asymmetric_keys/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconf=
ig
index 1dae2232fe9a..e50bd9b3e27b 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -27,6 +27,7 @@ config X509_CERTIFICATE_PARSER
 	tristate "X.509 certificate parser"
 	depends on ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	select ASN1
+	select CRYPTO_LIB_SHA256
 	select OID_REGISTRY
 	help
 	  This option provides support for parsing X.509 format blobs for key


