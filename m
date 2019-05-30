Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6723C303E0
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 23:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbfE3VLt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 17:11:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35862 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfE3VLt (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 17:11:49 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 681DA308AA11;
        Thu, 30 May 2019 21:11:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 03DC860BF3;
        Thu, 30 May 2019 21:11:42 +0000 (UTC)
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
Content-ID: <16575.1559250702.1@warthog.procyon.org.uk>
Date:   Thu, 30 May 2019 22:11:42 +0100
Message-ID: <16576.1559250702@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 30 May 2019 21:11:49 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Biggers <ebiggers@kernel.org> wrote:

>  key_create_or_update+0x868/0xbb0 security/keys/key.c:943

I forgot to init edit:

	struct assoc_array_edit *edit;

to NULL.

David
