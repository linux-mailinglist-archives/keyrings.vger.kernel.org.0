Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1703169F6
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 16:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBJPTW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Feb 2021 10:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45453 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231543AbhBJPTE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Feb 2021 10:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612970257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mceUppGttM5IRjUjF4Mhgo2zyBFKIwkpPAnlMIu3O04=;
        b=gtKlt4F4rqrAk8gWqcarKJNq3CBv6XYIRtVxySUD2G9pimTzD4dvsIkQ1idzXTwiBmZoJ7
        EmQthx2YSMkfcsaCZhS3D01xBZ7vD9sZxIAH3Pj+rUVqg1smJs3t+VLFBTVZuTI+Ox52M/
        Dga+mHpyeZYj5LghCRLQewE4JTkJu50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-DTjzdxsZMimxHRlugpVajA-1; Wed, 10 Feb 2021 10:17:33 -0500
X-MC-Unique: DTjzdxsZMimxHRlugpVajA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC43100CCDD;
        Wed, 10 Feb 2021 15:17:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 078C860C0F;
        Wed, 10 Feb 2021 15:17:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <1323922.1612970030@warthog.procyon.org.uk>
References: <1323922.1612970030@warthog.procyon.org.uk>
Cc:     dhowells@redhat.com, torvalds@linux-foundation.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Add EFI_CERT_X509_GUID support for dbx/mokx entries
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1324171.1612970250.1@warthog.procyon.org.uk>
Date:   Wed, 10 Feb 2021 15:17:30 +0000
Message-ID: <1324172.1612970250@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Howells <dhowells@redhat.com> wrote:

> This set of patches from Eric Snowberg that add support for
> EFI_CERT_X509_GUID entries in the dbx and mokx UEFI tables (such entries
> cause matching certificates to be rejected).  These are currently ignored
> and only the hash entries are made use of.

This is aimed at the next merge window.

David

