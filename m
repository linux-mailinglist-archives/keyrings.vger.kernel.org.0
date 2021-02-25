Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7895E325854
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 22:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhBYVDp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 16:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51269 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234876AbhBYVAq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Feb 2021 16:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614286749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GaPCWMrUePGJJoknBQo5jOHASSWRrtnBlimP7nH0gxY=;
        b=gAWfR6z1ohHNDW0LJfawmMlsdofuWjrO4q6WdnCQXSUgXAY0kajt/vxd66c959swNJ6Gg6
        pwt1MFqpQyE03MihM/gMrLDcXb5GdgVkVVChgHL2YmhD0LBti9PqqS6/DqZnTdQcoNHe4V
        8UJRvH0pBdVpTiG2E+TKtBmNliZPTFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-ep0hnRerPpOGyC-8WdqOGQ-1; Thu, 25 Feb 2021 15:59:06 -0500
X-MC-Unique: ep0hnRerPpOGyC-8WdqOGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69ABE19611A8;
        Thu, 25 Feb 2021 20:59:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A59660BF3;
        Thu, 25 Feb 2021 20:59:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/4] integrity: Load mokx variables into the blacklist keyring
From:   David Howells <dhowells@redhat.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, dhowells@redhat.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 25 Feb 2021 20:59:03 +0000
Message-ID: <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk>
In-Reply-To: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
cc: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20210122181054.32635-5-eric.snowberg@oracle.com/ # v5
Link: https://lore.kernel.org/r/c33c8e3839a41e9654f41cc92c7231104931b1d7.camel@HansenPartnership.com/
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
 


