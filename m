Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70B4B19FE95
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 22:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgDFUAX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 16:00:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44326 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFUAX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 16:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=kqzeiCoDoOQ3qJWZZp8tCPOkIcKx/AKK5dlo5OJFP3g=; b=nPqNqzLGmw3vq6hNA7s5ptUQr3
        uWDbaBu34UYbHaVwjlyp6TjveDEcBGTJ6jCF8Vc4JBtQJhdLPqa70GxSQFYeRgktCVTUcitQp1zmd
        BaXdpg300jsfEkWPpQyA62uY2fVEttWsDdZWLMFH40+PEPNsrZTqiqx4PxJ+Dzdy3VXX81MoTmC7f
        S9SUYQJsDdZx5mOAUU97DMKDEOZIuO0COqNxU9sv3j6iosr3mbizsk2MJ/q6Ovta8fb1LiomLnzro
        S6DP+2ApMWRMuwmVZJiZLpMGFrWzVcndIMXNqtiKijryle8Daut1hUUw7yIVCtAX5oFQWeS2+QMcO
        MeG8g8vA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jLXuq-0006Gj-Nk; Mon, 06 Apr 2020 20:00:16 +0000
Date:   Mon, 6 Apr 2020 13:00:16 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
Message-ID: <20200406200016.GJ21484@bombadil.infradead.org>
References: <20200406185827.22249-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406185827.22249-1-longman@redhat.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 06, 2020 at 02:58:27PM -0400, Waiman Long wrote:
> +/**
> + * kvfree_sensitive - free a data object containing sensitive information
> + * @addr - address of the data object to be freed
> + * @len  - length of the data object

Did you try building this with W=1?  I believe this is incorrect kerneldoc.
It should be @addr: and @len:

Also, it reads better in the htmldocs if you capitalise the first letter
of each sentence and finish with a full stop.

> @@ -914,7 +911,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  		 */
>  		if (ret > key_data_len) {
>  			if (unlikely(key_data))
> -				__kvzfree(key_data, key_data_len);
> +				kvfree_sensitive(key_data, key_data_len);

I'd drop the test of key_data here.

