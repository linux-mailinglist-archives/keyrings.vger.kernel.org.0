Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6256F11D8C1
	for <lists+keyrings@lfdr.de>; Thu, 12 Dec 2019 22:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730912AbfLLVq3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 12 Dec 2019 16:46:29 -0500
Received: from mga12.intel.com ([192.55.52.136]:33936 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730886AbfLLVq3 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 12 Dec 2019 16:46:29 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 13:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,307,1571727600"; 
   d="scan'208";a="208239659"
Received: from dwidzins-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.21.195])
  by orsmga008.jf.intel.com with ESMTP; 12 Dec 2019 13:46:26 -0800
Date:   Thu, 12 Dec 2019 23:46:24 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if
 akcipher_request_alloc() fails
Message-ID: <20191212214624.GB31054@linux.intel.com>
References: <20191009230349.127215-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009230349.127215-1-ebiggers@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Oct 09, 2019 at 04:03:49PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> No error code was being set on this error path.
> 
> Fixes: ad4b1eb5fb33 ("KEYS: asym_tpm: Implement encryption operation [ver #2]")
> Fixes: c08fed737126 ("KEYS: Implement encrypt, decrypt and sign for software asymmetric key [ver #2]")
> Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied to git://git.infradead.org/users/jjs/linux-tpmdd.git

/Jarkko
