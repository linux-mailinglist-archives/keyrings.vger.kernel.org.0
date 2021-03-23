Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B69934553A
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 03:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhCWCC7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 22:02:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:50538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhCWCCo (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 22 Mar 2021 22:02:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65CB661923;
        Tue, 23 Mar 2021 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616464963;
        bh=5lknl+7lO43LIBnWuIVTTxHxnStZYFW36kMNB87zaxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lg/NJae8JYDvPaXUEw0byQ8ayYpvyiBgnL0vDZG3wEgGiDkaY+iwLIG6jsOTIkhvA
         X1wLCA990qqQDXfKaPmymVZdQw3SB5J0G+yPTBdNVR+CSUURzrd1ZdPqOv1Stbh9Ml
         5qsxtEKRNS5Nr9PHyEKzrR2/dKtp09ry1rpfCaaIuuJDHL0D1OWpsdtkxcslq3VVoE
         eaJmsL/rX8BfsZNGn0K0ZVvivkzv7MfIXrcqTUwp5A1aZJ+3gtBJE+eGK/bMfdvw+7
         LtvcHuRlpwvW+gTDL+duVBkH+GGyzX5OyJcP4gFdupBvU46ymubL4c87Jj2H1VMM0B
         RLZmsxMWsG8Ow==
Date:   Tue, 23 Mar 2021 04:02:15 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrey Ryabinin <arbn@yandex-team.ru>,
        David Howells <dhowells@redhat.com>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: Allow disabling read permissions for key possessor
Message-ID: <YFlMJ12+3/MpYixW@kernel.org>
References: <20210322095726.14939-1-arbn@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322095726.14939-1-arbn@yandex-team.ru>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 22, 2021 at 12:57:26PM +0300, Andrey Ryabinin wrote:
> keyctl_read_key() has a strange code which allows possessor to read
> key's payload regardless of READ permission status:
> 
> $ keyctl add user test test @u
> 196773443
> $ keyctl print 196773443
> test
> $ keyctl describe 196773443
> 196773443: alswrv-----v------------  1000  1000 user: test
> $ keyctl rdescribe 196773443
> user;1000;1000;3f010000;test
> $ keyctl setperm 196773443 0x3d010000
> $ keyctl describe 196773443
> 196773443: alsw-v-----v------------  1000  1000 user: test
> $ keyctl  print 196773443
> test
> 
> The last keyctl print should fail with -EACCESS instead of success.
> Fix this by removing weird possessor checks.
> 
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.ru>

I wrote a new test. If you include a test into a commit please
describe it so that it can be easily executed. Otherwise, it is
somewhat useless.

Anyway,

https://gist.github.com/jarkk0sakkinen/7b417be20cb52ed971a90561192f0883

David, why all of these end up allowing to still print the payload?

/Jarkko
