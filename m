Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC11744E31D
	for <lists+keyrings@lfdr.de>; Fri, 12 Nov 2021 09:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhKLIdx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Nov 2021 03:33:53 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:55924 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhKLIds (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Nov 2021 03:33:48 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id D49AF21B29;
        Fri, 12 Nov 2021 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636705856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CtLj3iNwCrDsRfTbqCOC7KizGzeolFrA/oblDB2HR6M=;
        b=EqAF3455zC/KRKcNebZ+JmobShL1pKdzZJSTjddFuTEgjasrmJAuMwVnITg7Hg1Kx7SFHi
        4njht0Qdge/PimHhcx/YMBqy+O+r4fM0lVGx9ubDdEOhbqMhOliqM6hU7BciKZ/zWtHPI8
        dmlhKh/P8vxU868YKB8AjJIBe2Jirto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636705856;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CtLj3iNwCrDsRfTbqCOC7KizGzeolFrA/oblDB2HR6M=;
        b=UcES9wR1gopMpSYFFC0aHrMvAaIA88hW/HepzePD7xDe7jxEfxxT89WeVu/XkyVMma68Hj
        BakvkkGH35WvjDDw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 76E1BA3B95;
        Fri, 12 Nov 2021 08:30:56 +0000 (UTC)
Date:   Fri, 12 Nov 2021 09:30:55 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Nayna <nayna@linux.vnet.ibm.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>, keyrings@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jessica Yu <jeyu@kernel.org>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Frank van der Linden <fllinden@amazon.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211112083055.GA34414@kunlun.suse.cz>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
 <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

On Thu, Nov 11, 2021 at 05:26:41PM -0500, Nayna wrote:
> 
> On 11/8/21 07:05, Michal Suchánek wrote:
> > Hello,
> > 
> > On Mon, Nov 08, 2021 at 09:18:56AM +1100, Daniel Axtens wrote:
> > > Michal Suchánek <msuchanek@suse.de> writes:
> > > 
> > > > On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
> > > > > Michal Suchanek <msuchanek@suse.de> writes:
> > > > > 
> > > > > > S390 uses appended signature for kernel but implements the check
> > > > > > separately from module loader.
> > > > > > 
> > > > > > Support for secure boot on powerpc with appended signature is planned -
> > > > > > grub patches submitted upstream but not yet merged.
> > > > > Power Non-Virtualised / OpenPower already supports secure boot via kexec
> > > > > with signature verification via IMA. I think you have now sent a
> > > > > follow-up series that merges some of the IMA implementation, I just
> > > > > wanted to make sure it was clear that we actually already have support
> > > > So is IMA_KEXEC and KEXEC_SIG redundant?
> > > > 
> > > > I see some architectures have both. I also see there is a lot of overlap
> > > > between the IMA framework and the KEXEC_SIG and MODULE_SIg.
> > > 
> > > Mimi would be much better placed than me to answer this.
> > > 
> > > The limits of my knowledge are basically that signature verification for
> > > modules and kexec kernels can be enforced by IMA policies.
> > > 
> > > For example a secure booted powerpc kernel with module support will have
> > > the following IMA policy set at the arch level:
> > > 
> > > "appraise func=KEXEC_KERNEL_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig",
> > > (in arch/powerpc/kernel/ima_arch.c)
> > > 
> > > Module signature enforcement can be set with either IMA (policy like
> > > "appraise func=MODULE_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig" )
> > > or with CONFIG_MODULE_SIG_FORCE/module.sig_enforce=1.
> > > 
> > > Sometimes this leads to arguably unexpected interactions - for example
> > > commit fa4f3f56ccd2 ("powerpc/ima: Fix secure boot rules in ima arch
> > > policy"), so it might be interesting to see if we can make things easier
> > > to understand.
> > I suspect that is the root of the problem here. Until distributions pick
> > up IMA and properly document step by step in detail how to implement,
> > enable, and debug it the _SIG options are required for users to be able
> > to make use of signatures.
> 
> For secureboot, IMA appraisal policies are configured in kernel at boot time
> based on secureboot state of the system, refer
> arch/powerpc/kernel/ima_arch.c and security/integrity/ima/ima_efi.c. This
> doesn't require any user configuration. Yes, I agree it would be helpful to
> update kernel documentation specifying steps to sign the kernel image using
> sign-file.
> 
> > 
> > The other part is that distributions apply 'lockdown' patches that change
> > the security policy depending on secure boot status which were rejected
> > by upstream which only hook into the _SIG options, and not into the IMA_
> > options. Of course, I expect this to change when the IMA options are
> > universally available across architectures and the support picked up by
> > distributions.
> > 
> > Which brings the third point: IMA features vary across architectures,
> > and KEXEC_SIG is more common than IMA_KEXEC.
> > 
> > config/arm64/default:CONFIG_HAVE_IMA_KEXEC=y
> > config/ppc64le/default:CONFIG_HAVE_IMA_KEXEC=y
> > 
> > config/arm64/default:CONFIG_KEXEC_SIG=y
> > config/s390x/default:CONFIG_KEXEC_SIG=y
> > config/x86_64/default:CONFIG_KEXEC_SIG=y
> > 
> > KEXEC_SIG makes it much easier to get uniform features across
> > architectures.
> 
> Architectures use KEXEC_SIG vs IMA_KEXEC based on their requirement.
> IMA_KEXEC is for the kernel images signed using sign-file (appended
> signatures, not PECOFF), provides measurement along with verification, and

That's certainly not the case. S390 uses appended signatures with
KEXEC_SIG, arm64 uses PECOFF with both KEXEC_SIG and IMA_KEXEC.

> is tied to secureboot state of the system at boot time.

In distrubutions it's also the case with KEXEC_SIG, it's only upstream
where this is different. I don't know why Linux upstream has rejected
this support for KEXEC_SIG.

Anyway, sounds like the difference is that IMA provides measurement but
if you don't use it it does not makes any difference except more comlex
code.

Thanks

Michal
