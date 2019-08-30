Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F17BA3B0F
	for <lists+keyrings@lfdr.de>; Fri, 30 Aug 2019 17:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbfH3PyV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Aug 2019 11:54:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44110 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727963AbfH3PyV (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 30 Aug 2019 11:54:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B2A7230832EA;
        Fri, 30 Aug 2019 15:54:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1051D6012C;
        Fri, 30 Aug 2019 15:54:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <5292a3bb-f974-e32b-0f1f-0f78a2801f7d@linux.alibaba.com>
References: <5292a3bb-f974-e32b-0f1f-0f78a2801f7d@linux.alibaba.com>
To:     Yihao Wu <wuyihao@linux.alibaba.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: Re: [PATCH RESEND] KEYS: pass expiry from X.509 cert to key structure
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12205.1567180459.1@warthog.procyon.org.uk>
Date:   Fri, 30 Aug 2019 16:54:19 +0100
Message-ID: <12206.1567180459@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 30 Aug 2019 15:54:21 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Yihao Wu <wuyihao@linux.alibaba.com> wrote:

> +    prep->expiry = cert->valid_to;

Note that this patch has whitespace breakage, but I can fix that up by hand.

David
