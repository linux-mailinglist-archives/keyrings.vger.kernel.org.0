Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FF369D1F5
	for <lists+keyrings@lfdr.de>; Mon, 20 Feb 2023 18:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjBTRNz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 20 Feb 2023 12:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjBTRNy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 20 Feb 2023 12:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FAADBFF
        for <keyrings@vger.kernel.org>; Mon, 20 Feb 2023 09:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676913185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0XAQlgOMPIfazufHJ1cw7n8xZDJ+yyG6hELMNmQg+HQ=;
        b=d7UbaOA6tfCqOoVYDobPvyyRoRaNJ8u38ft4nzUYvGxBqKdGe3LhTt3ENApje9SsMyK5/E
        SjobHDrLniEw38lkMFfzl9r5K3sJidlL0OdTscOavu60LMApY9x2Pre04qomVtR5QdSjq9
        AASNgKBKuQ0lKWNFGY3gY9AoC3ReU2I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-Ou9OnCZ2MQKmAIsUkBGQCg-1; Mon, 20 Feb 2023 12:13:04 -0500
X-MC-Unique: Ou9OnCZ2MQKmAIsUkBGQCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AAD81C06EC6
        for <keyrings@vger.kernel.org>; Mon, 20 Feb 2023 17:13:04 +0000 (UTC)
Received: from eesha.redhat.com (unknown [10.22.9.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DA69414171B8;
        Mon, 20 Feb 2023 17:13:03 +0000 (UTC)
From:   Robbie Harwood <rharwood@redhat.com>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc:     Robbie Harwood <rharwood@redhat.com>
Subject: [PATCH v2 1/2] verify_pefile: relax wrapper length check
Date:   Mon, 20 Feb 2023 12:12:53 -0500
Message-Id: <20230220171254.592347-2-rharwood@redhat.com>
In-Reply-To: <20230220171254.592347-1-rharwood@redhat.com>
References: <20230220171254.592347-1-rharwood@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The PE Format Specification (section "The Attribute Certificate Table
(Image Only)") states that `dwLength` is to be rounded up to 8-byte
alignment when used for traversal.  Therefore, the field is not required
to be an 8-byte multiple in the first place.

Accordingly, pesign has not performed this alignment since version
0.110.  This causes kexec failure on pesign'd binaries with "PEFILE:
Signature wrapper len wrong".  Update the comment and relax the check.

Link: https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#the-attribute-certificate-table-image-only
Link: https://github.com/rhboot/pesign
Signed-off-by: Robbie Harwood <rharwood@redhat.com>
---
 crypto/asymmetric_keys/verify_pefile.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
index 7553ab18db89..fe1bb374239d 100644
--- a/crypto/asymmetric_keys/verify_pefile.c
+++ b/crypto/asymmetric_keys/verify_pefile.c
@@ -135,11 +135,15 @@ static int pefile_strip_sig_wrapper(const void *pebuf,
 	pr_debug("sig wrapper = { %x, %x, %x }\n",
 		 wrapper.length, wrapper.revision, wrapper.cert_type);
 
-	/* Both pesign and sbsign round up the length of certificate table
-	 * (in optional header data directories) to 8 byte alignment.
+	/* sbsign rounds up the length of certificate table (in optional
+	 * header data directories) to 8 byte alignment.  However, the PE
+	 * specification states that while entries are 8-byte aligned, this is
+	 * not included in their length, and as a result, pesign has not
+	 * rounded up since 0.110.
 	 */
-	if (round_up(wrapper.length, 8) != ctx->sig_len) {
-		pr_debug("Signature wrapper len wrong\n");
+	if (wrapper.length > ctx->sig_len) {
+		pr_debug("Signature wrapper bigger than sig len (%x > %x)\n",
+			 ctx->sig_len, wrapper.length);
 		return -ELIBBAD;
 	}
 	if (wrapper.revision != WIN_CERT_REVISION_2_0) {
-- 
2.39.1

