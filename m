Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8707F1DCFB4
	for <lists+keyrings@lfdr.de>; Thu, 21 May 2020 16:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgEUO2l (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 May 2020 10:28:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51310 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726973AbgEUO2l (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 21 May 2020 10:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590071320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uXEeffp8zWBNaA+wgERFcr7b4fNOxAPfIyMhL0oswDU=;
        b=E28sXnlYSXzd1GrQX7MkWLjDlxFbmakhUF+ClXM786FiQ3khl4+Zexr4CDXRC+JIunf1tP
        w9VlAzViLz3nN3qwAbdcb1p31blx2Phm1nzCN3JcCeBPs88wdw8fbTfDtyaBbS9Gg/0Z8Q
        RVOlnY+f64X+z0jlv2h4a/T12gi3hLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-AoU49pntMIWBQZr9bfxFaQ-1; Thu, 21 May 2020 10:28:39 -0400
X-MC-Unique: AoU49pntMIWBQZr9bfxFaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2B83BFD7;
        Thu, 21 May 2020 14:28:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7E912A4D;
        Thu, 21 May 2020 14:28:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <1590070442.4669.12.camel@HansenPartnership.com>
References: <1590070442.4669.12.camel@HansenPartnership.com> <20200521063226.7434-1-vulab@iscas.ac.cn>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     dhowells@redhat.com, Xu Wang <vulab@iscas.ac.cn>,
        dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scrpits: Remove unneeded assignment parentheses
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <116523.1590071315.1@warthog.procyon.org.uk>
Date:   Thu, 21 May 2020 15:28:35 +0100
Message-ID: <116524.1590071315@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> > Remove unneeded assignment parentheses.
> 
> I really don't think this is a good idea.  Best practice for macros is
> to parenthesize every argument even if there are technically some cases
> where it's unnecessary because the problems in the majority cases are
> huge and unexpected.

Yep.

David

