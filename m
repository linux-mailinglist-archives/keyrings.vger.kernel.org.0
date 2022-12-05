Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E6F642D3C
	for <lists+keyrings@lfdr.de>; Mon,  5 Dec 2022 17:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbiLEQkU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Dec 2022 11:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbiLEQj2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Dec 2022 11:39:28 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCB6205DA
        for <keyrings@vger.kernel.org>; Mon,  5 Dec 2022 08:38:14 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id f7so16574112edc.6
        for <keyrings@vger.kernel.org>; Mon, 05 Dec 2022 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=UtqOR0TUTGkUbDGr8MGZcoRbeL9zx0cfVyHFZjKEugE8WOFFw6JAS5X6FEfDOg1IiE
         wT8TCd+ZUazDUUTLyr9KxmICTmZes5eWEeh6ygEUrJfXY/Qu8VHCP0WdU4h/7zzYfyQl
         91qAU7yNjWvvL7FJ3yatshBFxZWiRV6Gj+XHwjTDfnsSIDj464rGZr9+66S/CjEYisfX
         xv+3yrZfjpeO/euAEP1mkfE28NFp0rDieI8OQi68tcOAZJxxQT8YqjNWf8kIGbIGATbB
         Wq5VQQWRQePBOv3EnRUjtzI2EBC6eVy0h1gStPbhX/ZavVWyEFThLAdVF5j3hsF7abY6
         fbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=fjGFroL1toqkAczPjHF+gO1jouZQIKQ0kRNoQqi8J3p/gb4rKTCtUY52S72YGFmgdN
         uEI2GN3t+2zohIbXY1AdbHmbLwltsBSwIFb8HmKNi/RtAS4Vj4iAV1pf5hG/iL9CgcXt
         goT/1rjiiOmCFkBA52R4ilbXxu6RD68Zjfr+gdpmQgQtIDVMnTm3taTmLrYy29nwzcPx
         jcmU3DPwW0uSrMODZw1jI9/juorJtFK84kO8LJ0fUvT0VxPsPyLjKAaM6UnSwoPvVoVS
         RhUwDYbCa3Eku6SjeT0+K8Y5RnEU1eGs93xRTZqQTlVxBi7+1VyHLpotyNJXrISaapby
         ffFw==
X-Gm-Message-State: ANoB5pkmoG6pgONRGMlDmYM9b+H/jQ24els/4KrWTDx5x/9zvGdRNhMe
        QO4ri0jpbxj+DWnJl3xDZbm5PzXDwD/eAaQ3lT4=
X-Google-Smtp-Source: AA0mqf64QyMe8fpf59aGbeHCR1q35cNfSuUf6BMdUngrsM/ayoA9RV606OgadYwLica4v+1WhenLeJNDfjKkv0tfV/0=
X-Received: by 2002:a05:6402:1655:b0:46a:80cc:d5bd with SMTP id
 s21-20020a056402165500b0046a80ccd5bdmr47540855edx.210.1670258293183; Mon, 05
 Dec 2022 08:38:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:3b6:b0:27:90e6:e1d1 with HTTP; Mon, 5 Dec 2022
 08:38:12 -0800 (PST)
Reply-To: plml47@hotmail.com
From:   Philip Manul <alomassou1972@gmail.com>
Date:   Mon, 5 Dec 2022 08:38:12 -0800
Message-ID: <CA+_U6tgZ8DEVAUv=Xxa_wPqd0AjaBUYpHdjuWYu-vZsb=wyRVA@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
