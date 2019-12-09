Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39A92117741
	for <lists+keyrings@lfdr.de>; Mon,  9 Dec 2019 21:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfLIUSp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 9 Dec 2019 15:18:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:33644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbfLIUSo (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 9 Dec 2019 15:18:44 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D7C6205C9;
        Mon,  9 Dec 2019 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575922724;
        bh=sJufDqeV4lVvmMhdvvsHEJb8DbIjBZQyWQghLyf/YFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wFKc/nuF1BzpnT1WcVGMAY1eTNx7Hh6CQs7M0GgAMCMJcdeJ7DVz3R0qyH0DtSP97
         vetPlOR1orA5O5nCvTOk0vHQbee1mDhsZZ7uZqgofVPWbXE5awa3n1VPjrCmquV9ca
         QY94uHm6VeCs48K8eP3jlV03md6nDT5l9Ij+7Yuk=
Date:   Mon, 9 Dec 2019 12:18:42 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Message-ID: <20191209201842.GD149190@gmail.com>
References: <20191009230443.127512-1-ebiggers@kernel.org>
 <20191014195354.GJ15552@linux.intel.com>
 <20191111182046.GC56300@gmail.com>
 <20191112200848.GC11213@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112200848.GC11213@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Nov 12, 2019 at 10:08:48PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 11, 2019 at 10:20:47AM -0800, Eric Biggers wrote:
> > On Mon, Oct 14, 2019 at 10:53:54PM +0300, Jarkko Sakkinen wrote:
> > > On Wed, Oct 09, 2019 at 04:04:43PM -0700, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > KEYS_COMPAT now always takes the value of COMPAT && KEYS.  But the
> > > > security/keys/ directory is only compiled if KEYS is enabled, so in
> > > > practice KEYS_COMPAT is the same as COMPAT.  Therefore, remove the
> > > > unnecessary KEYS_COMPAT and just use COMPAT directly.
> > > > 
> > > > (Also remove an outdated comment from compat.c.)
> > > > 
> > > > Reviewed-by: James Morris <jamorris@linux.microsoft.com>
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > 
> > > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > Tested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > 
> > > (aka compiling with the different combinations).
> > > 
> > > /Jarkko
> > 
> > Ping.
> 
> I can pick this up to my v5.5-rc2 PR (already sent one for rc1).
> 
> /Jarkko

Ping.
