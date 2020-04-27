Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E531BA305
	for <lists+keyrings@lfdr.de>; Mon, 27 Apr 2020 13:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgD0L5H (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Apr 2020 07:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgD0L5H (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 27 Apr 2020 07:57:07 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3CF220644;
        Mon, 27 Apr 2020 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587988627;
        bh=c3c5DR/SyfmjODj2FdK2DDP/a96lhhcFkbjDKEMPYnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j38wQfz8HrNC5dl6jYYmv7qa76/3YAAAbcNxoBzNkWcWCfD4RTFX1SzGqJ4mwFhTX
         vyaIi/dCxy51XiI5VBzAgLG07r0AH6ZZyMddgKrCUHohknpDJg7YVhydJlwfNPwhue
         t6NwwQDtCS0+oWmbcdsNRw5vuekUs+cfCvsli5Rw=
Date:   Mon, 27 Apr 2020 12:57:02 +0100
From:   Will Deacon <will@kernel.org>
To:     =?utf-8?B?0JDQu9C10LrRgdC10Lkg0JrRgNCw0YHQuNC60L7Qsg==?= 
        <alex-krasikov@yandex-team.ru>
Cc:     "dhowells@redhat.com" <dhowells@redhat.com>,
        "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "security@kernel.org" <security@kernel.org>,
        "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Subject: Re: [RFC PATCH] security/keys: remove possessor verify after key
 permission check
Message-ID: <20200427115701.GA15889@willie-the-truck>
References: <20200416123511.21640-1-alex-krasikov@yandex-team.ru>
 <40021587987860@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40021587987860@mail.yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 27, 2020 at 02:45:54PM +0300, Алексей Красиков wrote:
>    ping

Hmm, did the original patch make it to the mailing list? I don't see it in
the archives [1], so that might explain the silence.

Will
 
[1] https://www.spinics.net/lists/keyrings/maillist.html

>    "Alexey Krasikov" <alex-krasikov@yandex-team.ru>:
> 
>      In security/keys/keyctl.c: keyctl_read_key() after key_permission()
>      check
>      is called is_key_possessed(). According to the current logic, if the
>      caller is
>      a possessor, then it can read the key regardless of whether it has
>      rights
>      to do so.
> 
>      if I remove the possessor read rights:
>          keyctl_setperm(key, KEY_POS_ALL & (~KEY_POS_SETATTR));
>      the calling process will still be able to read the key if it is
>      possessor.
> 
>      In other words, if the possessor doesn't have read rights, it doesn't
>      matter.
> 
>      ---
>      I may be misunderstanding the logic behind it, but here's the patch to
>      stir the discussion.
> 
>      Signed-off-by: Alexey Krasikov <[1]alex-krasikov@yandex-team.ru>
