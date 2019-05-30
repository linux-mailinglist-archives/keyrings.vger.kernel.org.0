Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1C92FC60
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 15:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfE3Nbx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 09:31:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48066 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbfE3Nbx (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 09:31:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6377530833AF;
        Thu, 30 May 2019 13:31:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8E9608CD;
        Thu, 30 May 2019 13:31:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20190529232500.GA131466@gmail.com>
References: <20190529232500.GA131466@gmail.com> <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856412507.10428.15987388402707639951.stgit@warthog.procyon.org.uk>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] keys: Add a keyctl to move a key between keyrings
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3771.1559223108.1@warthog.procyon.org.uk>
Date:   Thu, 30 May 2019 14:31:48 +0100
Message-ID: <3772.1559223108@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 30 May 2019 13:31:53 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Biggers <ebiggers@kernel.org> wrote:

> This shows up after a few seconds of syzkaller fuzzing with a description of
> KEYCTL_MOVE added:

Yeah...  I'm fixing that now.  I've also created a bunch of tests, manpages,
etc. for keyutils which I'll push when I've fixed my patches.

David
