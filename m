Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838DE2D4207
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbgLIMUJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:20:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38008 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731492AbgLIMRM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I2OeoEaPoabGaS5Q60oqAdJsgF7TInIBkil2seWc1YY=;
        b=WRQHzUOgIkg3zccAwBVoRbskP0tBiXMAx2g/pBOjvGDu+97CbRu0rOVfaYqj8Ji0EZVcoQ
        UtedSARZmQ8IsGp2A4iORQfVdahnUJNji2R6r3mrMmRbXjVUTPCPVpX3ZbmF7xvolmDgxW
        5TgQpcn6qreODrpj+YYZmteFgarTRbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-absk2GxwMJWUb2H1Gy9eyg-1; Wed, 09 Dec 2020 07:15:36 -0500
X-MC-Unique: absk2GxwMJWUb2H1Gy9eyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5109800D55;
        Wed,  9 Dec 2020 12:15:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D173D620DE;
        Wed,  9 Dec 2020 12:15:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 09/18] encrypted-keys: Replace HTTP links with HTTPS ones
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:15:33 +0000
Message-ID: <160751613305.1238376.10058420900385575623.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Alexander A. Klimov <grandmaster@al2klimov.de>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/keys/encrypted-type.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/keys/encrypted-type.h b/include/keys/encrypted-type.h
index 38afb341c3f2..abfcbe02001a 100644
--- a/include/keys/encrypted-type.h
+++ b/include/keys/encrypted-type.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2010 IBM Corporation
  * Copyright (C) 2010 Politecnico di Torino, Italy
- *                    TORSEC group -- http://security.polito.it
+ *                    TORSEC group -- https://security.polito.it
  *
  * Authors:
  * Mimi Zohar <zohar@us.ibm.com>


