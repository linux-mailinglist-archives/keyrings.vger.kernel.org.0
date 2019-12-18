Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E8412563D
	for <lists+keyrings@lfdr.de>; Wed, 18 Dec 2019 23:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfLRWGX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Dec 2019 17:06:23 -0500
Received: from mga01.intel.com ([192.55.52.88]:57821 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbfLRWGX (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Dec 2019 17:06:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 14:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="365874367"
Received: from jtreacy-mobl1.ger.corp.intel.com ([10.251.82.127])
  by orsmga004.jf.intel.com with ESMTP; 18 Dec 2019 14:06:20 -0800
Message-ID: <73018a43cf345264d135e4b3a4c6c84ba0651489.camel@linux.intel.com>
Subject: Re: [PATCH] KEYS: trusted: fix type warnings in ntohl/nthos
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20191217110939.2067979-1-ben.dooks@codethink.co.uk>
References: <20191217110939.2067979-1-ben.dooks@codethink.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160
 Espoo
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 19 Dec 2019 00:06:14 +0200
User-Agent: Evolution 3.34.1-2 
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2019-12-17 at 11:09 +0000, Ben Dooks (Codethink) wrote:
> The ntohl takes a __be32 and ntohs takes __be16, so cast to
> those types before passing it to the byte swapping functions.
> 
> Note, would be32_to_cpu and be16_to_cpu be better here?

Yes, can you refine this?

Also in commit message you could

"
E.g.

security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
"

We get the idea from one line :-)

/Jarkko

