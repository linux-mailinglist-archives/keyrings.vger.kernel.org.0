Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C744030477F
	for <lists+keyrings@lfdr.de>; Tue, 26 Jan 2021 20:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbhAZGAc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 01:00:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26405 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730325AbhAYPoE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 25 Jan 2021 10:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611589358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oHEDm+5WwA/Q5G0/dTw9iBYvT3D210ckQgoeCi4htwA=;
        b=d7rjwMmaK3jWLotBKG4pH4nvdO39TwNdFCeBW/yH60ZbbFQJ1bQTvnYM0Qv/+tb0TcGYyB
        ces5DElLVi08eqn1YePHdK2U7qga5fwqnE/xCC8Ij5PHejCFFdV470Qe2xEQcI6Ec4Bbza
        01KJ6ovy7Vd7Qmo0sbvWUfrCvo2PInM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-0zWyCuvzM9mm16e0q2cY5g-1; Mon, 25 Jan 2021 10:17:28 -0500
X-MC-Unique: 0zWyCuvzM9mm16e0q2cY5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB5510054FF;
        Mon, 25 Jan 2021 15:17:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E990960938;
        Mon, 25 Jan 2021 15:17:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <7903360.NyiUUSuA9g@positron.chronox.de>
References: <7903360.NyiUUSuA9g@positron.chronox.de>
To:     Stephan =?us-ascii?Q?=3D=3FISO-8859-1=3FQ=3FM=3DFCller=3F=3D?= 
        <smueller@chronox.de>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: Keyctl: DH test failure
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 25 Jan 2021 15:17:26 +0000
Message-ID: <2443201.1611587846@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Stephan M=C3=BCller <smueller@chronox.de> wrote:

> The keyctl test COMPUTE DERIVED KEY WITH LEADING ZEROS fails on current=20
> kernels.
>=20
> keyutils/tests/keyctl/dh_compute/valid
>=20
> +++ LOAD SOURCE KEYS
> +++ COMPUTE DH PUBLIC KEY
> +++ LOAD SHA-256 SOURCE KEYS
> +++ COMPUTE DH SHARED SECRET
> +++ COMPUTE DERIVED KEY FROM DH SHARED SECRET (SHA-256)
> +++ COMPUTE DERIVED KEY WITH LEADING ZEROS
> FAILED
> +++ LOAD SHA-224 SOURCE KEYS
> +++ COMPUTE DH SHARED SECRET
> +++ COMPUTE DERIVED KEY FROM DH SHARED SECRET (SHA-224)
>=20
>=20
> The failure happens in the following check:
>=20
> + '[' 2 '!=3D' 2 -o 'xf571d0e7 18e00aba c6c1962b 11ded645' '!=3D' 'x00662=
07b=20
> cdab1d64 bbf489b3 d6a0dadc' ']'
>=20
> I.e. the kernel returns "xf571d0e7 18e00aba c6c1962b 11ded645" but the te=
st=20
> expects "x0066207b cdab1d64 bbf489b3 d6a0dadc".

Hmmm...  It works fine for me.  I'm using commit
9791581c049c10929e97098374dd1716a81fefcc as the base.  Any idea where it go=
es
wrong?

David

