Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E815789DD
	for <lists+keyrings@lfdr.de>; Mon, 18 Jul 2022 20:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbiGRSzX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 Jul 2022 14:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGRSzW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 Jul 2022 14:55:22 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5CE2F03B
        for <keyrings@vger.kernel.org>; Mon, 18 Jul 2022 11:55:21 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-f2a4c51c45so26199606fac.9
        for <keyrings@vger.kernel.org>; Mon, 18 Jul 2022 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=IL64lE4LbLc5WMmEb2219Dk5UN9+kZ5RfONWGMCNDMYaTm94xYuckMTyTFIM0HYHyP
         4qhj339VQ9uez57VkZKlt2rvjRtxFNddUD3E679hCtf62yuRqoBn+ZmRLgBhVM1Yvr/+
         gUsyiTt14MBYr0s/N2HAOJBWQU1i6FqUKaFnhyu8ki0tA4hp0g+XTQG3BDCCM/f/ynya
         88kEddf+Y5lgg65gKpQy3BczirGB94KObyov09bQWMw8+O0wNrOGRMmqWiusvTxk66Ft
         JParw5gfqoJ6wjQn/Z9yCs0g9sROaGwLXYgcyEzBGqsSUZVI5iN3tJpiswP7JwrrGZep
         Q6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=61wtJ8O9eMuzPuAoOcBkHWJj7chkNgrwUi3/ToddPcgFqbdFcobh/NHsFu68qVoLKn
         Y/Wtp5L3dNFaEfn/JqjhS2mbL8owxRlKIFPzvaO8L/IKPsnPZxToxRFVqxfL14oFwl0E
         36+PoaEWsrZI/iCfM+H0fAPNufxwC3GpaH3qIvemIP6gAypAmMNL2fwzavgWUN5SsTEm
         7NFTWaNFyCz8vHILSL6qwdvj1VzcxI0PLz38wEPPY2AsLo2LZfYkeC1BlvnMOpOX3K59
         wY1c7SWiU/shrmZcb5+KQjwuqJQoaJ1aIe9ofpiqsGFlfZggEnq4c4G13ouL62uZI1h2
         SM5A==
X-Gm-Message-State: AJIora+Wck4q4ogO9KX9XJqwx0mbz5aWGvhutPHSDBmjkU7w3NaC94wT
        qt+RJ7GnXU+1wSOG/c+S814Pr1t9txPHNDplMcI=
X-Google-Smtp-Source: AGRyM1tSCQ3IP5ciy+/5qB6v/ciSGXhmjmCVTSzURwl4kA4zy27uXHAF2N8GDxkhWx5gthIx35w7cORKQpyOjDA9nCM=
X-Received: by 2002:a05:6870:b292:b0:10c:8b96:ed3d with SMTP id
 c18-20020a056870b29200b0010c8b96ed3dmr15982664oao.171.1658170520758; Mon, 18
 Jul 2022 11:55:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6850:b093:b0:314:5f48:8afc with HTTP; Mon, 18 Jul 2022
 11:55:20 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <gonwse11@gmail.com>
Date:   Mon, 18 Jul 2022 10:55:20 -0800
Message-ID: <CALtkzuuhF82=n4RPBUUepj4zsw0yxzV6hH3HYPKiO=LE4QYwJg@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gonwse11[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gonwse11[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
