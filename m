Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAED822A4A3
	for <lists+keyrings@lfdr.de>; Thu, 23 Jul 2020 03:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387412AbgGWBg3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 Jul 2020 21:36:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:43875 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728914AbgGWBg2 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 Jul 2020 21:36:28 -0400
IronPort-SDR: hM2SfAXARxKwbMxSk6JaOHkSl/70rntNggy4kLVTWpRYjv4Oou8Q4MsN0IQX8LJ+6Xjzq9PbD5
 3tCZ6iWZFBYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="151761096"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="151761096"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 18:36:27 -0700
IronPort-SDR: OCxofJAfgBSRpuQqcUhQpDfslXUhmaxClJafopr1zuUTivfh3c0/hmltsjqykrtxffYelxX4xJ
 z9sGg/9Dc+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="310842811"
Received: from schwings-mobl.ger.corp.intel.com (HELO localhost) ([10.252.33.132])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2020 18:36:23 -0700
Date:   Thu, 23 Jul 2020 04:36:22 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org,
        Wei Yongjun <weiyongjun1@huawei.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: asymmetric: fix error return code in
 software_key_query()
Message-ID: <20200723013622.GB45081@linux.intel.com>
References: <159485211858.2340757.9890754969922775496.stgit@warthog.procyon.org.uk>
 <20200723013223.GA45081@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723013223.GA45081@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jul 23, 2020 at 04:32:38AM +0300, Jarkko Sakkinen wrote:
> On Wed, Jul 15, 2020 at 11:28:38PM +0100, David Howells wrote:
> > From: Wei Yongjun <weiyongjun1@huawei.com>
> > 
> > Fix to return negative error code -ENOMEM from kmalloc() error handling
> > case instead of 0, as done elsewhere in this function.
> > 
> > Fixes: f1774cb8956a ("X.509: parse public key parameters from x509 for akcipher")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > Signed-off-by: David Howells <dhowells@redhat.com>
> 
> Why f1774cb8956a lacked any possible testing? It extends ABI anyway.
> 
> I think it is a kind of change that would require more screening before
> getting applied.
> 
> > ---
> > 
> >  crypto/asymmetric_keys/public_key.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> > index d7f43d4ea925..e5fae4e838c0 100644
> > --- a/crypto/asymmetric_keys/public_key.c
> > +++ b/crypto/asymmetric_keys/public_key.c
> > @@ -119,6 +119,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
> >  	if (IS_ERR(tfm))
> >  		return PTR_ERR(tfm);
> >  
> > +	ret = -ENOMEM;
> 
> This is extremely confusing to read way to handle 'ret'.
> 
> Would be way more cleaner to be just simple and stupid:
> 
> 	if (!key) {
> 		ret = -ENOMEM;
> 		goto error_free_tfm;
> 	}

To rationalize why the 2nd way is better: the diff would tell the
whole story. Now this commit requires to check *both* the diff and
the source file to get the full understanding what is going on.

/Jarkko
