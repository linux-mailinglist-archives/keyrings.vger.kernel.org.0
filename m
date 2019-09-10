Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEACAECA0
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2019 16:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbfIJOIF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 10 Sep 2019 10:08:05 -0400
Received: from mout.gmx.net ([212.227.17.22]:56355 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfIJOIF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 10 Sep 2019 10:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568124480;
        bh=uWPkDQE8MgYpJC5ja2kkFEXfZsy4wqc2rtwIZT7XGd0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=SDmbsLd/4jQx0qssfGpYrQhkd4bTmS644gfX0o5JKtWhhHvgSKMrBJVs6fFctZNmr
         knlWtj6jqiz5wnIgCLRBqLN933/GY8tP01ceH3lWMFz3esXsZZOvssc3deqYCv9rHE
         6s1AOMQQ//abokR2HunbrKIem7QAZVU/OYTTJ8Iw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([91.61.54.239]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O6Y-1i8Dyo0ati-003twd; Tue, 10
 Sep 2019 16:08:00 +0200
Date:   Tue, 10 Sep 2019 16:07:59 +0200
From:   Marcus Huewe <suse-tux@gmx.de>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, suse-tux@gmx.de
Subject: [PATCH] keys: Do not check the retval of commit_creds in
 join_session_keyring
Message-ID: <044b34c4388405e995e38fb57fc120361bf962db.1568124150.git.suse-tux@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Provags-ID: V03:K1:G1lYWaACw+vi4VbKLJRmcWldg1i90UhAjSjTypSdK4mB3xwqbeE
 AEBNDwM/on0iR0+DQk7sL7jos4jea8lAh9GNZd0J9KN25Ds8v2e8z0GAGstqPfjoSD06gSM
 u2JU8+xYgIan9HmDRM3bZBRMfSmJvpNuOwC7Y6J8OQoQMV8hCTXE6sbCd5KZebAwIyzoQrI
 VED1yG0mkBU2VtyZBQpxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uEMlyRLlZ6g=:TAXli4cOgNDysEhMKSgJeB
 NQgToiyfc1MYQeNGJqqr+kI0+aoMyLWM/Pxkg0pW2ofQMOXEXXSR4mpXYHdSf3kXOsdadscSN
 /9lKdJHyNOW174WwXsVCbjiTiqX33w8eZS5pcWvwMLPGV2Wkn3qmjiSzCUM6XFip2+sEKBa47
 dmpTGTCjD2P1y1XmVhnhZjgAbqkLxjVzz00aykaWjnOQQwUcM3OXYXXYLiBtYkUqE7Iquhsvk
 wTz8SgrbhCHsG+cqdz6T99gI58tTTpKLdTZClmntqX9DKY8uOCgodpcdTEanbOixYRNkYSD/8
 c9tLQ+nC9MQvq6+gt6yXGeGjr6Xtdpejvo7XFCgqc+VxTuzl7Aw8wQib5T/Vche3P0ed/fB15
 BuH5e+3tuI7ek3Mp6q/oh3zNJSfq+EEh8Ug53T6N6pDoZWn96GA64ryoCnwiHwwoWHtL7NIun
 Lh8fCkhSCXHniBt/sjgtmwoScTV8CpyTFkHlqSSqynxmeha/E57dmku6fq2M0/8AdCks1Ckw4
 Za7R8hZ/cE3f2TiyVwYPBTs/YZD3HTNgku2cBYmTN28Hak4W0sdhFkIpTfG0g3wtGrMTI3kOQ
 KTE97weUfWk+qA5vJ7EVzfYmgBySGyg0S8vyD+UFeEiXex7LU7Z3GF7lpxkMdZSDKkqsrWl2A
 TcbJPwPXeFeKXy3+oNbF0Eu5zVf8kOwCuhel7IP1ptKovjN2bTbQpH9Pi16JCYfwW59zdXql3
 8yNGgsLzOx7NX50z3t9ya7QlPXnHIUYQMCcBxCgm1G9KhGF8Wn/wJEeFarjOhaTj9O1bRd+Ne
 nn+/mfKPxCA+OEXluUpa0c9jgVOj1+Sp8sttlFDjWwqAD79/vNJRiGjM0PcQr4/yE/2ifZzWb
 Dvfh2lBET0JQoxrDcCHsh45hPONxBdW/1+lLuDFJ9uYbfZ8bKtAFAf+KQ1RWhe7oW99+JdnhU
 VC25Hz1QNjSnk8r7Q6bn9/vCjz5Ltb/dgS5iC83UrN2XFwBEo7ywj2+H0dYzkSz/iwO6BM8tR
 rNfB+3YWmHKOPjSfwO+GddPol59/Xs488xo/W8hQZ8mXbiObxAiWaQqM8Hh+24ZMPM8AyX63U
 GpwloYCfc69PHHxKrD9W41xH/fpfx9kCzKx2/2/G2/gSzPgNzasrtr5hMuwt9lxpy7eTzyNzg
 M5Wuy/8utZzq+Q0mSbnNy4iz/DuNeRiQTuc40ucvAhK4sV+Ck8Vs8h5cKZBqWCSLzdllQ=
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Do not check the return value of the commit_creds call in
join_session_keyring in order to make the code more concise.
Since commit_creds always returns 0, the if-statement is not needed
and the session keyring's serial can be directly assigned to the
"ret" variable.

Signed-off-by: Marcus Huewe <suse-tux@gmx.de>
=2D--
 security/keys/process_keys.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index 09541de31f2f..e7cd1ff84709 100644
=2D-- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -840,7 +840,7 @@ long join_session_keyring(const char *name)
 	const struct cred *old;
 	struct cred *new;
 	struct key *keyring;
-	long ret, serial;
+	long ret;

 	new =3D prepare_creds();
 	if (!new)
@@ -853,10 +853,8 @@ long join_session_keyring(const char *name)
 		if (ret < 0)
 			goto error;

-		serial =3D new->session_keyring->serial;
-		ret =3D commit_creds(new);
-		if (ret =3D=3D 0)
-			ret =3D serial;
+		ret =3D new->session_keyring->serial;
+		commit_creds(new);
 		goto okay;
 	}

=2D-
2.22.0

