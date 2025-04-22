Return-Path: <keyrings+bounces-2658-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322BCA96F19
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 16:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290D9188C6B6
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 14:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1166128C5C5;
	Tue, 22 Apr 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d6KBPBDB"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39C28C5DC
	for <keyrings@vger.kernel.org>; Tue, 22 Apr 2025 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332830; cv=none; b=e2F/QZwt7X1FwE7D8rbA3HMjYqkdMqv+5o4Bh7LwSlTsF0jfmVTEZvfPcVhXHRHVSfYmU4f3mtJEs4kAxJIhMsCW8oe7J1r2ciMyWURBu1008iL6R2USxwqU4XProNFoQThr3znW3GWtOuDGMYtC4nxcDukqMnXUIYrpf39y1po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332830; c=relaxed/simple;
	bh=B3D+mYCe5PZJPRz2I9bt99gaau/z8dk0tPA2M5m5/S0=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=cAeBRKqViBLNp7n07upIl8iHCXhcfhLSmpxgKre1rAXJk8R3cTVcU92GwfrTbaiufV9XgacQ8XbLhsrBxD9PtgtPWWyROSez9GgFcRANl4nC0s82L6ukbxL5Dx0dk4dT0hcGx6xgrvCEhKnNZmh5kDgRx1mCn9zd859Xj1LKLXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d6KBPBDB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745332827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BoLYXqsta2hUBn8Wl8nPl9sHgiAGa7YAHmZkLomQDiA=;
	b=d6KBPBDBpvQsEPgxPGZvy8mbvcalCKPK0Vdx990Xz/bDU3ivvo5uiH0i/Vhpk38voXOHG7
	35z+lpKExAeSXJaAiZq+lh9N9/HhbYeUjtpa2gX0BNit4qIH6CNDG8uo80PUp+SfuIxt9L
	TZ0AudXbVwV9DhR4QAzrQGkCrz3/Fxc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-30-uU-NgTD6OCSbvJMP1VNDWw-1; Tue,
 22 Apr 2025 10:40:23 -0400
X-MC-Unique: uU-NgTD6OCSbvJMP1VNDWw-1
X-Mimecast-MFC-AGG-ID: uU-NgTD6OCSbvJMP1VNDWw_1745332822
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72311195605F;
	Tue, 22 Apr 2025 14:40:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 19DE51800374;
	Tue, 22 Apr 2025 14:40:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
cc: dhowells@redhat.com, keyrings@vger.kernel.org
Subject: [PATCH keyutils] test: Hide endianness
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2813084.1745332819.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Apr 2025 15:40:19 +0100
Message-ID: <2813085.1745332819@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Jarkko,

Having tried a bunch of ways to determine the cpu endianness so that I can
generate model content to compare against the raw contents of a keying, I
think it might be better to sidestep the problem and rely on 'od' to bytes=
wap
the raw contents and then compare.  What do you think?

David
---
test: Hide endianness

Hide the endianness of the raw binary contents of a keyring by passing it
through /usr/bin/od which will automatically byteswap it in 4-byte chunks
rather than trying to detect the endianness by examining what may be a
binary file to obtain a string the format of which changes over time.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 tests/keyctl/reading/valid/runtest.sh |    9 ++-------
 tests/toolbox.inc.sh                  |   36 +++++++++++++++++++++++-----=
--------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/=
valid/runtest.sh
index 2fb88b9..2527f13 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -40,13 +40,8 @@ expect_payload payload "67697a7a 617264"
 =

 # read the contents of the keyring as hex and match it to the key ID
 marker "READ KEYRING"
-read_key $keyringid
-tmp=3D`printf %08x $keyid`
-if [ "$endian" =3D "LE" ]
-then
-    tmp=3D`echo $tmp | sed 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/'`
-fi
-expect_payload payload $tmp
+pipe_key_int32 $keyringid
+expect_payload payload $keyid
 =

 # remove read permission from the key and try reading it again
 # - we should still have read permission because it's searchable in our
diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 609a6c7..6f4fb18 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -12,19 +12,6 @@
 =

 echo =3D=3D=3D $OUTPUTFILE =3D=3D=3D
 =

-endian=3D`file -L /proc/$$/exe`
-if expr "$endian" : '.* MSB \+\(pie executable\|executable\|shared object=
\).*' >&/dev/null
-then
-    endian=3DBE
-elif expr "$endian" : '.* LSB \+\(pie executable\|executable\|shared obje=
ct\).*' >&/dev/null
-then
-    endian=3DLE
-else
-    echo -e "+++ \e[31;1mCan't Determine Endianness\e[0m"
-    echo "+++ Can't Determine Endianness" >>$OUTPUTFILE
-    exit 2
-fi
-
 maxtypelen=3D31
 maxtype=3D`for ((i=3D0; i<$((maxtypelen)); i++)); do echo -n a; done`
 =

@@ -1055,6 +1042,29 @@ function pipe_key ()
     fi
 }
 =

+#########################################################################=
######
+#
+# pipe a key's raw payload to od to stdout, displaying it as a sequence o=
f
+# 32-bit numbers, appropriately byteswapped.
+#
+#########################################################################=
######
+function pipe_key_int32 ()
+{
+    my_exitval=3D0
+    if [ "x$1" =3D "x--fail" ]
+    then
+	my_exitval=3D1
+	shift
+    fi
+
+    echo keyctl pipe $1 \| od -t u4 -A none >>$OUTPUTFILE
+    echo `keyctl pipe $1 | od -t u4 -A none` >>$OUTPUTFILE 2>&1
+    if [ $? !=3D $my_exitval ]
+    then
+	failed
+    fi
+}
+
 #########################################################################=
######
 #
 # pipe a key's raw payload through md5sum


