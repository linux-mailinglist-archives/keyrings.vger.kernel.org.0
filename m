Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877E567B53B
	for <lists+keyrings@lfdr.de>; Wed, 25 Jan 2023 15:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbjAYO6V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 25 Jan 2023 09:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjAYO6U (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 25 Jan 2023 09:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED08568A6
        for <keyrings@vger.kernel.org>; Wed, 25 Jan 2023 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674658650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rKf/7nDuOwjzGLy8h9pFhivW5tWNbGYYqY0WQilf9uo=;
        b=OcDh8MMTKfFIDOWbihwqjC5T9NKKpRkKJiQDrQK7CDQWtatHUa+2O9wZ9hvcImC3VOH2Gz
        BspAhstzk71xaIvUf7fGAeChJ4FmztPBOkAydG0o9aCn35MVfACrFi3LjjNSruNbn0fGDK
        D52jW5YeWOTf8Hvig5xp504vbvHpMRI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-9DigMj7fMhywHVhf1_h4Kw-1; Wed, 25 Jan 2023 09:57:26 -0500
X-MC-Unique: 9DigMj7fMhywHVhf1_h4Kw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79C00802BF3;
        Wed, 25 Jan 2023 14:57:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 87B30492B01;
        Wed, 25 Jan 2023 14:57:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
References: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
To:     Bharath SM <bharathsm.hsk@gmail.com>
Cc:     dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Subject: Re: dns_query from cifs returning EKEYEXPIRED during reconnect operations
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2144379.1674658644.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 25 Jan 2023 14:57:24 +0000
Message-ID: <2144380.1674658644@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Does the attached fix your problem?

David
---
diff --git a/fs/cifs/dns_resolve.c b/fs/cifs/dns_resolve.c
index 8bf8978bc5d6..c77ac47fb08b 100644
--- a/fs/cifs/dns_resolve.c
+++ b/fs/cifs/dns_resolve.c
@@ -66,7 +66,7 @@ dns_resolve_server_name_to_ip(const char *unc, struct so=
ckaddr *ip_addr, time64_
 =

 	/* Perform the upcall */
 	rc =3D dns_query(current->nsproxy->net_ns, NULL, hostname, len,
-		       NULL, &ip, expiry, false);
+		       NULL, &ip, expiry, true);
 	if (rc < 0) {
 		cifs_dbg(FYI, "%s: unable to resolve: %*.*s\n",
 			 __func__, len, len, hostname);

