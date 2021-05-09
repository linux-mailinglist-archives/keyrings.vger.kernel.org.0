Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70144377885
	for <lists+keyrings@lfdr.de>; Sun,  9 May 2021 22:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhEIUoG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 9 May 2021 16:44:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhEIUoG (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sun, 9 May 2021 16:44:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31AEF6135A;
        Sun,  9 May 2021 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620592982;
        bh=G41KEdxV3XjgEswKLtAWvMoiJCLY4uFLJkmlJagnPf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rdTV/Oz4W9n2ePMqeech3RIBt4A3KtWVSjwBD7rNJOVMR3QUpdGIicvnlL/Q0pSX6
         ng7spUqXQKRFbfnBapwujPyE8WjlxQrnXV76LI9o5WeECRBYs5+y51Zpgu2IJIWt7Y
         vd5ctruu/n/h5IQtofkgIld5r/p+/0Qp6WycO1H4VdSIyV+TpEQ/2/rioKHc4lwxAD
         b6J8/tZuipLv6hgzkNZDsYlyrcb06s3nILanAD7ZD/HQGnhbNx9aZzGoX4EqWkWVlb
         0Q3g299leyVtF8S3Cgy14+l1UbfnPl1YsYVP7gireSLYQhaBq4tqsFbj7WH0BPKP1w
         dZt3oex9PMODw==
Date:   Sun, 9 May 2021 23:43:00 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     dhowells@redhat.com, jmorris@namei.org, serge@hallyn.com,
        nathan@kernel.org, ndesaulniers@google.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Keys: Remove redundant initialization of cred
Message-ID: <YJhJVEqIZAkU9xzp@kernel.org>
References: <1620467481-110575-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620467481-110575-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, May 08, 2021 at 05:51:21PM +0800, Yang Li wrote:
> Pointer cred is being initialized however this value is never
> read as cred is assigned an updated value from the returned
> call to get_current_cred(). Remove the redundant initialization.
> 
> Cleans up clang warning:
> 
> security/keys/request_key.c:119:21: warning: Value stored to 'cred'
> during its initialization is never read
> [clang-analyzer-deadcode.DeadStores]
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 'commit bb952bb98a7e ("CRED: Separate per-task-group keyrings from signal_struct")'
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  security/keys/request_key.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/keys/request_key.c b/security/keys/request_key.c
> index 2da4404..873c31f 100644
> --- a/security/keys/request_key.c
> +++ b/security/keys/request_key.c
> @@ -116,7 +116,7 @@ static int call_sbin_request_key(struct key *authkey, void *aux)
>  {
>  	static char const request_key[] = "/sbin/request-key";
>  	struct request_key_auth *rka = get_request_key_auth(authkey);
> -	const struct cred *cred = current_cred();
> +	const struct cred *cred;
>  	key_serial_t prkey, sskey;
>  	struct key *key = rka->target_key, *keyring, *session, *user_session;
>  	char *argv[9], *envp[3], uid_str[12], gid_str[12];
> -- 
> 1.8.3.1
> 
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko

