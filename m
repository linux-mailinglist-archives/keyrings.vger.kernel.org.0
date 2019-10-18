Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADA57DCBCB
	for <lists+keyrings@lfdr.de>; Fri, 18 Oct 2019 18:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393591AbfJRQqb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 18 Oct 2019 12:46:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55386 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbfJRQqa (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 18 Oct 2019 12:46:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6AF458A1C80;
        Fri, 18 Oct 2019 16:46:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-84.rdu2.redhat.com [10.10.121.84])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9D9600C1;
        Fri, 18 Oct 2019 16:46:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20191017092428.7336-1-hdanton@sina.com>
References: <20191017092428.7336-1-hdanton@sina.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     dhowells@redhat.com,
        syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        jarkko.sakkinen@linux.intel.com, jmorris@namei.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: WARNING: refcount bug in find_key_to_update
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31999.1571417187.1@warthog.procyon.org.uk>
Date:   Fri, 18 Oct 2019 17:46:27 +0100
Message-ID: <32000.1571417187@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Fri, 18 Oct 2019 16:46:30 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hillf Danton <hdanton@sina.com> wrote:

> -			  (1 << KEY_FLAG_REVOKED))) {
> +			  (1 << KEY_FLAG_REVOKED)) || !key_tryget(key)) {
>  		kleave(" = NULL [x]");
>  		return NULL;
>  	}
> -	__key_get(key);

That should be ineffective and ought not to fix the bug.

David
