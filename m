Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CAF4D1F35
	for <lists+keyrings@lfdr.de>; Tue,  8 Mar 2022 18:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345103AbiCHRjG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Mar 2022 12:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245683AbiCHRjF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Mar 2022 12:39:05 -0500
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6264A916
        for <keyrings@vger.kernel.org>; Tue,  8 Mar 2022 09:38:08 -0800 (PST)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-2dc242a79beso199743847b3.8
        for <keyrings@vger.kernel.org>; Tue, 08 Mar 2022 09:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=VsKXeyq/2GS92/Xx57CmizwltP2JbQChS2ubW8vafRE=;
        b=llxKnKXiVTI+/UdERIDC9ZbAmS88XFYz/wlvFVYc/36gaAGkVchkqmsoMN5fIOBoKK
         8q0/MLrsieLUdumNKyMT/Qy3lnlaFogwSaaunY0LQRDVNFGv92IkByGe6db9Jzxg/XM8
         X6on8aHm07Vg8m4fyQ/vePaHtNTfgh1HC7eaZ8hAYSDbPyG4BzVJ+YsLR2PO5kYX1R3g
         6wUELBf52UrTYaLm3o3cDivll/mULq6bjt05OGrR9Wi2jxzJTQJLOrMsNIT7naEUY8Qs
         AJ6HG/ilLslHqwCJ34D/AUCEr9ZSQSRdq7BbNhpJDXI5QrVpwGe+zSkj5YF9tlpNQ8HD
         to5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=VsKXeyq/2GS92/Xx57CmizwltP2JbQChS2ubW8vafRE=;
        b=iiHsYvyCsLqSP6+dRehJ1fniNwxK1ex6YS2cws8v23/+1jbrD74WbHHXQ4ZW+9dz1n
         KG7UeZQWBXAM2KEoTZeAtiy9lM9xsPkzJdCV63kD8vqfjr0FmK1AcLFC3mfnucoC5RX+
         ygm4ewh86C1RgXNwoCZiwZInMUgnsnfopKXv9ZgdOPbr4wAv72TonOUcYAxEbCuhTWhi
         RpLDVrN8n5mTFeItDd7JW+6RUBF3fv5kADJlCgq7O66wC/8lfXoEnhDqlSpVwMGsZdCb
         eDaJvH42K9TC6u+fezdPi5zr60i/wJQmkNlLnMJ1qXQl9qvlR01ls3z7CPUtNmnXtKD9
         9plQ==
X-Gm-Message-State: AOAM533l60CtIN1N1LFmt8txuk3pHgSk+M82uTwkIm+4IX3WGIyBrjy+
        5/88QPq2gN0EHkUuNxi0T+VUVYbgXczwuMEYJlI=
X-Google-Smtp-Source: ABdhPJzmrDtmyJ2xUjb5q4740o70qR3iUmejK2jHnxGIOACEp97Z+W7CSh0v6k2AOtM+Q4eKwsRV/0t6o76Yzm2fzoY=
X-Received: by 2002:a81:49d5:0:b0:2dc:5709:4d91 with SMTP id
 w204-20020a8149d5000000b002dc57094d91mr14097911ywa.231.1646761087773; Tue, 08
 Mar 2022 09:38:07 -0800 (PST)
MIME-Version: 1.0
Reply-To: f.k.fleckenstein01@gmail.com
Sender: mr.farrukhiqbal70@gmail.com
Received: by 2002:a05:7010:a383:b0:236:49a0:b67e with HTTP; Tue, 8 Mar 2022
 09:38:07 -0800 (PST)
From:   "Mr. Ken Fleckenstein" <f.k.fleckenstein01@gmail.com>
Date:   Tue, 8 Mar 2022 09:38:07 -0800
X-Google-Sender-Auth: u8t_W37GgKqrG6KrDszFPsM3lxw
Message-ID: <CAEh+Vm_WmSAHn0OwftnW9s_61j-TeeP4DeQ8iG2FyGWr88-r_w@mail.gmail.com>
Subject: Attention.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORM_FRAUD_5,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,MONEY_ATM_CARD,MONEY_FORM_SHORT,
        MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,NA_DOLLARS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_FRAUD_PHISH,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello

Nations (UN), European Union (EU) and FBI.We have been able to track
down some scam artist in various parts of African countries which
includes (Nigeria, Ghana and Senegal with cote d'ivoire, Cotonou,
Republic of Benin ) and they are all in Government custody now, they
will appear at International Criminal Court (ICC) soon for
Justice.During the course of investigation, they were able to recover
some funds from these scam artists and IMF organization have ordered
the funds recovered to be shared among the 100 Lucky people listed
around the World as a compensation. This notice is been directed to
you because your email address was found in one of the scam Artists
file and computer hard-disk while the investigation, maybe you have
been scammed, You are therefore being compensated with sum of
$6.5million US Dollars valid into an (ATM Card Number 506119102227).

Even if you are now dealing with this nonofficial directors of the
bank or any department always requesting money from you, You should
STOP your communication with them and forward the details so that we
will help and recover your fund peacefully and legal. Since your email
address is among the lucky beneficiaries who will receive a
compensation funds, we have arranged your payment to be paid to you
through ATM VISA CARD and deliver to your postal address with the Pin
Numbers as to enable you withdrawal maximum of $4,000 on each
withdrawal from any Bank ATM Machine of your choice, until all the
funds are exhausted.


The package is coming from Ouagadougou Burkina Faso.don't forget to
reconfirm your following information.
1. Your Full Name:
2. Address Where You want us to Send Your ATM Card
3. Cell/Mobile Number
4. Copy of your passport


Yours in Services
Mr. Ken. Fleckenstein.
MINISTERE DES FINANCES
ET DE L'ECONOMIE(M.F.E)
BURKINA FASO.
