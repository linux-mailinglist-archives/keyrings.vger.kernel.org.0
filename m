Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1D12D41F6
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731532AbgLIMRm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35552 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731554AbgLIMRi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uq8L5ulWBHSgEgLynQAoC8tpMqn1Ti7SvvLNdWjWHao=;
        b=XzsFUHY0ZNYWnF3LvsJ6+D3wyFb/xfaUk4FQGNFHrHPZlvwxEIxPwZunzP3UumhVgXL+do
        sgDGuMqnU+0YGEkpcVINZ7kbLIUFg9ke+rsjPX8It4v8l2xingFvi65yazqh8RWx3CzbyT
        8JYOlzHJNW3JneKjyw04r4TqRsQGoZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-w78lxvIPNmGeVCt0sgu6oQ-1; Wed, 09 Dec 2020 07:16:09 -0500
X-MC-Unique: w78lxvIPNmGeVCt0sgu6oQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEAD01800D42;
        Wed,  9 Dec 2020 12:16:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CB8C41F436;
        Wed,  9 Dec 2020 12:16:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 13/18] crypto: public_key: Remove redundant header file from
 public_key.h
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:16:04 +0000
Message-ID: <160751616472.1238376.7922728253720706756.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

The akcipher.h header file was originally introduced in SM2, and
then the definition of SM2 was moved to the existing code. This
header file is left and should be removed.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/crypto/public_key.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 948c5203ca9c..47accec68cb0 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -12,7 +12,6 @@
 
 #include <linux/keyctl.h>
 #include <linux/oid_registry.h>
-#include <crypto/akcipher.h>
 
 /*
  * Cryptographic data for the public-key subtype of the asymmetric key type.


