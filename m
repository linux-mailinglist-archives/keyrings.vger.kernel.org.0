Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A41259D3
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2019 23:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfEUVSh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 May 2019 17:18:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53522 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbfEUVSh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 21 May 2019 17:18:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B02A33079B93;
        Tue, 21 May 2019 21:18:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-170.rdu2.redhat.com [10.10.120.170])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 44D3260FE1;
        Tue, 21 May 2019 21:18:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <A3BC3B07-6446-4631-862A-F661FB9D63B9@holtmann.org>
References: <A3BC3B07-6446-4631-862A-F661FB9D63B9@holtmann.org> <20190521100034.9651-1-omosnace@redhat.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     dhowells@redhat.com, Ondrej Mosnacek <omosnace@redhat.com>,
        linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29982.1558473509.1@warthog.procyon.org.uk>
Date:   Tue, 21 May 2019 22:18:29 +0100
Message-ID: <29983.1558473509@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 21 May 2019 21:18:37 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Marcel Holtmann <marcel@holtmann.org> wrote:

> why use the description instead the actual key id? I wonder if a single
> socket option and a struct providing the key type and key id might be more
> useful.

If the key becomes invalid in some way, you can call request_key() again if
you have the description to get a new key.  This is how afs and af_rxrpc do
things on the client side.

David
