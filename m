Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C2A11A98D
	for <lists+keyrings@lfdr.de>; Wed, 11 Dec 2019 12:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfLKLDD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 11 Dec 2019 06:03:03 -0500
Received: from mga01.intel.com ([192.55.52.88]:53837 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728030AbfLKLDD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 11 Dec 2019 06:03:03 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 03:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="203519034"
Received: from unknown (HELO localhost) ([10.237.50.137])
  by orsmga007.jf.intel.com with ESMTP; 11 Dec 2019 03:03:00 -0800
Date:   Wed, 11 Dec 2019 13:03:00 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Message-ID: <20191211110300.GA16450@linux.intel.com>
References: <20191009230443.127512-1-ebiggers@kernel.org>
 <20191014195354.GJ15552@linux.intel.com>
 <20191111182046.GC56300@gmail.com>
 <20191112200848.GC11213@linux.intel.com>
 <20191209201842.GD149190@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209201842.GD149190@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Dec 09, 2019 at 12:18:42PM -0800, Eric Biggers wrote:
> On Tue, Nov 12, 2019 at 10:08:48PM +0200, Jarkko Sakkinen wrote:
> > On Mon, Nov 11, 2019 at 10:20:47AM -0800, Eric Biggers wrote:
> > > On Mon, Oct 14, 2019 at 10:53:54PM +0300, Jarkko Sakkinen wrote:
> > > > On Wed, Oct 09, 2019 at 04:04:43PM -0700, Eric Biggers wrote:
> > > > > From: Eric Biggers <ebiggers@google.com>
> > > > > 
> > > > > KEYS_COMPAT now always takes the value of COMPAT && KEYS.  But the
> > > > > security/keys/ directory is only compiled if KEYS is enabled, so in
> > > > > practice KEYS_COMPAT is the same as COMPAT.  Therefore, remove the
> > > > > unnecessary KEYS_COMPAT and just use COMPAT directly.
> > > > > 
> > > > > (Also remove an outdated comment from compat.c.)
> > > > > 
> > > > > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > > Tested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > > 
> > > > (aka compiling with the different combinations).
> > > > 
> > > > /Jarkko
> > > 
> > > Ping.
> > 
> > I can pick this up to my v5.5-rc2 PR (already sent one for rc1).
> > 
> > /Jarkko
> 
> Ping.

rc1 was just out last Sunday so nothing could have happened to this
anyway. It is on my queue but we have to fix tpm_tis issues first.

/Jarkko
