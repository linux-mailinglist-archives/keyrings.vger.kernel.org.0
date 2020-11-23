Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224F12C1909
	for <lists+keyrings@lfdr.de>; Mon, 23 Nov 2020 23:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733128AbgKWW4Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 23 Nov 2020 17:56:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:52528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732877AbgKWW4X (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 23 Nov 2020 17:56:23 -0500
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6511220717;
        Mon, 23 Nov 2020 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606172182;
        bh=/hzv+Q/ks2ebnvL3jtPDZcHnFwvZ7Z3vwANIFBchVe4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vfHq7GmkrUpHnEMw9Xk9CgxCBOMsxoJBV4355ZewF6Wn2fQqXnaksBOyXlitW3rPU
         qzG/y8jJ9lWyOsxKYgT9JqL+zuuVi+5ohLc+6PYObN7LRMVFP4jGMyvyeYMq18T7jE
         Zfc9uyJvr8FHr67KzftYF6T27GYZRYkSrtnzqme4=
Date:   Tue, 24 Nov 2020 00:56:18 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Gabriel Krisman Bertazi <krisman@collabora.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org, kernel@collabora.com
Subject: Re: [RESEND PATCH] watch_queue: Drop references to /dev/watch_queue
Message-ID: <20201123225618.GC19839@kernel.org>
References: <20201122054700.1499338-1-krisman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122054700.1499338-1-krisman@collabora.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, Nov 22, 2020 at 12:47:00AM -0500, Gabriel Krisman Bertazi wrote:
> Hi,
> 
> I sent this a while ago and I haven't seen it pop-up in any trees yet.
> I'm sorry if I missed it somewhere.
> 
> Otherwise, gently ping.
> 
> -- >8 --
> 
> The merged API doesn't use a watch_queue device, but instead relies on
> pipes, so let the documentation reflect that.
> 
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---

Shouldn't this have a fixes tag? Otherwise, looks good.

>  Documentation/security/keys/core.rst | 4 ++--
>  samples/Kconfig                      | 2 +-
>  samples/watch_queue/watch_test.c     | 2 +-
>  security/keys/Kconfig                | 8 ++++----
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
> index aa0081685ee1..b3ed5c581034 100644
> --- a/Documentation/security/keys/core.rst
> +++ b/Documentation/security/keys/core.rst
> @@ -1040,8 +1040,8 @@ The keyctl syscall functions are:
>  
>       "key" is the ID of the key to be watched.
>  
> -     "queue_fd" is a file descriptor referring to an open "/dev/watch_queue"
> -     which manages the buffer into which notifications will be delivered.
> +     "queue_fd" is a file descriptor referring to an open pipe which
> +     manages the buffer into which notifications will be delivered.
>  
>       "filter" is either NULL to remove a watch or a filter specification to
>       indicate what events are required from the key.
> diff --git a/samples/Kconfig b/samples/Kconfig
> index 0ed6e4d71d87..e76cdfc50e25 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -210,7 +210,7 @@ config SAMPLE_WATCHDOG
>  	depends on CC_CAN_LINK
>  
>  config SAMPLE_WATCH_QUEUE
> -	bool "Build example /dev/watch_queue notification consumer"
> +	bool "Build example watch_queue notification API consumer"
>  	depends on CC_CAN_LINK && HEADERS_INSTALL
>  	help
>  	  Build example userspace program to use the new mount_notify(),
> diff --git a/samples/watch_queue/watch_test.c b/samples/watch_queue/watch_test.c
> index 46e618a897fe..8c6cb57d5cfc 100644
> --- a/samples/watch_queue/watch_test.c
> +++ b/samples/watch_queue/watch_test.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/* Use /dev/watch_queue to watch for notifications.
> +/* Use watch_queue API to watch for notifications.
>   *
>   * Copyright (C) 2020 Red Hat, Inc. All Rights Reserved.
>   * Written by David Howells (dhowells@redhat.com)
> diff --git a/security/keys/Kconfig b/security/keys/Kconfig
> index 83bc23409164..c161642a8484 100644
> --- a/security/keys/Kconfig
> +++ b/security/keys/Kconfig
> @@ -119,7 +119,7 @@ config KEY_NOTIFICATIONS
>  	bool "Provide key/keyring change notifications"
>  	depends on KEYS && WATCH_QUEUE
>  	help
> -	  This option provides support for getting change notifications on keys
> -	  and keyrings on which the caller has View permission.  This makes use
> -	  of the /dev/watch_queue misc device to handle the notification
> -	  buffer and provides KEYCTL_WATCH_KEY to enable/disable watches.
> +	  This option provides support for getting change notifications
> +	  on keys and keyrings on which the caller has View permission.
> +	  This makes use of pipes to handle the notification buffer and
> +	  provides KEYCTL_WATCH_KEY to enable/disable watches.
> -- 
> 2.29.2
> 
> 

/Jarkko
