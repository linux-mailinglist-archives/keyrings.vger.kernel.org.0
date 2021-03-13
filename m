Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F57333A106
	for <lists+keyrings@lfdr.de>; Sat, 13 Mar 2021 21:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhCMU2L (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 13 Mar 2021 15:28:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43339 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234512AbhCMU14 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 13 Mar 2021 15:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615667275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=npd6iH7N0eZ87v+8lRO4RqkY5NTrMAoR2uHc3q8d1l0=;
        b=KDB3HVThf76mwOx/TwzHWtfY44I9mSpqPYvyTq6lQKLtni3BSmJ2Ao6oqfoAubesHv3IPD
        A0FxxsFJhiu35KNuX34FnNn8FQq5EpbCu6QomxjRDdBJOMZkwrgCKUZGvxOK2epTbX/XsS
        yQ4uswWgV0iIIGB1xrNPHTufdP0wE4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-wfTq5RUkPb68YwdkHN7alg-1; Sat, 13 Mar 2021 15:27:53 -0500
X-MC-Unique: wfTq5RUkPb68YwdkHN7alg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 126493EB9;
        Sat, 13 Mar 2021 20:27:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D4CD60C5F;
        Sat, 13 Mar 2021 20:27:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <12AAB359-A315-490E-8B94-FF947997B30E@oracle.com>
References: <12AAB359-A315-490E-8B94-FF947997B30E@oracle.com> <337B72A8-C81A-4C53-A4D6-FFFD7FA66CEC@oracle.com> <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk> <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk> <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com> <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com> <b10f51dc-b9d7-e84d-3a52-438ebd358a7d@canonical.com> <2579343.1615623232@warthog.procyon.org.uk>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com,
        Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] integrity: Load mokx variables into the blacklist keyring
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2625019.1615667266.1@warthog.procyon.org.uk>
Date:   Sat, 13 Mar 2021 20:27:46 +0000
Message-ID: <2625020.1615667266@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> > Can this go separately, or would it be better rolled into the existing
> > patchset?
> 
> IMHO, since you have already sent a pull request and this is not available
> yet in shim, it seems save to have it go separately.  I should have time 
> to send something out next week to address this change.

Ok, thanks.

David

