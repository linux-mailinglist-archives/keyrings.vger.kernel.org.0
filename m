Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A2318C21E
	for <lists+keyrings@lfdr.de>; Thu, 19 Mar 2020 22:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCSVPc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Mar 2020 17:15:32 -0400
Received: from mga04.intel.com ([192.55.52.120]:12203 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgCSVPc (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 19 Mar 2020 17:15:32 -0400
IronPort-SDR: uBINRE+DLy9twE63QQo3TQgRCOiH5dYtLveDyb9M3QKRo19+q3ZcxXg1X+eJqW1Lb7GyBbpNtA
 PTncCskHsZng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 14:15:31 -0700
IronPort-SDR: +tI52kjsqj3LnIpBEu8DGi/ITHu9bI/LzvTGpxHRxWNTdODx+WeEqD19frMeAxIc+DAB9Bfk9b
 jXIL1evwDUog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; 
   d="scan'208";a="280213766"
Received: from oamor-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.182.181])
  by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2020 14:15:29 -0700
Date:   Thu, 19 Mar 2020 23:15:28 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
        Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
Message-ID: <20200319211528.GA167847@linux.intel.com>
References: <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com>
 <20200228033009.GA932@sol.localdomain>
 <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200303041732.GA14653@sol.localdomain>
 <3166161.1584630501@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3166161.1584630501@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Mar 19, 2020 at 03:08:21PM +0000, David Howells wrote:
> How about:
> 
> 	keys: Fix the keys quotas limit check
> 
> It's a bit unfortunate that "key" is also usable as an adjective.
> 
> David

Unfortunately it is already hanging here:

https://www.lkml.org/lkml/2020/3/15/314

/Jarkko
