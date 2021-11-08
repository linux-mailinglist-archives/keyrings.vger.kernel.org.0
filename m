Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC0F447F3E
	for <lists+keyrings@lfdr.de>; Mon,  8 Nov 2021 13:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKHMHr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 8 Nov 2021 07:07:47 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:43850 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238161AbhKHMHq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 8 Nov 2021 07:07:46 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 837AE1FDB8;
        Mon,  8 Nov 2021 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636373101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cmeZsq/SJ5yGsF0N57gsSWLarC8qyb6PAjYqlIQ0w/c=;
        b=a8Nvyh7rPt8bvhLJtBc5yyuCb2zbJtrrQe8IsOB8xwbTq3CrRE+kOfmn7xnwXHJ6RurrPr
        tpdovJObV8sJdmZlzW1pDdkRz2ddq/PSpkbzeG2VWxPSYGQapjmak43sJwWCiQaO1bMQSk
        GxVxcCqkqqckWMuwNADLcG3VwLD1xe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636373101;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cmeZsq/SJ5yGsF0N57gsSWLarC8qyb6PAjYqlIQ0w/c=;
        b=jz9EhfEebyc2kc97iQIfOFQEttdfYqQbKq2cbiWqt6zaSv6HvoGuVdRFIBhwl1I//8cm+b
        1A/M8gmRX9VTFUAA==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 39B6EA3B83;
        Mon,  8 Nov 2021 12:05:01 +0000 (UTC)
Date:   Mon, 8 Nov 2021 13:05:00 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Daniel Axtens <dja@axtens.net>
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
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211108120500.GO11195@kunlun.suse.cz>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6ifehin.fsf@dja-thinkpad.axtens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

On Mon, Nov 08, 2021 at 09:18:56AM +1100, Daniel Axtens wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> 
> > On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
> >> Michal Suchanek <msuchanek@suse.de> writes:
> >> 
> >> > S390 uses appended signature for kernel but implements the check
> >> > separately from module loader.
> >> >
> >> > Support for secure boot on powerpc with appended signature is planned -
> >> > grub patches submitted upstream but not yet merged.
> >> 
> >> Power Non-Virtualised / OpenPower already supports secure boot via kexec
> >> with signature verification via IMA. I think you have now sent a
> >> follow-up series that merges some of the IMA implementation, I just
> >> wanted to make sure it was clear that we actually already have support
> >
> > So is IMA_KEXEC and KEXEC_SIG redundant?
> >
> > I see some architectures have both. I also see there is a lot of overlap
> > between the IMA framework and the KEXEC_SIG and MODULE_SIg.
> 
> 
> Mimi would be much better placed than me to answer this.
> 
> The limits of my knowledge are basically that signature verification for
> modules and kexec kernels can be enforced by IMA policies.
> 
> For example a secure booted powerpc kernel with module support will have
> the following IMA policy set at the arch level:
> 
> "appraise func=KEXEC_KERNEL_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig",
> (in arch/powerpc/kernel/ima_arch.c)
> 
> Module signature enforcement can be set with either IMA (policy like
> "appraise func=MODULE_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig" )
> or with CONFIG_MODULE_SIG_FORCE/module.sig_enforce=1.
> 
> Sometimes this leads to arguably unexpected interactions - for example
> commit fa4f3f56ccd2 ("powerpc/ima: Fix secure boot rules in ima arch
> policy"), so it might be interesting to see if we can make things easier
> to understand.

I suspect that is the root of the problem here. Until distributions pick
up IMA and properly document step by step in detail how to implement,
enable, and debug it the _SIG options are required for users to be able
to make use of signatures.

The other part is that distributions apply 'lockdown' patches that change
the security policy depending on secure boot status which were rejected
by upstream which only hook into the _SIG options, and not into the IMA_
options. Of course, I expect this to change when the IMA options are
universally available across architectures and the support picked up by
distributions.

Which brings the third point: IMA features vary across architectures,
and KEXEC_SIG is more common than IMA_KEXEC.

config/arm64/default:CONFIG_HAVE_IMA_KEXEC=y
config/ppc64le/default:CONFIG_HAVE_IMA_KEXEC=y

config/arm64/default:CONFIG_KEXEC_SIG=y
config/s390x/default:CONFIG_KEXEC_SIG=y
config/x86_64/default:CONFIG_KEXEC_SIG=y

KEXEC_SIG makes it much easier to get uniform features across
architectures.

Thanks

Michal
