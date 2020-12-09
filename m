Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DD02D41F9
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbgLIMR4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:17:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60754 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731551AbgLIMRr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6n5IZX39MrG3EesHjIkPB9DQmLLlhjhbqUZOtbzeyyo=;
        b=U8AnNwotSBG6EGiBJeVjPv8V8s+rVGzaNhV3hUNfWgPqr8/RhGSBFvyo2hx67FSr2tlvH+
        yeC2d3oWjtAdYrRTtfScZkkgyL0z54FZ64KfKgqx41EFO38BaN1jA4hVUjcX0agm/Us991
        8pfrjrT4Oznz3wZ6CieTaOsmaBUHlXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-VvzraQT8NBO2p70p3j0-AA-1; Wed, 09 Dec 2020 07:16:18 -0500
X-MC-Unique: VvzraQT8NBO2p70p3j0-AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55593190D36F;
        Wed,  9 Dec 2020 12:16:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D54FC6F960;
        Wed,  9 Dec 2020 12:16:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 14/18] certs/blacklist: fix kernel doc interface issue
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:16:14 +0000
Message-ID: <160751617400.1238376.9845973545419551111.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Alex Shi <alex.shi@linux.alibaba.com>

certs/blacklist.c:84: warning: Function parameter or member 'hash' not
described in 'mark_hash_blacklisted'

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: David Howells <dhowells@redhat.com>
---

 certs/blacklist.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 6514f9ebc943..2719fb2fbc1c 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -78,7 +78,7 @@ static struct key_type key_type_blacklist = {
 
 /**
  * mark_hash_blacklisted - Add a hash to the system blacklist
- * @hash - The hash as a hex string with a type prefix (eg. "tbs:23aa429783")
+ * @hash: The hash as a hex string with a type prefix (eg. "tbs:23aa429783")
  */
 int mark_hash_blacklisted(const char *hash)
 {


