Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D97811D8B6
	for <lists+keyrings@lfdr.de>; Thu, 12 Dec 2019 22:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731086AbfLLVoL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 12 Dec 2019 16:44:11 -0500
Received: from mga01.intel.com ([192.55.52.88]:35847 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730830AbfLLVoL (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 12 Dec 2019 16:44:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 13:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,307,1571727600"; 
   d="scan'208";a="208239148"
Received: from dwidzins-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.21.195])
  by orsmga008.jf.intel.com with ESMTP; 12 Dec 2019 13:44:08 -0800
Date:   Thu, 12 Dec 2019 23:44:06 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Message-ID: <20191212214330.GA31054@linux.intel.com>
References: <20191009230443.127512-1-ebiggers@kernel.org>
 <20191014195354.GJ15552@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014195354.GJ15552@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Oct 14, 2019 at 10:53:54PM +0300, Jarkko Sakkinen wrote:
> On Wed, Oct 09, 2019 at 04:04:43PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > KEYS_COMPAT now always takes the value of COMPAT && KEYS.  But the
> > security/keys/ directory is only compiled if KEYS is enabled, so in
> > practice KEYS_COMPAT is the same as COMPAT.  Therefore, remove the
> > unnecessary KEYS_COMPAT and just use COMPAT directly.
> > 
> > (Also remove an outdated comment from compat.c.)
> > 
> > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Tested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> (aka compiling with the different combinations).

I applied this to git://git.infradead.org/users/jjs/linux-tpmdd.git

/Jarkko
