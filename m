Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F19305A71
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 12:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbhA0L4A (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 06:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44238 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234254AbhA0Lrs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 06:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611747982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uGnFFbNsJBXnBWydvWton8GaNo0bt/G64Cx3q+ooLGE=;
        b=FRvO9NAD05eCKxqu0jenJskPI55i0i8V/72Oe0EPT66t/hkB4aljVieLGaPjyAnvOrj8Hr
        4lNBtJYcv/AZSM41qarb5ayHI/yPXRVEEn0VdAz0jGy7GgZTdIPfypW9WFjJowgoF9sSCR
        L+gwwJUbwUp8TJSDcWRFZaVx5n6jMkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-BzXRkwwmNAyQlm6f4Tn4tg-1; Wed, 27 Jan 2021 06:46:18 -0500
X-MC-Unique: BzXRkwwmNAyQlm6f4Tn4tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4694B8030A3;
        Wed, 27 Jan 2021 11:46:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 355375C1A1;
        Wed, 27 Jan 2021 11:46:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <YAjMm9Gq/FFOzQYG@kernel.org>
References: <YAjMm9Gq/FFOzQYG@kernel.org> <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com> <20200916004927.64276-1-eric.snowberg@oracle.com> <1360578.1607593748@warthog.procyon.org.uk> <2442460.1610463459@warthog.procyon.org.uk> <X/9a8naM8p4tT5sO@linux.intel.com> <A05E3573-B1AF-474B-94A5-779E69E5880A@oracle.com> <YAFdNiYZSWpB9vOw@kernel.org> <CFBF6AEC-2832-44F7-9D7F-F20489498C33@oracle.com> <YAgTawk3EENF/P6j@kernel.org> <D9F5E0BD-E2FC-428F-91B3-35D2750493A0@oracle.com>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     dhowells@redhat.com, Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        dwmw2@infradead.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, jmorris@namei.org, serge@hallyn.com,
        nayna@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>,
        erichte@linux.ibm.com, mpe@ellerman.id.au,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        James.Bottomley@hansenpartnership.com
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 27 Jan 2021 11:46:11 +0000
Message-ID: <3063834.1611747971@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> > I suppose a user space tool could be created. But wouldn=E2=80=99t what=
 is
> > currently done in the kernel in this area need to be removed?
>=20
> Right. I don't think this was a great idea in the first place to
> do to the kernel but since it exists, I guess the patch does make
> sense.

This information needs to be loaded from the UEFI tables before the system
starts loading any kernel modules or running any programs (if we do
verification of such, which I think IMA can do).

David

