Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3EB661D0C
	for <lists+keyrings@lfdr.de>; Mon,  9 Jan 2023 04:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbjAIDxv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 8 Jan 2023 22:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236722AbjAIDxC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 8 Jan 2023 22:53:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B0F1276F
        for <keyrings@vger.kernel.org>; Sun,  8 Jan 2023 19:51:54 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id o13so3970612pjg.2
        for <keyrings@vger.kernel.org>; Sun, 08 Jan 2023 19:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPLGdbD4w3KTNSXThRBpSsjS7f9R9UPFXQ4iA1FrtvI=;
        b=nPPmYnBXei1dfYlS1rdCM2vB2N1VwVs01sjf7uRRBjye8S+HOHefmxparAACWmM1WD
         aMAqF3SCZOzl/6oJTTay0ycDo1Ce165iGmwv5opji1Y6bgcUmowgU1bWuGmeTs7+0fC7
         dVIm84RuDd6Qv5ScegEDxJb3PaVDGCdI8kvbcg9J86poaHNp0BG+RUkTuiSUV5bJV9CA
         OyMoDvJL2A9BS40+lDXlmJ50fkeRkDrnadxJj6Ao0uevnhSxWcUA17SJXJUIZxeL+ATh
         2pixxWYOSXnYEoRO56vtmDsE3RuMTL6f7SWYn/44iQ6FfkTjVHT0g9Cb1nSnJjYtS6Q6
         ftiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPLGdbD4w3KTNSXThRBpSsjS7f9R9UPFXQ4iA1FrtvI=;
        b=BsipEKTg5nYjpgdsi363NXio46h4OEHpkiAG2Dx6zkZ+3iTokbPppZh9B6Jk4qMWpb
         mjSlcUyN3+h7LicDuam8Hswa07K69mpPx8bDVBKAUjlk0QvWYoaJLMYSbXft7NEgzlNm
         FqMQYuOVgwWWBmbs6H9ztKIthis75jMI5py4XrpbZpyKC3q5qa2XZDE9QGwPaO05emmG
         oe0EI3bSz6vHWoX/nxmVV1RfXjzVtLuLIz4SAPW1kvqx6eGqJqTPGbXQ6tmGDUgBT8jz
         Uf1xE4Ff+6wn+jKjTY7cyaeKKsabbX0XOWPnNDfuPHJPzJ9E94FRRcbuqdT+p7mX6HEG
         i+OA==
X-Gm-Message-State: AFqh2kqvY6Fskn2yTsV+1T3FCpzmSLTKOGQ4es1aGe/OFdSM9DwtiP2z
        T8DSla65dhBdz1iL2R7S+PEUAQ==
X-Google-Smtp-Source: AMrXdXsHyCuK/5tTYQ2YiGIo2OlMLfna9+NQYVqCDBdoVnrK+eAv9N2c36+OrrMuRoh4EdIDp1Zslw==
X-Received: by 2002:a17:902:a512:b0:192:5c3e:8952 with SMTP id s18-20020a170902a51200b001925c3e8952mr14756022plq.2.1673236305856;
        Sun, 08 Jan 2023 19:51:45 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id z3-20020a6552c3000000b0049b7b1205a0sm4278560pgp.54.2023.01.08.19.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 19:51:45 -0800 (PST)
Message-ID: <f9ca2051-741b-e4bb-74c5-178778c788df@kernel.dk>
Date:   Sun, 8 Jan 2023 20:51:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCHv2 00/12] iov_iter: replace import_single_range with ubuf
Content-Language: en-US
To:     Keith Busch <kbusch@meta.com>, linux-kernel@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>
Cc:     linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, hch@lst.de,
        io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, davem@davemloft.net,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        netdev@vger.kernel.org, Keith Busch <kbusch@kernel.org>
References: <20230105190741.2405013-1-kbusch@meta.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230105190741.2405013-1-kbusch@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/5/23 12:07 PM, Keith Busch wrote:
> From: Keith Busch <kbusch@kernel.org>
> 
> ITER_UBUF is a more efficient representation when using single vector
> buffers, providing small optimizations over ITER_IOVEC. This series
> introduces a helper to set these up, and replaces all applicable users
> of import_single_range with the new helper. And since there are no
> single range users left after this change, the helper is no longer
> needed.
> 
> As noted in v1(*), there are some fundamental differences to how io_uring
> compares to read/write/readv/writev. There are only the two affected
> file_operations, and they already do not work with io_uring due to their
> diverging semantics for vectored vs non-vectored read/write. Therefore,
> this series having io_uring prefer ubuf iov_iter isn't introducing new
> breakage.

Pondering how to stage this, both for later upstream but also for
testing. Would probably make the best sense to stage 1-5 separately,
and then just punt the remaining ones to the appropriate subsystems.
And then 12/12 can go in when they have all been applied.

-- 
Jens Axboe


