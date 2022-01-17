Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05670490E69
	for <lists+keyrings@lfdr.de>; Mon, 17 Jan 2022 18:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242228AbiAQRIu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 Jan 2022 12:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241451AbiAQRGr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 17 Jan 2022 12:06:47 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46DCC06124E
        for <keyrings@vger.kernel.org>; Mon, 17 Jan 2022 09:04:17 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id c2so9478027qvw.3
        for <keyrings@vger.kernel.org>; Mon, 17 Jan 2022 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0hNWdm5n9u5qVC3fRUHZ7VK1Pllh2iO5xA98hrEfK2U=;
        b=aJKzCXehSh69U3RCXCcLUhLPpMbpEfuimfkbEzb64vl/w1F4Xv+rtrMmPMNLj6S7Fc
         P/HAGYoGIXtQarO8AB5hoYnxeNGQsPg7lRCBGn9+gKDkaINIkfagzfWYLeqc9bFkfSNZ
         oXuoZT0lN+g6LPPqL8iXwNFSJx67yLdwW+r+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0hNWdm5n9u5qVC3fRUHZ7VK1Pllh2iO5xA98hrEfK2U=;
        b=dmCDoZPs36rsA9zE73sMJMh8JjOZJrOYy/4YjA9gXa7z4ZwjtOW+PXhSBdq6ml7dSj
         4WpRPO3GOtJrig832fYTRkYHetephc1tKJUrFyL9q+Ip6t9ibyhdU2lj2xbuxqb1qOAt
         qACVB0jIzhw2AdKWMZKJE4U3wCDappgD3d9Ezk4unGG1coWcm/c0YGaN+eg2dRIrUpgm
         wKwvB1sgdPghTwhfdy3FZ1DBOt59ucYIP7iIEHjPo7geK+p8kin+ZvR2yUx30fMHmjCy
         kmjurq2nWttnJeFGHkJtUSABeKEKUzvBY0G/8ao4q0lZP2vO3yTfLWLIxl2mAFu81q+q
         q9wQ==
X-Gm-Message-State: AOAM531yI9nwoHROUex7ONP/Z2Bo23IjAxOFhQbUzwJ9QE4EAkQU/Bcx
        5cVtVNUcOvs66X7uGxet9wI5KQ==
X-Google-Smtp-Source: ABdhPJywSIAmiF2poqUmvx5cjQbTfPwoIKoE310ebp7bGexVbeDlQNyNuXc0bpNU3+eOG7ut+NWlJw==
X-Received: by 2002:ad4:5ca5:: with SMTP id q5mr19346839qvh.128.1642439057064;
        Mon, 17 Jan 2022 09:04:17 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id j2sm1637993qko.117.2022.01.17.09.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 09:04:16 -0800 (PST)
Date:   Mon, 17 Jan 2022 12:04:15 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Roberto Sassu <roberto.sassu@huawei.com>, dhowells@redhat.com,
        dwmw2@infradead.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
        zohar@linux.ibm.com, ebiggers@kernel.org
Subject: Re: [PATCH 00/14] KEYS: Add support for PGP keys and signatures
Message-ID: <20220117170415.7j342okd67xl6rix@meerkat.local>
References: <20220111180318.591029-1-roberto.sassu@huawei.com>
 <YeV+jkGg6mpQdRID@zx2c4.com>
 <20220117165933.l3762ppcbj5jxicc@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220117165933.l3762ppcbj5jxicc@meerkat.local>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jan 17, 2022 at 11:59:33AM -0500, Konstantin Ryabitsev wrote:
> The most promising non-PGP development of PKI signatures that I've seen lately
> is the openssh FIDO2 integration (the -sk keys) and support for
> signing/verifying arbitrary external content using `ssh-keygen -n`. It even

Typo fix: that should be `ssh-keygen -Y`

-K
