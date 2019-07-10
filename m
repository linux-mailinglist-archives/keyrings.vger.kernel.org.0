Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF25063EF6
	for <lists+keyrings@lfdr.de>; Wed, 10 Jul 2019 03:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfGJBc2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Jul 2019 21:32:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbfGJBc2 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 9 Jul 2019 21:32:28 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0993720693;
        Wed, 10 Jul 2019 01:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562722347;
        bh=VvkJu6WOWPBfEu1dXI4N1bsdh6tfES4g7an4kdrLwCA=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=DtoWRDRkCxD7i4ZZdT1HomDOhn5U/As2i9ORhrjUdmFpSCXRgEj1bS+2qnsQsAjh6
         RUAfbt2s+VXBtz18kLBF1UshZTzq5llWZB5WfJdhmIthgxGeaxdvkbYgmO+A9BEppM
         TtSx4F4Ld8FNoPXhi+R4xViAoE/b6ycg+Ux1Rf0s=
Date:   Tue, 9 Jul 2019 18:32:25 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        David Woodhouse <dwmw2@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: next-20190705 - problems generating certs/x509_certificate_list
Message-ID: <20190710013225.GB7973@sol.localdomain>
Mail-Followup-To: David Howells <dhowells@redhat.com>,
        keyrings@vger.kernel.org,
        Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
References: <27671.1562384658@turing-police>
 <20190709201712.GI641@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190709201712.GI641@sol.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 09, 2019 at 01:17:14PM -0700, Eric Biggers wrote:
> On Fri, Jul 05, 2019 at 11:44:18PM -0400, Valdis Klētnieks wrote:
> > This worked fine in next-20190618, but in next-20190701 I'm seeing dmesg
> > entries at boot:
> > 
> > dmesg | grep -i x.509
> > [    8.345699] Loading compiled-in X.509 certificates
> > [    8.366137] Problem loading in-kernel X.509 certificate (-13)
> > [    8.507348] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> > [    8.526556] cfg80211: Problem loading in-kernel X.509 certificate (-13)
> > 
> > I start debugging, and discover that certs/x509_certificate_list is a zero-length file.
> > I rm it, and 'make V=1 certs/system_certificates.o', which tells me:
> > 
> > (....)
> > make -f ./scripts/Makefile.headersinst obj=include/uapi
> > make -f ./scripts/Makefile.headersinst obj=arch/x86/include/uapi
> > make -f ./scripts/Makefile.build obj=certs certs/system_certificates.o
> > ---- smoking gun alert
> >   scripts/extract-cert "" certs/x509_certificate_list
> > ----
> >   gcc -Wp,-MD,certs/.system_certificates.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-redhat-linux/9/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -m64 -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_AVX512=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -Wa,-gdwarf-2 -DCC_USING_FENTRY -I.   -c -o certs/system_certificates.o certs/system_certificates.S
> > 
> > I go look at extract-cert.c, and sure enough, if the first parameter is a null string
> > it just goes and creates an empty file.
> > 
> > The Makefile says:
> > 
> > quiet_cmd_extract_certs  = EXTRACT_CERTS   $(patsubst "%",%,$(2))
> >       cmd_extract_certs  = scripts/extract-cert $(2) $@
> > 
> > and damned if I know why $(2) is "". Diffed the config files from -0618 and -0705,
> > not seeing anything relevant difference.
> > 
> > Any ideas?
> > 
> 
> I'm seeing on mainline now:
> 
> [   10.915386] Problem loading in-kernel X.509 certificate (-13)
> 
> - Eric

This is caused by

commit 2e12256b9a76584fa3a6da19210509d4775aee36
Author: David Howells <dhowells@redhat.com>
Date:   Thu Jun 27 23:03:07 2019 +0100

    keys: Replace uid/gid/perm permissions checking with an ACL

- Eric
