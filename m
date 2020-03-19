Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E030118BAB7
	for <lists+keyrings@lfdr.de>; Thu, 19 Mar 2020 16:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgCSPNi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Mar 2020 11:13:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24600 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727102AbgCSPNi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Mar 2020 11:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584630817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kpQ29lY62WBgdMc1rPENnWWjniroVBhAdBka0yzdkVg=;
        b=MrY3ZTtU+1Wcp6p9dL86BWufKatlvH4VhMPe9PNxk/MuajSi0FHFf9Neh0vBkD+v8zKQ13
        Puduwcr+9g5ZXonzUm/GqsRGaXHiWuybHqU0AzidjLJfl1mWpWY9Fje2EbzlcSPt7FO3WR
        q8pRqbSPUuZyCvJzmJsd56qeKeJv93A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-eO5hDhqGNjeJm1vAIJ7SNg-1; Thu, 19 Mar 2020 11:13:33 -0400
X-MC-Unique: eO5hDhqGNjeJm1vAIJ7SNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5168017CC;
        Thu, 19 Mar 2020 15:13:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 04CD51001920;
        Thu, 19 Mar 2020 15:13:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200129093612.16889-1-clayc@hpe.com>
References: <20200129093612.16889-1-clayc@hpe.com>
To:     Clay Chang <clayc@hpe.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] KEYS: check the certfile for ASN1 encoding before inserting
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3166604.1584630811.1@warthog.procyon.org.uk>
Date:   Thu, 19 Mar 2020 15:13:31 +0000
Message-ID: <3166605.1584630811@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Clay Chang <clayc@hpe.com> wrote:

> +	if (cert[0] != 0x30 && cert[1] != 0x82) {
> +		err("Invalid certfile.\n");
> +		exit(EXIT_FAILURE);
> +	}
> +

I wonder if this is a good enough check.  It might be better to actually run
it through a utility that will actually check the structure (eg. openssl
asn1parse or openssl x509) and check the error code.

David

