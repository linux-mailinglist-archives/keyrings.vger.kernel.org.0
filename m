Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB2A32500A
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 13:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhBYM5Z (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 07:57:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:53072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233087AbhBYM5Y (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 25 Feb 2021 07:57:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DB3D64EC4;
        Thu, 25 Feb 2021 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614257803;
        bh=7w0ppqJfZpS/4Y+thDZTIjsZ8b0D17qBZlWVYwUGMfM=;
        h=From:To:Cc:Subject:Date:From;
        b=ira5MTPkyaYPrhXegW3NMyDVH566eXHhFudA1UsXRYlIgIabyblknyofFmYY/Gpj5
         wIUaT+rKgHzJTl0PB5Rp1SqX05tfolXf/u0wmvKvpCwaFJ1d94QGD+GJ3CTCBAXIMu
         muXC0OnWHO6WTFB5VKAmdGV43gTWK5CLDvGtmOIdR1vraK9Rhg8+zr6+zVihJ32tQ5
         fhCE+wVV7/zpePeRJJOywSdmrZu/WTdk9IKou/qK/yaSgPvDpR7NO9iuS6pnDryISE
         Zvzxv7rujIDZ5MVpiI4CP4/emS/ibSvFSpGP268uafuzapTy3F0xvErCKDED2sqLXs
         XinhROH3sMO5A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] certs: select PKCS7_MESSAGE_PARSER if needed
Date:   Thu, 25 Feb 2021 13:56:30 +0100
Message-Id: <20210225125638.1841436-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_SYSTEM_BLACKLIST_KEYRING and CONFIG_INTEGRITY_PLATFORM_KEYRING
are both enabled, the system blacklist tries calling the
pkcs7_validate_trust() function, causing a link failure if the driver
that defines it is disabled or a loadable module:

ld.lld: error: undefined symbol: pkcs7_validate_trust
>>> referenced by blacklist.c
>>>               blacklist.o:(is_key_on_revocation_list) in archive certs/built-in.a

Add a Kconfig 'select' statement for this specific case that force-
enables the pkcs7 code as well.

Fixes: 30fdba3f40fd ("certs: Add EFI_CERT_X509_GUID support for dbx entries")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 certs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/certs/Kconfig b/certs/Kconfig
index 379a6e198459..21192bb25c79 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -68,6 +68,7 @@ config SECONDARY_TRUSTED_KEYRING
 config SYSTEM_BLACKLIST_KEYRING
 	bool "Provide system-wide ring of blacklisted keys"
 	depends on KEYS
+	select PKCS7_MESSAGE_PARSER if INTEGRITY_PLATFORM_KEYRING
 	help
 	  Provide a system keyring to which blacklisted keys can be added.
 	  Keys in the keyring are considered entirely untrusted.  Keys in this
-- 
2.29.2

