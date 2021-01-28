Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00EE30728F
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 10:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhA1JX4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 04:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26541 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232463AbhA1JVZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 04:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611825599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BnmVGKIvsnH3KiFsOG7CdLvqfhvMHJo37XYIQD3By1w=;
        b=Sw7O4vNkZKIIav52nSVlHbY1z26wRJxKp9UOO5LZyCwrLJjEyWvGdcbmzKxZbZO0XNzL+3
        K4lFgPbMOH6VvJiFDkpOzAgJsuQOiu8A+Om0jrJJNrRboKkR4yK3wdSNZf+VBC6onmt7KN
        bhmpLa9k4D96/AyJ0wdtXorHpKyNuQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-uqtLZuADMF2qhdEiUX5iIA-1; Thu, 28 Jan 2021 04:19:55 -0500
X-MC-Unique: uqtLZuADMF2qhdEiUX5iIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E28D98049C0;
        Thu, 28 Jan 2021 09:19:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7E8D7771E;
        Thu, 28 Jan 2021 09:19:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
References: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
To:     Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] Add support for x509 certs with NIST p256 and p192 keys
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3451835.1611825591.1@warthog.procyon.org.uk>
Date:   Thu, 28 Jan 2021 09:19:51 +0000
Message-ID: <3451836.1611825591@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This (sub)set is intended to go through the keyrings tree or is it all going
through the crypto tree now?

David

