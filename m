Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E3E4BC1B
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 16:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFSO4S (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 10:56:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41204 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfFSO4S (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 10:56:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 12DB0309266A;
        Wed, 19 Jun 2019 14:56:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D2D27608A7;
        Wed, 19 Jun 2019 14:56:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190619133033.GA11027@rotor.kitware.com>
References: <20190619133033.GA11027@rotor.kitware.com> <20190605130247.GA21275@rotor.kitware.com>
To:     mathstuf@gmail.com
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: keyctl_capabilities and buflen
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17690.1560956175.1@warthog.procyon.org.uk>
Date:   Wed, 19 Jun 2019 15:56:15 +0100
Message-ID: <17691.1560956175@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 19 Jun 2019 14:56:18 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <mathstuf@gmail.com> wrote:

> I see that this is now `unsigned char*` instead of `unsigned int` on
> `next` now and in the kernel by the newest patch submission.

If you're okay with the patch, could you reply to it with a Reviewed-by?

Thanks,
David
