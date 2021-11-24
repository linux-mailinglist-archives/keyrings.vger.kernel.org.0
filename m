Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0DC45C2C5
	for <lists+keyrings@lfdr.de>; Wed, 24 Nov 2021 14:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347004AbhKXNcc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Nov 2021 08:32:32 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44134 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351269AbhKXNab (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Nov 2021 08:30:31 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id CCED321941;
        Wed, 24 Nov 2021 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637760438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mN2kL64eNA1N2PK/PmloaFO9N3vVjmU6wTcDc2qhV70=;
        b=FMMYRpnfAGayOuJ/OK4NiO+Rx4lPtVOsvLnfUGWuitz77A9Q1LQzXEThtnv16Qf3SmSAwM
        s2ZzzLYTAjhWFIweg/PzCBGYT7fz693yetXPDZ/nbU4tKRDFKxfMfTHwr/1OnUPihqoTaX
        C/XDrJpV7ODrGvuHvUkkALx/m7QdGuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637760438;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mN2kL64eNA1N2PK/PmloaFO9N3vVjmU6wTcDc2qhV70=;
        b=Mqki1S4QamNYU0y4PtzCs1Pt2rdDnqqPiT8W36clDnHP3O2iMu2RsASAK90x88WoZDwDNY
        7hA994IhL7ztkgAw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id C4C7EA3B93;
        Wed, 24 Nov 2021 13:27:17 +0000 (UTC)
Date:   Wed, 24 Nov 2021 14:27:16 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     Philipp Rudo <prudo@redhat.com>, Nayna <nayna@linux.vnet.ibm.com>,
        keyrings@vger.kernel.org, Rob Herring <robh@kernel.org>,
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
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Daniel Axtens <dja@axtens.net>, buendgen@de.ibm.com
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211124132716.GT34414@kunlun.suse.cz>
References: <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
 <20211112083055.GA34414@kunlun.suse.cz>
 <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
 <20211116095343.GG34414@kunlun.suse.cz>
 <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
 <20211119111823.GC34414@kunlun.suse.cz>
 <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
 <20211124120950.57c10a9f@rhtmp>
 <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Nov 24, 2021 at 08:10:10AM -0500, Mimi Zohar wrote:
> On Wed, 2021-11-24 at 12:09 +0100, Philipp Rudo wrote:
> > Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely on all
> > architectures using the same mechanism and thus reduce maintenance cost.
> > On the way there he even makes some absolutely reasonable improvements
> > for everybody.
> > 
> > Why is that so controversial? What is the real problem that should be
> > discussed here?
> 
> Nothing is controversial with what Michal wants to do.  I've already
> said, "As for adding KEXEC_SIG appended signature support on PowerPC
> based on the s390 code, it sounds reasonable."

Ok, I will resend the series with the arch-specific changes first to be
independent of the core cleanup.

Thanks

Michal
