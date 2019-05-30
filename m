Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E264C30493
	for <lists+keyrings@lfdr.de>; Fri, 31 May 2019 00:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfE3WD4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 18:03:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43080 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfE3WDz (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 18:03:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5DFC9307D910;
        Thu, 30 May 2019 22:03:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 21C7960C5F;
        Thu, 30 May 2019 22:03:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190530181248.GC70051@gmail.com>
References: <20190530181248.GC70051@gmail.com> <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        James Morris <jamorris@linux.microsoft.com>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] keys: Miscellany [ver #2]
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24107.1559253828.1@warthog.procyon.org.uk>
Date:   Thu, 30 May 2019 23:03:48 +0100
Message-ID: <24108.1559253828@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 30 May 2019 22:03:55 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Biggers <ebiggers@kernel.org> wrote:

> syzkaller still manages to crash something in the keys subsystem really
> quickly when I run it on that branch (commit 35036b7e765b6):

I've pushed a new version that should fix that, thanks.

David
