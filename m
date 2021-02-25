Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8E132515C
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 15:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBYONm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 09:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25958 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232495AbhBYONk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Feb 2021 09:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614262333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YqccJEy9AMMCMPnTdlBzCqoK7M5ik4LsaWv1terBdfs=;
        b=dewhnBpaAgBcfc8+YTpl0sqgfClrAO62UR+DyJCdppqtfH7+u2R7HCMf9Tc0c96t0n1X71
        DnUKMWB79uzWQ89ifnZH8aydsdPHYijd20EbEbF73JIyc5TuHyurK2IqBl/2wMVGcbvuEc
        9H2RH/ur9UDesxhdue2wQWEQXbGHYYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-NeSnUbl3MyOVYDPN93fGAA-1; Thu, 25 Feb 2021 09:12:11 -0500
X-MC-Unique: NeSnUbl3MyOVYDPN93fGAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 640E6107ACE3;
        Thu, 25 Feb 2021 14:12:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE3AE19C79;
        Thu, 25 Feb 2021 14:12:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210225125638.1841436-1-arnd@kernel.org>
References: <20210225125638.1841436-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] certs: select PKCS7_MESSAGE_PARSER if needed
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <347809.1614262328.1@warthog.procyon.org.uk>
Date:   Thu, 25 Feb 2021 14:12:08 +0000
Message-ID: <347810.1614262328@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> wrote:

> +	select PKCS7_MESSAGE_PARSER if INTEGRITY_PLATFORM_KEYRING

I think a better way to do it is to add a separate config option for dealing
with revocation certs, which is part of what I suggested here:

	https://lore.kernel.org/keyrings/3731128.1614163916@warthog.procyon.org.uk/

David

