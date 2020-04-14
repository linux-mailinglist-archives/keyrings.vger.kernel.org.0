Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B540D1A809B
	for <lists+keyrings@lfdr.de>; Tue, 14 Apr 2020 17:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405517AbgDNPBZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Apr 2020 11:01:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55678 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405178AbgDNPBU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Apr 2020 11:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586876479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=BNJ2ShHeuV6cRZ6cvuASvIdGYqCK2PoGgkFRTICHqX4=;
        b=Thn6i5NlU3C5yhNgG2Df5SZCT611+IK5Q+pepsfEBcmyMgU6SITyP3qCwppTQpXA1G7cqq
        GTXSNLh8OyMiclmQ3blVs0YFn4k+VRJD0l+oLVYsmYHBK5H8sHIJNuyf6amEnCUjsis41l
        DCgb2IznFQ1/q5EvEPuhrTijorbHV1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-kQ2e62LZMdOYkQ8zuUBLYg-1; Tue, 14 Apr 2020 11:01:11 -0400
X-MC-Unique: kQ2e62LZMdOYkQ8zuUBLYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4997E149C0;
        Tue, 14 Apr 2020 15:01:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com [10.10.113.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 71B7B126510;
        Tue, 14 Apr 2020 15:01:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
cc:     dhowells@redhat.com, vvs@virtuozzo.com, keyrings@vger.kernel.org
Subject: [PATCH] keys: Fix proc_keys_next to increase position index
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3881683.1586876468.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 14 Apr 2020 16:01:08 +0100
Message-ID: <3881684.1586876468@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Jarkko,

I'm planning on passing this on to Linus if you're okay with it.  Note tha=
t
I've altered the subject and the body slightly.

David
---
commit 3e87bc31455f887a0372276990249a150e31fc5a
Author: Vasily Averin <vvs@virtuozzo.com>
Date:   Thu Jan 30 13:16:27 2020 +0300

    keys: Fix proc_keys_next to increase position index
    =

    If seq_file .next function does not change position index,
    read after some lseek can generate unexpected output:
    =

    $ dd if=3D/proc/keys bs=3D1  # full usual output
    0f6bfdf5 I--Q---     2 perm 3f010000  1000  1000 user      4af2f79ab88=
48d0a: 740
    1fb91b32 I--Q---     3 perm 1f3f0000  1000 65534 keyring   _uid.1000: =
2
    27589480 I--Q---     1 perm 0b0b0000     0     0 user      invocation_=
id: 16
    2f33ab67 I--Q---   152 perm 3f030000     0     0 keyring   _ses: 2
    33f1d8fa I--Q---     4 perm 3f030000  1000  1000 keyring   _ses: 1
    3d427fda I--Q---     2 perm 3f010000  1000  1000 user      69ec44aec76=
78e5a: 740
    3ead4096 I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.10=
00: 1
    521+0 records in
    521+0 records out
    521 bytes copied, 0,00123769 s, 421 kB/s
    =

    $ dd if=3D/proc/keys bs=3D500 skip=3D1  # read after lseek in middle o=
f last line
    dd: /proc/keys: cannot skip to specified offset
    g   _uid_ses.1000: 1        <<<< end of last line
    3ead4096 I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.10=
00: 1
       <<<< and whole last line again
    0+1 records in
    0+1 records out
    97 bytes copied, 0,000135035 s, 718 kB/s
    =

    $ dd if=3D/proc/keys bs=3D1000 skip=3D1   # read after lseek beyond en=
d of file
    dd: /proc/keys: cannot skip to specified offset
    3ead4096 I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.10=
00: 1
       <<<< generates last line
    0+1 records in
    0+1 records out
    76 bytes copied, 0,000119981 s, 633 kB/s
    =

    See https://bugzilla.kernel.org/show_bug.cgi?id=3D206283
    =

    Cc: stable@vger.kernel.org
    Fixes: 1f4aace60b0e ("fs/seq_file.c: simplify seq_file iteration code =
...")
    Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/security/keys/proc.c b/security/keys/proc.c
index 415f3f1c2da0..d0cde6685627 100644
--- a/security/keys/proc.c
+++ b/security/keys/proc.c
@@ -139,6 +139,8 @@ static void *proc_keys_next(struct seq_file *p, void *=
v, loff_t *_pos)
 	n =3D key_serial_next(p, v);
 	if (n)
 		*_pos =3D key_node_serial(n);
+	else
+		(*_pos)++;
 	return n;
 }
 =

