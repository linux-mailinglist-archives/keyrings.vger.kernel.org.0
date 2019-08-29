Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E650A2843
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfH2Unl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:41 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33207 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfH2Unk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:40 -0400
Received: by mail-qk1-f194.google.com with SMTP id w18so4290058qki.0
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IAVBtAE3rVIFubplEzXT1SGp2mGkXQfSN9G7CBrXTg8=;
        b=aG1puaDliGedCbwzhHLfc6RLR8uMEucw1BJfK9XsB4vB2wo/YXtBTuTVkn6vjN+/nw
         LjwmcAGf8WZVHKUeb3jJgiwo2mAG2iFCz7oZWVZbTRLXrBuE5ITV9gVGoCYe5+NXw5XO
         QjstnC3hdnQLGpXSqeN4dsh8cOHR+ocGb/6vDZ4XvzkvPtYgpsbPy10/mZug8iR4uac6
         NeY7PyLnNhb++HgBSkDgkfnkqsfhCeMqbLaKy33LNveRkibUSLSZvCBNgxBwcj8P4jVm
         ZxHdaHfM0ejmSh+/rlI/JbWrayhjw9Aj4OENCGlA9FJE8fyOxNzbEW0k2vFiHu7azgq+
         F3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAVBtAE3rVIFubplEzXT1SGp2mGkXQfSN9G7CBrXTg8=;
        b=qv9niw4tsARp1zexcVsNsr5+8/bEy/CBFZMgwHbbnZ2Ezh6f4hDV3Z2kQknw8IXFmb
         Y00TZPvAareJA/uP9C5+rqrRDz2GrfA9H02BMLNwtdfFJCmHb5KLPK88b73wlcL0C2s+
         2bdiiAkRkXGS6ll0TYYsdJX5HkO2mI1/obXTLcRmZNNdP4xOSzXt7GzQMB967PRroDiI
         uzapbT88uvJ0R94LlTfrDlXUviN0Ysqlukm5usjbuusUV7XE++H10Jox0HeYTgRs4eQA
         HEoDC7kuqx4SP74dYlyE+oAVxcIa+NbdF24nQhTNQ7i6XEhEtPuuj1sbuKSioBtdvjSR
         +Jng==
X-Gm-Message-State: APjAAAUSYansJL5Ngx34Wnrl/KngwdFERthzqgvxnqKemYshfIzS6Hqv
        xUsHbzGaYKrGrOObx+kPBI0LGcuf
X-Google-Smtp-Source: APXvYqz0w0+NAdskgTOeiGpcQ93yY2s46z128iLCHBQyLGmQG4Y72f5i92V4nLTqtX4hc3Aij2YfaQ==
X-Received: by 2002:a05:620a:144d:: with SMTP id i13mr6919426qkl.197.1567111419762;
        Thu, 29 Aug 2019 13:43:39 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id o27sm1769332qkm.37.2019.08.29.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:39 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 04/13] keyctl: unify spelling of "unparsable"
Date:   Thu, 29 Aug 2019 16:43:12 -0400
Message-Id: <20190829204322.8015-5-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829204322.8015-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
 <20190829204322.8015-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Both spelling seems to be accepted, but the majority of uses agreed on
the "unparsable" variant.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 keyctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/keyctl.c b/keyctl.c
index 7120e38..510b019 100644
--- a/keyctl.c
+++ b/keyctl.c
@@ -1003,7 +1003,7 @@ static void act_keyctl_list(int argc, char *argv[])
 		n = sscanf((char *) buffer, "%*[^;]%n;%d;%d;%x;%n",
 			   &tlen, &uid, &gid, &perm, &dpos);
 		if (n != 3) {
-			fprintf(stderr, "Unparseable description obtained for key %d\n", key);
+			fprintf(stderr, "Unparsable description obtained for key %d\n", key);
 			exit(3);
 		}
 
@@ -1096,7 +1096,7 @@ static void act_keyctl_describe(int argc, char *argv[])
 	n = sscanf(buffer, "%*[^;]%n;%d;%d;%x;%n",
 		   &tlen, &uid, &gid, &perm, &dpos);
 	if (n != 3) {
-		fprintf(stderr, "Unparseable description obtained for key %d\n", key);
+		fprintf(stderr, "Unparsable description obtained for key %d\n", key);
 		exit(3);
 	}
 
@@ -2508,7 +2508,7 @@ static int dump_key_tree_aux(key_serial_t key, int depth, int more, int hex_key_
 		   type, &uid, &gid, &perm, &dpos);
 
 	if (n != 4) {
-		fprintf(stderr, "Unparseable description obtained for key %d\n", key);
+		fprintf(stderr, "Unparsable description obtained for key %d\n", key);
 		exit(3);
 	}
 
-- 
2.21.0

