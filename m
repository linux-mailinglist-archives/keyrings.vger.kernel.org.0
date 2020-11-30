Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B0B2C80A9
	for <lists+keyrings@lfdr.de>; Mon, 30 Nov 2020 10:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgK3JLU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 30 Nov 2020 04:11:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55347 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725902AbgK3JLU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 30 Nov 2020 04:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606727394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EoMMNm0IUt1GO2xD2OU0HZdE8ALUJkd8oHe2thJ9cwY=;
        b=BJQnmYrSWFIH2F3r6IkR3vSUrmJVEe3V27aBdywYceCwPiWoAngp3yOvyY1fkgEWaLw5Mh
        vDoqL8Q/MOtKSP7ZROkegATiWpnWpoErLLMNOtkXaUmM89LFiAaUyH5vSprMeUBjXp4zmx
        imUX76M1o81c25KebUHTg7wQnlH+xO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-6yb7Kk_GMOOYXJT19jeF_Q-1; Mon, 30 Nov 2020 04:09:51 -0500
X-MC-Unique: 6yb7Kk_GMOOYXJT19jeF_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57D15873110;
        Mon, 30 Nov 2020 09:09:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-159.rdu2.redhat.com [10.10.112.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA24160843;
        Mon, 30 Nov 2020 09:09:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <67250277-7903-2005-b94b-193bce0a3388@markus-regensburg.de>
References: <67250277-7903-2005-b94b-193bce0a3388@markus-regensburg.de>
To:     Tobias Markus <tobias@markus-regensburg.de>
Cc:     dhowells@redhat.com, linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org
Subject: Re: Null pointer dereference in public key verification (related to SM2 introduction)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3092219.1606727387.1@warthog.procyon.org.uk>
Date:   Mon, 30 Nov 2020 09:09:47 +0000
Message-ID: <3092220.1606727387@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Tobias Markus <tobias@markus-regensburg.de> wrote:

> kernel: RIP: 0010:public_key_verify_signature+0x189/0x3f0

Is it possible for you to provide a disassembly of this function from the
kernel you were using?  For this to occur on that line, it appears that sig
would need to be NULL - but that should trip an assertion at the top of the
function - or a very small number (which could be RCX, R09 or R11).

Thanks,
David

