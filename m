Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DE0741819
	for <lists+keyrings@lfdr.de>; Wed, 28 Jun 2023 20:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbjF1SfS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 28 Jun 2023 14:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35229 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229645AbjF1SfS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 28 Jun 2023 14:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687977268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NE1gN9jyC/m2Xo9jc/p/eHR4s7D3nJPtsR0MfSzL5G4=;
        b=S7SP/zEAE56xpe4fIUJ4y6xJN0l6DczJ8Tqm/vzxfz1shZgeSqHv7NIplB7wsCUuWYiWpx
        E7f2GkkVPEsYJAnMxwn5RGBxxOPeocq42pfVGsxQ6tUjWGwZrqebmQ0OeLc+TwSSu/h95g
        rnaQqUVdNTNZpfhb9EHp/5QW8Kpn1p4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-JCjyi9g9N22iu2r4b1mgSg-1; Wed, 28 Jun 2023 14:34:23 -0400
X-MC-Unique: JCjyi9g9N22iu2r4b1mgSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 452E7101A54E;
        Wed, 28 Jun 2023 18:34:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 048E940C6F5A;
        Wed, 28 Jun 2023 18:34:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wi5D7drbmMrdA+8rMGGvA-R1fUK3ZqZ=r1ccNMiDT8atA@mail.gmail.com>
References: <CAHk-=wi5D7drbmMrdA+8rMGGvA-R1fUK3ZqZ=r1ccNMiDT8atA@mail.gmail.com> <ZIg4b8kAeW7x/oM1@gondor.apana.org.au> <570802.1686660808@warthog.procyon.org.uk> <ZIrnPcPj9Zbq51jK@gondor.apana.org.au> <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com> <ZJlf6VoKRf+OZJEo@gondor.apana.org.au> <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com> <ZJlk2GkN8rp093q9@gondor.apana.org.au> <20230628062120.GA7546@sol.localdomain> <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com> <20230628173346.GA6052@sol.localdomain> <CAMj1kXGBrNZ6-WCGH7Bbw_T_2Og8JGErZPdLHLQVB58z+vrZ8A@mail.gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dhowells@redhat.com, Ard Biesheuvel <ardb@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3695541.1687977261.1@warthog.procyon.org.uk>
Date:   Wed, 28 Jun 2023 19:34:21 +0100
Message-ID: <3695542.1687977261@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

What about something like the Intel on-die accelerators (e.g. IAA and QAT)?  I
think they can do async compression.

David

