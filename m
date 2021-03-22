Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E53343D56
	for <lists+keyrings@lfdr.de>; Mon, 22 Mar 2021 10:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCVJ5p (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhCVJ5O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Mar 2021 05:57:14 -0400
X-Greylist: delayed 73 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 Mar 2021 02:57:13 PDT
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9051BC061574;
        Mon, 22 Mar 2021 02:57:13 -0700 (PDT)
Received: from sas1-6b1512233ef6.qloud-c.yandex.net (sas1-6b1512233ef6.qloud-c.yandex.net [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
        by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5FCED2E1A5C;
        Mon, 22 Mar 2021 12:55:49 +0300 (MSK)
Received: from sas1-c2bc061771d1.qloud-c.yandex.net (sas1-c2bc061771d1.qloud-c.yandex.net [2a02:6b8:c08:8c0e:0:640:c2bc:617])
        by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id tq3Em1ENmX-tmW4ALXt;
        Mon, 22 Mar 2021 12:55:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
        t=1616406949; bh=e+/1GyuQ/kEyRFB76ojHD7RM2+yYDnoHwxj1Ys4/bkQ=;
        h=Message-Id:Date:Subject:To:From:Cc;
        b=aixg3KO8WFVzfgJwjAvv2KZ1t2YE3vTn+V86q8n7tj3dEvhldqP3GuxIpk1F/kumG
         XFWb8o1aliFDhLj+3At6jZJMENF7I7Wk84RZlCOmfttJ4DyMY5zsddhR1+eVMDtwVL
         LTbQzNYb18wLYkLcG85lXVBBUEyMAhPiOdxLONzY=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b080:8024::1:c])
        by sas1-c2bc061771d1.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id jsos7KcTCc-tmnOUxrn;
        Mon, 22 Mar 2021 12:55:48 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Andrey Ryabinin <arbn@yandex-team.ru>
To:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrey Ryabinin <arbn@yandex-team.ru>
Subject: [PATCH] keys: Allow disabling read permissions for key possessor
Date:   Mon, 22 Mar 2021 12:57:26 +0300
Message-Id: <20210322095726.14939-1-arbn@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

keyctl_read_key() has a strange code which allows possessor to read
key's payload regardless of READ permission status:

$ keyctl add user test test @u
196773443
$ keyctl print 196773443
test
$ keyctl describe 196773443
196773443: alswrv-----v------------  1000  1000 user: test
$ keyctl rdescribe 196773443
user;1000;1000;3f010000;test
$ keyctl setperm 196773443 0x3d010000
$ keyctl describe 196773443
196773443: alsw-v-----v------------  1000  1000 user: test
$ keyctl  print 196773443
test

The last keyctl print should fail with -EACCESS instead of success.
Fix this by removing weird possessor checks.

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.ru>
---

 - This was noticed by code review. It seems like a bug to me,
 but if I'm wrong and current behavior is correct, I think we need
 at least better comment here.
   

 security/keys/keyctl.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 96a92a645216d..2ec021c7adc12 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -845,22 +845,9 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 
 	/* see if we can read it directly */
 	ret = key_permission(key_ref, KEY_NEED_READ);
-	if (ret == 0)
-		goto can_read_key;
-	if (ret != -EACCES)
+	if (ret != 0)
 		goto key_put_out;
 
-	/* we can't; see if it's searchable from this process's keyrings
-	 * - we automatically take account of the fact that it may be
-	 *   dangling off an instantiation key
-	 */
-	if (!is_key_possessed(key_ref)) {
-		ret = -EACCES;
-		goto key_put_out;
-	}
-
-	/* the key is probably readable - now try to read it */
-can_read_key:
 	if (!key->type->read) {
 		ret = -EOPNOTSUPP;
 		goto key_put_out;
-- 
2.26.2

