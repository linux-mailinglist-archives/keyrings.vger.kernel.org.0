Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919A1302707
	for <lists+keyrings@lfdr.de>; Mon, 25 Jan 2021 16:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730141AbhAYPjv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 25 Jan 2021 10:39:51 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:33507 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730098AbhAYPjY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 25 Jan 2021 10:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611588925;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
        From:Subject:Sender;
        bh=wh8ynQ0sFZs0cMug4EY282tqecnbYeK+Wnn/R/lwneE=;
        b=nDZkNQCD2CuWCkR5apOOoXobzktjy7tsR57OybjpG5stXUTL5EFiD9ymAKhro084Dx
        gGPoBMGRRltq3axKo92NhoSLQ3BsFC0ofRto8A1p/FhBNp0yYRBIaUdpqXSjrNRwzODF
        crHJN7+CeJzlJpBu+zwcNC5lhMRehKx3WUGTr8aUI84Odu6/Wm/HEOObsAQC1C0fZAhu
        Y59ls31UhKVC3EJapAoK2Loc9rtw+KZUX1+ogHJZmijdhJiAzc3NigBNRnZRQI3+Q4TC
        GGH4Dzx1iMlUVuP+3h2e8UPxxHmTL7jlQ1u8YKlsf+IXOmyhq6B2lqkHZdrwz9BtuPEf
        JLYA==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNzyCzy1Sfr67uExK884EC0GFGHavJSpDkMdZNkE="
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
        by smtp.strato.de (RZmta 47.15.1 DYNA|AUTH)
        with ESMTPSA id 607b6ax0PFUL0o1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 25 Jan 2021 16:30:21 +0100 (CET)
Message-ID: <86159cb41fd1750738ebb07a78af06ec557d8acc.camel@chronox.de>
Subject: Re: Keyctl: DH test failure
From:   Stephan Mueller <smueller@chronox.de>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org
Date:   Mon, 25 Jan 2021 16:30:21 +0100
In-Reply-To: <2443201.1611587846@warthog.procyon.org.uk>
References: <7903360.NyiUUSuA9g@positron.chronox.de>
         <2443201.1611587846@warthog.procyon.org.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Am Montag, dem 25.01.2021 um 15:17 +0000 schrieb David Howells:
> Stephan Müller <smueller@chronox.de> wrote:
> > 
> > + '[' 2 '!=' 2 -o 'xf571d0e7 18e00aba c6c1962b 11ded645' '!=' 'x0066207b 
> > cdab1d64 bbf489b3 d6a0dadc' ']'
> > 
> > I.e. the kernel returns "xf571d0e7 18e00aba c6c1962b 11ded645" but the
> > test 
> > expects "x0066207b cdab1d64 bbf489b3 d6a0dadc".
> 
> Hmmm...  It works fine for me.  I'm using commit
> 9791581c049c10929e97098374dd1716a81fefcc as the base.  Any idea where it
> goes
> wrong?

The issue is that it does not work for me on either 5.11-rc4, 5.10-rc1, and
even on the Fedora 32 kernel package version 5.9.11-100.fc32.x86_64.

So, I am a bit surprised too.

I noticed the issue during the development of the KDF patches and thought my
patches are broken. But my patches calculate the exact same responses as the
kernel version without the patches. So, it must be something with either the
input data or the operations before the KDF.

Still investigating...

Ciao
Stephan

