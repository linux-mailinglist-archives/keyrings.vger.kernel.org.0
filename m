Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2683261D9ED
	for <lists+keyrings@lfdr.de>; Sat,  5 Nov 2022 13:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiKEMiy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 5 Nov 2022 08:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiKEMix (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 5 Nov 2022 08:38:53 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27591583F
        for <keyrings@vger.kernel.org>; Sat,  5 Nov 2022 05:38:50 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c2so7180415plz.11
        for <keyrings@vger.kernel.org>; Sat, 05 Nov 2022 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=dP/vGfJ52tqdGGbdLFa+Ia1xCAutipWeAOPq8jKDnWkU62hZU7sMsZY49TgkwXAA5g
         1yeGamAlfRFs90wkvR6lgaV3Wg24N6HDnekdo8UURsmSP5otybZlRkZzNxJ7AfUj6Q2+
         CKiyBj4FP1EFkZc1H9L2i7zRAVvwvNQ+/TJeOdzeNP7tRScDVLp3Vlh/OdENcMPFJkDn
         oSEUQfZcVQpylzARvlDhQNJui4E2RbhaxAaa7n3Kdgsd4f/k34LkyqWLBylB/XpPW04g
         dKDuUZyENsU3QsJf+hTLTKsTcNOWBj2897N39hnlhbs7/J2gK6gRaL+j/IeFSdFJ1ntP
         NWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=iOYCfHneHZrfJoDJ25QN9HKR2B8ngGMp+7wISdmeznIgiKZ88sOqttOvl7r4C3+ndC
         O4fnR09UtHMhWADbYdVfZOuKOJwkk9xGVjLM9GfkPMTE3l3nUKOHoXMZ8UhTX5+4YVXi
         40MK206Qtj9r7l5R5S9yF1js/HG4owcvmTu+yhchjCaCf1nCsz4Y9L5aIkelShQWgXM6
         pnWtG+PR6z91g57yNPGXWxhC9kzSrwyNe7QIh4S7mXOZiIGz2pRTuQ9aWtnkgvyTV9UY
         MutW/k9jbAzBadUN8t6+c0q3VD1AcYxqG528zMDwKd8S+EFANNTk5QfIgXlrvAJvgq24
         42lQ==
X-Gm-Message-State: ACrzQf3JJnBx+O64PecZqo97+dJCVarUnIa9gBy940mctOaGdvQF00nA
        Q46H1Dcgl6vZsADULhgV6mWs12dbpS+VwHfETT0=
X-Google-Smtp-Source: AMsMyM4olsI8J+PUrJBDqcdS3+ybCY1m5BPCD8wMv7D7l+O5tLdAL0JwRK1eWuD3q/Waqjsy5xHfJk1xeIU90M7q0J0=
X-Received: by 2002:a17:902:f28b:b0:186:b069:63fc with SMTP id
 k11-20020a170902f28b00b00186b06963fcmr41192256plc.38.1667651930280; Sat, 05
 Nov 2022 05:38:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:2e91:b0:83:922d:c616 with HTTP; Sat, 5 Nov 2022
 05:38:49 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <wamathaibenard@gmail.com>
Date:   Sat, 5 Nov 2022 15:38:49 +0300
Message-ID: <CAN7bvZJK9DwWPHW=SDzsdiMac2NZ4YPui9Vp11ivOjS8hNwTjg@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
