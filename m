Return-Path: <keyrings+bounces-2661-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDDA9AADC
	for <lists+keyrings@lfdr.de>; Thu, 24 Apr 2025 12:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C400A19431D5
	for <lists+keyrings@lfdr.de>; Thu, 24 Apr 2025 10:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D1C1E5B6A;
	Thu, 24 Apr 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+Vc85CK"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282491E9B32
	for <keyrings@vger.kernel.org>; Thu, 24 Apr 2025 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491490; cv=none; b=Q+m8TpG9VpGuPwMHQsZ8lvttzYpkLf/bYRiI4f+l+1GZdKALpcNaOmoED/Sv06cMnK4aJ/fhT1ekx6B/pAk7Q8+LK/0BvITSV/Wjj+fcx3esjtn/lLO4R2bmEgHt9kvReFVnI2YmXQ/oTp9tspoJWe/vXUOO7bnT4yJwVBB0t+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491490; c=relaxed/simple;
	bh=srPpCwBBTBcG0UQ7pTmo2VgxvZVnw2VFQ1x90p51RJY=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=HayZ4Ag75AyAGy5rmRuVprg1rQaXhvMvuu2+oICZuDNMXd7lQ7WVvxVJYQezc8xC86X3SNZCqhW1ENoX4yiA00HNIsemfBJX3vhLjy1ecD4Hcn0yxRi4xNJkDqIP6F2B41JhNo4uOrzSXSWLnA0c5gNmXKCcMcP3k9uJmvxrMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+Vc85CK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745491487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WMLLQpRUhw0b6j7lrq1jp33gLec8Zcw4oSoDT5hT84Y=;
	b=J+Vc85CKFdtg2AKfMUU3/VBVQsAlmiiXrZ2ccU0LVepWKA+iEf3t4n9jWT5lpvS97w5vam
	kJcm2fVilGI+81ceVzzuLnKd05Uhs+mBsoPXKvmTqtTpadqiVlEFTSUvcWGFD5uYWawajj
	jmp9m+8zksIjP334iPe90z4/vDsaaLU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-225-_4NUA1_PPZyL4VA0wGO82A-1; Thu,
 24 Apr 2025 06:44:43 -0400
X-MC-Unique: _4NUA1_PPZyL4VA0wGO82A-1
X-Mimecast-MFC-AGG-ID: _4NUA1_PPZyL4VA0wGO82A_1745491483
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8CAD19560AF;
	Thu, 24 Apr 2025 10:44:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C991C180047F;
	Thu, 24 Apr 2025 10:44:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
cc: dhowells@redhat.com, keyrings@vger.kernel.org
Subject: [PATCH keyutils] tests: Add skips for testing of unsupported features
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3089642.1745491480.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Apr 2025 11:44:40 +0100
Message-ID: <3089643.1745491480@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Jarkko,

Here's a patch I'm proposing to add to the keyutils testsuite so that I ca=
n
use it with some older OS versions.

David
---
tests: Add skips for testing of unsupported features

Add skips for features that are either unsupported by the kernel or by the
keyutils package.
    =

Signed-off-by: David Howells <dhowells@redhat.com>
---
 tests/features/limits/runtest.sh          |    6 +++++
 tests/hex2bin.pl                          |   21 +++++++++++++++++++
 tests/keyctl/id/bad-args/runtest.sh       |    6 +++++
 tests/keyctl/id/noargs/runtest.sh         |    6 +++++
 tests/keyctl/id/valid/runtest.sh          |    6 +++++
 tests/keyctl/move/bad-args/runtest.sh     |    6 +++++
 tests/keyctl/move/noargs/runtest.sh       |    6 +++++
 tests/keyctl/move/recursion/runtest.sh    |    6 +++++
 tests/keyctl/move/valid/runtest.sh        |    6 +++++
 tests/keyctl/session/valid2/runtest.sh    |    6 +++++
 tests/keyctl/supports/bad-args/runtest.sh |    6 +++++
 tests/keyctl/supports/valid/runtest.sh    |    6 +++++
 tests/prepare.inc.sh                      |   23 ++++++++++++++++++++
 tests/toolbox.inc.sh                      |   33 ++++++++++++++++++++++++=
------
 14 files changed, 136 insertions(+), 7 deletions(-)

diff --git a/tests/features/limits/runtest.sh b/tests/features/limits/runt=
est.sh
index 3af2f5a..7642071 100644
--- a/tests/features/limits/runtest.sh
+++ b/tests/features/limits/runtest.sh
@@ -9,6 +9,12 @@
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

+if ! keyutils_at_or_later_than 1.6.2
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl --test'"
+    exit 0
+fi
+
 # This doesn't work on MIPS earler than 3.19 because of a kernel bug
 kver=3D`uname -r`
 kmch=3D`uname -m`
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
+my $str =3D "";
+
+if ($ARGV[0] eq "-") {
+    shift(@ARGV);
+    $str .=3D $_ while (<STDIN>);
+} else {
+    $str =3D join("", @ARGV);
+}
+
+$str =3D~ s/[ \t\n]//g;
+die "odd length string\n" if (length($str) & 1);
+
+for (; $str; $str =3D substr($str, 2)) {
+    my $pair =3D hex(substr($str, 0, 2));
+    print pack("C", $pair);
+}
diff --git a/tests/keyctl/id/bad-args/runtest.sh b/tests/keyctl/id/bad-arg=
s/runtest.sh
index 957d1a5..bba62c6 100644
--- a/tests/keyctl/id/bad-args/runtest.sh
+++ b/tests/keyctl/id/bad-args/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_id_command =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/id/noargs/runtest.sh b/tests/keyctl/id/noargs/ru=
ntest.sh
index aff9de6..b95c596 100644
--- a/tests/keyctl/id/noargs/runtest.sh
+++ b/tests/keyctl/id/noargs/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_id_command =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/id/valid/runtest.sh b/tests/keyctl/id/valid/runt=
est.sh
index ffed995..2c06b3d 100644
--- a/tests/keyctl/id/valid/runtest.sh
+++ b/tests/keyctl/id/valid/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_id_command =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/move/bad-args/runtest.sh b/tests/keyctl/move/bad=
-args/runtest.sh
index b1c7e66..9410941 100644
--- a/tests/keyctl/move/bad-args/runtest.sh
+++ b/tests/keyctl/move/bad-args/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_move_key =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/move/noargs/runtest.sh b/tests/keyctl/move/noarg=
s/runtest.sh
index 29a91f1..8ad91e9 100644
--- a/tests/keyctl/move/noargs/runtest.sh
+++ b/tests/keyctl/move/noargs/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_move_key =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/move/recursion/runtest.sh b/tests/keyctl/move/re=
cursion/runtest.sh
index 36cd5cb..8b90be8 100644
--- a/tests/keyctl/move/recursion/runtest.sh
+++ b/tests/keyctl/move/recursion/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_move_key =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/move/valid/runtest.sh b/tests/keyctl/move/valid/=
runtest.sh
index 31b51d7..20ccff2 100644
--- a/tests/keyctl/move/valid/runtest.sh
+++ b/tests/keyctl/move/valid/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_move_key =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/session/valid2/runtest.sh b/tests/keyctl/session=
/valid2/runtest.sh
index 12ad234..1642395 100644
--- a/tests/keyctl/session/valid2/runtest.sh
+++ b/tests/keyctl/session/valid2/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_id_command =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/supports/bad-args/runtest.sh b/tests/keyctl/supp=
orts/bad-args/runtest.sh
index 05581a4..f87f517 100644
--- a/tests/keyctl/supports/bad-args/runtest.sh
+++ b/tests/keyctl/supports/bad-args/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_capabilities =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl supports'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/keyctl/supports/valid/runtest.sh b/tests/keyctl/support=
s/valid/runtest.sh
index 2c62ef2..4e41200 100644
--- a/tests/keyctl/supports/valid/runtest.sh
+++ b/tests/keyctl/supports/valid/runtest.sh
@@ -6,6 +6,12 @@
 =

 # ---- do the actual testing ----
 =

+if [ $have_capabilities =3D 0 ]
+then
+    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl supports'"
+    exit 0
+fi
+
 result=3DPASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 =

diff --git a/tests/prepare.inc.sh b/tests/prepare.inc.sh
index 4033d69..be134da 100644
--- a/tests/prepare.inc.sh
+++ b/tests/prepare.inc.sh
@@ -112,11 +112,14 @@ then
     esac
 fi
 =

+have_capabilities=3D0
 have_key_invalidate=3D0
 have_big_key_type=3D0
 have_dh_compute=3D0
-have_restrict_keyring=3D0
+have_move_key=3D0
 have_notify=3D0
+have_public_key=3D0
+have_restrict_keyring=3D0
 =

 if keyctl supports capabilities >&/dev/null
 then
@@ -179,3 +182,21 @@ if [ "$SKIPINSTALLREQ" =3D "yes" ]
 then
     skip_install_required=3D1
 fi
+
+#
+# Check if "keyctl id" is supported
+#
+have_id_command=3D0
+if keyutils_at_or_later_than 1.6.2
+then
+    have_id_command=3D1
+fi
+
+#
+# Check if "keyctl pkey_*" are supported
+#
+have_pkey_commands=3D0
+if keyutils_at_or_later_than 1.6
+then
+    have_pkey_commands=3D1
+fi
diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 6f4fb18..212b353 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -613,8 +613,15 @@ function create_key ()
 	my_keyring=3D$4
     fi
 =

-    echo keyctl add "$@" >>$OUTPUTFILE
-    keyctl add "$@" >>$OUTPUTFILE 2>&1
+    if [ "$1" =3D "-x" ] && version_less_than $OSRELEASE 9
+    then
+	shift
+	echo perl ../../../hex2bin.pl "$3" "|" keyctl padd "$1 $2 $4" >>$OUTPUTF=
ILE
+	perl ../../../hex2bin.pl "$3" | keyctl padd "$1" "$2" "$4" >>$OUTPUTFILE
+    else
+	echo keyctl add "$@" >>$OUTPUTFILE
+	keyctl add "$@" >>$OUTPUTFILE 2>&1
+    fi
     e=3D$?
     if [ $e =3D=3D $my_exitval ]
     then
@@ -682,8 +689,15 @@ function pcreate_key ()
 	my_keyring=3D$3
     fi
 =

-    echo echo -n $data \| keyctl padd "$@" >>$OUTPUTFILE
-    echo -n $data | keyctl padd "$@" >>$OUTPUTFILE 2>&1
+    if [ "$1" =3D "-x" ] && version_less_than $OSRELEASE 9
+    then
+	shift
+	echo echo -n $data \| perl ../../../hex2bin.pl "|" keyctl padd "$@" >>$O=
UTPUTFILE
+	echo -n $data | perl ../../../hex2bin.pl - | keyctl padd "$@" >>$OUTPUTF=
ILE
+    else
+	echo echo -n $data \| keyctl padd "$@" >>$OUTPUTFILE
+	echo -n $data | keyctl padd "$@" >>$OUTPUTFILE 2>&1
+	fi
     e=3D$?
     if [ $e =3D=3D $my_exitval ]
     then
@@ -1232,8 +1246,15 @@ function update_key ()
 	shift
     fi
 =

-    echo keyctl update "$@" >>$OUTPUTFILE
-    keyctl update "$@" >>$OUTPUTFILE 2>&1
+    if [ "x$1" =3D "x-x" ] && version_less_than $OSRELEASE 9
+    then
+	shift
+	echo perl ../../../hex2bin.pl "$2" "|" keyctl pupdate "$1" >>$OUTPUTFILE
+	perl ../../../hex2bin.pl "$2" | keyctl pupdate "$1" >>$OUTPUTFILE
+    else
+	echo keyctl update "$@" >>$OUTPUTFILE
+	keyctl update "$@" >>$OUTPUTFILE 2>&1
+    fi
     e=3D$?
     if [ $e =3D=3D $my_exitval ]
     then


