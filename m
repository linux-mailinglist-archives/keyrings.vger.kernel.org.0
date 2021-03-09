Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7CC332CF6
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 18:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhCIRNB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 12:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40303 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231613AbhCIRMy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 12:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615309973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QDiWkJUtFaM48IgTP2YitIoq9fuTHCd8wn8lOzbyjb4=;
        b=aLAbWZSg7SqHBz8HQjqrwrGEsYlXFcUb7oF1+qidAjuG05qUuJRu+o3M2Nkv9DUr/OeDFi
        wBqiJsGRh25d+gbba4SlKAtWxm0DdJ5oC+PJm0vyFJNV1QCc6Mhr4yoBRwQxwXl8+qm0TW
        QmLlNF7UAsJ+zLMtcZP1B6UAuLiPNJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-rOiZa9gJOXOA9wVIVbv71w-1; Tue, 09 Mar 2021 12:12:49 -0500
X-MC-Unique: rOiZa9gJOXOA9wVIVbv71w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C77784BA40;
        Tue,  9 Mar 2021 17:12:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E13F5D6D7;
        Tue,  9 Mar 2021 17:12:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
References: <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com> <20210303135500.24673-1-alex.bennee@linaro.org> <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com> <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dhowells@redhat.com, Arnd Bergmann <arnd@linaro.org>,
        keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
        Joakim Bech <joakim.bech@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxim Uvarov <maxim.uvarov@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        ruchika.gupta@linaro.org,
        "Winkler, Tomas" <tomas.winkler@intel.com>, yang.huang@intel.com,
        bing.zhu@intel.com, Matti.Moell@opensynergy.com,
        hmo@opensynergy.com, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-nvme@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd.bergmann@linaro.org>,
        Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <178478.1615309961.1@warthog.procyon.org.uk>
Date:   Tue, 09 Mar 2021 17:12:41 +0000
Message-ID: <178479.1615309961@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> wrote:

> As it seems neither Microsoft nor Apple is paying it much attention
> (+/- new facts) it will be up to the community to define use cases
> for RPMB. I don't know what would make most sense, but the
> kernel keyring seems to make a bit of sense as it is a well maintained
> keyring project.

I'm afraid I don't know a whole lot about the RPMB.  I've just been and read
https://lwn.net/Articles/682276/ about it.

What is it you envision the keyring API doing with regard to this?  Being used
to represent the key needed to access the RPMB or being used to represent an
RPMB entry (does it have entries?)?

David

