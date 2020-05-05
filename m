Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558411C51C2
	for <lists+keyrings@lfdr.de>; Tue,  5 May 2020 11:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgEEJUE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 May 2020 05:20:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:49972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727931AbgEEJUD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 5 May 2020 05:20:03 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68767206B9;
        Tue,  5 May 2020 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588670403;
        bh=umFqN2nr6WGUGKndcmJqJf8juUXXSxdtp4kqwvdHXmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zU4xeTB/UoB7m/NpUvybsxh+WB+BbvYB8fOBSxafVQ3kBMUEcS1aTFiYVcrSBKOTZ
         CzNzZULFZHFhWMw+iftE+R1dtCV1ZNP+6SeDH16c+faG/RpZR3DNLHSWlTdShecPRR
         YjXfssB8vpfuTGtUcYvOlGCDtSDialC5NdbYYnfI=
Date:   Tue, 5 May 2020 10:19:59 +0100
From:   Will Deacon <will@kernel.org>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>
Cc:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
Subject: Re: [RESEND] security/keys: remove possessor verify after key
 permission check
Message-ID: <20200505091958.GD16980@willie-the-truck>
References: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Apr 30, 2020 at 10:34:03AM +0300, Alexey Krasikov wrote:
> In security/keys/keyctl.c: keyctl_read_key() after key_permission() check
> is called is_key_possessed(). According to the current logic, if the caller is
> a possessor, then it can read the key regardless of whether it has rights
> to do so.
> 
> if I remove the possessor read rights:
>     keyctl_setperm(key, KEY_POS_ALL & (~KEY_POS_SETATTR));
> the calling process will still be able to read the key if it is possessor.
> 
> In other words, if the possessor doesn't have read rights, it doesn't matter.
> 
> ---
> I may be misunderstanding the logic behind it, but here's the patch to
> stir the discussion.
> 
> Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
> ---
>  security/keys/keyctl.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)

Hmm, looks like this still didn't make it to the keyrings@ list :(

On the off-chance that my reply /does/ make it, I've left the whole of the
patch intact below. Please can somebody have a look?

Will

--->8

> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 5e01192e222a..61e53c6b5adb 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -845,22 +845,9 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  
>  	/* see if we can read it directly */
>  	ret = key_permission(key_ref, KEY_NEED_READ);
> -	if (ret == 0)
> -		goto can_read_key;
> -	if (ret != -EACCES)
> +	if (ret != 0)
>  		goto key_put_out;
>  
> -	/* we can't; see if it's searchable from this process's keyrings
> -	 * - we automatically take account of the fact that it may be
> -	 *   dangling off an instantiation key
> -	 */
> -	if (!is_key_possessed(key_ref)) {
> -		ret = -EACCES;
> -		goto key_put_out;
> -	}
> -
> -	/* the key is probably readable - now try to read it */
> -can_read_key:
>  	if (!key->type->read) {
>  		ret = -EOPNOTSUPP;
>  		goto key_put_out;
> -- 
> 2.17.1
> 
