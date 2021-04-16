Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7583623A7
	for <lists+keyrings@lfdr.de>; Fri, 16 Apr 2021 17:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343600AbhDPPQs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 16 Apr 2021 11:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44209 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245714AbhDPPPe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 16 Apr 2021 11:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618586104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=Pn6yvUUjNUSlzuQVqqIMB1mfmQSsMpS8xNJAq4YBzK8=;
        b=GNOOCsNKc5VD+fervF4m2Ym4dIv/71FhL+GALJ8PXPtFcRkYnVx8EpjO6QS74TzadLg7X4
        QRxhtxmySB4poHJ+dfwJUOcZSueP24pMSNsJEdaN5O8iqBimCt5AhF3thFNwoQL9n/Cy+L
        X8JsJN864dbgpJRnj00gVpn0HusPMTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-hjNCdYNrOQubG6COtEDHvg-1; Fri, 16 Apr 2021 11:15:00 -0400
X-MC-Unique: hjNCdYNrOQubG6COtEDHvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBEDF8030A0;
        Fri, 16 Apr 2021 15:14:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com [10.10.119.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 25B392B3C8;
        Fri, 16 Apr 2021 15:14:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Fix for CVE-2020-26541
MIME-Version: 1.0
Content-Type: text/plain
Date:   Fri, 16 Apr 2021 16:14:56 +0100
Message-ID: <1609249.1618586096@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Linus,

I posted a pull request for a fix for CVE-2020-26541:

	https://lore.kernel.org/keyrings/1884195.1615482306@warthog.procyon.org.uk/
	[GIT PULL] Add EFI_CERT_X509_GUID support for dbx/mokx entries

I'm guessing you're not going to pull it now for 5.12, so should I just
reissue the request in the merge window?  Also, do you want the base pulling
up to something a bit more recent than 5.11-rc4?

David

