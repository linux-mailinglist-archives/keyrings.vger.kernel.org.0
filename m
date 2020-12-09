Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4447E2D41F8
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbgLIMRm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29877 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731544AbgLIMRd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=StPZWFO2ooUkaCfWPBeP0KHyeWMeGp90us4ehUWeUXU=;
        b=GyCt+W7dLO5mm+xAKYsHmJ/ocXrdKA1OsvMH8ZcL+/VSI5b8sYLtaSf581qIbFwuTgVoOh
        CxeGDVb8/1LPYJoRV/2bmY3RhFGUa+CRy6WfQbjLBi8lhTbZA5fI0D/w/r9anxv6kLI5E7
        7tM2pvwpGk5ak+TuKFpDvg6VEd86F+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-NoAMSQEDMdWGQhmptBYKAQ-1; Wed, 09 Dec 2020 07:16:00 -0500
X-MC-Unique: NoAMSQEDMdWGQhmptBYKAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B9521005504;
        Wed,  9 Dec 2020 12:15:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6236360C7B;
        Wed,  9 Dec 2020 12:15:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 12/18] keys: remove trailing semicolon in macro definition
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Tom Rix <trix@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:15:57 +0000
Message-ID: <160751615760.1238376.13792183884684466805.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---

 include/linux/key.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index 0f2e24f13c2b..1b0837c975b9 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -360,7 +360,7 @@ static inline struct key *request_key(struct key_type *type,
  * completion of keys undergoing construction with a non-interruptible wait.
  */
 #define request_key_net(type, description, net, callout_info) \
-	request_key_tag(type, description, net->key_domain, callout_info);
+	request_key_tag(type, description, net->key_domain, callout_info)
 
 /**
  * request_key_net_rcu - Request a key for a net namespace under RCU conditions
@@ -372,7 +372,7 @@ static inline struct key *request_key(struct key_type *type,
  * network namespace are used.
  */
 #define request_key_net_rcu(type, description, net) \
-	request_key_rcu(type, description, net->key_domain);
+	request_key_rcu(type, description, net->key_domain)
 #endif /* CONFIG_NET */
 
 extern int wait_for_key_construction(struct key *key, bool intr);


