Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524A74ECE10
	for <lists+keyrings@lfdr.de>; Wed, 30 Mar 2022 22:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350996AbiC3UfX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Mar 2022 16:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351004AbiC3UfW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Mar 2022 16:35:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B717A6478
        for <keyrings@vger.kernel.org>; Wed, 30 Mar 2022 13:33:31 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r13so43862650ejd.5
        for <keyrings@vger.kernel.org>; Wed, 30 Mar 2022 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=eT9vDzjHW/FfFjL/ybLsrFbYukyfSiHXua+06jvkaok=;
        b=SdK00kOdGLMNpNRGXAKju/gX1QDNAxsedO8Be9oSjbeBiwJWwYWruJXp8dtzLVugP3
         vuYNQaCh0a4Rq/W1vHeldoAF3IxsvczavxPaduQY4P8bN3ABDk6BCcpde6cMMRO5CW5o
         M6uB0iP9zpzxHLJSgaOXRS/lxEZyFbDsNKhvtp20e0wh2fBGfRbzQCk94jQjACvz7svJ
         T6i3RTcWzrCg7ur65S7teGHwdVOM4AYnp0E91DhTZVIyoTI5N8WNy2DyOOuZCq8xrPdy
         RcyWIZM54Wd9HRIjCmfnsCFk7OXzRxHhwv6JzXooB9ZnxkGv/jBnauBsQouqdFstugTL
         mURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=eT9vDzjHW/FfFjL/ybLsrFbYukyfSiHXua+06jvkaok=;
        b=jaolQwaTeqz9ARmINU/55obEEdoarb/s7NqfCPjtun78CRwtcVOhCqnZW/yo6NC5pg
         Nm0Hk8Rm+oqxqLcze3ruhcx2QcYOX4cj9usmcwUHBwrjFaxUG7FbvRACHEK9QWxFwNFa
         yHYKG3Cc7G6/9x9/DrOua7Dhaas7COjTMLNL7EYJx4MFdg+ZwsOUoBGHT/mUEQPRAHGx
         kjW9Yf+wcoGQhoCCGbHZ+cZl6QrfyBesqK+YOeDKHlNqxEzdBgd2LINZi9IbbduRn00Z
         XvpP6X0jKdSdvWIPeSsMCiGIYnsW/rIQhwifOp38bpVxhmH5ZL50eqyVnZx51YYn3wqI
         K8WQ==
X-Gm-Message-State: AOAM531SL79TPSP1AZGOYwyt7212chrXulNiOp36mOqMfPgAAYdHLzRz
        XXTM2tsbLvgBDTjb1oB/FPz3oVwZEiuwJn+cDyQ=
X-Google-Smtp-Source: ABdhPJxQu+j0gzlsyl6qstIUfJJpxFEVJeyEgyZ7fwX3PXwXznQbMiWdMgLheok+0hjEE2jW6cOZ2+h35MGNtYrdr1k=
X-Received: by 2002:a17:907:c0c:b0:6d1:8c46:6415 with SMTP id
 ga12-20020a1709070c0c00b006d18c466415mr1609240ejc.326.1648672409944; Wed, 30
 Mar 2022 13:33:29 -0700 (PDT)
MIME-Version: 1.0
From:   Duke Abbaddon <duke.abbaddon@gmail.com>
Date:   Wed, 30 Mar 2022 21:33:25 +0100
Message-ID: <CAHpNFcPdVQ3N+SH6uJM5mhDcT-D_x1=8HJzTuEOjNrLpicWHHw@mail.gmail.com>
Subject: #CryptoFASTintFL Polynomial ROOFLINING : In terms of Entropy pool Int
 & Timer collections Polynomial is a Cryptologic_Functiontion & should be A :
 Rooflined B : Streamlined & C : In Crypto_hash_function.h https://lkml.org/lkml/2022/3/30/1313
To:     submissions@vialicensing.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Polynomial ROOFLINING : #CryptoFASTintFL

In terms of Entropy pool Int & Timer collections Polynomial is a
Cryptologic_Functiontion & should be A : Rooflined B : Streamlined & C
: In Crypto_hash_function.h

https://lkml.org/lkml/2022/3/30/1313

**Reference**

Multi Bit load operations for bitmap,Texture & Other tasks +ON+HighLowOP (c)RS
May take higher or lower bit depth & precisions: Rupert S 2021

MultiBit Serial & Parallel execution conversion inline of N*Bit -+

2 16 Bit loads is 32Bit but takes 2 cycles...

16 Bit loads with 32 Bit Stores & Math unit:

Operation 1

16Bit , 16Bit , 16Bit , 16Bit Operation
    \         /    \         /
           Inline Store
     32Bit Store 32Bit Store
           64Bit Store
       \     /
32Bit ADD/DIV x 2 or 64Bit ADD/DIV x1

Operation 2

32Bit ADD/DIV x 2 or 64Bit ADD/DIV x1
          \            /
          4x 16Bit Store

4 x 16Bit Operation

MultiBit Serial & Parallel execution conversion inline of N*Bit -+

In the case of ADD -+ Signed for example:(c)RS
Plus & - Lines ADD or Subtract (Signed, Bit Depth Irrelevant)

Multiples of 16Bit works in place of 32Bit or 64Bit

V1: 16Bit Values composing a total 128Bit number
V2: 16Bit Values composing a total 128Bit number - (Value less than V1)
V3: Result
NBit: Bit Depth

4x16Bit operations in the same cycle >
If Value = 16Bit = Store
If Value = V3=Bit = Store * NBit

Stored 128Bit RAM or if remainder = less > 4x16Bit -1-1-1 ; 16Bit Value Store

*

*RAND OP Ubuntu

https://pollinate.n-helix.com/

(Rn1 *<>/ Rn2 *<>/ Rn3)

-+
VAR(+-) Var = Rn1 +- Rn8

(Rn5 *<>/ Rn6 *<>/ Rn7)

4 Samples over N * Sample 1 to 4

Input into pool 1 Low half -+
Input into pool 1 High half -+

*RAND OP Recycle It

*

(c)RS https://bit.ly/DJ_EQ
