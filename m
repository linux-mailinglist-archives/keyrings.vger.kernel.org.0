Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58FEBA38DB
	for <lists+keyrings@lfdr.de>; Fri, 30 Aug 2019 16:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfH3ONF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Aug 2019 10:13:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61352 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727914AbfH3ONF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 30 Aug 2019 10:13:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 617ED308620B;
        Fri, 30 Aug 2019 14:13:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 125E11001925;
        Fri, 30 Aug 2019 14:13:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190830085646.14740-1-hdanton@sina.com>
References: <20190830085646.14740-1-hdanton@sina.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     dhowells@redhat.com, Sachin Sant <sachinp@linux.vnet.ibm.com>,
        linuxppc-dev@ozlabs.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from LTP
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4383.1567174383.1@warthog.procyon.org.uk>
Date:   Fri, 30 Aug 2019 15:13:03 +0100
Message-ID: <4384.1567174383@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 30 Aug 2019 14:13:05 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hillf Danton <hdanton@sina.com> wrote:

> -	struct request_key_auth *rka = dereference_key_rcu(key);
> +	struct request_key_auth *rka;
> +
> +	rcu_read_lock();
> +	rka = dereference_key_rcu(key);

This shouldn't help as the caller, proc_keys_show(), is holding the RCU read
lock across the call.  The end of the function reads:

		if (key->type->describe)
			key->type->describe(key, m);
		seq_putc(m, '\n');

		rcu_read_unlock();
		return 0;
	}

and the documentation says "This method will be called with the RCU read lock
held".

I suspect the actual bugfix is this bit:

> +	if (!rka)
> +		goto out;

David
