Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F067F24A821
	for <lists+keyrings@lfdr.de>; Wed, 19 Aug 2020 23:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHSVFF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Aug 2020 17:05:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:18291 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgHSVFD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Aug 2020 17:05:03 -0400
IronPort-SDR: f8sp7QlWrmaLje7tVzlqRNGOACKh7m+GFs9yLSwCkfJnxuaxgqW01C7Y4HnHIVUfx+y40CSBr7
 TFkGBamshWYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="152802718"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="152802718"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 14:05:02 -0700
IronPort-SDR: PcixcoPqvfCnmvE/OjFiiJ/P0l20uoTMg5NL7iey/R1Pm6Cz8vG/e7Bne/FKbrebvDVqtVFHse
 6/Hc5KyII0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="337082674"
Received: from pbooyens-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.52.107])
  by orsmga007.jf.intel.com with ESMTP; 19 Aug 2020 14:04:59 -0700
Date:   Thu, 20 Aug 2020 00:04:57 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Coly Li <colyli@suse.de>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3] docs: trusted-encrypted.rst: update parameters for
 command examples
Message-ID: <20200819210457.GC9942@linux.intel.com>
References: <20200818170002.38145-1-colyli@suse.de>
 <20200819210234.GB9942@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819210234.GB9942@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Aug 20, 2020 at 12:02:38AM +0300, Jarkko Sakkinen wrote:
> On Wed, Aug 19, 2020 at 01:00:02AM +0800, Coly Li wrote:
> > The parameters in command examples for tpm2_createprimary and
> > tpm2_evictcontrol are outdated, people (like me) are not able to create
> > trusted key by these command examples.
> > 
> > This patch updates the parameters of command example tpm2_createprimary
> > and tpm2_evictcontrol in trusted-encrypted.rst. With Linux kernel v5.8
> > and tpm2-tools-4.1, people can create a trusted key by following the
> > examples in this document.
> > 
> > Signed-off-by: Coly Li <colyli@suse.de>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: James Bottomley <jejb@linux.ibm.com>
> > Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > Cc: Mimi Zohar <zohar@linux.ibm.com>
> > Cc: Stefan Berger <stefanb@linux.ibm.com>
> 
> OK, now it is clear. Thank you.
> 
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

There is one problem though.

You have missed to add linux-doc and linux-integrity maintainers and
also their maintainers from the CC list. You need to resend this patch
with that information. Use get_maintainers.pl or look from the file
called MAINTAINERS.

/Jarkko
