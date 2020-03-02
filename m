Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF72175AD4
	for <lists+keyrings@lfdr.de>; Mon,  2 Mar 2020 13:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbgCBMwW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Mar 2020 07:52:22 -0500
Received: from mga18.intel.com ([134.134.136.126]:35369 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727267AbgCBMwW (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 2 Mar 2020 07:52:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 04:52:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; 
   d="scan'208";a="273706946"
Received: from esoroki-mobl.ccr.corp.intel.com ([10.252.15.146])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2020 04:52:20 -0800
Message-ID: <7c44c7c9745d81361f3d38206e0a68095a06c171.camel@linux.intel.com>
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Cc:     keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Date:   Mon, 02 Mar 2020 14:52:19 +0200
In-Reply-To: <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200228033009.GA932@sol.localdomain>
         <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 2020-02-28 at 12:41 +0800, Yang Xu wrote:
> Currently, when we add a new user key, the calltrace as below:
> 
> add_key()
>   key_create_or_update()
>     key_alloc()
>     __key_instantiate_and_link
>       generic_key_instantiate
>         key_payload_reserve
>           ......
> 
> Since commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly"),
> we can reach max bytes/keys in key_alloc, but we forget to remove this
> limit when we reserver space for payload in key_payload_reserve. So we
> can only reach max keys but not max bytes when having delta between plen
> and type->def_datalen. Remove this limit when instantiating the key, so we
> can keep consistent with key_alloc.
> 
> Also, fix the similar problem in keyctl_chown_key().
> 
> Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
> Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko

