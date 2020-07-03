Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F772130DC
	for <lists+keyrings@lfdr.de>; Fri,  3 Jul 2020 03:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgGCBOy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Jul 2020 21:14:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:39463 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgGCBOy (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 2 Jul 2020 21:14:54 -0400
IronPort-SDR: lfgKy1LmHGErwclArEgm8FPrwxYxmd3UsDo5L23CpFAmF5kPHYi//SKxJ/2o1GC+xRyHQc6TpL
 ny770EoiKjqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="146154994"
X-IronPort-AV: E=Sophos;i="5.75,306,1589266800"; 
   d="scan'208";a="146154994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 18:14:52 -0700
IronPort-SDR: fhdmFW9reP/IxWp4c0xH9krfmykR1YsC2fJBEHY9PtTu52xVjm3tRY8N3WlL5Tb7Ji09PaNeFY
 9hRe8x+0k3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,306,1589266800"; 
   d="scan'208";a="482195815"
Received: from chadjitt-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.41.125])
  by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2020 18:14:48 -0700
Date:   Fri, 3 Jul 2020 04:14:47 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Alexey Krasikov <alexey_krasikov@mail.ru>, dhowells@redhat.com
Cc:     Greg KH <greg@kroah.com>,
        Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
Message-ID: <20200703011447.GA294568@linux.intel.com>
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
 <20200601173427.GA26455@linux.intel.com>
 <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
 <20200615170043.GA5416@linux.intel.com>
 <c3f47d1c-90a6-aa37-6692-d26202fa92d2@yandex-team.ru>
 <20200622123028.GA3502713@kroah.com>
 <20200623012859.GI28795@linux.intel.com>
 <5b6f4d9c-ef6f-d456-096f-4673c85d4dbd@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b6f4d9c-ef6f-d456-096f-4673c85d4dbd@mail.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, Jun 28, 2020 at 03:27:37AM +0300, Alexey Krasikov wrote:
> On 6/23/20 4:28 AM, Jarkko Sakkinen wrote:
> > On Mon, Jun 22, 2020 at 02:30:28PM +0200, Greg KH wrote:
> > > On Mon, Jun 22, 2020 at 12:04:29PM +0300, Alexey Krasikov wrote:
> > > > On 6/15/20 8:00 PM, Jarkko Sakkinen wrote:
> > > > > On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
> > > > > > On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
> > > > > > > On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
> > > > > > > > $ KEYID=$(keyctl add user john smith @u)
> > > > > > > > $ keyctl describe $KEYID
> > > > > > > > 5927639: alswrv-----v------------  1000  1000 user: john
> > > > > > > > $ keyctl setperm $KEYID 0x3d000000
> > > > > > > > $ keyctl describe $KEYID
> > > > > > > > 5927639: alsw-v-----v------------  1000  1000 user: john
> > > > > > > > $ keyctl print $KEYID
> > > > > > > > smith
> > > > > > > A keyring default permissions are 0x3f3f0000.
> > > > > > > A key default permissions are 0x3f010000.
> > > > > > > 
> > > > > > > Because of this:
> > > > > > > 
> > > > > > > $ KEYID=$(keyctl add user john smith @u)
> > > > > > > $ keyctl setperm $KEYID 0x3d000000
> > > > > > > keyctl_setperm: Permission denied
> > > > > > > 
> > > > > > > Are you sure that your example is correct?
> > > > > > > 
> > > > > > > /Jarkko
> > > > > > Yes, this example works correctly.
> > > > > > 
> > > > > > Why do you think, that the current keyring and key rights
> > > > > > 
> > > > > > shoukd not allow this to be done?
> > > > > I'm just saying that I cannot figure out your point in the cover letter.
> > > > > It contains random dumps of keyctl output.
> > > > > 
> > > > > Maybe a better idea would be to write a test script that demonstrates
> > > > > the issue?
> > > > > 
> > > > > /Jarkko
> > > > + alexey_krasikov@mail.ru
> > > > 
> > > > Possible you may not be able to reproduce the problem because you have a
> > > > different version of Linux.
> > > > 
> > > > I get to reproduce the problem on two systems:
> > > > 
> > > > Linux 4.14.74-28+yc11.91
> > > > 
> > > > and
> > > > 
> > > > Linux ubuntu 4.15.0-106-generic
> > > Both of those are distro-specific kernels, can you reproduce this on
> > > 5.8-rc2 or 5.7 as released from kernel.org?
> > Alexey,
> > 
> > A shell script containing the keyctl command chain with some output, and
> > then your version of the output when running the script would be also
> > very useful for better comparison.
> > 
> > /Jarkko
> 
> Ok. I have the following script:
> 
> ----------------------------------------------------------------------------
> #!/usr/bin/sh
> 
> uname -r
> 
> KEYID=$(keyctl add user john smith @u)
> keyctl describe $KEYID
> keyctl setperm $KEYID 0x3d000000
> keyctl describe $KEYID
> keyctl print $KEYID

pam_keyinit.so should create user keyring when the login session is
created. If the user space stack is working correclty, you should not
end up to be the possessor for the user keyring.

However, I can simulate your environment with the session keyring:

KEYID=`keyctl add user john smith @s`

keyctl describe $KEYID
keyctl setperm $KEYID 0x3d000000
keyctl describe $KEYID
keyctl print $KEYID

And yes I do get:

564302411: alswrv-----v------------  1000  1000 user: john
564302411: alsw-v------------------  1000  1000 user: john
smith

Here's another sequence that also removes setattr:

KEYID=`keyctl add user john smith @s`

keyctl describe $KEYID
keyctl setperm $KEYID 0x08000000
keyctl describe $KEYID
keyctl print $KEYID

700153280: alswrv-----v------------  1000  1000 user: john
keyctl_describe_alloc: Permission denied
smith

David, this look at least with a quick sight somewhat weird: my
possessor permissions are only "search", so why does reading the
payload succeed?

/Jarkko
