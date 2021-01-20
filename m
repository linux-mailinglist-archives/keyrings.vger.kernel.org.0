Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25BC2FD090
	for <lists+keyrings@lfdr.de>; Wed, 20 Jan 2021 13:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbhATMkp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 07:40:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:33718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732761AbhATL1W (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 20 Jan 2021 06:27:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6221622AAA;
        Wed, 20 Jan 2021 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611142001;
        bh=vBYgu7+Vk//vFZiH3/SNchvwbekN9GzeUV312H49ldU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jmiSRx+Q/FgCNwuKmR/yJ1G3rjIZWTTRRA8gIcWPAHkttsQ1dvcNBJVI/eSbsw1Xm
         t5mW+CZp/bSQoO5s9MJxX/1gQE0XTGAqfTzq42L1+1lnIzeMr9J7vQw+8GHjcZa21n
         gx2lpKSjFu//AgqJdLs2ycHMkffk+mcd+qLwQF+I2kLU1ftKWGhGuAnOYc3GATqBgT
         OLx+vU9jgOb9KsAiLdxZ9wyiTR8DWw9i8OAQ0TrVWXC0U/69umpqnn4bNdgstPl2lA
         N9adz3cK3a12wd5dxgzRdklHmInOVZd02dP+5X8k+t3c0+70QttyDwSrco/7v9dAUd
         2IdZqCRa3ttNg==
Date:   Wed, 20 Jan 2021 13:26:35 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        James.Bottomley@hansenpartnership.com
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
Message-ID: <YAgTawk3EENF/P6j@kernel.org>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
 <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
 <2442460.1610463459@warthog.procyon.org.uk>
 <X/9a8naM8p4tT5sO@linux.intel.com>
 <A05E3573-B1AF-474B-94A5-779E69E5880A@oracle.com>
 <YAFdNiYZSWpB9vOw@kernel.org>
 <CFBF6AEC-2832-44F7-9D7F-F20489498C33@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CFBF6AEC-2832-44F7-9D7F-F20489498C33@oracle.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jan 15, 2021 at 09:49:02AM -0700, Eric Snowberg wrote:
> 
> > On Jan 15, 2021, at 2:15 AM, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > 
> > On Wed, Jan 13, 2021 at 05:11:10PM -0700, Eric Snowberg wrote:
> >> 
> >>> On Jan 13, 2021, at 1:41 PM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> >>> 
> >>> On Tue, Jan 12, 2021 at 02:57:39PM +0000, David Howells wrote:
> >>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
> >>>> 
> >>>>>> On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> wrote:
> >>>>>> 
> >>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
> >>>>>> 
> >>>>>>> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> >>>>>>> is found, it is added as an asymmetrical key to the .blacklist keyring.
> >>>>>>> Anytime the .platform keyring is used, the keys in the .blacklist keyring
> >>>>>>> are referenced, if a matching key is found, the key will be rejected.
> >>>>>> 
> >>>>>> Ummm...  Why this way and not as a blacklist key which takes up less space?
> >>>>>> I'm guessing that you're using the key chain matching logic.  We really only
> >>>>>> need to blacklist the key IDs.
> >>>>> 
> >>>>> I implemented it this way so that certs in the dbx would only impact 
> >>>>> the .platform keyring. I was under the impression we didn’t want to have 
> >>>>> Secure Boot UEFI db/dbx certs dictate keyring functionality within the kernel
> >>>>> itself. Meaning if we have a matching dbx cert in any other keyring (builtin,
> >>>>> secondary, ima, etc.), it would be allowed. If that is not how you’d like to 
> >>>>> see it done, let me know and I’ll make the change.
> >>>> 
> >>>> I wonder if that is that the right thing to do.  I guess this is a policy
> >>>> decision and may depend on the particular user.
> >>> 
> >>> Why would you want to allow dbx entry in any keyring?
> >> 
> >> Today, DB and MOK certs go into the platform keyring.  These certs are only
> >> referenced during kexec.  They can’t be used for other things like validating
> >> kernel module signatures.  If we follow the same pattern, the DBX and MOKX entries
> >> in the blacklist keyring should only impact kexec. 
> >> 
> >> Currently, Mickaël Salaün has another outstanding series to allow root to update 
> >> the blacklist keyring.  I assume the use case for this is around certificates used 
> >> within the kernel, for example revoking kernel module signatures.  The question I have
> >> is, should another keyring be introduced?  One that carries DBX and MOKX, which just
> >> correspond to certs/hashes in the platform keyring; this keyring would only be
> >> referenced for kexec, just like the platform keyring is today. Then, the current
> >> blacklist keyring would be used for everything internal to the kernel.
> > 
> > Right, I'm following actively that series.
> > 
> > Why couldn't user space drive this process and use that feature to do it?
> 
> I could see where the user would want to use both. With Mickaël Salaün’s
> series, the blacklist keyring is updated immediately.  However it does
> not survive a reboot.  With my patch, the blacklist keyring is updated
> during boot, based on what is in the dbx. Neither approach needs a new 
> kernel build.

I don't want to purposely challenge this, but why does it matter
that it doesn't survive the boot? I'm referring here to the golden
principle of kernel defining a mechanism, not policy. User space
can do the population however it wants to for every boot.

E.g. systemd service could do this.

What am I missing here?

/Jarkko
