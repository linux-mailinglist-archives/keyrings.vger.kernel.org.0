Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151C122A9B2
	for <lists+keyrings@lfdr.de>; Thu, 23 Jul 2020 09:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgGWHbc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 23 Jul 2020 03:31:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47066 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726941AbgGWHbc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 23 Jul 2020 03:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595489491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jQHRUT5gixVlpLT/vMX5zI5kpeZwUfmxkJZjL4H/0xo=;
        b=NLzsT4RpemUKm/njc+zyByUbA4ewaS4iT71+0lcKZQ7Gv7kz9Sctid/a7c7WboTTiehrQz
        BLnh3rlpJimy/0EYZ3ZpWVB4Tigx68e/tmWaw3Hujsl7z/v3j/7Bh0BGZ6czx2fLBZsPDr
        mgdIsDiVvO8ILme18ZlG3+NKzQXqD80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-IvtNbOVbOpabky9s9I6Xow-1; Thu, 23 Jul 2020 03:31:27 -0400
X-MC-Unique: IvtNbOVbOpabky9s9I6Xow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A3657;
        Thu, 23 Jul 2020 07:31:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4BC61176;
        Thu, 23 Jul 2020 07:31:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200723013223.GA45081@linux.intel.com>
References: <20200723013223.GA45081@linux.intel.com> <159485211858.2340757.9890754969922775496.stgit@warthog.procyon.org.uk>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, torvalds@linux-foundation.org,
        Wei Yongjun <weiyongjun1@huawei.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: asymmetric: fix error return code in software_key_query()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1267852.1595489483.1@warthog.procyon.org.uk>
Date:   Thu, 23 Jul 2020 08:31:23 +0100
Message-ID: <1267853.1595489483@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> >  	if (IS_ERR(tfm))
> >  		return PTR_ERR(tfm);
> >  
> > +	ret = -ENOMEM;
> 
> This is extremely confusing to read way to handle 'ret'.
> 
> Would be way more cleaner to be just simple and stupid:
> 
> 	if (!key) {
> 		ret = -ENOMEM;
> 		goto error_free_tfm;
> 	}

I agree, but we have some people who will (or who used to) moan at you for
doing in four lines what you could've done in three.  I don't know if this is
still the standard.

David

