Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7AE2DF23D
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2019 17:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbfJUP70 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Oct 2019 11:59:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46191 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729838AbfJUP7V (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Oct 2019 11:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571673560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gB3h1+rX6SwZqtoY3Kw85+CkKWUkDR1tjhYDoTIgQqI=;
        b=hgclhPRTLu8iogpwdpISRXnnz+2xYH7IbErEnFwkSGzSSEYo7HG8NWRNBxwR7HTSngWs/z
        yIg71MnN3MDBixReQQ/d2UOUPr62p72rzFXsAlFyv86FAqjbuQVejOAdx0WyXDzMENhVD6
        z6AWzA3RCMiPmcq3o4OB7i/Q2aQ7AKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-ZRM1CcYIMe2Hn_ko3VmGjA-1; Mon, 21 Oct 2019 11:59:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CBA01005500;
        Mon, 21 Oct 2019 15:59:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com [10.10.121.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD4756012E;
        Mon, 21 Oct 2019 15:59:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <000000000000830fe50595115344@google.com>
References: <000000000000830fe50595115344@google.com>
To:     syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>
Cc:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: WARNING: refcount bug in find_key_to_update
MIME-Version: 1.0
Content-ID: <8508.1571673553.1@warthog.procyon.org.uk>
Date:   Mon, 21 Oct 2019 16:59:13 +0100
Message-ID: <8509.1571673553@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZRM1CcYIMe2Hn_ko3VmGjA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com> wrote:

> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11c8adab600=
000

How do I tell what's been passed into the add_key for the encrypted key?

David

