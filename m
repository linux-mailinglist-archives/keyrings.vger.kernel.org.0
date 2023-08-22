Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C436784E08
	for <lists+keyrings@lfdr.de>; Wed, 23 Aug 2023 03:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjHWBK2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Aug 2023 21:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbjHWBK1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Aug 2023 21:10:27 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:10:20 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C26CF9
        for <keyrings@vger.kernel.org>; Tue, 22 Aug 2023 18:10:20 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-72-64e54400aa65
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id A7.E6.10987.00445E46; Wed, 23 Aug 2023 04:25:52 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=ZamwtGZdRTRsW2+Eqp8N1j98zxxvt/8BRn5onNuIVZ/if4V0tK2/9wAsMcDEQUfok
          SdYBm/HrMGWoXkV0pWJBRQs+pOFwmsIqQ0lyFAxRIOBwhZIZUs/2iTfjm+bAL9Ie8
          6SmKWmrPFwjn+TELZErlmydHiy6LHrvHYuMyhk6Ag=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=dcQX7nEYho0g20rSwhz1DH6XdcaCWewY6TTYDUsedoUts7KZMPsYiaAUFHhLkpVvB
          liiA/3oxoyi2Numy5rR3B1jlbga38XGxCQvxXUXtOQ0bkcQwqeCTJy3zdCCcY7Fbb
          iUGhlvfVTY6GCp7MK5Up/pM6D1SqCWAwx2VoM5pUU=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:02:36 +0500
Message-ID: <A7.E6.10987.00445E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     keyrings@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:02:50 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW5fB5WmKwdTN5hZb7zSxOTB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhI3Lh6G8jm4hAS2MMk
        8fzxXlYQh0VgNbPE8uY2ZgjnIbPEytZrjBBlzYwScz78ZgXp5xWwljh6ah0biM0soCdxY+oU
        Noi4oMTJmU9YIOLaEssWvgaaxAFkq0l87SoBCQsLiEl8mraMHcQWEZCR2Pl7K9hJbAL6Eiu+
        NjOC2CwCqhL3V/aCxYUEpCQ2XlnPNoGRfxaSbbOQbJuFZNsshG0LGFlWMUoUV+YmAoMt2UQv
        OT+3OLGkWC8vtUSvIHsTIzAQT9doyu1gXHop8RCjAAejEg/vz3VPUoRYE8uAug4xSnAwK4nw
        Sn9/mCLEm5JYWZValB9fVJqTWnyIUZqDRUmc11boWbKQQHpiSWp2ampBahFMlomDU6qB8VFP
        gtmvn/V+WQcO5LrOV+KcbZc9oU1tgrHiaS2Gs5N9Xs33XiScub919x+Wd58yTn8886//7Irj
        c67OCHR6ePRVaso5cc+ESYpfX11JiTHr6NQuuzTzGrfrrmWuOVPf3pftmDqbj+v8rIsPxWa/
        v7bKINCz7oXnec+HWswhv4NZmHT37+SaekyJpTgj0VCLuag4EQAkTwd2QAIAAA==
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

