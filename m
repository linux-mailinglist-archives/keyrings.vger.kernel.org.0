Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D0245D6F1
	for <lists+keyrings@lfdr.de>; Thu, 25 Nov 2021 10:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353271AbhKYJTk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Nov 2021 04:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37278 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346500AbhKYJRi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Nov 2021 04:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637831667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yh81UVE1ZYrhP/lMOWYxUubcBdiPdKo4kQjVZE8GRMQ=;
        b=AcV1JAFYoo7SkgzLlywjypFGm92ioyGbbh0jh0exxKsq263U93SCJRF8d+fGiVK8xfnhgz
        n/Kc74Vi0+xKVHc6Tbdcan9OBAB9eXx8MLIP/za5yHJr2qqGja6ot2rbgB0+yqlB+iRDQA
        /AUS1REZ6mix1TN06DjiWGIwHS06aYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-OSWOpHYINU-U5tCWRwuWgA-1; Thu, 25 Nov 2021 04:14:24 -0500
X-MC-Unique: OSWOpHYINU-U5tCWRwuWgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E740805747;
        Thu, 25 Nov 2021 09:14:20 +0000 (UTC)
Received: from rhtmp (unknown [10.39.193.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 76F345D6B1;
        Thu, 25 Nov 2021 09:14:16 +0000 (UTC)
Date:   Thu, 25 Nov 2021 10:14:12 +0100
From:   Philipp Rudo <prudo@redhat.com>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     Mimi Zohar <zohar@linux.ibm.com>, Nayna <nayna@linux.vnet.ibm.com>,
        keyrings@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jessica Yu <jeyu@kernel.org>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Frank van der Linden <fllinden@amazon.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Daniel Axtens <dja@axtens.net>, buendgen@de.ibm.com
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211125101412.25596ee2@rhtmp>
In-Reply-To: <20211124132716.GT34414@kunlun.suse.cz>
References: <20211108120500.GO11195@kunlun.suse.cz>
        <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
        <20211112083055.GA34414@kunlun.suse.cz>
        <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
        <20211116095343.GG34414@kunlun.suse.cz>
        <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
        <20211119111823.GC34414@kunlun.suse.cz>
        <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
        <20211124120950.57c10a9f@rhtmp>
        <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
        <20211124132716.GT34414@kunlun.suse.cz>
Organization: Red Hat inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Michal,

On Wed, 24 Nov 2021 14:27:16 +0100
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Wed, Nov 24, 2021 at 08:10:10AM -0500, Mimi Zohar wrote:
> > On Wed, 2021-11-24 at 12:09 +0100, Philipp Rudo wrote: =20
> > > Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely o=
n all
> > > architectures using the same mechanism and thus reduce maintenance co=
st.
> > > On the way there he even makes some absolutely reasonable improvements
> > > for everybody.
> > >=20
> > > Why is that so controversial? What is the real problem that should be
> > > discussed here? =20
> >=20
> > Nothing is controversial with what Michal wants to do.  I've already
> > said, "As for adding KEXEC_SIG appended signature support on PowerPC
> > based on the s390 code, it sounds reasonable." =20
>=20
> Ok, I will resend the series with the arch-specific changes first to be
> independent of the core cleanup.

could you please add the kexec@lists.infradead.org to Cc when you
resend the series. As this is kexec related I think it makes sense to
give them a heads up, too.

Thanks
Philipp

