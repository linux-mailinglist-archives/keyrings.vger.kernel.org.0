Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250213373FD
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 14:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbhCKNb3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 08:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40761 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233588AbhCKNbY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 08:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615469483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e4Idb2N8an2x83JxsD8aodpPtXFyz97ff2I1Pwu5oE8=;
        b=gBJnJnarf9mGz97oHT19CduiNc7BLPTpOT+tLbXVHB1RxV34nOlnXN+wTNQVw91ZQC4H7H
        I5B7BhRIhNohu9dZ4blmo3N1mpA1trGBULLekcuWnXV/wudKZYtO7M1pMRb7xjLzjhUaMA
        XwIexiEvGFk+vlV3KOsB7zEYqpROv+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-xPNgStTmNqya1OWn-46Ryg-1; Thu, 11 Mar 2021 08:31:19 -0500
X-MC-Unique: xPNgStTmNqya1OWn-46Ryg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1F42100D671;
        Thu, 11 Mar 2021 13:31:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA73D19704;
        Thu, 11 Mar 2021 13:31:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <1486567.1615464259@warthog.procyon.org.uk>
References: <1486567.1615464259@warthog.procyon.org.uk> <109018.1615463088@turing-police> <91190.1615444370@turing-police> <972381.1615459754@warthog.procyon.org.uk>
To:     valdis.kletnieks@vt.edu
Cc:     dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1864397.1615469475.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 11 Mar 2021 13:31:15 +0000
Message-ID: <1864398.1615469475@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Howells <dhowells@redhat.com> wrote:

> I'll have to try with the aarch64 build, see if it's something in that t=
hat's
> the problem.

That works too... kind of.  Building in the certs/ dir is fine - and all t=
he
cert generation and extraction is done in the expected place, but the link
fails with errors like:

aarch64-linux-gnu-ld: arch/arm64/kernel/paravirt.o: relocation R_AARCH64_A=
BS32 against `__crc_pv_ops' can not be used when making a shared object
arch/arm64/kernel/paravirt.o:(__patchable_function_entries+0x0): dangerous=
 relocation: unsupported relocation
arch/arm64/kernel/paravirt.o:(__patchable_function_entries+0x8): dangerous=
 relocation: unsupported relocation
arch/arm64/kernel/paravirt.o:(__patchable_function_entries+0x10): dangerou=
s relocation: unsupported relocation
arch/arm64/kernel/paravirt.o:(__patchable_function_entries+0x18): dangerou=
s relocation: unsupported relocation
...

David

