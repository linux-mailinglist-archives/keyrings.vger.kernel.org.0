Return-Path: <keyrings+bounces-2974-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F5B31BC0
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1FD76437C0
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1333128B6;
	Fri, 22 Aug 2025 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+qMWtEN"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293A73128AC
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872560; cv=none; b=IsHbzCB7ZD34F589XC2nCrjh9hP0xULNBntcKVXZMIOAQyRUL6Mowq/grxt86fp3jB/LRW/Q0g69NfF/TDQqz8wbmU8jBxD4Yq2sYd5Fqt3jj85VBuEaOZgIpL6U/fw8B5qhEtuXVE85gR/vQ5ZKT6Uszp5wEuhFTyokOMn42Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872560; c=relaxed/simple;
	bh=TraykhXuNIeDPi+bm5l609BGmj55Eaa3Z/gNt9JbzHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhZ43DgnM0nxrkBbd12defkebbZY6yETiKaeFBnzYTnqNsaTylL0Z7o9sA1YE6IU8omBqvtXli+e3cvkIOEI/jGl8cs6Lxe9nI49P60iKHatBufb9ktfe2QuCu7CvalbFb7ZiBdctsmSMeXvzdwDkpdx2m2OLkzfrcDPjXQU8xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+qMWtEN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySRlbhyiwv/BltP0wsJJxLGif0rcRHsxShcb/MRRnzw=;
	b=h+qMWtENXWuSuARrxRWrW/rWVfkerq5IiRaQB0O8zE2N1KGqCI8ij5Ig0G8ZjJ7dcQfVWV
	jjmxcNnOFaFIcktr46qLOCkm9uwuiWtVnH31VkiU0WtYAl5fPqfftk9T6FmQiHRFORmQrq
	3PX6a9ftiGjja6e60RZApbtAvrzt4pE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-9-FfmtpcN8CA_5njh_efFg-1; Fri,
 22 Aug 2025 10:22:31 -0400
X-MC-Unique: 9-FfmtpcN8CA_5njh_efFg-1
X-Mimecast-MFC-AGG-ID: 9-FfmtpcN8CA_5njh_efFg_1755872550
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A57681956089;
	Fri, 22 Aug 2025 14:22:30 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72F9718003FC;
	Fri, 22 Aug 2025 14:22:29 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] tests: Add skips for testing of unsupported features
Date: Fri, 22 Aug 2025 15:22:11 +0100
Message-ID: <20250822142215.2475014-5-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Add skips for features that are either unsupported by the kernel or by the
keyutils package.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/keyrings/3089643.1745491480@warthog.procyon.org.uk/
---
 tests/features/limits/runtest.sh          |  6 +++++
 tests/hex2bin.pl                          | 21 +++++++++++++++
 tests/keyctl/id/bad-args/runtest.sh       |  6 +++++
 tests/keyctl/id/noargs/runtest.sh         |  6 +++++
 tests/keyctl/id/valid/runtest.sh          |  6 +++++
 tests/keyctl/move/bad-args/runtest.sh     |  6 +++++
 tests/keyctl/move/noargs/runtest.sh       |  6 +++++
 tests/keyctl/move/recursion/runtest.sh    |  6 +++++
 tests/keyctl/move/valid/runtest.sh        |  6 +++++
 tests/keyctl/session/valid2/runtest.sh    |  6 +++++
 tests/keyctl/supports/bad-args/runtest.sh |  6 +++++
 tests/keyctl/supports/valid/runtest.sh    |  6 +++++
 tests/prepare.inc.sh                      | 23 +++++++++++++++-
 tests/toolbox.inc.sh                      | 33 ++++++++++++++++++-----
 14 files changed, 136 insertions(+), 7 deletions(-)
 create mode 100644 tests/hex2bin.pl

diff --git a/tests/features/limits/runtest.sh b/tests/features/limits/runtest.sh
index 3af2f5a..7642071 100644
--- a/tests/features/limits/runtest.sh
+++ b/tests/features/limits/runtest.sh
@@ -9,6 +9,12 @@
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
+if ! keyutils_at_or_later_than 1.6.2
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl --test'"
+    exit 0
+fi
+
 # This doesn't work on MIPS earler than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
diff --git a/tests/hex2bin.pl b/tests/hex2bin.pl
new file mode 100644
index 0000000..4f0f27a
--- /dev/null
+++ b/tests/hex2bin.pl
@@ -0,0 +1,21 @@
+#!/usr/bin/perl -w
+use strict;
+
+die "Format:\n\t$0 <hex> [<hex>]*\n\t$0 -\n" unless (@ARGV);
+
+my $str = "";
+
+if ($ARGV[0] eq "-") {
+    shift(@ARGV);
+    $str .= $_ while (<STDIN>);
+} else {
+    $str = join("", @ARGV);
+}
+
+$str =~ s/[ \t\n]//g;
+die "odd length string\n" if (length($str) & 1);
+
+for (; $str; $str = substr($str, 2)) {
+    my $pair = hex(substr($str, 0, 2));
+    print pack("C", $pair);
+}
diff --git a/tests/keyctl/id/bad-args/runtest.sh b/tests/keyctl/id/bad-args/runtest.sh
index 957d1a5..bba62c6 100644
--- a/tests/keyctl/id/bad-args/runtest.sh
+++ b/tests/keyctl/id/bad-args/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_id_command = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/id/noargs/runtest.sh b/tests/keyctl/id/noargs/runtest.sh
index aff9de6..b95c596 100644
--- a/tests/keyctl/id/noargs/runtest.sh
+++ b/tests/keyctl/id/noargs/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_id_command = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/id/valid/runtest.sh b/tests/keyctl/id/valid/runtest.sh
index ffed995..2c06b3d 100644
--- a/tests/keyctl/id/valid/runtest.sh
+++ b/tests/keyctl/id/valid/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_id_command = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/move/bad-args/runtest.sh b/tests/keyctl/move/bad-args/runtest.sh
index b1c7e66..9410941 100644
--- a/tests/keyctl/move/bad-args/runtest.sh
+++ b/tests/keyctl/move/bad-args/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_move_key = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/move/noargs/runtest.sh b/tests/keyctl/move/noargs/runtest.sh
index 29a91f1..8ad91e9 100644
--- a/tests/keyctl/move/noargs/runtest.sh
+++ b/tests/keyctl/move/noargs/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_move_key = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/move/recursion/runtest.sh b/tests/keyctl/move/recursion/runtest.sh
index 36cd5cb..8b90be8 100644
--- a/tests/keyctl/move/recursion/runtest.sh
+++ b/tests/keyctl/move/recursion/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_move_key = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/move/valid/runtest.sh b/tests/keyctl/move/valid/runtest.sh
index 31b51d7..20ccff2 100644
--- a/tests/keyctl/move/valid/runtest.sh
+++ b/tests/keyctl/move/valid/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_move_key = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/session/valid2/runtest.sh b/tests/keyctl/session/valid2/runtest.sh
index 12ad234..1642395 100644
--- a/tests/keyctl/session/valid2/runtest.sh
+++ b/tests/keyctl/session/valid2/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_id_command = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/supports/bad-args/runtest.sh b/tests/keyctl/supports/bad-args/runtest.sh
index 05581a4..f87f517 100644
--- a/tests/keyctl/supports/bad-args/runtest.sh
+++ b/tests/keyctl/supports/bad-args/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_capabilities = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl supports'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/keyctl/supports/valid/runtest.sh b/tests/keyctl/supports/valid/runtest.sh
index 2c62ef2..4e41200 100644
--- a/tests/keyctl/supports/valid/runtest.sh
+++ b/tests/keyctl/supports/valid/runtest.sh
@@ -6,6 +6,12 @@
 
 # ---- do the actual testing ----
 
+if [ $have_capabilities = 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl supports'"
+    exit 0
+fi
+
 result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
diff --git a/tests/prepare.inc.sh b/tests/prepare.inc.sh
index 4033d69..be134da 100644
--- a/tests/prepare.inc.sh
+++ b/tests/prepare.inc.sh
@@ -112,11 +112,14 @@ then
     esac
 fi
 
+have_capabilities=0
 have_key_invalidate=0
 have_big_key_type=0
 have_dh_compute=0
-have_restrict_keyring=0
+have_move_key=0
 have_notify=0
+have_public_key=0
+have_restrict_keyring=0
 
 if keyctl supports capabilities >&/dev/null
 then
@@ -179,3 +182,21 @@ if [ "$SKIPINSTALLREQ" = "yes" ]
 then
     skip_install_required=1
 fi
+
+#
+# Check if "keyctl id" is supported
+#
+have_id_command=0
+if keyutils_at_or_later_than 1.6.2
+then
+    have_id_command=1
+fi
+
+#
+# Check if "keyctl pkey_*" are supported
+#
+have_pkey_commands=0
+if keyutils_at_or_later_than 1.6
+then
+    have_pkey_commands=1
+fi
diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 6f4fb18..212b353 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -613,8 +613,15 @@ function create_key ()
 	my_keyring=$4
     fi
 
-    echo keyctl add "$@" >>$OUTPUTFILE
-    keyctl add "$@" >>$OUTPUTFILE 2>&1
+    if [ "$1" = "-x" ] && version_less_than $OSRELEASE 9
+    then
+	shift
+	echo perl ../../../hex2bin.pl "$3" "|" keyctl padd "$1 $2 $4" >>$OUTPUTFILE
+	perl ../../../hex2bin.pl "$3" | keyctl padd "$1" "$2" "$4" >>$OUTPUTFILE
+    else
+	echo keyctl add "$@" >>$OUTPUTFILE
+	keyctl add "$@" >>$OUTPUTFILE 2>&1
+    fi
     e=$?
     if [ $e == $my_exitval ]
     then
@@ -682,8 +689,15 @@ function pcreate_key ()
 	my_keyring=$3
     fi
 
-    echo echo -n $data \| keyctl padd "$@" >>$OUTPUTFILE
-    echo -n $data | keyctl padd "$@" >>$OUTPUTFILE 2>&1
+    if [ "$1" = "-x" ] && version_less_than $OSRELEASE 9
+    then
+	shift
+	echo echo -n $data \| perl ../../../hex2bin.pl "|" keyctl padd "$@" >>$OUTPUTFILE
+	echo -n $data | perl ../../../hex2bin.pl - | keyctl padd "$@" >>$OUTPUTFILE
+    else
+	echo echo -n $data \| keyctl padd "$@" >>$OUTPUTFILE
+	echo -n $data | keyctl padd "$@" >>$OUTPUTFILE 2>&1
+	fi
     e=$?
     if [ $e == $my_exitval ]
     then
@@ -1232,8 +1246,15 @@ function update_key ()
 	shift
     fi
 
-    echo keyctl update "$@" >>$OUTPUTFILE
-    keyctl update "$@" >>$OUTPUTFILE 2>&1
+    if [ "x$1" = "x-x" ] && version_less_than $OSRELEASE 9
+    then
+	shift
+	echo perl ../../../hex2bin.pl "$2" "|" keyctl pupdate "$1" >>$OUTPUTFILE
+	perl ../../../hex2bin.pl "$2" | keyctl pupdate "$1" >>$OUTPUTFILE
+    else
+	echo keyctl update "$@" >>$OUTPUTFILE
+	keyctl update "$@" >>$OUTPUTFILE 2>&1
+    fi
     e=$?
     if [ $e == $my_exitval ]
     then


