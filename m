Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747E7A2816
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfH2Uft (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:49 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33946 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfH2Uft (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:49 -0400
Received: by mail-qk1-f195.google.com with SMTP id m10so4260681qkk.1
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IAVBtAE3rVIFubplEzXT1SGp2mGkXQfSN9G7CBrXTg8=;
        b=ntZ4wHY0DcPH8kZl3yjaz2HZchKt8qK8rONx+77IXNDFOjg8lhulttUJKG84MM/X2H
         ThU24d1xlwJUlTg2vTN2FXd6cG+u1XQ1PdsU55+F1O2RHdmlDeoy2vTlgLjoRl/UDfnN
         WlWPOAOKrHebWvNpJWNdMceh/EMBl57hJgSPUE+Elo34TcoiWICyWCjM/yGCYASpxuzr
         bqL05ygplTK04J0mhJD9EiXDQoUBPk9DZeD1Y9xhbqld+sq1qmzSB+4XNlk1UVd2VZUq
         F0v6SSJVOIM7hYSVCBJ7MKhhu8PZJ8xs5ru1H1nXhBtwo91qSigAA5NrAFFZ0XBFXeap
         0jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAVBtAE3rVIFubplEzXT1SGp2mGkXQfSN9G7CBrXTg8=;
        b=tzZhGtiFupzMucBz2N80ctZ9uaYMjIqGw3VGZQySKfGErj3kQA7HHQ4Jc2H9rTTf/H
         +k9RQ8g1i13M3rjy84HKZ91G1MbTKIbeP7mJaK3rCkhryaA/IrohOgf9ukFNPlpSWDCl
         NA8w3W8kAJeoA8AephJSPPfAexxQ7Vxq2ix6qOUdvqkvM99Qgw8v2w/qbZKeKYqJXMGM
         DY3niMh7vleckVa9CzuwfLlyKsGR9uil9SCDz6+90VNDIqtyUANcGFRsY0wHA0P9Ey3X
         TPjYkfI1Gni3H1Wwm9PQTovvJnnsciKu61r2rUqZnPCQxiFMU9qvw/WSADkSM8/hlTMQ
         Lkkw==
X-Gm-Message-State: APjAAAVLtsiqH3fEx7mDADw103X0eUZJ3EkJ+YVy3momco7SScP/vVVZ
        de3X77Bnq1/zFNj3IwG//ZeCGN2Q
X-Google-Smtp-Source: APXvYqylArvWjWirQaW5u0+G68yBN1cB65ifETNQT9chpNmoTUGHU434Z58ZxmmU10/LzHiuvuZhYg==
X-Received: by 2002:ae9:ec0d:: with SMTP id h13mr10677989qkg.407.1567110948510;
        Thu, 29 Aug 2019 13:35:48 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id g30sm2553835qta.77.2019.08.29.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:48 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 04/13] keyctl: unify spelling of "unparsable"
Date:   Thu, 29 Aug 2019 16:35:27 -0400
Message-Id: <20190829203542.4410-5-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
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

