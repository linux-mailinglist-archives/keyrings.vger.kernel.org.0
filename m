Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF98107620
	for <lists+keyrings@lfdr.de>; Fri, 22 Nov 2019 18:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfKVRCD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Nov 2019 12:02:03 -0500
Received: from ms.lwn.net ([45.79.88.28]:41326 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfKVRCC (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 22 Nov 2019 12:02:02 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 103F26D9;
        Fri, 22 Nov 2019 17:02:02 +0000 (UTC)
Date:   Fri, 22 Nov 2019 10:02:01 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Documentation: security: core.rst: fix warnings
Message-ID: <20191122100201.30b1e71f@lwn.net>
In-Reply-To: <20191122041806.68650-1-dwlsalmeida@gmail.com>
References: <20191122041806.68650-1-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 22 Nov 2019 01:18:06 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fix warnings due to missing markup, no change in content otherwise.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  Documentation/security/keys/core.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
> index d6d8b0b756b6..d9b0b859018b 100644
> --- a/Documentation/security/keys/core.rst
> +++ b/Documentation/security/keys/core.rst
> @@ -1102,7 +1102,7 @@ payload contents" for more information.
>      See also Documentation/security/keys/request-key.rst.
>  
>  
> - *  To search for a key in a specific domain, call:
> + *  To search for a key in a specific domain, call::
>  
>  	struct key *request_key_tag(const struct key_type *type,
>  				    const char *description,

Applied, thanks.

jon
