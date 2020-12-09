Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BB42D4209
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbgLIMQt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731424AbgLIMQq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/mvd3i8Iisj3of36p/MCFCEO3iZ3VRAoJPd3yylzh6w=;
        b=ULUneFF/JfolHdwcCA+E6fkQs1wAwkqaY/sIe/vISMArqkOPf206W8HDe6RwdI8NB5gtmE
        5u2hMSC4dyWxWza27hZ1Capwd9MpRtRKRVR0rbOWeRR1LX2sY+JhhUIw7Ix/tc2Lj+pc8T
        vXA3R619HTjXtWNs9X0+C6azE78juRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-9cqO1hUXOkmEWPtLscZjoA-1; Wed, 09 Dec 2020 07:15:15 -0500
X-MC-Unique: 9cqO1hUXOkmEWPtLscZjoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECB49107ACE3;
        Wed,  9 Dec 2020 12:15:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 136096E521;
        Wed,  9 Dec 2020 12:15:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 06/18] security: keys: delete repeated words in comments
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:15:11 +0000
Message-ID: <160751611127.1238376.11653059698742959354.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop repeated words in comments.
{to, will, the}

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: keyrings@vger.kernel.org
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org
---

 security/keys/keyctl.c  |    2 +-
 security/keys/keyring.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 61a614c21b9b..96a92a645216 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -506,7 +506,7 @@ long keyctl_keyring_clear(key_serial_t ringid)
  * keyring, otherwise replace the link to the matching key with a link to the
  * new key.
  *
- * The key must grant the caller Link permission and the the keyring must grant
+ * The key must grant the caller Link permission and the keyring must grant
  * the caller Write permission.  Furthermore, if an additional link is created,
  * the keyring's quota will be extended.
  *
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 977066208387..5e6a90760753 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -881,7 +881,7 @@ static bool search_nested_keyrings(struct key *keyring,
  *
  * Keys are matched to the type provided and are then filtered by the match
  * function, which is given the description to use in any way it sees fit.  The
- * match function may use any attributes of a key that it wishes to to
+ * match function may use any attributes of a key that it wishes to
  * determine the match.  Normally the match function from the key type would be
  * used.
  *
@@ -1204,7 +1204,7 @@ static int keyring_detect_cycle_iterator(const void *object,
 }
 
 /*
- * See if a cycle will will be created by inserting acyclic tree B in acyclic
+ * See if a cycle will be created by inserting acyclic tree B in acyclic
  * tree A at the topmost level (ie: as a direct child of A).
  *
  * Since we are adding B to A at the top level, checking for cycles should just


