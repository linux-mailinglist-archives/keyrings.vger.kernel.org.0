Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D3331EE64
	for <lists+keyrings@lfdr.de>; Thu, 18 Feb 2021 19:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhBRSd4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 18 Feb 2021 13:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35903 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230099AbhBRQ0I (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 18 Feb 2021 11:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613665481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ol04b9SwBsNodyJM22S45r12k9peEbiT8MJxTqE+tN4=;
        b=XIPU9QS8avCBZQqYaID/j+rT1twJpTjM6YdvhJv77i9lblrM2+7rIS+fhuImZ02t7wPocZ
        H3Bpiv99IUrqP/U0a4bxUlezpG/Nz3Hc/wsLy0ZLvd/tO/PsAFgFwFWqHb/59R4eiNK0Fe
        KlKPeO36vdPSm2hyJLUH3J5wm+tLzMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-rW-hvFsBMdK8XUyn30FbIQ-1; Thu, 18 Feb 2021 11:24:37 -0500
X-MC-Unique: rW-hvFsBMdK8XUyn30FbIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FF380364E;
        Thu, 18 Feb 2021 16:24:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 319C519D9F;
        Thu, 18 Feb 2021 16:24:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk>
References: <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk> <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
To:     Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>
Cc:     dhowells@redhat.com, Mimi Zohar <zohar@linux.vnet.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/18] certs: Fix blacklist flag type confusion
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Howells <dhowells@redhat.com>
Date:   Thu, 18 Feb 2021 16:24:34 +0000
Message-ID: <2031808.1613665474@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Micka=C3=ABl, Jarkko,

Can I transfer your acks from:

	https://lore.kernel.org/lkml/20210121155513.539519-5-mic@digikod.net/

to here?

David

