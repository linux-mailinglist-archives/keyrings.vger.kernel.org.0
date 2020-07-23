Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B2422A9D3
	for <lists+keyrings@lfdr.de>; Thu, 23 Jul 2020 09:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgGWHme (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 23 Jul 2020 03:42:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23101 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726178AbgGWHme (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 23 Jul 2020 03:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595490153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=//Yfojb2+5l/9c7yxk/wQkjqrs7GK4h6tRXxyXSn7Co=;
        b=SkYdK+up4ljAmRNISHwhmyI/C+4LupHkN4e+j01e6uy9syzsUTUJQENXk6dBqw6qk1imM7
        hQHq3S85Z7ojMMY97//4tb5xgyu+5vqpYrJyi6/xOio1CH7wwhJD+xLVeOpFRrCDxDUbSE
        lfZl6d3jNzGS8BFp8/TN/c9ps1MtJZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-6kTqSsMROdmuFJgLBoZ4mA-1; Thu, 23 Jul 2020 03:42:29 -0400
X-MC-Unique: 6kTqSsMROdmuFJgLBoZ4mA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFB96100CCC0;
        Thu, 23 Jul 2020 07:42:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 614E610013C0;
        Thu, 23 Jul 2020 07:42:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200723013223.GA45081@linux.intel.com>
References: <20200723013223.GA45081@linux.intel.com> <159485211858.2340757.9890754969922775496.stgit@warthog.procyon.org.uk>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, torvalds@linux-foundation.org,
        Wei Yongjun <weiyongjun1@huawei.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: asymmetric: fix error return code in software_key_query()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1269136.1595490145.1@warthog.procyon.org.uk>
Date:   Thu, 23 Jul 2020 08:42:25 +0100
Message-ID: <1269137.1595490145@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> Why f1774cb8956a lacked any possible testing? It extends ABI anyway.
> 
> I think it is a kind of change that would require more screening before
> getting applied.

Yeah.  It went in via a round-about route.  I left off development of it when
the tpm stuff I wrote broke because the tpm2 stuff went in upstream.  I then
handed the patches off to Denis who did the tpm support, but I never got my
stuff finished enough to work out how to do the testsuite (since it would
involve using a tpm).  However, since I did the PKCS#8 testing module as well,
I guess I don't need that to at least test the API.  I'll look at using that
to add some tests.  Any suggestions as to how to do testing via the tpm?

David

