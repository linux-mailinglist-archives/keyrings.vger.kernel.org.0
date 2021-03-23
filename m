Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9643345447
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 01:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhCWAzg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 20:55:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231453AbhCWAzb (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 22 Mar 2021 20:55:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB68619AD;
        Tue, 23 Mar 2021 00:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616460931;
        bh=eL7GjnIfETK0w55hHwx5UGeZDCUlzEv98Et4KDmZU3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VflmfzXyjLWA9YO8Uh+V1TLVEHavGiiydb8pIWRlVTheDiKZSurbn3/qprgbEigPO
         qbgMYmUecidjzoK5m9zlh+Xmg4Mj50ESFEZGQ1tfwnwgTyddg5PQ2Xb5lRbpChqDBr
         Um1znQc2/EIcZNDDLsa2w67M8RPK8aVCZY9GW5+gy2/QLPUOBUbNIVyAWqghNcG1wv
         qsdCIPSVeWBYxt27By+dx9tLJtu50a5Dx2I82c2mXu5dzerom72pU0e+Ef6dfuB1vA
         VHI5COlNLSmxiz+yQgqm8KmrFwWWnXfFf/QQ+I0ChpW/p4OufyQu0iob5hCvFxDyJQ
         UOxxNYbifYzsQ==
Date:   Mon, 22 Mar 2021 17:55:29 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Andrey Ryabinin <arbn@yandex-team.ru>
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: Allow disabling read permissions for key possessor
Message-ID: <YFk8gb/M4AOGDO7Y@gmail.com>
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
> ---
> 
>  - This was noticed by code review. It seems like a bug to me,
>  but if I'm wrong and current behavior is correct, I think we need
>  at least better comment here.
>    
> 
>  security/keys/keyctl.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 96a92a645216d..2ec021c7adc12 100644
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

This might be intentional, given the comment above the function:

 * The key must either grant the caller Read permission, or it must grant the
 * caller Search permission when searched for from the process keyrings.

The 'is_key_possessed()' check is implementing the second part, right?

Maybe check if this shows up in the documentation and tests too.

- Eric
