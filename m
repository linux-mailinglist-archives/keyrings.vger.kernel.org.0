Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7E52D5787
	for <lists+keyrings@lfdr.de>; Thu, 10 Dec 2020 10:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgLJJup (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Dec 2020 04:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41557 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728129AbgLJJup (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Dec 2020 04:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607593759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ANRQNvQxs5wiZtk/4xV+GI9Sns6KDSiXIeFUsgCF5nw=;
        b=dYZhXkZa9c5QZS5fXz+uWU/+kZNCgZTjTXIlo6OtGrB4QKVlj/BXypm2p91L2zFWYy4uyW
        GRBIGOoM45cx+omd+GUZNL28V7YWE7cTmIq00jOOuxwkhTJFsxoWKIoB5C5RqIM7WIF8/n
        MsE8s2nP+a4bc+Vc3dQLbzS0TJpf+Eg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-lCu6pvXdM4Wj2oM-EJz8lg-1; Thu, 10 Dec 2020 04:49:15 -0500
X-MC-Unique: lCu6pvXdM4Wj2oM-EJz8lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B66AFA89;
        Thu, 10 Dec 2020 09:49:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4D55B6A2;
        Thu, 10 Dec 2020 09:49:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200916004927.64276-1-eric.snowberg@oracle.com>
References: <20200916004927.64276-1-eric.snowberg@oracle.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        jarkko.sakkinen@linux.intel.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, jmorris@namei.org, serge@hallyn.com,
        nayna@linux.ibm.com, zohar@linux.ibm.com, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1360577.1607593748.1@warthog.procyon.org.uk>
Date:   Thu, 10 Dec 2020 09:49:08 +0000
Message-ID: <1360578.1607593748@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> is found, it is added as an asymmetrical key to the .blacklist keyring.
> Anytime the .platform keyring is used, the keys in the .blacklist keyring
> are referenced, if a matching key is found, the key will be rejected.

Ummm...  Why this way and not as a blacklist key which takes up less space?
I'm guessing that you're using the key chain matching logic.  We really only
need to blacklist the key IDs.

Also, what should happen if a revocation cert rejected by the blacklist?

> +int mark_key_revocationlisted(const char *data, size_t size)

Hmmm...  The name looks wrong, but I can see the potential issue that kernel
keys can actually be marked revoked as a separate concept.  How about
add_key_to_revocation_list() and is_key_on_revocation_list().

David

