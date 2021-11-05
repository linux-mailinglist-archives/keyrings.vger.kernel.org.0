Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6704463E3
	for <lists+keyrings@lfdr.de>; Fri,  5 Nov 2021 14:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhKENQq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Nov 2021 09:16:46 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33204 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbhKENQo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Nov 2021 09:16:44 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 6DE281FD37;
        Fri,  5 Nov 2021 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636118043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GJZ3yTXhrzi4whvrAIl3BNUnX0rED/L5GxqfhBDh6mo=;
        b=gZlL3n9dgK20NLv/q4Tjf8za+Zyb+vEPJJUCccpbyATFt+Y7qamzrZHILKT9OUJ1BDOpPE
        6AUtJ39tV5G5CkBXkovM3M0AimFa/4v0orHsoAiPnLPL+Vrp3xHSbaFeI/V2Mvx06BDd4U
        xagoOQY0ft2lt1LbyFCz+E2f+cfSCJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636118043;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GJZ3yTXhrzi4whvrAIl3BNUnX0rED/L5GxqfhBDh6mo=;
        b=rpqjS5Jwt1qeWSytrXnsbDBHXb+K6Ov6jka10AwhMpvrngwpe4rn1SqFeZHtW9mE0QF0xO
        5yTO9V5A3dK305DQ==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id DA9E12C144;
        Fri,  5 Nov 2021 13:14:02 +0000 (UTC)
Date:   Fri, 5 Nov 2021 14:14:01 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Daniel Axtens <dja@axtens.net>
Cc:     keyrings@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
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
Message-ID: <20211105131401.GL11195@kunlun.suse.cz>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czneeurr.fsf@dja-thinkpad.axtens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
> Michal Suchanek <msuchanek@suse.de> writes:
> 
> > S390 uses appended signature for kernel but implements the check
> > separately from module loader.
> >
> > Support for secure boot on powerpc with appended signature is planned -
> > grub patches submitted upstream but not yet merged.
> 
> Power Non-Virtualised / OpenPower already supports secure boot via kexec
> with signature verification via IMA. I think you have now sent a
> follow-up series that merges some of the IMA implementation, I just
> wanted to make sure it was clear that we actually already have support

So is IMA_KEXEC and KEXEC_SIG redundant?

I see some architectures have both. I also see there is a lot of overlap
between the IMA framework and the KEXEC_SIG and MODULE_SIg.

Thanks

Michal
