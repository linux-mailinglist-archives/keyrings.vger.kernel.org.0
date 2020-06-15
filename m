Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B676E1F9E01
	for <lists+keyrings@lfdr.de>; Mon, 15 Jun 2020 19:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgFORA7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 15 Jun 2020 13:00:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:9692 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729956AbgFORA6 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 15 Jun 2020 13:00:58 -0400
IronPort-SDR: O0V+bxX9N0CdT/MHbnYQvQqOiwPVJDKCQ8y3TI5w9D6xlIoqZCDSvzCCjsBSi5Uon2yPjzwHan
 cET7Ly15/NvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 10:00:48 -0700
IronPort-SDR: 4rTOZmA/++XEHu2YN+mLEonmCdGnt9u5eD6piAwPJse/hpFf9uDJAZjx7cJY5ZuRcEimb+5Yoz
 BCJsW4e/hocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="420435226"
Received: from ifaivilx-mobl.ger.corp.intel.com (HELO localhost) ([10.249.35.251])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2020 10:00:44 -0700
Date:   Mon, 15 Jun 2020 20:00:43 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
Message-ID: <20200615170043.GA5416@linux.intel.com>
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
 <20200601173427.GA26455@linux.intel.com>
 <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
> On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
> > On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
> > > $ KEYID=$(keyctl add user john smith @u)
> > > $ keyctl describe $KEYID
> > > 5927639: alswrv-----v------------  1000  1000 user: john
> > > $ keyctl setperm $KEYID 0x3d000000
> > > $ keyctl describe $KEYID
> > > 5927639: alsw-v-----v------------  1000  1000 user: john
> > > $ keyctl print $KEYID
> > > smith
> > A keyring default permissions are 0x3f3f0000.
> > A key default permissions are 0x3f010000.
> > 
> > Because of this:
> > 
> > $ KEYID=$(keyctl add user john smith @u)
> > $ keyctl setperm $KEYID 0x3d000000
> > keyctl_setperm: Permission denied
> > 
> > Are you sure that your example is correct?
> > 
> > /Jarkko
> 
> Yes, this example works correctly.
> 
> Why do you think, that the current keyring and key rights
> 
> shoukd not allow this to be done?

I'm just saying that I cannot figure out your point in the cover letter.
It contains random dumps of keyctl output.

Maybe a better idea would be to write a test script that demonstrates
the issue?

/Jarkko
