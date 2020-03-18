Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C056518A72B
	for <lists+keyrings@lfdr.de>; Wed, 18 Mar 2020 22:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgCRVlv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Mar 2020 17:41:51 -0400
Received: from mail.rosalinux.ru ([195.19.76.54]:34312 "EHLO mail.rosalinux.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbgCRVlu (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Mar 2020 17:41:50 -0400
X-Greylist: delayed 588 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Mar 2020 17:41:50 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.rosalinux.ru (Postfix) with ESMTP id 59136D6F76F95;
        Thu, 19 Mar 2020 00:32:01 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
        by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id vEBJrQ_agJiR; Thu, 19 Mar 2020 00:31:46 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
        by mail.rosalinux.ru (Postfix) with ESMTP id ED54BD68A0074;
        Thu, 19 Mar 2020 00:31:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru ED54BD68A0074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
        s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1584567106;
        bh=OLZmYDkiQvs3u1GvR5c0MQQi01rmIE2Bh3XgwpIg5yA=;
        h=To:From:Message-ID:Date:MIME-Version;
        b=EFozWfUN30D/226h7IZAyPnKysjfb5/TW6iRx1ekEq1nmPTVDV7/ZMt40AFGgNSVr
         q1BSkzqnB2coScnRPnWDajGI3Bu+YLKHuAg0EBFQ40SZV7bWXmCuzAEbXMYfH9yrmM
         BPHCmhi+EqX6Ibk6cQtABx4Wr2vorrtAppFyItvaK939ogUJjXg5ZB4QwWGldAcvdH
         1MLUV54Y9AhWlgA0xYPJtJvRU9wLdEJsEe0BDF8+mLUMFNcxqKIve8iumQF7cP5wyg
         iU1ZmmTfd6sQ8H8juqOM/C3tIDjEaycAejTL5PP1f+gh6iUBzhEoUS9EClEe80B3C3
         5rJnFV+k2MCtA==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
        by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Um9Klry3hGBe; Thu, 19 Mar 2020 00:31:45 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-24.ip.moscow.rt.ru [90.154.70.24])
        by mail.rosalinux.ru (Postfix) with ESMTPSA id BC344D688A072;
        Thu, 19 Mar 2020 00:31:45 +0300 (MSK)
To:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
From:   Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: sign-file: full functionality with modern LibreSSL
Message-ID: <f13b4174-bcfa-6569-0601-65a9bfc9bb92@rosalinux.ru>
Date:   Thu, 19 Mar 2020 00:31:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Current pre-release version of LibreSSL has enabled CMS support,
and now sign-file is fully functional with it.

See https://github.com/libressl-portable/openbsd/commits/master

To test buildability with current LibreSSL:
~$ git clone https://github.com/libressl-portable/portable.git
~$ cd portable && ./autogen.sh
~$ ./configure --prefix=3D/opt/libressl
~$ make
~# make install
Go to the kernel source tree and:
~$ gcc -I/opt/libressl/include -L /opt/libressl/lib -lcrypto -Wl,-rpath,/=
opt/libressl/lib scripts/sign-file.c -o scripts/sign-file

Fixes: f8688017 ("sign-file: fix build error in sign-file.c with libressl=
")

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
=C2=A0scripts/sign-file.c | 7 ++++---
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f57..fd4d7c31d1bf 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -41,9 +41,10 @@
=C2=A0 * signing with anything other than SHA1 - so we're stuck with that=
 if such is
=C2=A0 * the case.
=C2=A0 */
-#if defined(LIBRESSL_VERSION_NUMBER) || \
-=C2=A0=C2=A0=C2=A0 OPENSSL_VERSION_NUMBER < 0x10000000L || \
-=C2=A0=C2=A0=C2=A0 defined(OPENSSL_NO_CMS)
+#if defined(OPENSSL_NO_CMS) || \
+=C2=A0=C2=A0=C2=A0 ( defined(LIBRESSL_VERSION_NUMBER) \
+=C2=A0=C2=A0=C2=A0 && (LIBRESSL_VERSION_NUMBER < 0x3010000fL) ) || \
+=C2=A0=C2=A0=C2=A0 OPENSSL_VERSION_NUMBER < 0x10000000L
=C2=A0#define USE_PKCS7
=C2=A0#endif
=C2=A0#ifndef USE_PKCS7
--=20
2.20.1


