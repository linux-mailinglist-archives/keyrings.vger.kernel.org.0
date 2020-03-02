Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F05431755FE
	for <lists+keyrings@lfdr.de>; Mon,  2 Mar 2020 09:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgCBI3B (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Mar 2020 03:29:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44058 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727107AbgCBI3B (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 2 Mar 2020 03:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583137740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S7SFRPLr3XQ/yGKMtmqHYUaXpbtaCS+K42ZRD+xBPoU=;
        b=CnAD/dpBkq8RAStRRPzwKAP0NMuuxNYVi/OvLO/RNacsM6Ii4j2/PC4nORMWgf9G4VivSJ
        4J1JDODHrwhIQHDazzW6/TyVfMC0EiauS+nNY6IFwDKdPECaeJvnROxR0ONA4kPxHiar9U
        bMzALnXPGXt5w2ZA/x/W5YuVYStnNHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-czq4hj2UPdCfjl2o7yOhzg-1; Mon, 02 Mar 2020 03:28:56 -0500
X-MC-Unique: czq4hj2UPdCfjl2o7yOhzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9D74DB21;
        Mon,  2 Mar 2020 08:28:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-182.rdu2.redhat.com [10.10.120.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 74E2C60BF3;
        Mon,  2 Mar 2020 08:28:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200218211259.GA19673@linux.intel.com>
References: <20200218211259.GA19673@linux.intel.com> <000000000000f4bf93059db8b081@google.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com
Subject: Re: kernel BUG at lib/assoc_array.c:LINE!
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <538779.1583137732.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 02 Mar 2020 08:28:52 +0000
Message-ID: <538780.1583137732@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> The arguments for request_key_and_link() are fairly constrained:
> =

> type =3D=3D &key_type_dns_resolver
> description =3D=3D "afsdb:<cell name>"
> domain_tag =3D=3D net->key_domain
> callout_info =3D=3D "srv=3D1"
> callout_len =3D=3D 5
> aux =3D=3D NULL
> dest_keyring =3D=3D NULL
> flags =3D=3D KEY_ALLOC_IN_QUOTA
> =

> (manually resolved)
> =

> The only obvious moving part I see is the key type implementatio i.e.
> net/dns_resolver/dns_key.c.

It shouldn't matter what the payload of the key is going to be, but it mig=
ht
matter what the cell name is.  Looking in the log, I see this:

mount(&(0x7f0000000000)=3DANY=3D[@ANYBLOB=3D"25dc545df1e34ab2e26e2f5034c85=
b3a"], &(0x7f0000000140)=3D'./file0\x00', &(0x7f0000000180)=3D'afs\x00', 0=
x0, 0x0)

The:

	@ANYBLOB=3D"25dc545df1e34ab2e26e2f5034c85b3a"

is the source, i.e.:

	%\xdcT]\xf1\xe3J\xb2\xe2n/P4\xc8[':

This is in the form "[%#][<cellname>:]<volumename>", which comports with t=
he
log:

[  621.627412][ T6728] kAFS: unable to lookup cell '?T]??J??n/P4?['

This is a bit odd, since the version allegedly being tested includes a pat=
ch
to prohibit AFS cell names that contain unprintable chars.  It should erro=
r
out in afs_alloc_cell(), way before it tries to do a DNS lookup.

David

