Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39A22D6A51
	for <lists+keyrings@lfdr.de>; Mon, 14 Oct 2019 21:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbfJNTst (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Oct 2019 15:48:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:48368 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730114AbfJNTst (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 14 Oct 2019 15:48:49 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 12:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; 
   d="scan'208";a="395298959"
Received: from kridax-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.7.178])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2019 12:48:46 -0700
Date:   Mon, 14 Oct 2019 22:48:46 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if
 akcipher_request_alloc() fails
Message-ID: <20191014194846.GI15552@linux.intel.com>
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

Cc: stable@vger.kernel.org
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

I can pick this up to my tree given the TPM association. David?

/Jarkko
