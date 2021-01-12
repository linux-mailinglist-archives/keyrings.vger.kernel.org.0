Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E458E2F3372
	for <lists+keyrings@lfdr.de>; Tue, 12 Jan 2021 16:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbhALO7Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 Jan 2021 09:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38216 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726713AbhALO7Y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 12 Jan 2021 09:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610463478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XlUm2JYDUqrCFaqRZjf68KX2pnc8iKtDpFI9TKkiM18=;
        b=CivmYjR8C9bdFnQin+wimDMaVBgo7eGgcZgSTakvN/g5DOR6S25Aj2TZoL7mc5eImFRus/
        VXqxSDVN8eghU+MeG4RZSZUNXbFK4AB3vEbUBAhet+kcOavK/PkTRA89+jq9df2d95kE7r
        O9+OBrS3gbXCg+RTiTqVBCRrCxsFO/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-mlPyzESvNF2x4AJowppFGg-1; Tue, 12 Jan 2021 09:57:54 -0500
X-MC-Unique: mlPyzESvNF2x4AJowppFGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3DD8803F4C;
        Tue, 12 Jan 2021 14:57:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-8.rdu2.redhat.com [10.10.112.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA5D6B540;
        Tue, 12 Jan 2021 14:57:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com> <20200916004927.64276-1-eric.snowberg@oracle.com> <1360578.1607593748@warthog.procyon.org.uk>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 12 Jan 2021 14:57:39 +0000
Message-ID: <2442460.1610463459@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> > On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> wrote:
> >=20
> > Eric Snowberg <eric.snowberg@oracle.com> wrote:
> >=20
> >> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_G=
UID
> >> is found, it is added as an asymmetrical key to the .blacklist keyring.
> >> Anytime the .platform keyring is used, the keys in the .blacklist keyr=
ing
> >> are referenced, if a matching key is found, the key will be rejected.
> >=20
> > Ummm...  Why this way and not as a blacklist key which takes up less sp=
ace?
> > I'm guessing that you're using the key chain matching logic.  We really=
 only
> > need to blacklist the key IDs.
>=20
> I implemented it this way so that certs in the dbx would only impact=20
> the .platform keyring. I was under the impression we didn=E2=80=99t want =
to have=20
> Secure Boot UEFI db/dbx certs dictate keyring functionality within the ke=
rnel
> itself. Meaning if we have a matching dbx cert in any other keyring (buil=
tin,
> secondary, ima, etc.), it would be allowed. If that is not how you=E2=80=
=99d like to=20
> see it done, let me know and I=E2=80=99ll make the change.

I wonder if that is that the right thing to do.  I guess this is a policy
decision and may depend on the particular user.

> > Also, what should happen if a revocation cert rejected by the blacklist?
>=20
> I=E2=80=99m not sure I understand the question. How would it be rejected?

The SHA256 of a revocation cert being loaded could match an
already-blacklisted SHA256 sum, either compiled in or already loaded from
UEFI.

David

