Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1D14B9A9
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbfFSNTy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:19:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49804 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727458AbfFSNTx (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:19:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B998286658;
        Wed, 19 Jun 2019 13:19:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 143A7608A5;
        Wed, 19 Jun 2019 13:19:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 08/10] keys: Grant Link permission to possessers of
 request_key auth keys [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     James Morris <jamorris@linux.microsoft.com>, dhowells@redhat.com,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:19:49 +0100
Message-ID: <156095038937.9363.13848713196793738568.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 19 Jun 2019 13:19:53 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Grant Link permission to the possessers of request_key authentication keys,
thereby allowing a daemon that is servicing upcalls to arrange things such
that only the necessary auth key is passed to the actual service program
and not all the daemon's pending auth keys.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
---

 security/keys/request_key_auth.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
index 572c7a60473a..ec5226557023 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -204,7 +204,7 @@ struct key *request_key_auth_new(struct key *target, const char *op,
 
 	authkey = key_alloc(&key_type_request_key_auth, desc,
 			    cred->fsuid, cred->fsgid, cred,
-			    KEY_POS_VIEW | KEY_POS_READ | KEY_POS_SEARCH |
+			    KEY_POS_VIEW | KEY_POS_READ | KEY_POS_SEARCH | KEY_POS_LINK |
 			    KEY_USR_VIEW, KEY_ALLOC_NOT_IN_QUOTA, NULL);
 	if (IS_ERR(authkey)) {
 		ret = PTR_ERR(authkey);

