Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B737FF7AA7
	for <lists+keyrings@lfdr.de>; Mon, 11 Nov 2019 19:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKKSU5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 11 Nov 2019 13:20:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:44488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfKKSU5 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 11 Nov 2019 13:20:57 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC77C2190F;
        Mon, 11 Nov 2019 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573496456;
        bh=CQozGzawVi5pjEmSMYqcylVfoQWEPkOhKyR8c63ga0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d9e8mvH/NFqALgpWB8wCX9ks+6f3+zFJU65Asmlni/jtNRl8CCTFUANp5Hjzopg45
         6KNlJaY8WXSTdIBosPDDn5chka5idjOUKbRIMo4XRR5nqoiaSCJXQtauK2XU/QJMTn
         XKpM2gI+oCUYV8iY40p5Gn9zLcOuwP6uyd/7n3A0=
Date:   Mon, 11 Nov 2019 10:20:55 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if
 akcipher_request_alloc() fails
Message-ID: <20191111182054.GD56300@gmail.com>
Mail-Followup-To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
References: <20191009230349.127215-1-ebiggers@kernel.org>
 <20191014194846.GI15552@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014194846.GI15552@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Oct 14, 2019 at 10:48:46PM +0300, Jarkko Sakkinen wrote:
> On Wed, Oct 09, 2019 at 04:03:49PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > No error code was being set on this error path.
> > 
> > Fixes: ad4b1eb5fb33 ("KEYS: asym_tpm: Implement encryption operation [ver #2]")
> > Fixes: c08fed737126 ("KEYS: Implement encrypt, decrypt and sign for software asymmetric key [ver #2]")
> > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> I can pick this up to my tree given the TPM association. David?
> 
> /Jarkko

Ping.
