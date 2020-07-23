Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAAD22A49F
	for <lists+keyrings@lfdr.de>; Thu, 23 Jul 2020 03:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733229AbgGWBcj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 Jul 2020 21:32:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:59090 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733075AbgGWBcj (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 Jul 2020 21:32:39 -0400
IronPort-SDR: +jqdWu9hzF+UozJIx3GeMjVwAHzx3jTzexjcBkX++A6/ErV7ESuE3s6bUgZ4OKAvahe3bhUZ33
 0EfV3PhOVeoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="168585605"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="168585605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 18:32:38 -0700
IronPort-SDR: pTsqcZHQQ3nPDSGFdQBjwFz9HTWkoVOffURZxPc2szniHsomaYCFLjyRjSjMQ/bejoqNdNeOwO
 3f582BsuQ/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="488656357"
Received: from schwings-mobl.ger.corp.intel.com (HELO localhost) ([10.252.33.132])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2020 18:32:36 -0700
Date:   Thu, 23 Jul 2020 04:32:35 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org,
        Wei Yongjun <weiyongjun1@huawei.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: asymmetric: fix error return code in
 software_key_query()
Message-ID: <20200723013223.GA45081@linux.intel.com>
References: <159485211858.2340757.9890754969922775496.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159485211858.2340757.9890754969922775496.stgit@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jul 15, 2020 at 11:28:38PM +0100, David Howells wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fix to return negative error code -ENOMEM from kmalloc() error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: f1774cb8956a ("X.509: parse public key parameters from x509 for akcipher")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: David Howells <dhowells@redhat.com>

Why f1774cb8956a lacked any possible testing? It extends ABI anyway.

I think it is a kind of change that would require more screening before
getting applied.

> ---
> 
>  crypto/asymmetric_keys/public_key.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index d7f43d4ea925..e5fae4e838c0 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -119,6 +119,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
>  	if (IS_ERR(tfm))
>  		return PTR_ERR(tfm);
>  
> +	ret = -ENOMEM;

This is extremely confusing to read way to handle 'ret'.

Would be way more cleaner to be just simple and stupid:

	if (!key) {
		ret = -ENOMEM;
		goto error_free_tfm;
	}

>  	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
>  		      GFP_KERNEL);
>  	if (!key)

/Jarkko
