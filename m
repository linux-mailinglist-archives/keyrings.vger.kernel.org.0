Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D07F1E267E
	for <lists+keyrings@lfdr.de>; Tue, 26 May 2020 18:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgEZQHR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 May 2020 12:07:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53811 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729401AbgEZQHR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 May 2020 12:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590509236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ga1+aiKNAdSYKO4V4SMnVKbCjeKbc562al4JWbkomq0=;
        b=ZAlJp5q+El3aRAKUGQN8qkM91OZEP2lltx+DjEyKSp77pNsz4P3NBE16hv8caHYZaPdTSd
        1FNrqICxEi+k6Td6u9PAn/E8PFc7wiJJTnMFFfh0HZS2bVoPv7SIHb9EO1xHgrv5tWnAQ7
        OZM2MQSz3JkNFq8bP/iRsPYD+2mUlC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-TQD69dTlNy2Hwt2v7VI0Tw-1; Tue, 26 May 2020 12:07:10 -0400
X-MC-Unique: TQD69dTlNy2Hwt2v7VI0Tw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 238A918017E8;
        Tue, 26 May 2020 16:07:09 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A667D648DB;
        Tue, 26 May 2020 16:07:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200525103310.455f50e0@lwn.net>
References: <20200525103310.455f50e0@lwn.net> <20200516003917.2035545-1-list.lkml.keyrings@me.benboeckel.net> <20200516003917.2035545-2-list.lkml.keyrings@me.benboeckel.net>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     dhowells@redhat.com, Ben Boeckel <me@benboeckel.net>,
        keyrings@vger.kernel.org, Ben Boeckel <mathstuf@gmail.com>,
        jarkko.sakkinen@linux.intel.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] Documentation: security: core.rst: add missing argument
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3191880.1590509226.1@warthog.procyon.org.uk>
Date:   Tue, 26 May 2020 17:07:06 +0100
Message-ID: <3191881.1590509226@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> wrote:

> Applied, thanks.

Ah - I've applied it to my keys-next branch.

David

