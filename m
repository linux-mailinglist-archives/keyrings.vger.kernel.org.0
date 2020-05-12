Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98831CF572
	for <lists+keyrings@lfdr.de>; Tue, 12 May 2020 15:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbgELNRQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 May 2020 09:17:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41856 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728283AbgELNRQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 12 May 2020 09:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589289434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AfyFJp14Em5eun2MnpR0ECXxjVn+ZY1Q40CAO8H54Xk=;
        b=VGkzy6jY8pEgBY0Y+LKs5hrMGVOh6EhRloJphCTNZ8QSamOmgbNwCCLL/AwK3H79QGRafP
        4hMXQM0DrchQYDjoQ55kYuSxdMEvX6cEZmApgmGX0HpiRLRsPKIg3ACDnOdIgHLynBETvW
        iQgQvmriokh2+7elAfvoePmPewUv+Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-JyLrBjopMn2UUB8-ic6Ftw-1; Tue, 12 May 2020 09:17:10 -0400
X-MC-Unique: JyLrBjopMn2UUB8-ic6Ftw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A6A119200C2;
        Tue, 12 May 2020 13:17:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com [10.10.112.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 868FB60BF1;
        Tue, 12 May 2020 13:17:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200511215101.302530-1-Jason@zx2c4.com>
References: <20200511215101.302530-1-Jason@zx2c4.com> <CAHmME9oXiTmVuOYmG=K3ijWK+zP2yB9a2CFjbLx_5fkDiH30Tg@mail.gmail.com>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com,
        Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v3] security/keys: rewrite big_key crypto to use library interface
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2620779.1589289425.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 12 May 2020 14:17:05 +0100
Message-ID: <2620780.1589289425@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> -	/* no ->update(); don't add it without changing big_key_crypt() nonce =
*/
> +	/* no ->update(); don't add it without changing chacha20poly1305's non=
ce

Note that ->update() doesn't have to modify the contents of the key, but c=
an
just rather replace them entirely.  See attached.  The actual work is done=
 in
big_key_preparse(); all big_key_update() has to do is apply it and dispose=
 of
the old payload.

David
---
commit 724e76c185d517f35ead4f72f9958850c9218f4d
Author: David Howells <dhowells@redhat.com>
Date:   Tue May 12 14:03:53 2020 +0100

    keys: Implement update for the big_key type
    =

    Implement the ->update op for the big_key type.
    =

    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/include/keys/big_key-type.h b/include/keys/big_key-type.h
index 3fee04f81439..988d90d77f53 100644
--- a/include/keys/big_key-type.h
+++ b/include/keys/big_key-type.h
@@ -18,5 +18,6 @@ extern void big_key_revoke(struct key *key);
 extern void big_key_destroy(struct key *key);
 extern void big_key_describe(const struct key *big_key, struct seq_file *=
m);
 extern long big_key_read(const struct key *key, char *buffer, size_t bufl=
en);
+extern int big_key_update(struct key *key, struct key_preparsed_payload *=
prep);
 =

 #endif /* _KEYS_BIG_KEY_TYPE_H */
diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index d43f3daab2b8..dd708e8f13c0 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -47,7 +47,7 @@ struct key_type key_type_big_key =3D {
 	.destroy		=3D big_key_destroy,
 	.describe		=3D big_key_describe,
 	.read			=3D big_key_read,
-	/* no ->update(); don't add it without changing chacha20poly1305's nonce=
 */
+	.update			=3D big_key_update,
 };
 =

 /*
@@ -191,6 +191,23 @@ void big_key_destroy(struct key *key)
 	key->payload.data[big_key_data] =3D NULL;
 }
 =

+/*
+ * Update a big key
+ */
+int big_key_update(struct key *key, struct key_preparsed_payload *prep)
+{
+	int ret;
+
+	ret =3D key_payload_reserve(key, prep->datalen);
+	if (ret < 0)
+		return ret;
+
+	if (key_is_positive(key))
+		big_key_destroy(key);
+
+	return generic_key_instantiate(key, prep);
+}
+
 /*
  * describe the big_key key
  */

