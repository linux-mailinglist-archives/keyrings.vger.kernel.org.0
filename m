Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A02832C2E6
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 01:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236659AbhCCX74 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Mar 2021 18:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50920 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241091AbhCCK0t (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Mar 2021 05:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614767122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vMUUJSbWiaKTXgtpt8GHYmtHVmZoDHu1V86PH+IT7A0=;
        b=gKSyR3LXr/zD8dLGnPTk0SHwospUbNN9Qrg0Jw1ipKh0jPCWgCkctpUr2iHPcmkq7i3RL0
        mQ2ThlceCo0ZV0SkoZLuW7ADQ9mIhA9a7UucWhT4iM0HN3eT8QMPTTG4nC6ZjjEIr67DoB
        o5JhBubwDwjauanHXU4Zphx63Zv4U4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-719A2JaVNDKjt3KlIWojNA-1; Wed, 03 Mar 2021 04:24:44 -0500
X-MC-Unique: 719A2JaVNDKjt3KlIWojNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E756835E21;
        Wed,  3 Mar 2021 09:24:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 84D1B60BFA;
        Wed,  3 Mar 2021 09:24:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210303034418.106762-1-eric.snowberg@oracle.com>
References: <20210303034418.106762-1-eric.snowberg@oracle.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, rdunlap@infradead.org, dwmw2@infradead.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] certs: Fix wrong kconfig option used for x509_revocation_list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2033456.1614763481.1@warthog.procyon.org.uk>
Date:   Wed, 03 Mar 2021 09:24:41 +0000
Message-ID: <2033457.1614763481@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> +ifeq ($(CONFIG_SYSTEM_REVOCATION_LIST),y)
> +obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += revocation_certificates.o
> +endif

Should the ifeq be referring to CONFIG_SYSTEM_REVOCATION_KEYS rather than
CONFIG_SYSTEM_REVOCATION_LIST?  In fact, since S_R_K depends indirectly on
S_B_K, you should be able to just do:

	+obj-$(CONFIG_SYSTEM_REVOCATION_KEYS) += revocation_certificates.o

> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST

Here also?

> + hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)   += extract-cert

And here too?

(As an aside, I wonder if SYSTEM_REVOCATION_CERTS would be a better name, but
I'm okay with leaving it as-is for now).

David

