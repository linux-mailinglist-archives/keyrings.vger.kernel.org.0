Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0EF69B399
	for <lists+keyrings@lfdr.de>; Fri, 17 Feb 2023 21:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBQUPm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Feb 2023 15:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBQUPk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Feb 2023 15:15:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E365CF2F
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 12:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676664892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hdNt+k4sTcnE5wIQSp1k2NwQJ314/PEoF9ngt9ahExU=;
        b=Q78/T0ECnCOCW/i37E37mH/CCeoyVlMFNPBUNekzDBa5mUALo3w4RyLclSLPlJ55+0d0Ot
        sU25glYPTxzSXcdobZh3cVIg9wxptx7xElNhr15ZUZ+mtQGclkyzjE2kbKjOF94dEeKCHL
        /JJN2PTMQiSGFNIVw/0gJ0ZuPTMhbns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-Mv1F1mYSOPyitNUYeCFNKw-1; Fri, 17 Feb 2023 15:14:50 -0500
X-MC-Unique: Mv1F1mYSOPyitNUYeCFNKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10C571C05B03
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 20:14:50 +0000 (UTC)
Received: from eesha.redhat.com (unknown [10.22.18.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E18E7C15BA0;
        Fri, 17 Feb 2023 20:14:49 +0000 (UTC)
From:   Robbie Harwood <rharwood@redhat.com>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc:     Robbie Harwood <rharwood@redhat.com>
Subject: [PATCH v1 0/2] Fix kexec of pesigned images
Date:   Fri, 17 Feb 2023 15:14:33 -0500
Message-Id: <20230217201435.39784-1-rharwood@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

In order to comply with the PE specification, recent versions of pesign do not
include 8-byte padding in the dwLength field.  kexec of signed images has
therefore not worked in Fedora (which uses pesign) for some time.

The first commit relaxes the check in order to fix this issue.  The second
upgrades several pe_debug() messages to pe_info() in order to make this more
debuggable on systems with secureboot lockdown in place.

Be well,
--Robbie

Robbie Harwood (2):
  verify_pefile: relax wrapper length check
  asymmetric_keys: log on fatal failures in PE/pkcs7

 crypto/asymmetric_keys/pkcs7_verify.c  | 10 ++++----
 crypto/asymmetric_keys/verify_pefile.c | 32 +++++++++++++++-----------
 2 files changed, 23 insertions(+), 19 deletions(-)

-- 
2.39.1

