Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CDF1783D1
	for <lists+keyrings@lfdr.de>; Tue,  3 Mar 2020 21:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbgCCUTF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 3 Mar 2020 15:19:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:2866 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbgCCUTF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 3 Mar 2020 15:19:05 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 12:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="229061102"
Received: from fkuchars-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.4.236])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2020 12:19:01 -0800
Date:   Tue, 3 Mar 2020 22:18:59 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Biggers <ebiggers@kernel.org>, dhowells@redhat.com
Cc:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
Message-ID: <20200303201847.GI5775@linux.intel.com>
References: <20200228033009.GA932@sol.localdomain>
 <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200303041732.GA14653@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303041732.GA14653@sol.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 02, 2020 at 08:17:32PM -0800, Eric Biggers wrote:
> On Fri, Feb 28, 2020 at 12:41:51PM +0800, Yang Xu wrote:
> >
> > Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
> 
> The subject should be in imperative tense, like
> "KEYS: reach the keys quotas correctly"

Preferably with a capital letter .

> 
> > Currently, when we add a new user key, the calltrace as below:
> > 
> > add_key()
> >   key_create_or_update()
> >     key_alloc()
> >     __key_instantiate_and_link
> >       generic_key_instantiate
> >         key_payload_reserve
> >           ......
> > 
> > Since commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly"),
> > we can reach max bytes/keys in key_alloc, but we forget to remove this
> > limit when we reserver space for payload in key_payload_reserve. So we
> > can only reach max keys but not max bytes when having delta between plen
> > and type->def_datalen. Remove this limit when instantiating the key, so we
> > can keep consistent with key_alloc.
> > 
> > Also, fix the similar problem in keyctl_chown_key().
> > 
> > Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
> > Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> > Cc: Eric Biggers <ebiggers@google.com>
> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> 
> Otherwise this looks fine.  Thanks!
> 
> Reviewed-by: Eric Biggers <ebiggers@google.com>

David, should I pick this is up to my tree?

/Jarkko
