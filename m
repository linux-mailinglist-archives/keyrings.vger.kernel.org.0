Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23372D56FC
	for <lists+keyrings@lfdr.de>; Thu, 10 Dec 2020 10:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgLJJXO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Dec 2020 04:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49668 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728235AbgLJJXA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Dec 2020 04:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607592094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dPFplBajGFzHoMPJFIILG6qmHqaV9Y/5ciJwrq+XxHM=;
        b=Lrk9GyjgFkVViIb05IVnl2K/XmHFU+w0ZG6lsHy8xyDUAmeAnUvsq/7AJioBNr39e47Vew
        ekf+39Qbo7Y2zXcGOEgDA9jfiY2K6wT3VFIvUvrp9pnG0r6N45RqOMrbp2LeKP1JcAlMlF
        N0xjd3Gievkz6c9toZgTfdt6TgrJaC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-qx9b1bR2P3GvhkyGkjmwmA-1; Thu, 10 Dec 2020 04:21:32 -0500
X-MC-Unique: qx9b1bR2P3GvhkyGkjmwmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34198042A2;
        Thu, 10 Dec 2020 09:21:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D99565D6AC;
        Thu, 10 Dec 2020 09:21:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20201209190724.GA1448831@erythro>
References: <20201209190724.GA1448831@erythro> <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk> <160751611918.1238376.7060458630378643472.stgit@warthog.procyon.org.uk>
To:     Ben Boeckel <me@benboeckel.net>
Cc:     dhowells@redhat.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Tom Rix <trix@redhat.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] KEYS: remove redundant memset
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1357092.1607592088.1@warthog.procyon.org.uk>
Date:   Thu, 10 Dec 2020 09:21:28 +0000
Message-ID: <1357093.1607592088@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <me@benboeckel.net> wrote:

> > Reviewing use of memset in keyctrl_pkey.c
> 
> Typo: `keyctl_pkey.c`

Fixed, thanks.

David

