Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4899DE8A99
	for <lists+keyrings@lfdr.de>; Tue, 29 Oct 2019 15:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389157AbfJ2OS7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 29 Oct 2019 10:18:59 -0400
Received: from mga07.intel.com ([134.134.136.100]:14091 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388871AbfJ2OS7 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 29 Oct 2019 10:18:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 07:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; 
   d="scan'208";a="193618177"
Received: from jkenneal-mobl.ger.corp.intel.com (HELO localhost) ([10.252.31.252])
  by orsmga008.jf.intel.com with ESMTP; 29 Oct 2019 07:18:53 -0700
Date:   Tue, 29 Oct 2019 16:18:52 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     dhowells@redhat.com, jmorris@namei.org, serge@hallyn.com,
        sumit.garg@linaro.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] KEYS: trusted: Remove set but not used variable 'keyhndl'
Message-ID: <20191029141852.GB7415@linux.intel.com>
References: <1572341612-31893-1-git-send-email-zhengbin13@huawei.com>
 <20191029141637.GA7415@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029141637.GA7415@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 29, 2019 at 04:16:37PM +0200, Jarkko Sakkinen wrote:
> On Tue, Oct 29, 2019 at 05:33:32PM +0800, zhengbin wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning:
> > 
> > security/keys/trusted-keys/trusted_tpm1.c: In function tpm_unseal:
> > security/keys/trusted-keys/trusted_tpm1.c:588:11: warning: variable keyhndl set but not used [-Wunused-but-set-variable]
> > 
> > It is introduced by commit 00aa975bd031 ("KEYS: trusted:
> > Create trusted keys subsystem"), but never used, so remove it.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: zhengbin <zhengbin13@huawei.com>
> 
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> I'll pick this to my tree.

Please use fixes tag next time instead of ad hoc.

Anyway, applied, thanks.

/Jarkko
