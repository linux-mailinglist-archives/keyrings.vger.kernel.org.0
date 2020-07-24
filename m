Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B2222BED3
	for <lists+keyrings@lfdr.de>; Fri, 24 Jul 2020 09:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGXHQl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 24 Jul 2020 03:16:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:8331 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgGXHQj (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 24 Jul 2020 03:16:39 -0400
IronPort-SDR: JBw9HJ8w3SQr9VKOkFXMvcTmcq8VvzfJiPxaz9V3mBzXhXPuGO7iSQDeQEdllvlMI/qd+rthLi
 HeEZWFTy6Big==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="130744636"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="130744636"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2020 00:16:38 -0700
IronPort-SDR: j2KK6kP0J+fDiKxJ95jlu/hDyyYP9v6JH6cA4bkpmW8feH7gE8IfsA4vWqkJ+k32bHItnhQeVf
 JDPgRgmGlMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="320922247"
Received: from cbuerkle-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.36.184])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2020 00:16:36 -0700
Date:   Fri, 24 Jul 2020 10:16:34 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     torvalds@linux-foundation.org,
        Wei Yongjun <weiyongjun1@huawei.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: asymmetric: fix error return code in
 software_key_query()
Message-ID: <20200724071634.GA1872662@linux.intel.com>
References: <20200723013223.GA45081@linux.intel.com>
 <159485211858.2340757.9890754969922775496.stgit@warthog.procyon.org.uk>
 <1269137.1595490145@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1269137.1595490145@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jul 23, 2020 at 08:42:25AM +0100, David Howells wrote:
> Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> 
> > Why f1774cb8956a lacked any possible testing? It extends ABI anyway.
> > 
> > I think it is a kind of change that would require more screening before
> > getting applied.
> 
> Yeah.  It went in via a round-about route.  I left off development of it when
> the tpm stuff I wrote broke because the tpm2 stuff went in upstream.  I then
> handed the patches off to Denis who did the tpm support, but I never got my
> stuff finished enough to work out how to do the testsuite (since it would
> involve using a tpm).  However, since I did the PKCS#8 testing module as well,
> I guess I don't need that to at least test the API.  I'll look at using that
> to add some tests.  Any suggestions as to how to do testing via the tpm?
> 
> David

The unfortunate thing is that I was not involved with asym_tpm.c review
process in any possible way, which means that at the moment I lack both:

1. Knowledge of crypto/asymmetric_keys.
2. How asym_tpm.c is implemented.

I only became aware of asym_tpm.c's existence last Sep [*].

I'll put to my backlog to try TPM asymmetric keys (earliest when I'm back
from vacation 08/10).

[*] https://lore.kernel.org/linux-integrity/20190926171601.30404-1-jarkko.sakkinen@linux.intel.com/

/Jarkko
