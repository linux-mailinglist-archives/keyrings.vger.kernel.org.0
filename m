Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5270EF9A42
	for <lists+keyrings@lfdr.de>; Tue, 12 Nov 2019 21:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfKLUJL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 Nov 2019 15:09:11 -0500
Received: from mga14.intel.com ([192.55.52.115]:50367 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfKLUJL (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 12 Nov 2019 15:09:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 12:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; 
   d="scan'208";a="235002027"
Received: from joshbuck-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.20.68])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2019 12:09:09 -0800
Date:   Tue, 12 Nov 2019 22:09:08 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if
 akcipher_request_alloc() fails
Message-ID: <20191112200908.GD11213@linux.intel.com>
References: <20191009230349.127215-1-ebiggers@kernel.org>
 <20191014194846.GI15552@linux.intel.com>
 <20191111182054.GD56300@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111182054.GD56300@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Nov 11, 2019 at 10:20:55AM -0800, Eric Biggers wrote:
> On Mon, Oct 14, 2019 at 10:48:46PM +0300, Jarkko Sakkinen wrote:
> > On Wed, Oct 09, 2019 at 04:03:49PM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > No error code was being set on this error path.
> > > 
> > > Fixes: ad4b1eb5fb33 ("KEYS: asym_tpm: Implement encryption operation [ver #2]")
> > > Fixes: c08fed737126 ("KEYS: Implement encrypt, decrypt and sign for software asymmetric key [ver #2]")
> > > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > 
> > I can pick this up to my tree given the TPM association. David?
> > 
> > /Jarkko
> 
> Ping.

I can pick this up to my v5.5-rc2 PR (already sent one for rc1).

/Jarkko
