Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0BB1C99EA
	for <lists+keyrings@lfdr.de>; Thu,  7 May 2020 20:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgEGSwp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 7 May 2020 14:52:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728400AbgEGSwo (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 7 May 2020 14:52:44 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4CAD2495D;
        Thu,  7 May 2020 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588877564;
        bh=P1BZoVC5niH/b6wY6lBALWnDN27yPCuxedD3vhCY58U=;
        h=Date:From:To:Cc:Subject:From;
        b=zuE9YU9EaKifydGTMEqu4frQJYuioxYCSBuELZsfsf2e6pW6qHF9/oyv2U+rROTqD
         ZoM2JbXzngfjL3Mo2gOfa6Vsis4py0EZupTciFBJbfZQXSDlqdZJoQUG5914AUKeB5
         lhwanVv7l7H5J4JI0atzEAi9nA3AeDAnI2Fy3CXg=
Date:   Thu, 7 May 2020 13:57:10 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KEYS: Replace zero-length array with flexible-array
Message-ID: <20200507185710.GA14910@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/keys/user-type.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/keys/user-type.h b/include/keys/user-type.h
index be61fcddc02a..386c31432789 100644
--- a/include/keys/user-type.h
+++ b/include/keys/user-type.h
@@ -27,7 +27,7 @@
 struct user_key_payload {
 	struct rcu_head	rcu;		/* RCU destructor */
 	unsigned short	datalen;	/* length of this data */
-	char		data[0] __aligned(__alignof__(u64)); /* actual data */
+	char		data[] __aligned(__alignof__(u64)); /* actual data */
 };
 
 extern struct key_type key_type_user;

