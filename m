Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849832D5737
	for <lists+keyrings@lfdr.de>; Thu, 10 Dec 2020 10:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgLJJbm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Dec 2020 04:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726278AbgLJJbl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Dec 2020 04:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607592615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OK/nInPQSL9jnVzhYq1NESDYlTBdG+vb/BJz0j219LU=;
        b=ZGuEg1zOctzmuT05BxvWM/77JiVcilkDC3SHgP8ZoFEen+p0/RR1h31NcYf8NNzPJj4Gay
        kA59Ilfzx0NkTEHMrMcl7bGeHV8RzvysHTu0XRFFQRHRoVP1FDg6bCkttZ9a8BkFHJygY2
        PqNeAjnnOYeRQKkuisiPSSWEJya3qqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-IMLI8mAlPmWOCOKk5j3ASg-1; Thu, 10 Dec 2020 04:30:13 -0500
X-MC-Unique: IMLI8mAlPmWOCOKk5j3ASg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD8BE6D522;
        Thu, 10 Dec 2020 09:30:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D3B775D6BA;
        Thu, 10 Dec 2020 09:30:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20201209191204.GB1448831@erythro>
References: <20201209191204.GB1448831@erythro> <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
To:     Ben Boeckel <me@benboeckel.net>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH 00/18] keys: Miscellaneous fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1359154.1607592609.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 10 Dec 2020 09:30:09 +0000
Message-ID: <1359155.1607592609@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <me@benboeckel.net> wrote:

> > I've extended my collection of minor keyrings fixes for the next merge
> > window.  Anything else I should add (or anything I should drop)?
> > =

> > The patches can be found on the following branch:
> > =

> > 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git=
/log/?h=3Dkeys-fixes
> =

> 1-16 LGTM (modulo the typo in patch 7's commit message). 17 and 18 are
> outside my knowledge right now.
> =

> Reviewed-by: Ben Boeckel <mathstuf@gmail.com>

I've applied that to the first 16 patches, thanks.

David

