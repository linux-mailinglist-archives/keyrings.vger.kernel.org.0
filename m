Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6222F543D
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 21:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbhAMUnU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 15:43:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:54856 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbhAMUnU (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 13 Jan 2021 15:43:20 -0500
IronPort-SDR: BqaGB00I+jlC5kgp/DHIu8bh76+w4eWrCEFnpHF7R6HP8XxaVwuesaLsnvEz1EA+gO2bGGDkuZ
 9LECEuMvh5Dw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="158042589"
X-IronPort-AV: E=Sophos;i="5.79,345,1602572400"; 
   d="scan'208";a="158042589"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 12:41:34 -0800
IronPort-SDR: rik8a87SibAyMJx9YKB+Yvhcm7UmFbqnOu9ufcOhQmN2c4wRi6q5norGHVwSJSr2k/7CmYTXPb
 XZJ5/YuhbBig==
X-IronPort-AV: E=Sophos;i="5.79,345,1602572400"; 
   d="scan'208";a="381998210"
Received: from oslutsk1-mobl1.ccr.corp.intel.com (HELO linux.intel.com) ([10.249.40.71])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 12:41:27 -0800
Date:   Wed, 13 Jan 2021 22:41:22 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>, dwmw2@infradead.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
Message-ID: <X/9a8naM8p4tT5sO@linux.intel.com>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
 <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
 <2442460.1610463459@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2442460.1610463459@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 12, 2021 at 02:57:39PM +0000, David Howells wrote:
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
> 
> > > On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> wrote:
> > > 
> > > Eric Snowberg <eric.snowberg@oracle.com> wrote:
> > > 
> > >> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> > >> is found, it is added as an asymmetrical key to the .blacklist keyring.
> > >> Anytime the .platform keyring is used, the keys in the .blacklist keyring
> > >> are referenced, if a matching key is found, the key will be rejected.
> > > 
> > > Ummm...  Why this way and not as a blacklist key which takes up less space?
> > > I'm guessing that you're using the key chain matching logic.  We really only
> > > need to blacklist the key IDs.
> > 
> > I implemented it this way so that certs in the dbx would only impact 
> > the .platform keyring. I was under the impression we didn’t want to have 
> > Secure Boot UEFI db/dbx certs dictate keyring functionality within the kernel
> > itself. Meaning if we have a matching dbx cert in any other keyring (builtin,
> > secondary, ima, etc.), it would be allowed. If that is not how you’d like to 
> > see it done, let me know and I’ll make the change.
> 
> I wonder if that is that the right thing to do.  I guess this is a policy
> decision and may depend on the particular user.

Why would you want to allow dbx entry in any keyring?

/Jarkko
