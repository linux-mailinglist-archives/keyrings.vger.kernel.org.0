Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6E81D1BCB
	for <lists+keyrings@lfdr.de>; Wed, 13 May 2020 19:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389507AbgEMRC1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 May 2020 13:02:27 -0400
Received: from mga04.intel.com ([192.55.52.120]:29114 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgEMRC0 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 13 May 2020 13:02:26 -0400
IronPort-SDR: 2tIy2cQRE7kVM3Fe8y5aJ7jBhQVQLXjQ0dHGkuW+ofvKjbKUfT8fHB+Mq1lMk8Qk3Y/LpQ+eT7
 OEJUq0S8jVtw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 10:02:26 -0700
IronPort-SDR: gCy9wK+Erqq5I80MrdV08xRdDFkYGJWEIYtYTy6HoBSr2zMXykhuN7W73ffP12lI4Ct1GsWRd3
 xhEXFOhtKAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="464007965"
Received: from tvladisl-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.129])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2020 10:02:23 -0700
Date:   Wed, 13 May 2020 20:02:23 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: Replace zero-length array with flexible-array
Message-ID: <20200513170223.GC25598@linux.intel.com>
References: <20200507185710.GA14910@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507185710.GA14910@embeddedor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 07, 2020 at 01:57:10PM -0500, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

David, can you pick this up? [*]

[*] Maybe a good workflow to start with is the following that you mostly
pick up the pure keyring patches. We can retune this over time if/when
needed.

/Jarkko
