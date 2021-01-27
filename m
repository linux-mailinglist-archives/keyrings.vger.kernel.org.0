Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DEA305C89
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 14:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238210AbhA0NJU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 08:09:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51225 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237363AbhA0NH2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 08:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611752763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qLn5/wsS0dcwc4LcvWQZoJ8QO8t05OxxxLh72rUzLqw=;
        b=bXzeoByXPE3E/J/9zRb6xy2SAfiMY9SY9Tgkonh8Bldp6wA99rEAiYLPjtzm3zH9T3M/YB
        npPrhUyO8IIth9riW+Bi1y5zeHJC7IJvJiQ1G7FV07ksx6JaYBaq6tANRMBdz4IZX2zmfu
        NFcjc+DquJnBKoEA+0NTReNN4Ti6d9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Q4WTgsKxNDqw4tXvcp7b4g-1; Wed, 27 Jan 2021 08:05:58 -0500
X-MC-Unique: Q4WTgsKxNDqw4tXvcp7b4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A94C19251A4;
        Wed, 27 Jan 2021 13:05:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D0D8619D80;
        Wed, 27 Jan 2021 13:05:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
To:     Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] Add support for x509 certs with NIST p256 and p192 keys
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3069453.1611752753.1@warthog.procyon.org.uk>
Date:   Wed, 27 Jan 2021 13:05:53 +0000
Message-ID: <3069454.1611752753@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> k=$(keyctrl newring test @u)

keyctl - but I can fix that.

David

