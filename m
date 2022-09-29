Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302B15F0143
	for <lists+keyrings@lfdr.de>; Fri, 30 Sep 2022 01:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiI2XRD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Sep 2022 19:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiI2XRC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Sep 2022 19:17:02 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD805153A49
        for <keyrings@vger.kernel.org>; Thu, 29 Sep 2022 16:17:01 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so7360830pjq.3
        for <keyrings@vger.kernel.org>; Thu, 29 Sep 2022 16:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=qr160bjFvsMQlapQ9mf0vDQHXjbJ+J3zHuO0hmuVucE=;
        b=d4Ie18zgl1mqAmp2j1hAyfVKBgVbpIgefckHSgmGuoTlpYi9pAFchCsngJZ2UfO00n
         hMh2NA2ryxIHdC/EC+EoeWsV43vIAz6JXyihlFAnM0j/uK+r1l6lqKjvp9EsKDzK12FT
         k3alvcJJAoe6VFnBSulMVZoVhpanGLeDsbM1udNdg4kDEKmvVOyR4DjCJaP5Itq86Alc
         kVaaJ17guGDo0rQfDkzytj+3Lsv4bp4ANNrcFUp6XuSwXhqBFezzXNWQdjIjjgFP7toU
         7VYBs0C2iYbdTSVTYdlFLSj75EznOICFNpK4A2EmgMKWG/u7+rZONyAgv+Cklp1xfxU5
         tkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qr160bjFvsMQlapQ9mf0vDQHXjbJ+J3zHuO0hmuVucE=;
        b=M8Jd2ZC626HF0cRyKKwPuMzWZsyJUjo1WMPvi9RcQDXZFZmMrFDtWETPIy5i3b0ViN
         42Ee8o2Unl7EcSdGyDa1MhDuOmj0YVUAmwd2cqwsntgJhtffEHCy7U8giJF3Gtm+Z11i
         OKkr3IgCCw/ZhvSCDhtkTe2wi0TQ6LntGXri+hqK1z1r/yNXkGWmLG849ApxdVW13Qe2
         t3U5HLIx4YJj7DN7+fBLhc5FT0aDjqjfEmhNublNimABJyG/gmlGd7ohxBgbRWzCIWOd
         1xEnaVgXLn6//4jUNpjOo4/gTxwDi+6EA/cmxAS7bQQwHJrcad2exhbOUuK2aphl5uto
         lzUA==
X-Gm-Message-State: ACrzQf0HZyXVUdP61jaD2FuyGsg8KQOx2MlfUxNeY9KwP1jCdl6rwEx2
        eSnWRr+SfKuituOf4jQ4om+d8vVBIdsJyCDG3b0=
X-Google-Smtp-Source: AMsMyM6aSytt2r4PJcZkxKipI5oKoaolyAPwGsC4bZPXUeWB2Xh3nCmEaqq0yhyhs9bXfE7XAcsz5j2/MfXEtooL4/I=
X-Received: by 2002:a17:90b:4c50:b0:202:c7b1:b1f9 with SMTP id
 np16-20020a17090b4c5000b00202c7b1b1f9mr19017414pjb.77.1664493421301; Thu, 29
 Sep 2022 16:17:01 -0700 (PDT)
MIME-Version: 1.0
Sender: laurahaver36@gmail.com
Received: by 2002:a05:7300:d28:b0:6f:3883:cc14 with HTTP; Thu, 29 Sep 2022
 16:17:00 -0700 (PDT)
From:   Maya Williamson <mayawillmson@gmail.com>
Date:   Thu, 29 Sep 2022 23:17:00 +0000
X-Google-Sender-Auth: 6TcW1VL3pzk-lsqROM4Z-sNl_HM
Message-ID: <CAHco0c4=4dG9MHUug71sRixVFdj0-KtBuFB0iz3Y92PzgJLYzg@mail.gmail.com>
Subject: gk
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

-- 
Mr,
I want to speak with you.

I'm Maya.



Maya
