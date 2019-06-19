Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7554BCB0
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 17:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbfFSPWa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 11:22:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44606 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729020AbfFSPWa (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 11:22:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 662BD821C6;
        Wed, 19 Jun 2019 15:22:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B30B95D71C;
        Wed, 19 Jun 2019 15:22:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190619151524.GA29993@rotor.kitware.com>
References: <20190619151524.GA29993@rotor.kitware.com> <20190619133033.GA11027@rotor.kitware.com> <20190605130247.GA21275@rotor.kitware.com> <17691.1560956175@warthog.procyon.org.uk>
To:     mathstuf@gmail.com
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: keyctl_capabilities and buflen
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17556.1560957748.1@warthog.procyon.org.uk>
Date:   Wed, 19 Jun 2019 16:22:28 +0100
Message-ID: <17557.1560957748@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 19 Jun 2019 15:22:30 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <mathstuf@gmail.com> wrote:

> I'm not confident enough in the kernel side to give such a tag, sorry.
> I'm more interested in the libkeyutils patches which tend to just show
> up in the repo rather than for review on the list (where I'd happily
> give such tags where I can).

Okay, thanks.

David
