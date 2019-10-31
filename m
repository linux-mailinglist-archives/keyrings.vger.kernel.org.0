Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9181AEB117
	for <lists+keyrings@lfdr.de>; Thu, 31 Oct 2019 14:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfJaNXb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 31 Oct 2019 09:23:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44057 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726540AbfJaNXb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 31 Oct 2019 09:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572528210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KJ7gYMHvWXYw7fYwssB5R3OTomWplPdTWh4BX/jCpLk=;
        b=Vpb/XHZXmJfrZUnn2uD2afuDJ2Tl0YiiUMnn1X3i9PkZgcqL0MpYw8QC6M1JFZm3/QPTEq
        Sd6bhNjtceC9iZmc9P6encabyrq1uukZpE3BFNhCKjUvQcCLPxbWT7as7qBNU9r3BhkQaE
        iS3ZjI5K+TzBTqMQ70cfxDNjCbBHrPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-8FW2e_wDPwq12lJOShwDiA-1; Thu, 31 Oct 2019 09:23:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC9521005500;
        Thu, 31 Oct 2019 13:23:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com [10.10.121.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 018A0600CD;
        Thu, 31 Oct 2019 13:23:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20191029143451.327761-1-mail@maciej.szmigiero.name>
References: <20191029143451.327761-1-mail@maciej.szmigiero.name>
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH] keyctl: try to wipe keys from memory after use
MIME-Version: 1.0
Content-ID: <23323.1572528204.1@warthog.procyon.org.uk>
Date:   Thu, 31 Oct 2019 13:23:24 +0000
Message-ID: <23324.1572528204@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 8FW2e_wDPwq12lJOShwDiA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Maciej S. Szmigiero <mail@maciej.szmigiero.name> wrote:

> The key being added or updated likely contains secrets so it would be bes=
t
> not to leave it in memory or in a core dump when no longer needed.
>=20
> Glibc 2.25+ provides the explicit_bzero() function that can be used for
> this purpose, let's utilize it if it is present.
>=20
> Tested by redefining exit(n) to abort() and inspecting the resulting core
> file for key data.
>=20
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

Applied.

