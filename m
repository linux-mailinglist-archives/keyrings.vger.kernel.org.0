Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F39C32F583
	for <lists+keyrings@lfdr.de>; Fri,  5 Mar 2021 22:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhCEVur (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Mar 2021 16:50:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49810 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229729AbhCEVul (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Mar 2021 16:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614981040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gTv8VYcMT5gsPp7Ebk9ro0Z4xDvHuCrUQDCBU9X5YWQ=;
        b=bhK9GfQJyDC36Op+M7/5emT8dvPZZy+G41QwNYXmTFDrPnfB6d93sXQtSppOq5qGKK2yyb
        dKaIzE8NbPmXhZUwF/YYPYnUBJX61G1ebibXIuK5kYhZ78JqTG4yf6h9zlEpvWZMiaU2gL
        Gj7PBhotuMbwAMgVbrOrur6iQrwVKhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-g3SalbxcO4qvSFUkCqJ8dQ-1; Fri, 05 Mar 2021 16:50:39 -0500
X-MC-Unique: g3SalbxcO4qvSFUkCqJ8dQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62C226863;
        Fri,  5 Mar 2021 21:50:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-46.rdu2.redhat.com [10.10.112.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D2B119CA8;
        Fri,  5 Mar 2021 21:50:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210304175030.184131-1-eric.snowberg@oracle.com>
References: <20210304175030.184131-1-eric.snowberg@oracle.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, rdunlap@infradead.org, jarkko@kernel.org,
        nathan@kernel.org, dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] certs: Fix wrong kconfig option used for x509_revocation_list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <147603.1614981032.1@warthog.procyon.org.uk>
Date:   Fri, 05 Mar 2021 21:50:32 +0000
Message-ID: <147604.1614981032@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> @@ -11,7 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
>  hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
> - hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+= extract-cert
> +hostprogs-always-$(CONFIG_SYSTEM_REVOCATION_LIST)	+= extract-cert

Hmmm...  We have extract-cert listed twice.  Does that matter, I wonder?

David

