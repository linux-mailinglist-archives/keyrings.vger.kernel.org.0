Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4069332D69F
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 16:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhCDP1R (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Mar 2021 10:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56500 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233885AbhCDP1H (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Mar 2021 10:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614871542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bRJEiSefcrHEzMDzADLTwg9cPsOXIHiUbrP1luK3dts=;
        b=HPE3d2u39m1WD2lZusSc3Plf0wdnlNMWKZGvCK2uFq3w3FfWZMHeZvhAIUKTLN3WpIAh0y
        PgGITJBd/eNrUzFvGN/oREKdw2BIA/ckQNYvR20dk32ftgJ8kXO9c0CKcXxZouIpNt8VQJ
        2/r4tYbuFFbboRtXgi2cbFRU0Zr8MiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-5CdpKfNZM72oNq1BKhT6dw-1; Thu, 04 Mar 2021 10:25:40 -0500
X-MC-Unique: 5CdpKfNZM72oNq1BKhT6dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC199A0BDE;
        Thu,  4 Mar 2021 15:25:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-66.rdu2.redhat.com [10.10.112.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C65F660C0F;
        Thu,  4 Mar 2021 15:25:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <10ECA885-8F0B-4BB1-8CD9-B3D1993E20E0@oracle.com>
References: <10ECA885-8F0B-4BB1-8CD9-B3D1993E20E0@oracle.com> <20210303034418.106762-1-eric.snowberg@oracle.com> <2033457.1614763481@warthog.procyon.org.uk>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, Randy Dunlap <rdunlap@infradead.org>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] certs: Fix wrong kconfig option used for x509_revocation_list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3021688.1614871536.1@warthog.procyon.org.uk>
Date:   Thu, 04 Mar 2021 15:25:36 +0000
Message-ID: <3021689.1614871536@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> Since S_R_K is a string, I could not get that to work.

Okay.

> >> + hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)   += extract-cert

I think this should then refer to CONFIG_SYSTEM_REVOCATION_LIST.

David

