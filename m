Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C57F9A41
	for <lists+keyrings@lfdr.de>; Tue, 12 Nov 2019 21:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfKLUIv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 Nov 2019 15:08:51 -0500
Received: from mga18.intel.com ([134.134.136.126]:4516 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfKLUIv (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 12 Nov 2019 15:08:51 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 12:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; 
   d="scan'208";a="235001963"
Received: from joshbuck-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.20.68])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2019 12:08:49 -0800
Date:   Tue, 12 Nov 2019 22:08:48 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Message-ID: <20191112200848.GC11213@linux.intel.com>
References: <20191009230443.127512-1-ebiggers@kernel.org>
 <20191014195354.GJ15552@linux.intel.com>
 <20191111182046.GC56300@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111182046.GC56300@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Nov 11, 2019 at 10:20:47AM -0800, Eric Biggers wrote:
> On Mon, Oct 14, 2019 at 10:53:54PM +0300, Jarkko Sakkinen wrote:
> > On Wed, Oct 09, 2019 at 04:04:43PM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > KEYS_COMPAT now always takes the value of COMPAT && KEYS.  But the
> > > security/keys/ directory is only compiled if KEYS is enabled, so in
> > > practice KEYS_COMPAT is the same as COMPAT.  Therefore, remove the
> > > unnecessary KEYS_COMPAT and just use COMPAT directly.
> > > 
> > > (Also remove an outdated comment from compat.c.)
> > > 
> > > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > Tested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > 
> > (aka compiling with the different combinations).
> > 
> > /Jarkko
> 
> Ping.

I can pick this up to my v5.5-rc2 PR (already sent one for rc1).

/Jarkko
