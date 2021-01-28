Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BF6307A2B
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 16:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbhA1P7o (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 10:59:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35208 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231276AbhA1P7o (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 10:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611849498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Be25vmGqRhkmgPL4pLFQDcyJCsUHDsc9RcG0TdvFtds=;
        b=BlX8AZwkW5F8HnXZbenM35tXQKisYp4hEIaaYStfLo1GQHKrjI/2ecBsVIb6GwA1dE/aZk
        06cqWUcUOMstUtNvYBmVCJAOyJqdb0eYjg31Q/V748j8jrvx3Qiejt/U+7vgX11wi8CMcR
        wclfhyfgiy61DOPGAPmLARWUdlas+Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-zf5yUEjJOB2hIravAJ_WXA-1; Thu, 28 Jan 2021 10:58:14 -0500
X-MC-Unique: zf5yUEjJOB2hIravAJ_WXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D4AB180A096;
        Thu, 28 Jan 2021 15:58:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 056845D9F4;
        Thu, 28 Jan 2021 15:58:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <8f0c3b88-872a-bbae-eaa2-1467b6f386a0@linux.vnet.ibm.com>
References: <8f0c3b88-872a-bbae-eaa2-1467b6f386a0@linux.vnet.ibm.com> <20210122181054.32635-1-eric.snowberg@oracle.com> <20210122181054.32635-2-eric.snowberg@oracle.com> <399024a1-59fb-12b8-9ea9-9bbee843dbc8@linux.vnet.ibm.com> <13EE0575-2F90-4C49-AF5D-365B63D2CB64@oracle.com>
To:     Nayna <nayna@linux.vnet.ibm.com>
Cc:     dhowells@redhat.com, Eric Snowberg <eric.snowberg@oracle.com>,
        dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v5 1/4] certs: Add EFI_CERT_X509_GUID support for dbx entries
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3579294.1611849483.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 28 Jan 2021 15:58:03 +0000
Message-ID: <3579295.1611849483@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Nayna <nayna@linux.vnet.ibm.com> wrote:

> Thanks Eric for clarifying. I was confusing it with with the broader mea=
ning
> of revocation i.e. certificate revocation list. To avoid similar confusi=
on in
> the future, I wonder if we should call it as 'blocklist' or 'denylist' a=
s
> suggested in the document. This is to avoid conflicts with actual CRL su=
pport
> if added in the future. I also wonder if we should add the clarification=
 in
> the patch description.

Reject-list might be better.

David

