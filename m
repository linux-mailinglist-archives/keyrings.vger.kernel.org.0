Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3D0117746
	for <lists+keyrings@lfdr.de>; Mon,  9 Dec 2019 21:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLIUTW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 9 Dec 2019 15:19:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:34352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbfLIUTW (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 9 Dec 2019 15:19:22 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5CF5205C9;
        Mon,  9 Dec 2019 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575922761;
        bh=qmJshrv10StOK76MaxU366l0xx2N9WtKMDD5BAVAy5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WxHZX5o12/xBG6CLw+vqtpZzddSGKMV0Ugb7xo6Sq3bTZ0R0Iu6shODMji8EMxZwy
         6l/gUUXmmqpFnyv9+d0tFSp4SZ2YwDld4MLffeKlyRBcurF56vMol1ZOJCZCdJi4TI
         Awe7S/Pzkp4SVzyiTQFvTVslYkLV818sBB9ujmfs=
Date:   Mon, 9 Dec 2019 12:19:20 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if
 akcipher_request_alloc() fails
Message-ID: <20191209201920.GE149190@gmail.com>
References: <20191009230349.127215-1-ebiggers@kernel.org>
 <20191014194846.GI15552@linux.intel.com>
 <20191111182054.GD56300@gmail.com>
 <20191112200908.GD11213@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112200908.GD11213@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Nov 12, 2019 at 10:09:08PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 11, 2019 at 10:20:55AM -0800, Eric Biggers wrote:
> > On Mon, Oct 14, 2019 at 10:48:46PM +0300, Jarkko Sakkinen wrote:
> > > On Wed, Oct 09, 2019 at 04:03:49PM -0700, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > No error code was being set on this error path.
> > > > 
> > > > Fixes: ad4b1eb5fb33 ("KEYS: asym_tpm: Implement encryption operation [ver #2]")
> > > > Fixes: c08fed737126 ("KEYS: Implement encrypt, decrypt and sign for software asymmetric key [ver #2]")
> > > > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > 
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > 
> > > I can pick this up to my tree given the TPM association. David?
> > > 
> > > /Jarkko
> > 
> > Ping.
> 
> I can pick this up to my v5.5-rc2 PR (already sent one for rc1).
> 
> /Jarkko

Ping.
