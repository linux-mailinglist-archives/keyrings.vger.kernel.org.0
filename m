Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99257C0962
	for <lists+keyrings@lfdr.de>; Fri, 27 Sep 2019 18:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfI0QSI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 27 Sep 2019 12:18:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46416 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727289AbfI0QSH (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 27 Sep 2019 12:18:07 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C2B7119D369;
        Fri, 27 Sep 2019 16:18:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com [10.10.125.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD94660BF3;
        Fri, 27 Sep 2019 16:18:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] keys: Add Jarkko Sakkinen as co-maintainer
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 27 Sep 2019 17:18:05 +0100
Message-ID: <156960108588.29253.1084048628417655842.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 27 Sep 2019 16:18:07 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

To address a major procedural concern on Linus's part the keyrings needs
a co-maintainer.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Suggested-by: David Howells <dhowells@redhat.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a97f1be63b9d..d9ebe514708b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9060,6 +9060,7 @@ F:	include/keys/trusted.h
 
 KEYS/KEYRINGS:
 M:	David Howells <dhowells@redhat.com>
+M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
 L:	keyrings@vger.kernel.org
 S:	Maintained
 F:	Documentation/security/keys/core.rst

