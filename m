Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6420372E362
	for <lists+keyrings@lfdr.de>; Tue, 13 Jun 2023 14:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjFMMyX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Jun 2023 08:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239868AbjFMMyW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Jun 2023 08:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FBE10FA
        for <keyrings@vger.kernel.org>; Tue, 13 Jun 2023 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686660817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y7DcASSObS+eRy1HQOSfVcPKlmOl64c+asQijp73BVQ=;
        b=YY1bFHy/uVIRyRA6kvYg0O1SXRqKWPuhl/3NIqiPMx0GkL7oYaoW0JRJMuH97h5Ldk12Bw
        21hLvdOA5q+djAfGK1IEbt3aVxSXD0Nn4aVmF1MS12Kc0nxXg/7wM/LYfTF6qOs4xey0b+
        H/wrt39Or+i9gEyu02Tsu/1IROGzQoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-rZO7NWkPOOukhFJsi6eg6Q-1; Tue, 13 Jun 2023 08:53:32 -0400
X-MC-Unique: rZO7NWkPOOukhFJsi6eg6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00D08101AA6D;
        Tue, 13 Jun 2023 12:53:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1CBC940C20F5;
        Tue, 13 Jun 2023 12:53:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     dhowells@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH 0/5] crypto: Add akcipher interface without SGs
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <570801.1686660808.1@warthog.procyon.org.uk>
Date:   Tue, 13 Jun 2023 13:53:28 +0100
Message-ID: <570802.1686660808@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Herbert Xu <herbert@gondor.apana.org.au> wrote:

> I've decided to split out signing and verification because most
> (all but one) of our signature algorithms do not support encryption
> or decryption.  These can now be accessed through the dsa interface:

That feels wrongly named as there's a DSA public key algorithm.

David

