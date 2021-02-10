Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEED531699F
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 16:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhBJPAh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Feb 2021 10:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhBJPAa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Feb 2021 10:00:30 -0500
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A488BC06174A;
        Wed, 10 Feb 2021 06:59:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3062F1280970;
        Wed, 10 Feb 2021 06:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1612969186;
        bh=DxDyCNcnCVoW8QKTNX6Mk6L5XH6eZAVV8RI1Foj2CAQ=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=UvkRPgOA60dj2pJQ9mMtEt+ah+IaqxBFtQnSUiPAbl5y53XfePEMwUS2VDPQLh90W
         QgKcUfHMV8ER1UjeCp9umLKYi3I6Phybt+cnR8LCJpGzcvkYHyW3sg0SMjLIthhrXt
         +iIrQGhg0Kd3uXwJSubKKVgGYtkaeNo4vbydFr6U=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tXk5NU9INlaf; Wed, 10 Feb 2021 06:59:46 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9DCA4128096F;
        Wed, 10 Feb 2021 06:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1612969186;
        bh=DxDyCNcnCVoW8QKTNX6Mk6L5XH6eZAVV8RI1Foj2CAQ=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=UvkRPgOA60dj2pJQ9mMtEt+ah+IaqxBFtQnSUiPAbl5y53XfePEMwUS2VDPQLh90W
         QgKcUfHMV8ER1UjeCp9umLKYi3I6Phybt+cnR8LCJpGzcvkYHyW3sg0SMjLIthhrXt
         +iIrQGhg0Kd3uXwJSubKKVgGYtkaeNo4vbydFr6U=
Message-ID: <a4ed4f9a5181995bb304490be219fa32dbb6a061.camel@HansenPartnership.com>
Subject: Re: [PATCH] sign-file: add openssl engine support
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     David Woodhouse <dwmw2@infradead.org>,
        Yang Song <songyang@linux.alibaba.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     zhang.jia@linux.alibaba.com, tianjia.zhang@linux.alibaba.com
Date:   Wed, 10 Feb 2021 06:59:44 -0800
In-Reply-To: <E4E1860E-57B8-44AA-B370-9589F9C20215@infradead.org>
References: <20210210074554.81100-1-songyang@linux.alibaba.com>
         <E4E1860E-57B8-44AA-B370-9589F9C20215@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2021-02-10 at 08:01 +0000, David Woodhouse wrote:
> 
> On 10 February 2021 07:45:54 GMT, Yang Song <
> songyang@linux.alibaba.com> wrote:
> > Use a customized signature service supported by openssl engine
> > to sign the kernel module.
> > Add command line parameters that support engine for sign-file
> > to use the customized openssl engine service to sign kernel
> > modules.
> > 
> > Signed-off-by: Yang Song <songyang@linux.alibaba.com>
> 
> Aren't engines already obsolete in the latest versions of OpenSSL, as
> well as being an implementation detail of one particular crypto
> library?

Um, no, they're getting renamed providers with some annoying API
changes that require a bit of a rewrite but the concept of a crypto
"engine" plug in to the code base isn't going away.

>  They aren't really a concept we should be exposing in *our* user
> interface.

We already do ... grep ENGINE in scripts/sign-file.c

Just by the way in case anyone is interested in history:

https://lore.kernel.org/keyrings/1518452963.3114.6.camel@HansenPartnership.com/

> Better to make sign-file automatically recognise RFC7512 PKCS#11 URIs
> and handle them by automatically loading the PKCS#11 engine.

PKCS11 can't cover everyting engines can.  Engines are mostly used for
accelerators, which are not in the PKCS11 API and even for external
keys, PKCS11 can't cope if the key isn't inside what PKCS11 thinks of
as a token.

James


