Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D047A3A13
	for <lists+keyrings@lfdr.de>; Fri, 30 Aug 2019 17:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfH3PMg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Aug 2019 11:12:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48628 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727948AbfH3PMg (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 30 Aug 2019 11:12:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 143BB881346;
        Fri, 30 Aug 2019 15:12:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4492100197A;
        Fri, 30 Aug 2019 15:12:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190830145454.B91DF125411@zmta02.collab.prod.int.phx2.redhat.com>
References: <20190830145454.B91DF125411@zmta02.collab.prod.int.phx2.redhat.com> <20190830085646.14740-1-hdanton@sina.com> <4384.1567174383@warthog.procyon.org.uk>
To:     Hillf Danton <hdanton@sina.com>
Cc:     dhowells@redhat.com, Sachin Sant <sachinp@linux.vnet.ibm.com>,
        "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from LTP
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11907.1567177954.1@warthog.procyon.org.uk>
Date:   Fri, 30 Aug 2019 16:12:34 +0100
Message-ID: <11908.1567177954@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Fri, 30 Aug 2019 15:12:36 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hillf Danton <hdanton@sina.com> wrote:

> 1, callee has no pre defined duty to help caller in general; they should not
> try to do anything, however, to help their callers in principle due to
> limited info on their hands IMO.

Ah, no.  It's entirely reasonable for an API to specify that one of its
methods will be called with one or more locks held - and that the method must
be aware of this and may make use of this.

> 3, no comment can be found in security/keys/request_key_auth.c about
> the rcu already documented.

There is API documentation in Documentation/security/keys/core.rst.  If you
look at about line 1538 onwards:

  *  ``void (*describe)(const struct key *key, struct seq_file *p);``

     This method is optional. It is called during /proc/keys reading to
     summarise a key's description and payload in text form.

     This method will be called with the RCU read lock held. rcu_dereference()
     should be used to read the payload pointer if the payload is to be
     accessed. key->datalen cannot be trusted to stay consistent with the
     contents of the payload.

     The description will not change, though the key's state may.

     It is not safe to sleep in this method; the RCU read lock is held by the
     caller.

David
