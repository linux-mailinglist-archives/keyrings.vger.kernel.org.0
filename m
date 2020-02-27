Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74401172358
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2020 17:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgB0Q00 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Feb 2020 11:26:26 -0500
Received: from mga02.intel.com ([134.134.136.20]:59652 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730018AbgB0Q00 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 27 Feb 2020 11:26:26 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Feb 2020 08:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,492,1574150400"; 
   d="scan'208";a="317834945"
Received: from mchodson-mobl.ger.corp.intel.com (HELO localhost) ([10.252.26.84])
  by orsmga001.jf.intel.com with ESMTP; 27 Feb 2020 08:26:24 -0800
Date:   Thu, 27 Feb 2020 18:26:23 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        xuyang_jy_0410@163.com
Subject: Re: [PATCH] KEYS: reaching the keys quotas correctly when
 instanttiating
Message-ID: <20200227162623.GG5140@linux.intel.com>
References: <1582799145-16073-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582799145-16073-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Feb 27, 2020 at 06:25:45PM +0800, Yang Xu wrote:
> I wrote a regression test[1]to test commit a08bf91ce28ed
> ("KEYS: allow reaching the keys quotas exactly"), but it
> failed even I used lastest kernel. It looks like the previous
> patch doesn't remove "=" when we instantiate the key.
> 
> [1]http://lists.linux.it/pipermail/ltp/2020-February/015331.html
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

1. Describe the failure and how this patch fixes in the commit
   message.
2. Add a fixes tag.

/Jarkko
