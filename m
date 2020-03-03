Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 972981783B2
	for <lists+keyrings@lfdr.de>; Tue,  3 Mar 2020 21:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbgCCUJj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 3 Mar 2020 15:09:39 -0500
Received: from mga12.intel.com ([192.55.52.136]:18317 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728393AbgCCUJj (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 3 Mar 2020 15:09:39 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 12:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="240193043"
Received: from fkuchars-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.4.236])
  by orsmga003.jf.intel.com with ESMTP; 03 Mar 2020 12:09:34 -0800
Date:   Tue, 3 Mar 2020 22:09:28 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 02/18] docs: crypto: convert asymmetric-keys.txt to
 ReST
Message-ID: <20200303200928.GF5775@linux.intel.com>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
 <0e467df334fb6563a50190e0523a5ed1af1638ed.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e467df334fb6563a50190e0523a5ed1af1638ed.1583243826.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 03, 2020 at 02:59:09PM +0100, Mauro Carvalho Chehab wrote:
> This file is almost compatible with ReST. Just minor changes
> were needed:
> 
> - Adjust document and titles markups;
> - Adjust numbered list markups;
> - Add a comments markup for the Contents section;
> - Add markups for literal blocks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
