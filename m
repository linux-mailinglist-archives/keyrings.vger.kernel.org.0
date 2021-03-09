Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398053326AA
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 14:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhCINVd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 08:21:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52168 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231358AbhCINVV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 08:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615296080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CEm+z0J80FwRzKm4ZgJ4wMa9yHtW6K/S9JzBKuRxp+8=;
        b=Nx4k/3QVnhnS5Z8gyKOSedpLbvUtaX7FoTluxQP7s/DclQVdoiavVgfm0/kIGLyWOyrrC2
        yM0aXvY3AFZN9tigAOyTvTmuPawdA8e6xfbMaVvPu1TsJWyScd40byWJpSfxppN5lpUKWl
        aua9KsdZRkH0YSLDlqWnXTb0gfzY2cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-hbYGuUPQOrCAwoBqYriWnA-1; Tue, 09 Mar 2021 08:21:18 -0500
X-MC-Unique: hbYGuUPQOrCAwoBqYriWnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8959801503;
        Tue,  9 Mar 2021 13:21:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3CEAA10016F9;
        Tue,  9 Mar 2021 13:21:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH v3 4/4] integrity: Load mokx variables into the blacklist
 keyring
From:   David Howells <dhowells@redhat.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Mar 2021 13:21:14 +0000
Message-ID: <161529607422.163428.13530426573612578854.stgit@warthog.procyon.org.uk>
In-Reply-To: <161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk>
References: <161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Snowberg <eric.snowberg@oracle.com>

During boot the Secure Boot Forbidden Signature Database, dbx,
is loaded into the blacklist keyring.  Systems booted with shim
have an equivalent Forbidden Signature Database called mokx.
Currently mokx is only used by shim and grub, the contents are
ignored by the kernel.

Add the ability to load mokx into the blacklist keyring during boot.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
cc: keyrings@vger.kernel.org
Link: https://lore.kernel.org/r/20210122181054.32635-5-eric.snowberg@oracle.com/ # v5
Link: https://lore.kernel.org/r/c33c8e3839a41e9654f41cc92c7231104931b1d7.camel@HansenPartnership.com/
Link: https://lore.kernel.org/r/161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/161433313205.902181.2502803393898221637.stgit@warthog.procyon.org.uk/ # v2
---

 security/integrity/platform_certs/load_uefi.c |   20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index ee4b4c666854..f290f78c3f30 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -132,8 +132,9 @@ static int __init load_moklist_certs(void)
 static int __init load_uefi_certs(void)
 {
 	efi_guid_t secure_var = EFI_IMAGE_SECURITY_DATABASE_GUID;
-	void *db = NULL, *dbx = NULL;
-	unsigned long dbsize = 0, dbxsize = 0;
+	efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
+	void *db = NULL, *dbx = NULL, *mokx = NULL;
+	unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
 	efi_status_t status;
 	int rc = 0;
 
@@ -175,6 +176,21 @@ static int __init load_uefi_certs(void)
 		kfree(dbx);
 	}
 
+	mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
+	if (!mokx) {
+		if (status == EFI_NOT_FOUND)
+			pr_debug("mokx variable wasn't found\n");
+		else
+			pr_info("Couldn't get mokx list\n");
+	} else {
+		rc = parse_efi_signature_list("UEFI:MokListXRT",
+					      mokx, mokxsize,
+					      get_handler_for_dbx);
+		if (rc)
+			pr_err("Couldn't parse mokx signatures %d\n", rc);
+		kfree(mokx);
+	}
+
 	/* Load the MokListRT certs */
 	rc = load_moklist_certs();
 


