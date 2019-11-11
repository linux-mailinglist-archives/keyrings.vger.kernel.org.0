Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AECB9F7AA6
	for <lists+keyrings@lfdr.de>; Mon, 11 Nov 2019 19:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfKKSUu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 11 Nov 2019 13:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:44466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfKKSUt (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 11 Nov 2019 13:20:49 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A79C20674;
        Mon, 11 Nov 2019 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573496449;
        bh=9r4TnW8HLncBqSrNXkuQ2Habbskz/WBEdcuvHj383qY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=02UVvw/7tPiFGI+fWQ/V7MDLvl6Z2s3KvDEbY6lsb1Nqd5iLoj2x7sVkLChCPvc5E
         5IhxdbUSQ/5oxs35xySH4zMtVgQUSnDPKYfAVkIS0UhPY6m8gxastpUOqAPadMDhB3
         8VdnG6BEEIJhB2UJGYdN84IwjWPc0c4bY0nkL2Q0=
Date:   Mon, 11 Nov 2019 10:20:47 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Message-ID: <20191111182046.GC56300@gmail.com>
Mail-Followup-To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
References: <20191009230443.127512-1-ebiggers@kernel.org>
 <20191014195354.GJ15552@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014195354.GJ15552@linux.intel.com>
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
> 
> /Jarkko

Ping.
