Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5638316080
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 09:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbhBJICn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Feb 2021 03:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbhBJICl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Feb 2021 03:02:41 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D198C061756;
        Wed, 10 Feb 2021 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Subject:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
        Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=YwvDu6oqROt+57TdiDoWh5hmU/4sN4z20+5LEuc/s2s=; b=v28vFuD3GKtPjcZ1S4zq/pKgIn
        6WOeUKnFlUOe3TSLrwe3QMtmr3WuTROXmKCYs4UzXyRbDV6M7t3XzfC3q6vQgaWEEKP1f2AEnuJ9H
        SXCwIkbiJ4ltBMTKEw44H0eVJHInTxp5GDRVhzwF96pWLOvk3Cn/miPQah2ShslEqn5LSFAw3H67Q
        OmGyt6jjntKi6z07AayxxIFW/MNsDA2DuHzXFjtIKAMQKdThYxYcqEJCb6qH6sFjet3eUFG0Dq9+d
        Yutzm/JSyvihGhQR/uslkl1ofDFIgvd8GqAGOruz3z2Xsqe6Gc7fTZEdbEDsvfb2w8O89q3i3oQMu
        ITi+bGpA==;
Received: from [2001:8b0:10b:1:214c:2fae:9fc7:4b5c]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9kRG-008Y5W-EA; Wed, 10 Feb 2021 08:01:43 +0000
Date:   Wed, 10 Feb 2021 08:01:30 +0000
User-Agent: K-9 Mail for Android
In-Reply-To: <20210210074554.81100-1-songyang@linux.alibaba.com>
References: <20210210074554.81100-1-songyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sign-file: add openssl engine support
To:     Yang Song <songyang@linux.alibaba.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
CC:     zhang.jia@linux.alibaba.com, tianjia.zhang@linux.alibaba.com,
        songyang@linux.alibaba.com
From:   David Woodhouse <dwmw2@infradead.org>
Message-ID: <E4E1860E-57B8-44AA-B370-9589F9C20215@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 10 February 2021 07:45:54 GMT, Yang Song <songyang@linux=2Ealibaba=2Eco=
m> wrote:
>Use a customized signature service supported by openssl engine
>to sign the kernel module=2E
>Add command line parameters that support engine for sign-file
>to use the customized openssl engine service to sign kernel modules=2E
>
>Signed-off-by: Yang Song <songyang@linux=2Ealibaba=2Ecom>

Aren't engines already obsolete in the latest versions of OpenSSL, as well=
 as being an implementation detail of one particular crypto library? They a=
ren't really a concept we should be exposing in *our* user interface=2E

Better to make sign-file automatically recognise RFC7512 PKCS#11 URIs and =
handle them by automatically loading the PKCS#11 engine=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
