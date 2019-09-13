Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 837A4B20FD
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2019 15:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391542AbfIMNbF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 13 Sep 2019 09:31:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:17111 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388620AbfIMNbE (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 13 Sep 2019 09:31:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 06:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; 
   d="scan'208";a="192721575"
Received: from unknown (HELO localhost) ([10.249.39.126])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Sep 2019 06:30:59 -0700
Date:   Fri, 13 Sep 2019 14:30:57 +0100
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: asym_tpm: Use common tpm_buf for asymmetric keys
Message-ID: <20190913133057.GD7412@linux.intel.com>
References: <1568200910-31368-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568200910-31368-1-git-send-email-sumit.garg@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 11, 2019 at 04:51:50PM +0530, Sumit Garg wrote:
> Switch to utilize common heap based tpm_buf code for TPM based
> asymmetric keys rather than using stack based tpm_buf code.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Can you roll instead a new version of the whole patch set?

/Jarkko
