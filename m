Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C763319D91
	for <lists+keyrings@lfdr.de>; Fri, 12 Feb 2021 12:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBLLuA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Feb 2021 06:50:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:47058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhBLLt6 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 12 Feb 2021 06:49:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8633964E7D;
        Fri, 12 Feb 2021 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130558;
        bh=cUvMxzXC600Efy1Ug6l8sauc/4u3co4Gf+va2XshCvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSs13cIq7GuWz4la26g7KDvDns60h8i6TO7pz+crFUB5hiD3sLK03X/gJXxDM5TR8
         p/Nmqg+vOHdnav/2XRTTI8dijkgjE/DulY1q85tvCeGgaQbTDiziSNRnu4LF/lxS1/
         1TD8RJDARTHUEWGwLdViOovu/J5qD4I85/ArYXDBfnHNuZJGL/rK+amUGbZOPvUedu
         WY5OOARHu9RLjqy5HKwn5Z7I5Kj9G38/A5l8uw1TmpKASU2nE3P9TvI6kmygz0VnJ1
         BacMEZmBIHZoSct8Ii0B0lQnLKaFm5Tr+JcjyvP58CZTjN3yCoagLd/zqJhAKbrZls
         fVAQkr0JMkaIA==
Date:   Fri, 12 Feb 2021 13:49:08 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>,
        =?us-ascii?B?PT91dGYtOD9RP01pY2thPUMzPUFCbF9TYWxhPUMzPUJDbj89?= 
        <mic@digikod.net>, dwmw2@infradead.org,
        James.Bottomley@hansenpartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Subject: Re: Re: Conflict with =?iso-8859-1?Q?Micka?=
 =?iso-8859-1?Q?=EBl_Sala=FCn's_blacklist_patches_=5Bwas_=5BPATCH_v5_0=2F4?=
 =?iso-8859-1?Q?=5D?= Add EFI_CERT_X509_GUID support for dbx/mokx entries]
Message-ID: <YCZrNIecWpZGvbaw@kernel.org>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
 <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
 <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
 <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com>
 <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
 <525705.1612876446@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <525705.1612876446@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Feb 09, 2021 at 01:14:06PM +0000, David Howells wrote:
> 
> Hi Eric, Mickaël,
> 
> Do we have a consensus on this?  From what's written here, I don't think I can
> ask Linus to pull the merge of your two branches.  I feel that I probably need
> to push Eric's first as that fixes a CVE if I can't offer a merge.
> 
> David

Would it be possible to compose a single unified patch set?

It's also somewhat distracting to review both separately.

/Jarkko
