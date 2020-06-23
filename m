Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6922046B4
	for <lists+keyrings@lfdr.de>; Tue, 23 Jun 2020 03:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731572AbgFWB3I (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Jun 2020 21:29:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:20416 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731912AbgFWB3H (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 22 Jun 2020 21:29:07 -0400
IronPort-SDR: x9u//6FJYYh9ZBRDsIBjGoiJMy3VFjXZgFrc3vdh8k8vI7jANhUWvh+fTnRYH+4K8TTtuPKXlk
 GcWi9nSACvrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="124195419"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; 
   d="scan'208";a="124195419"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2020 18:29:05 -0700
IronPort-SDR: PepYCeaGPgGt6CO3nU6EiJHnxxcmmYCd2qNob0iceO3HM9RvcPoKp3Wmb//kf8qsntfDEVle/r
 fh0xdxDyo92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; 
   d="scan'208";a="319014224"
Received: from jczajka-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.133])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2020 18:29:00 -0700
Date:   Tue, 23 Jun 2020 04:28:59 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Greg KH <greg@kroah.com>
Cc:     Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru, alexey_krasikov@mail.ru
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
Message-ID: <20200623012859.GI28795@linux.intel.com>
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
 <20200601173427.GA26455@linux.intel.com>
 <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
 <20200615170043.GA5416@linux.intel.com>
 <c3f47d1c-90a6-aa37-6692-d26202fa92d2@yandex-team.ru>
 <20200622123028.GA3502713@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622123028.GA3502713@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jun 22, 2020 at 02:30:28PM +0200, Greg KH wrote:
> On Mon, Jun 22, 2020 at 12:04:29PM +0300, Alexey Krasikov wrote:
> > On 6/15/20 8:00 PM, Jarkko Sakkinen wrote:
> > > On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
> > > > On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
> > > > > On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
> > > > > > $ KEYID=$(keyctl add user john smith @u)
> > > > > > $ keyctl describe $KEYID
> > > > > > 5927639: alswrv-----v------------  1000  1000 user: john
> > > > > > $ keyctl setperm $KEYID 0x3d000000
> > > > > > $ keyctl describe $KEYID
> > > > > > 5927639: alsw-v-----v------------  1000  1000 user: john
> > > > > > $ keyctl print $KEYID
> > > > > > smith
> > > > > A keyring default permissions are 0x3f3f0000.
> > > > > A key default permissions are 0x3f010000.
> > > > > 
> > > > > Because of this:
> > > > > 
> > > > > $ KEYID=$(keyctl add user john smith @u)
> > > > > $ keyctl setperm $KEYID 0x3d000000
> > > > > keyctl_setperm: Permission denied
> > > > > 
> > > > > Are you sure that your example is correct?
> > > > > 
> > > > > /Jarkko
> > > > Yes, this example works correctly.
> > > > 
> > > > Why do you think, that the current keyring and key rights
> > > > 
> > > > shoukd not allow this to be done?
> > > I'm just saying that I cannot figure out your point in the cover letter.
> > > It contains random dumps of keyctl output.
> > > 
> > > Maybe a better idea would be to write a test script that demonstrates
> > > the issue?
> > > 
> > > /Jarkko
> > 
> > + alexey_krasikov@mail.ru
> > 
> > Possible you may not be able to reproduce the problem because you have a
> > different version of Linux.
> > 
> > I get to reproduce the problem on two systems:
> > 
> > Linux 4.14.74-28+yc11.91
> > 
> > and
> > 
> > Linux ubuntu 4.15.0-106-generic
> 
> Both of those are distro-specific kernels, can you reproduce this on
> 5.8-rc2 or 5.7 as released from kernel.org?

Alexey,

A shell script containing the keyctl command chain with some output, and
then your version of the output when running the script would be also
very useful for better comparison.

/Jarkko
