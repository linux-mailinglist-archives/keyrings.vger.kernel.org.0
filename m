Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17F71F773F
	for <lists+keyrings@lfdr.de>; Fri, 12 Jun 2020 13:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgFLLZk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Jun 2020 07:25:40 -0400
Received: from mout.gmx.net ([212.227.15.19]:38369 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbgFLLZk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 12 Jun 2020 07:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1591961134;
        bh=YUBTRyPitMtGkuAhL3alLAU7/epWf4XysoinO2nX83g=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=OZQfEXQHorp0qiJkCIbg8qkHMPTyIsIYzC8sX69T3w0IIbtpy1+JrUECzhDyRXsiM
         vCGqfyQofuGo5GESQkDYQrzhrq3JESE9kndyltawKt45kGAdgZlnv4otPjOM8Q3kDd
         v2Dx3tCnfx0f/DCWsJMWeV2a1gJYVEGPRaUffZT0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([84.171.145.76]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FnZ-1joONd1MFb-006OJV; Fri, 12
 Jun 2020 13:25:34 +0200
Date:   Fri, 12 Jun 2020 13:25:33 +0200
From:   Marcus Huewe <suse-tux@gmx.de>
To:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com
Cc:     keyrings@vger.kernel.org
Subject: [PATCH] keys: Do not check the retval of commit_creds in
 join_session_keyring
Message-ID: <c8ccba0bbcb9147fb220fd18b3b5e1e951b6d5fd.1591960478.git.suse-tux@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vTIWjGlZ5MMd7pQeVMqycJ3aghXmO6d8CLKZGhTwy7wOUdrUlIk
 dZf751aNqZRJ3RdjB1Mji+q5HBCzyj/TtYkymYXzKqBFHbYuFtRi/D+MvJqnWTo3QOJ8INI
 n9foZtMJFhx2ZiAozqD2MoITIWvsVX+9OcIdbimMp5Q1HJlcBfDyU7UAB6eguXEfo56syN+
 GFYsdMlyZyjyTkhwGOVAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cpsj1vRvDU0=:Ca94a39LDHafmiciCJQOcS
 X0XNdnR+zcvldMIpiP/HySwYpWzo9oVHN2nogvgIbddQIeMHYmvZzS4o2MJjTML1eDkxVE9q8
 MsCuSGwL2CGlVQwLDasukslAaw768fC5I7+XIUUKrpGDTOISQId+nR+w+mL+TyFGkx6zPM1x3
 vSesWjYVbrl/SPZ4Py8/+qhBMprK6zzl6WQe5Wq8yYjb5Fff1u3KOypXg5tNugYRLhFcX/Ydd
 RHtcOZkJH323baqalzMXc8czMU+w1mm3uAPuyJKcgfs+89v78wcVoaXHEjSYD7xHsg4hj0xlI
 WJtd2hlZ7P+mwpOYvtB5uK27hWz3W+FeZMxkfBKeU5yP2SELRKpneZYemimTb7aXXFEbhUzOw
 DUkvO/P1K4i6L8zLUg1yv3cAW4cw6a2zCKjrrjXhez/9b7ZbAe9xwBpkhUCHkGRiB0Iq5Mdj+
 4TJX/tBr45pBnrdWFHPJG3+EwXnMEdKHwXUnKkI7xvMYTtNeMxAhrJfOcFlfHWWLz5nJVLvkM
 hd8ts118ZYkhT9BOFEmfSSJAd5/wkDAXfbEohy53r2FlAqMpTj0jgemwpKEvJ5m3tlLYr06aD
 A8KFoeMDqI19c0HbSqK8dkXo1O7w4NmJRMzmKAXtAaPrHZsY00SWh3wekxApJk+8R3WuXnuB2
 YxEMtVcnpYdOv/77KBhn5KFn250m/gUCP5hD1+LIl24qgWtcqnoHd03qO+pq9jRhYKnVjbrBh
 94oKAjzefA6qIPRuRubSVP3Rbug4+iXK9HTv3DDjwP1JEebhdRjnBDSL4bvFSyyevE1YLxtBn
 HVyNiC5Z6O96tOILfP3dttRS1OXO1ue2GYE1+gy8DjgboQUO91JO9jI9vbzsIE3+P8mPGjAIc
 r4VKXu/84immS6vDu2jvi0JgEBx8V00kPJbn/tTLj6qxv/eTFf7L1EZk2k7FaDa/g5NpaTAL/
 VseKt6/X96diPc1YaooWgEtXP4APgOCyWI9xV0x9Fd6dAIuFQihM06IdrIDl7aMzvZK0p5cKs
 cHwnkcBJP2yeiS1bvO1J56V9c/DZcu1O5+ICjD3x1l2JTZmptiqvXMfSanzl6SDuVQ4u2cC0E
 coZn/KSAbv3l6Xck93GFqSRUbRbWWSdJk7BmWSuSs8tXM+JRn6gtQud4pyGQrWzLSWU8m169X
 MuLNpzSftJOF2szo6wLhmS+D80XpfQ4EeYXs9TtbTHyx8E2oX5Th+k4s9mZe1f0x5VeHNu1JR
 JCQMv+cDrywf9Ywam
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
2.26.2

