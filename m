Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE1D718BD26
	for <lists+keyrings@lfdr.de>; Thu, 19 Mar 2020 17:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgCSQ5M (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Mar 2020 12:57:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:54315 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727382AbgCSQ5L (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Mar 2020 12:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584637031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AaKwZwOguQNJWhTrzh5ZjJRpBDCSdEfNgpiIhyBkdS0=;
        b=FAkIpGjXPkQZicjEpabyPzkeYJUy4qi4DoIMsQxJllLXEkSYq1Tx3uLyf9pROjfA1y3M28
        uOFZ/dVlUmRX5OZn4HQKtsY6ablDau3gyG+NBPDHatuu+GvujLtgC05XdePY5Wwuxf8YP9
        YiCaqkRxChT1ZeF2XHxsXhVYELscsZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-OTDR7ACAONC1Lq9ZwcRZ5A-1; Thu, 19 Mar 2020 12:57:06 -0400
X-MC-Unique: OTDR7ACAONC1Lq9ZwcRZ5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B611B2C980;
        Thu, 19 Mar 2020 16:57:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0AF33390;
        Thu, 19 Mar 2020 16:57:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200310051607.30334-7-James.Bottomley@HansenPartnership.com>
References: <20200310051607.30334-7-James.Bottomley@HansenPartnership.com> <20200310051607.30334-1-James.Bottomley@HansenPartnership.com>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     dhowells@redhat.com, linux-integrity@vger.kernel.org,
        Mimi Zohar <zohar@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH v8 6/8] security: keys: trusted: add PCR policy to TPM2 keys
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3180900.1584637023.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 19 Mar 2020 16:57:03 +0000
Message-ID: <3180901.1584637023@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> keyctl new 32 keyhandle=3D0x81000001 hash=3Dsha1 pcrinfo=3D0300000167680=
33e216468247bd
> 031a0a2d9876d79818f8f" @u

I think part of this got lost.  There's only one '"' for a start.

David

