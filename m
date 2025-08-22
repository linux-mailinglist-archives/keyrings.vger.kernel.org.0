Return-Path: <keyrings+bounces-2972-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE9B31BDA
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38BD643EFB
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECE631282E;
	Fri, 22 Aug 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jWkNa3Gu"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CC3126CF
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872555; cv=none; b=nxHeANfkfEs3GfHsGrK1JwLoOC2GXKdYQ1WqK0QBTsBxjHU69YgKMuU7yASx+p57QchqwJu0OVsAf5DSbGTLKF7NFCFibqgAmkZHfuzFYSM4ThNI4Yhw7/k6TRkk0ohkI7X5CGDy//+CiuyGK3Jf9lEdRKrlZgdVqrCzXjbE6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872555; c=relaxed/simple;
	bh=zCypTlaDHffLCDlbMYrzU8JmLZfE78I8zAGjTuZeDwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSX9eRX0eqdTvdvDTyTcMGcFLfMYt1VwpnpI5utSfHZU1qlypnyS6J+B3va8m35y/QwKGYjypyE4Wo29K2rhrhcED7wcL/O4IeDrBbWVzGttxGJH/NUKTyrvdb6ZafmHDe4q39VRtSTql399RriITx1QK0geh+e1aQyZQ93GAdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWkNa3Gu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egP0+NYa72c2/aBcMaaZPvBLQrtUqtpQbxPIy/YKSxY=;
	b=jWkNa3Gust8+shL/PvTmtODh6OmHlLB7gpG9YyV9KLakDZeywewPMlHfRZtX9z5l+f2Hmq
	KhnWP0ixIGHyzRnlegKqAIT9L/lHqTR2/MXfE8FZl0JMbB0Mgpcd1CZjBYq4oZ0YPtNiga
	S/dQfn8dToYdG+rsmNaQlde33vdASMY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-uoZDrJKnOwSqlAEAPK7JZA-1; Fri,
 22 Aug 2025 10:22:29 -0400
X-MC-Unique: uoZDrJKnOwSqlAEAPK7JZA-1
X-Mimecast-MFC-AGG-ID: uoZDrJKnOwSqlAEAPK7JZA_1755872548
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 47447180045C;
	Fri, 22 Aug 2025 14:22:28 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11B9430001A1;
	Fri, 22 Aug 2025 14:22:26 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] test: Hide endianness
Date: Fri, 22 Aug 2025 15:22:10 +0100
Message-ID: <20250822142215.2475014-4-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hide the endianness of the raw binary contents of a keyring by passing it
through /usr/bin/od which will automatically byteswap it in 4-byte chunks
rather than trying to detect the endianness by examining what may be a
binary file to obtain a string the format of which changes over time.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/keyrings/2813085.1745332819@warthog.procyon.org.uk/
---
 tests/keyctl/reading/valid/runtest.sh |  9 ++-----
 tests/toolbox.inc.sh                  | 36 +++++++++++++++++----------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/valid/runtest.sh
index 2fb88b9..2527f13 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -40,13 +40,8 @@ expect_payload payload "67697a7a 617264"
 
 # read the contents of the keyring as hex and match it to the key ID
 marker "READ KEYRING"
-read_key $keyringid
-tmp=`printf %08x $keyid`
-if [ "$endian" = "LE" ]
-then
-    tmp=`echo $tmp | sed 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/'`
-fi
-expect_payload payload $tmp
+pipe_key_int32 $keyringid
+expect_payload payload $keyid
 
 # remove read permission from the key and try reading it again
 # - we should still have read permission because it's searchable in our
diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 609a6c7..6f4fb18 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -12,19 +12,6 @@
 
 echo === $OUTPUTFILE ===
 
-endian=`file -L /proc/$$/exe`
-if expr "$endian" : '.* MSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
-then
-    endian=BE
-elif expr "$endian" : '.* LSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
-then
-    endian=LE
-else
-    echo -e "+++ \e[31;1mCan't Determine Endianness\e[0m"
-    echo "+++ Can't Determine Endianness" >>$OUTPUTFILE
-    exit 2
-fi
-
 maxtypelen=31
 maxtype=`for ((i=0; i<$((maxtypelen)); i++)); do echo -n a; done`
 
@@ -1055,6 +1042,29 @@ function pipe_key ()
     fi
 }
 
+###############################################################################
+#
+# pipe a key's raw payload to od to stdout, displaying it as a sequence of
+# 32-bit numbers, appropriately byteswapped.
+#
+###############################################################################
+function pipe_key_int32 ()
+{
+    my_exitval=0
+    if [ "x$1" = "x--fail" ]
+    then
+	my_exitval=1
+	shift
+    fi
+
+    echo keyctl pipe $1 \| od -t u4 -A none >>$OUTPUTFILE
+    echo `keyctl pipe $1 | od -t u4 -A none` >>$OUTPUTFILE 2>&1
+    if [ $? != $my_exitval ]
+    then
+	failed
+    fi
+}
+
 ###############################################################################
 #
 # pipe a key's raw payload through md5sum


