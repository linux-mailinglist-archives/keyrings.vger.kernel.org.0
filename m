Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C0479F165
	for <lists+keyrings@lfdr.de>; Wed, 13 Sep 2023 20:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjIMSwR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Sep 2023 14:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjIMSwQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Sep 2023 14:52:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C5C1985
        for <keyrings@vger.kernel.org>; Wed, 13 Sep 2023 11:52:12 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so23927666b.1
        for <keyrings@vger.kernel.org>; Wed, 13 Sep 2023 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694631130; x=1695235930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qj9Z1rQiOVRFuIxsKJDJyO2OoNyojeG35brwDaLZgQ=;
        b=d5QJbEoRWpQ2nEetGEM2hXNIrWKepyH9sc02Igli9Z4bvlcITQXh4jZwq3ino2bEJg
         J+2A7eiUQeTgEV72fi+ooGNvZsuGaAK3WI4ntzb/nIKbsPUcFDUAOS8tjQpG5BWuSZyt
         kEGtw8f1YzU8zbMIfmWGu/V/gf5tbsETnu3V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694631130; x=1695235930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qj9Z1rQiOVRFuIxsKJDJyO2OoNyojeG35brwDaLZgQ=;
        b=F7pAhUUmfGCmhVTvfcY7Oyp7Je5y83ETzFNt40ScGh1WjMdFZKJf+REgf7fjnJjSIg
         IE5jiK783MdxSg8aC9bJSDmpOBQmTE3ixlwVglwnWXH9EKSviDQhPW3+vCxM5kaBEjm/
         jL6PLwuPExCSsziCzGMacV/FF/3VGDnVJyN4OArwhpPlU2mr3KqZTIPhFzp0cjcnmW6a
         INj+pAm9YpTvvmJL/1vDql7EB1aaMzG7Vvvgj8h6ay4mHddqcNIK5sZc70fehKEaq3uh
         IXEs+0NF6TvJPfc6eJcenx6kIH7fA4h0stYqOxF8J4dpkKz9/DRMlodu6F5dhccA2xUu
         emZg==
X-Gm-Message-State: AOJu0Yz2mlCQrsTT54UcKpSKy84xdsjX1yAIK5Nz2bMsgXjnhQGMQC10
        voxgMxN3HyxcntjtgPodBSCuBmlPl49k9XR6+5jD7gHZ
X-Google-Smtp-Source: AGHT+IERwzXfoTU4kNMAm/THJnxW7Gi4QVcFVe70IY06ZXtYpDERH0wpDqgmffZI2yjg/UxVsfPQrg==
X-Received: by 2002:a17:906:74c1:b0:994:4095:3abf with SMTP id z1-20020a17090674c100b0099440953abfmr2828120ejl.14.1694631130298;
        Wed, 13 Sep 2023 11:52:10 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id cb22-20020a170906a45600b0099d804da2e9sm8788601ejb.225.2023.09.13.11.52.09
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 11:52:09 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so77689a12.3
        for <keyrings@vger.kernel.org>; Wed, 13 Sep 2023 11:52:09 -0700 (PDT)
X-Received: by 2002:a17:907:761a:b0:9a2:185b:5376 with SMTP id
 jx26-20020a170907761a00b009a2185b5376mr2470433ejc.49.1694631129472; Wed, 13
 Sep 2023 11:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230912201102.1012306-1-jarkko@kernel.org>
In-Reply-To: <20230912201102.1012306-1-jarkko@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 13 Sep 2023 11:51:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLB9_z5TcvRKVsSk3BWPfkDeWN0pDMdEv=-hnrnTgX1Q@mail.gmail.com>
Message-ID: <CAHk-=wgLB9_z5TcvRKVsSk3BWPfkDeWN0pDMdEv=-hnrnTgX1Q@mail.gmail.com>
Subject: Re: [GIT PULL] tpmdd changes for v6.6-rc2
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        David Howells <dhowells@redhat.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Justin M . Forbes" <jforbes@fedoraproject.org>,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 12 Sept 2023 at 13:11, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> This pull request contains a critical fix for my previous pull request.

Please, less sarcasm and more actual helpful merge commit fodder, ok?

              Linus
