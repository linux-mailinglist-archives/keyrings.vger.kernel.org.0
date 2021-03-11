Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A293371FA
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 13:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhCKME4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 07:04:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232954AbhCKME0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 07:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615464265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j9DCFxw7/igOd3LmB1G3n774oKnzGKLPLaO6vlSHqIc=;
        b=hZPDDTf8e5lgRHpBy7kfJ5Uo4nF9M0dfXJqnJaNfmQTIt9M9xdzqyArAcMrGL+fF10Bz+6
        ugdPdbbImxVm+Dp111Eg3odlf1Xwzfc141nrXyIHWhkTRx30w7bUur3gsJf0ese7kn9xpL
        kkAe7oGw5JGRSzqfO1y3YGceP+wbs5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-2BgAgTuANqW8QLsufTZAzw-1; Thu, 11 Mar 2021 07:04:23 -0500
X-MC-Unique: 2BgAgTuANqW8QLsufTZAzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B384C1005E6C;
        Thu, 11 Mar 2021 12:04:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ADF4E196E3;
        Thu, 11 Mar 2021 12:04:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <109018.1615463088@turing-police>
References: <109018.1615463088@turing-police> <91190.1615444370@turing-police> <972381.1615459754@warthog.procyon.org.uk>
To:     =?us-ascii?Q?Valdis_Kl=3D=3Futf-8=3FQ=3F=3Dc4=3D93=3F=3Dtnieks?= 
        <valdis.kletnieks@vt.edu>
Cc:     dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 11 Mar 2021 12:04:19 +0000
Message-ID: <1486567.1615464259@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu> wrote:

> So there's something weird going on with scripts/extract-cert when running
> as a userid other than the owner of the source tree..  I wonder if it's
> actually an OpenSSL issue...

I cloned next-20210311 as one user then built it as another user using:

	LANG=3DC nice -19 make O=3D/data/git/next-20210311-build -j8 allmodconfig
	LANG=3DC nice -19 make O=3D/data/git/next-20210311-build -j8

It built with no problems.  The building user definitely can't create/modify
files in the source directory.

Interestingly, the following line in the output from mine:

	EXTRACT_CERTS   certs/signing_key.pem

doesn't show the full path as it does in yours:

	EXTRACT_CERTS   /usr/src/linux-next/"certs/signing_key.pem"

but I don't know why.  There are some odd quotes in your line also which may
be related to the problem.  The relevant config line looks the same:

	CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"

I'll have to try with the aarch64 build, see if it's something in that that=
's
the problem.

David

