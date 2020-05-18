Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D231D7AA9
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 16:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgEROGs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 10:06:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47960 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726855AbgEROGr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 10:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589810806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=41TliIhfhinzxrxdsRW3/sg358I0ryfCq9whwOxbZ/E=;
        b=ejlvqy+21Mzp96Gajs3gjo3kh3XvIqPnRSfs6BAq6TJGCZLjTFxB6sNIWgurhiG0eV+6+3
        WtAQ3I0AoDKBYyc2jf8oH7Gd28dE2kMiRrV/g9aF8+j+ezLdHpBY496qUOefJX2x50fAF/
        VVXOBRAv74+7jNQ0RNp7yFrsJu/t5Bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-zKo2C-U_MSe6t5j8EiFLJA-1; Mon, 18 May 2020 10:06:42 -0400
X-MC-Unique: zKo2C-U_MSe6t5j8EiFLJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F9C564AF0;
        Mon, 18 May 2020 14:06:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA256298C;
        Mon, 18 May 2020 14:06:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200516002334.2025760-2-list.lkml.keyrings@me.benboeckel.net>
References: <20200516002334.2025760-2-list.lkml.keyrings@me.benboeckel.net> <20200516002334.2025760-1-list.lkml.keyrings@me.benboeckel.net>
To:     Ben Boeckel <me@benboeckel.net>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Ben Boeckel <mathstuf@gmail.com>
Subject: Re: [PATCH 1/1] man: the info strings are actually space or tab separated
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <869605.1589810784.1@warthog.procyon.org.uk>
Date:   Mon, 18 May 2020 15:06:24 +0100
Message-ID: <869606.1589810784@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <me@benboeckel.net> wrote:

> From: Ben Boeckel <mathstuf@gmail.com>
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Applied.

