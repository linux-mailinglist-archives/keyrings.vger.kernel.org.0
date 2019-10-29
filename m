Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A15E8A8E
	for <lists+keyrings@lfdr.de>; Tue, 29 Oct 2019 15:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388595AbfJ2OQn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 29 Oct 2019 10:16:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:40433 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbfJ2OQn (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 29 Oct 2019 10:16:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 07:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; 
   d="scan'208";a="189956252"
Received: from jkenneal-mobl.ger.corp.intel.com (HELO localhost) ([10.252.31.252])
  by orsmga007.jf.intel.com with ESMTP; 29 Oct 2019 07:16:38 -0700
Date:   Tue, 29 Oct 2019 16:16:37 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     dhowells@redhat.com, jmorris@namei.org, serge@hallyn.com,
        sumit.garg@linaro.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] KEYS: trusted: Remove set but not used variable 'keyhndl'
Message-ID: <20191029141637.GA7415@linux.intel.com>
References: <1572341612-31893-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572341612-31893-1-git-send-email-zhengbin13@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 29, 2019 at 05:33:32PM +0800, zhengbin wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> security/keys/trusted-keys/trusted_tpm1.c: In function tpm_unseal:
> security/keys/trusted-keys/trusted_tpm1.c:588:11: warning: variable keyhndl set but not used [-Wunused-but-set-variable]
> 
> It is introduced by commit 00aa975bd031 ("KEYS: trusted:
> Create trusted keys subsystem"), but never used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

I'll pick this to my tree.

/Jarkko
