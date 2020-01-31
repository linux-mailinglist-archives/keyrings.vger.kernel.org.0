Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFF814F130
	for <lists+keyrings@lfdr.de>; Fri, 31 Jan 2020 18:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgAaRTw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 31 Jan 2020 12:19:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49121 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726139AbgAaRTw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 31 Jan 2020 12:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580491191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PJ6ZXnCZlySRaLqFHO5kcXQrkfWEiHgSHgDYrdwchj8=;
        b=JHmPTyuMmp9E+zAhnhwqG6MqaPz9fg6rlzzxqaUf1TxOnoxeUY031ea+ecGGH2TafqMgDl
        cQ3+S8n/eaLEVq6eaU9XV1Ipk1DpPyEI8dQpzbyYvX6SW7HifM4QIkNTBMCQ5lKCsbPnmT
        Tb6WnHoRJqRFFEqLjYmbWPbGQKPbJHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-2qhknmQBO7i3fxsuzot7rg-1; Fri, 31 Jan 2020 12:19:44 -0500
X-MC-Unique: 2qhknmQBO7i3fxsuzot7rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F52F100550E;
        Fri, 31 Jan 2020 17:19:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com [10.10.120.218])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6EF305DD64;
        Fri, 31 Jan 2020 17:19:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <22307ecd-3254-6077-8bc7-02693338b586@virtuozzo.com>
References: <22307ecd-3254-6077-8bc7-02693338b586@virtuozzo.com> <eaacb0b2-fd0d-480e-1868-0a1284c20185@virtuozzo.com>
To:     Vasily Averin <vvs@virtuozzo.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH v2] keys: proc_keys_next should increase position index
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <265150.1580491178.1@warthog.procyon.org.uk>
Date:   Fri, 31 Jan 2020 17:19:38 +0000
Message-ID: <265151.1580491178@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Vasily Averin <vvs@virtuozzo.com> wrote:

> If seq_file .next fuction does not change position index,

"function"

>    <<<< and whole last lien again

"line"

I can fix these up for you.

> https://bugzilla.kernel.org/show_bug.cgi?id=206283

I wonder if this should have a tag - it looks kind of out of place without
one, but I can't find one suggested.

David

