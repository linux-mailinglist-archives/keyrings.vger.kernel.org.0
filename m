Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C047D18C4E5
	for <lists+keyrings@lfdr.de>; Fri, 20 Mar 2020 02:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCTBpR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Mar 2020 21:45:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:13500 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726726AbgCTBpQ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 19 Mar 2020 21:45:16 -0400
IronPort-SDR: kRJ5SD2vNA0y9wPZWLIh7Zz+epDCJ7A+5tYAHHqaf2pVyW1JQH3Q6dui9TkZuXajzX+1cO87V2
 5ICYLN3Yv/IQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 18:45:16 -0700
IronPort-SDR: uasizdxZYx0Pd+B2DPCoVs2MEaer05b5pqGkLaOc7HMnmWl1Yvhk7RkjYis2WwdC5hbASLqGCQ
 rfzFGIwtb47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,282,1580803200"; 
   d="scan'208";a="234361937"
Received: from anakash-mobl2.ger.corp.intel.com (HELO localhost) ([10.251.183.74])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2020 18:45:14 -0700
Date:   Fri, 20 Mar 2020 03:45:13 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
        Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
Message-ID: <20200320014513.GA183331@linux.intel.com>
References: <20200319211528.GA167847@linux.intel.com>
 <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com>
 <20200228033009.GA932@sol.localdomain>
 <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200303041732.GA14653@sol.localdomain>
 <3166161.1584630501@warthog.procyon.org.uk>
 <3203731.1584653413@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3203731.1584653413@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Mar 19, 2020 at 09:30:13PM +0000, David Howells wrote:
> Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> 
> > Unfortunately it is already hanging here:
> > 
> > https://www.lkml.org/lkml/2020/3/15/314
> 
> Hanging? Or queued?

Not yet queued.

Should I request to withdraw it? There is still time to do that.

/Jarkko
