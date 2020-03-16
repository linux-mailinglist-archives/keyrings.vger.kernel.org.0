Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3431186A25
	for <lists+keyrings@lfdr.de>; Mon, 16 Mar 2020 12:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730840AbgCPLeb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 16 Mar 2020 07:34:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22099 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730783AbgCPLeb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 16 Mar 2020 07:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584358469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z4yHxb7pYbdu/8lnkdFoPeZU8J+nX5WxMfkBKfFUCQ4=;
        b=ibzLU0pmc4NdK6qkNW0snFJkDu7u/bklQzfv+jRj+6SToWfYKt57V2y1HPu/D1f9N9AQF1
        T2P/6D9sjfv0H/6iOMQB5ERYg/qt4nzV6MtuKoFiKEPoQCdMp6ytXCvoCWNFYF/3SPsS9G
        lHZXWCKjKcmexnEjLbcbBnK0rdpFf9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-UZw6igqXO-ay-k0IbW6pKw-1; Mon, 16 Mar 2020 07:34:28 -0400
X-MC-Unique: UZw6igqXO-ay-k0IbW6pKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC248017DF;
        Mon, 16 Mar 2020 11:34:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-182.rdu2.redhat.com [10.10.120.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A8C219CA3;
        Mon, 16 Mar 2020 11:34:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200315212706.GE224162@linux.intel.com>
References: <20200315212706.GE224162@linux.intel.com> <20200313152102.1707-1-longman@redhat.com> <20200313152102.1707-2-longman@redhat.com> <20200315192104.GD224162@linux.intel.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, Waiman Long <longman@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Mimi Zohar <zohar@linux.ibm.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        Sumit Garg <sumit.garg@linaro.org>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Eric Biggers <ebiggers@google.com>,
        Chris von Recklinghausen <crecklin@redhat.com>
Subject: Re: [PATCH v3 1/3] KEYS: Don't write out to userspace while holding key semaphore
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1794025.1584358459.1@warthog.procyon.org.uk>
Date:   Mon, 16 Mar 2020 11:34:19 +0000
Message-ID: <1794026.1584358459@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> Do you have a test case that can reproduce this on a constant basis?

In this case it's quite tricky because a network filesystem is involved.  I
wonder if it might be possible to do it with fscrypt or ecryptfs.

David

