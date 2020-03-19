Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D939418C24C
	for <lists+keyrings@lfdr.de>; Thu, 19 Mar 2020 22:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgCSVad (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Mar 2020 17:30:33 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:57654 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726680AbgCSVad (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Mar 2020 17:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584653432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=INQSMIy4BlEhLC1JCr5vC5mxy+ZAhw+/2HYi53/tp7w=;
        b=I3noIl+bZumAv/Omja/qTJ3/qqW/xuC7LNH5/o10CeNk7OEP+QPgldD8IWUJDEsHalfhZt
        uovp+6CjnOXepJcNw81OxXYDciMdHG/ME26hVen88qKRWqZY09ErsWBwA4wsdkLKeK+z/y
        joFBv82bvgDYy35lBLkxeKD5AIsnYgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-UJGT-lXzOWut4RJlzlr9Mw-1; Thu, 19 Mar 2020 17:30:28 -0400
X-MC-Unique: UJGT-lXzOWut4RJlzlr9Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A95710139AA;
        Thu, 19 Mar 2020 21:30:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D0836EF9D;
        Thu, 19 Mar 2020 21:30:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200319211528.GA167847@linux.intel.com>
References: <20200319211528.GA167847@linux.intel.com> <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com> <20200228033009.GA932@sol.localdomain> <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com> <20200303041732.GA14653@sol.localdomain> <3166161.1584630501@warthog.procyon.org.uk>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
        Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3203730.1584653413.1@warthog.procyon.org.uk>
Date:   Thu, 19 Mar 2020 21:30:13 +0000
Message-ID: <3203731.1584653413@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> Unfortunately it is already hanging here:
> 
> https://www.lkml.org/lkml/2020/3/15/314

Hanging? Or queued?

David

