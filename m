Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05BE24DEC8
	for <lists+keyrings@lfdr.de>; Fri, 21 Aug 2020 19:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgHURnl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 Aug 2020 13:43:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:35186 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbgHURnk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 21 Aug 2020 13:43:40 -0400
IronPort-SDR: vCFLoHLDoJkT2duxmM05cDEItPNMcaip8MbdINIY7rTRGxLZn1Fjhu1v65vTzeDomWE/7WCFRg
 n7gnWAi+wTzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="135656993"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; 
   d="scan'208";a="135656993"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 10:43:39 -0700
IronPort-SDR: 7SEMlRDQ/ABQdv+zxmFjOCitI74ax7knxTslSfe7ysIrdVygKow79rzQX+bCjIrk2yxlz7bmeP
 qR1yRowG5uAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; 
   d="scan'208";a="330105848"
Received: from jjakacki-mobl.ger.corp.intel.com (HELO localhost) ([10.252.52.112])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2020 10:43:38 -0700
Date:   Fri, 21 Aug 2020 20:43:37 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Coly Li <colyli@suse.de>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3] docs: trusted-encrypted.rst: update parameters for
 command examples
Message-ID: <20200821174337.GC3559@linux.intel.com>
References: <20200818170002.38145-1-colyli@suse.de>
 <20200819210234.GB9942@linux.intel.com>
 <20200819210457.GC9942@linux.intel.com>
 <1a54fdde-6067-1dd1-8459-079023be9a82@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a54fdde-6067-1dd1-8459-079023be9a82@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Aug 21, 2020 at 09:50:16PM +0800, Coly Li wrote:
> On 2020/8/20 05:04, Jarkko Sakkinen wrote:
> > On Thu, Aug 20, 2020 at 12:02:38AM +0300, Jarkko Sakkinen wrote:
> >> On Wed, Aug 19, 2020 at 01:00:02AM +0800, Coly Li wrote:
> >>> The parameters in command examples for tpm2_createprimary and
> >>> tpm2_evictcontrol are outdated, people (like me) are not able to create
> >>> trusted key by these command examples.
> >>>
> >>> This patch updates the parameters of command example tpm2_createprimary
> >>> and tpm2_evictcontrol in trusted-encrypted.rst. With Linux kernel v5.8
> >>> and tpm2-tools-4.1, people can create a trusted key by following the
> >>> examples in this document.
> >>>
> >>> Signed-off-by: Coly Li <colyli@suse.de>
> >>> Cc: Dan Williams <dan.j.williams@intel.com>
> >>> Cc: James Bottomley <jejb@linux.ibm.com>
> >>> Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >>> Cc: Mimi Zohar <zohar@linux.ibm.com>
> >>> Cc: Stefan Berger <stefanb@linux.ibm.com>
> >>
> >> OK, now it is clear. Thank you.
> >>
> >> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > 
> > There is one problem though.
> > 
> > You have missed to add linux-doc and linux-integrity maintainers and
> > also their maintainers from the CC list. You need to resend this patch
> > with that information. Use get_maintainers.pl or look from the file
> > called MAINTAINERS.
> 
> Copied. Some of the maintainers are in Cc list already, I add rested in
> v4 patch, and Cc linux-doc and linux-integrity mailing lists.

Please do.

> Thanks.
> 
> Coly Li

BR,
/Jarkko
