Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9E1D7AAB
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 16:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgEROHA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 10:07:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35322 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727827AbgEROHA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 10:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589810819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1tgcgDAPiSepIH7vg01s0OAQzObxUTpaUDiRgczTkxc=;
        b=ZUWT3eTXj1pkmS+5O2r1KVooqIWVeteFIAb3Zb2jmjSfxIbMVeE1CaSAjOdTsUR2jGWS9j
        ROBo4KMzeZ9TRtgScxfVtf9hs4MqXsrPp16gHFjCJtiV7EFbRbB1hZFnP2MMt99DYBjlbK
        /wTpL4shHRwNvawRycQ8ilFbBbv29/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-gRN_4zkwOPSdtN_TPLh9ZQ-1; Mon, 18 May 2020 10:06:57 -0400
X-MC-Unique: gRN_4zkwOPSdtN_TPLh9ZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D632718B6135;
        Mon, 18 May 2020 14:06:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 220BE62925;
        Mon, 18 May 2020 14:06:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200513222306.870160-2-list.lkml.keyrings@me.benboeckel.net>
References: <20200513222306.870160-2-list.lkml.keyrings@me.benboeckel.net> <20200513222306.870160-1-list.lkml.keyrings@me.benboeckel.net>
To:     Ben Boeckel <me@benboeckel.net>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Ben Boeckel <mathstuf@gmail.com>
Subject: Re: [PATCH 1/1] man: clarify that keyctl_set_reqkey_keyring(3) returns the old default
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <869618.1589810797.1@warthog.procyon.org.uk>
Date:   Mon, 18 May 2020 15:06:37 +0100
Message-ID: <869619.1589810797@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <me@benboeckel.net> wrote:

> From: Ben Boeckel <mathstuf@gmail.com>
> 
> The prose mentions this, but the return value section gave conflicting
> information.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Applied.

