Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F84624A817
	for <lists+keyrings@lfdr.de>; Wed, 19 Aug 2020 23:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgHSVBs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Aug 2020 17:01:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:49564 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgHSVBs (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Aug 2020 17:01:48 -0400
IronPort-SDR: HR52TbLMav+Oy2lnFr8/RG1AJlrVrvUowJqSqK+DLdlYBs6bQlcydLupnpl7e2czLU2vNAkRPC
 KOP65R7qH39g==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="219502311"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="219502311"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 14:01:36 -0700
IronPort-SDR: htkgrLPtzc5qOD5RU/6QAWfvSxbCanfny7gU/PDeOgNy+1TeEB1MKg7dAeoS5nolpasX8XRnjm
 m9hZXUmBa/Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="337081925"
Received: from pbooyens-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.52.107])
  by orsmga007.jf.intel.com with ESMTP; 19 Aug 2020 14:01:34 -0700
Date:   Thu, 20 Aug 2020 00:01:33 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     James Bottomley <jejb@linux.ibm.com>
Cc:     Coly Li <colyli@suse.de>, Stefan Berger <stefanb@linux.ibm.com>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH RESEND] docs: update trusted-encrypted.rst
Message-ID: <20200819210133.GA9942@linux.intel.com>
References: <20200815075143.47082-1-colyli@suse.de>
 <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
 <1597595769.8344.7.camel@linux.ibm.com>
 <f9d4c4a9-5059-eae2-bc89-51f16e8ca4d9@suse.de>
 <1597597933.8344.13.camel@linux.ibm.com>
 <20200818154444.GA137138@linux.intel.com>
 <1597767558.3898.14.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597767558.3898.14.camel@linux.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Aug 18, 2020 at 09:19:18AM -0700, James Bottomley wrote:
> On Tue, 2020-08-18 at 18:44 +0300, Jarkko Sakkinen wrote:
> > On Sun, Aug 16, 2020 at 10:12:13AM -0700, James Bottomley wrote:
> > > On Mon, 2020-08-17 at 00:57 +0800, Coly Li wrote:
> > > > On 2020/8/17 00:36, James Bottomley wrote:
> > > > > On Sun, 2020-08-16 at 12:06 -0400, Stefan Berger wrote:
> > > > > [...]
> > > > > > A note in this file states this:
> > > > > > 
> > > > > > Note: When using a TPM 2.0 with a persistent key with handle
> > > > > > 0x81000001, append 'keyhandle=0x81000001' to statements
> > > > > > between quotes, such as "new 32 keyhandle=0x81000001".
> > > > > > 
> > > > > > Now if someone was (still) interested in TPM 1.2 
> > > > > > adapt the  note to state that these keyhandle=... should be
> > > > > > removed for the TPM 1.2 case.
> > > > > 
> > > > > Actually, I also have a plan to match what userspace does and
> > > > > simply assume a keyhandle of 40000001 (generate an EC Storage
> > > > > Primary Key on the fly) if it's not specified, which will make
> > > > > the TPM1.2 and 2.0 versions of this the same.  Unfortunately
> > > > > the necessary precursor patches are taking an age to get
> > > > > upstream.
> > > > 
> > > > Hi James,
> > > > 
> > > > Do you have a plan to push such patches into upstream soon? If
> > > > yes than I may wait for your patch and withdraw this one.
> > > 
> > > Well, as I said above it depends on not yet upstream precursor
> > > patches.  They have been pending for about a year, so I've no real
> > > idea of the timeline.
> > > 
> > > James
> > 
> > As far as I remember there was not much left in the previous version
> > to do. Some time has passed when it was discussed but I recall it was
> > mainly about documenting the key format.
> 
> Actually, no, unfortunately it's not in that update.  Generating an on-
> the-fly primary would involve the cryptographic security patch (same
> mechanism as used to generate the null primary).  I was thinking I'd
> extract just that piece and use it in a follow on.  So both the rework
> of the key format and this extra patch that's not yet even broken out
> of the TPM security series are required precursors.
> 
> James

OK, sorry I mixed up thinks. Thanks.

/Jarkko
