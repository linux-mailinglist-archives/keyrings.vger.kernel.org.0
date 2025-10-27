Return-Path: <keyrings+bounces-3279-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31600C1148A
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 20:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8124052C7
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 19:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD542D8DB9;
	Mon, 27 Oct 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEzUc52X"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF74A00;
	Mon, 27 Oct 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594901; cv=none; b=YW0MrIAU1BISglhAjUjrxEnp27arOsLHcDlOJ5RxmX6skQyNOoAUzqcqzuUPCgEvusEcCYVs03OwMK3PtGUTBrlqQoWmTXUFjbx9WU8KIBnUIqjO9TqgAO5pVzOc6UkKUCU1bVcycY8yHe0G2iyZf8Oe1p8jmEwwi+h/701hC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594901; c=relaxed/simple;
	bh=DG2vmndPjXqWsweCjoe61ED7B3TMjtN8Gp4+TXHtf2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jt8nOBFL4IESvBTQIDqnV8bWVaRoU5iP4QaqRSg8ME9CJWZu+JTnGCZO6MtvRz468ndqw5pOtSQnTawRWw2pY4cZNygeZlJRPx0rzhDD+QvAe7nFGBONePKpwBxN6jPSKx9pymqOX4uUFe/tMFI256QZu9rYAIlb992n7p0/H64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEzUc52X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF79DC4CEF1;
	Mon, 27 Oct 2025 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761594901;
	bh=DG2vmndPjXqWsweCjoe61ED7B3TMjtN8Gp4+TXHtf2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEzUc52XJNenKdw4wJYy5/EDDgad/uFgBENUwgymWsMNMjvQiIXVkryZT4byIUuNH
	 HuqgRFGvHsReeoKYt5W4IGVw5WR8FQLbZ/rkt5aiyjxpSRG9NtIcDQMHmq4kUmvgGZ
	 FCpupTHSPWVMuwRmfX/zimwLZcKBqxeCItCmzajFYsfmRSpRDVHmkflLdNoQsPZ4Jo
	 oPteQ1BzIZA+TsSHn/cq4xGrxuw/jD9bSHRqNnVkYyyeMW5FpQbEQ9dY0SlpVsQpPP
	 2tXLFxz8V006RhdZyaMrkjN7jULuOAkdTRNeBIRZ2RLnnX6/+FWMgMQeCz8aQIczuQ
	 OphCsRYa8KfgA==
Date: Mon, 27 Oct 2025 21:54:57 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] keys: Remove unnecessary local variable from
 proc_keys_show
Message-ID: <aP_OEQs2RcBNfn0M@kernel.org>
References: <20251023143231.2086-2-thorsten.blum@linux.dev>
 <20251023143231.2086-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143231.2086-4-thorsten.blum@linux.dev>

On Thu, Oct 23, 2025 at 04:32:33PM +0200, Thorsten Blum wrote:
> The local variable 'rc' is only used to temporary store the result of
> calling key_task_permission(). Use the result directly and remove the
> local variable.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  security/keys/proc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/security/keys/proc.c b/security/keys/proc.c
> index 4f4e2c1824f1..39af57af2aad 100644
> --- a/security/keys/proc.c
> +++ b/security/keys/proc.c
> @@ -160,7 +160,6 @@ static int proc_keys_show(struct seq_file *m, void *v)
>  	char xbuf[16];
>  	short state;
>  	u64 timo;
> -	int rc;
>  
>  	struct keyring_search_context ctx = {
>  		.index_key		= key->index_key,
> @@ -188,8 +187,7 @@ static int proc_keys_show(struct seq_file *m, void *v)
>  	}
>  
>  	/* check whether the current task is allowed to view the key */
> -	rc = key_task_permission(key_ref, ctx.cred, KEY_NEED_VIEW);
> -	if (rc < 0)
> +	if (key_task_permission(key_ref, ctx.cred, KEY_NEED_VIEW) < 0)
>  		return 0;

I absolutely dislike combining return value check to the call.

The old version documents that we ignore the return value, which
is convoluted in the new version.

>  
>  	now = ktime_get_real_seconds();
> -- 
> 2.51.0
> 

BR, Jarkko

