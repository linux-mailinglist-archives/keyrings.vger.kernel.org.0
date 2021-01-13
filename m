Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE8F2F4A46
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 12:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbhAMLax (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 06:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37456 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727194AbhAMLaw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jan 2021 06:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610537366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RBvUo/6vjpBKP0pLeQRwuVWC4Mf8TIQXAT6GH3pLh/A=;
        b=Oa5dnnd7Kq7MCfMY8Nv0Vg/1QPTSNSQDSjfDoUq/UM6NlZ04lP4monn+nAAgGTH5dJDLx/
        A0Z8xxXjvT+OJgzS6fcTCCWx+l+iKbSaikZEMsLumU+1zB4loZAtSj/9P9AMVCiavcuHPC
        GwNXKbyoDcUDoeqmjILbp6JDmVR/x7U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-XgAOFD21Pky-KcC7D17JmA-1; Wed, 13 Jan 2021 06:29:24 -0500
X-MC-Unique: XgAOFD21Pky-KcC7D17JmA-1
Received: by mail-ed1-f70.google.com with SMTP id u17so717454edi.18
        for <keyrings@vger.kernel.org>; Wed, 13 Jan 2021 03:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=RBvUo/6vjpBKP0pLeQRwuVWC4Mf8TIQXAT6GH3pLh/A=;
        b=KnvODfFVYohNfLx5tsdsOZKkeps3B6CmoNWMMAVJy5G43d2xQV/hFlabbTHRkqkcOA
         PMRg0l+Xg1d+4CVsPR5DvRuKaPKWMSTKkpxYEen3xXjQV/5/6nneMFD3VO2jazZjSqp2
         nLh8nOUHjBdHznU4U97VFrqhVDQC8Wt38WJBrO+qPtBdrpYn2Csrq4eZ4TEWQaFXC/fV
         Oxs20YHAxaZnqUT8cPC+DYbig5cW6YzL5GrECSGpXnG1OXZ7cfSiJqPFvE7Fog660j2J
         8ANRTZetLQ7YRBFQP5Ap7vsdNo0CaSK1QRA52mIz35toLlXMBZHsLOz7u/00qbD2GuW3
         GF7g==
X-Gm-Message-State: AOAM530mzTIb+ynj3i/Q7/J36427KzszNAZlqoqYRw0xymcpw5K1lW4C
        AEKReu9Xi6mwx0RBPDvvbXfLao/kf5+GwHlKmc/80KF5TgCl/7qgmBOzxighIIY7UbAkJZduU5J
        rmjSIdzm3DFYqZ9TPZ/Y=
X-Received: by 2002:a17:906:c10e:: with SMTP id do14mr1293942ejc.166.1610537362770;
        Wed, 13 Jan 2021 03:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV0UhPTkqnfz0zhus4V2pdERz5D9Xe87p960xLKFrM1TiE4FX3YbkCxBmnvrwbXxFrSOjddA==
X-Received: by 2002:a17:906:c10e:: with SMTP id do14mr1293933ejc.166.1610537362623;
        Wed, 13 Jan 2021 03:29:22 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id y22sm588794ejj.111.2021.01.13.03.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 03:29:22 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id ACE1618032B; Wed, 13 Jan 2021 12:29:20 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Gilad Ben-Yossef <gilad@benyossef.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: public_key: check that pkey_algo is non-NULL
 before passing it to strcmp()
In-Reply-To: <d7a50628-5559-a054-bc47-2d45746eb503@linux.alibaba.com>
References: <20210112161044.3101-1-toke@redhat.com>
 <d7a50628-5559-a054-bc47-2d45746eb503@linux.alibaba.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 13 Jan 2021 12:29:20 +0100
Message-ID: <878s8x9isv.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:

> Hi,
>
> I have fixed this problem last week. Still thanks for your fixing.
> patch is here: https://lkml.org/lkml/2021/1/7/201

Ah, awesome! I did look if this had already been fixed, but your patch
wasn't in the crypto tree and didn't think to go perusing the mailing
lists. So sorry for the duplicate, and thanks for fixing this :)

-Toke

