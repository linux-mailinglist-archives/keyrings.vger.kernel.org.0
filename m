Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A412A4FA1
	for <lists+keyrings@lfdr.de>; Mon,  2 Sep 2019 09:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfIBHTd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Sep 2019 03:19:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53774 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfIBHTd (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 2 Sep 2019 03:19:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A25291053E64;
        Mon,  2 Sep 2019 07:19:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9B38B5D6B7;
        Mon,  2 Sep 2019 07:19:32 +0000 (UTC)
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
Content-ID: <1379.1567408771.1@warthog.procyon.org.uk>
Date:   Mon, 02 Sep 2019 08:19:31 +0100
Message-ID: <1380.1567408771@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Mon, 02 Sep 2019 07:19:33 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Yihao Wu <wuyihao@linux.alibaba.com> wrote:

> Expiry time is not utilized by X.509 cert yet. This patch reads expiry
> from X.509 cert into key_preparsed_payload. Then it is passed to key
> structure when the key is being instantiated.

Thinking on it again, it's more complicated than you think: Unless you can
guarantee that the system clock is correct at time of boot, this may cause the
system to fail to boot.  The certs used for module signing and suchlike may
appear to be expired because the clock is wrong and thus not be usable.

David
