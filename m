Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E7621604A
	for <lists+keyrings@lfdr.de>; Mon,  6 Jul 2020 22:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgGFU2C (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Jul 2020 16:28:02 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20703 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726280AbgGFU2C (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Jul 2020 16:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594067281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m5GJhBHfQvwYhhcm6QQRUzrq1EmA2pRjHHaTYuLf16I=;
        b=GGX/ef7aynCbbrqLin5n55bie45sIqs1LwXlkB1yi+uhI8GnDMHrNXOEawJXHt3w33jfyG
        PK6M0fRNgmQFWqq9++7rhs1kJF7uR/IblU4RWlSGUpRiDKgDpnsMjBi8JUsXrRNgVjC/Mt
        sqg0FD0chNfMMRTIv2fzPQaKZ5X/Yzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-L-ZunkeBPXCe7WjWM2qPNQ-1; Mon, 06 Jul 2020 16:27:59 -0400
X-MC-Unique: L-ZunkeBPXCe7WjWM2qPNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF6EA80040C;
        Mon,  6 Jul 2020 20:27:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com [10.10.112.113])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A2E8E275E34;
        Mon,  6 Jul 2020 20:27:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200702085723.7026-1-cvubrugier@fastmail.fm>
References: <20200702085723.7026-1-cvubrugier@fastmail.fm>
To:     Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        =?UTF-8?q?Stephan=20M=C3=BCller?= <smueller@chronox.de>
Subject: Re: [PATCH 0/4] keyutils: fix compilation error with C++
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2973695.1594067275.1@warthog.procyon.org.uk>
Date:   Mon, 06 Jul 2020 21:27:55 +0100
Message-ID: <2973696.1594067275@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Christophe Vu-Brugier <cvubrugier@fastmail.fm> wrote:

> * Patch #1 fixes a few typos in the man pages.
> * Patch #2 fixes the aforementioned issue.
> * Patch #3 helps prevent a similar issue from happening in the future.
> * Patch #4 fixes an issue reported by C++ compilers at link time.

Applied.

David

