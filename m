Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAB252C6C2
	for <lists+keyrings@lfdr.de>; Thu, 19 May 2022 00:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbiERWzF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 May 2022 18:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbiERWy6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 May 2022 18:54:58 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A0522688F
        for <keyrings@vger.kernel.org>; Wed, 18 May 2022 15:54:50 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2ec42eae76bso39846807b3.10
        for <keyrings@vger.kernel.org>; Wed, 18 May 2022 15:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=gv8b9mH5j8dKK9HDbtelBY7k1skyG2RqGXKJEezc6kQXAEVwPAQXbYH5g+ryAiB4NB
         EMDQcpkY8efTgnm2hFhVPB0dfQ/McjcdO5WwbUAeEcRIHVUw3xY55wtu4XnAWA5vdxxE
         qY2+X2pXekqIVJsRdTHOq3bdw3UfmWSIYAgiA4PdzmePMBbeywP0+lmvYl4Zkmk5u8Wf
         3lBhugtnPRhWU4I5E/vWygG4js4RvQf/ts9YlD1Mt999ZSTiU0LcF9sYVgYtL3cwSGFz
         70+vuZQHQhywd3FuAx6a9kFb5zbKygwwcf9jbA7Tjjblhepyg+f05IZ/GoJ1uZDNSvQA
         ndrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=KMKFO7eOLhB2Q8qU60s/1RlC8+rp94QjeL8p3ru1LwfqjnRCwGMmnbQRpyXUVIapXn
         Ao2WPHLv807E7se5orWg598WPdwf0m1kJnqrgZg1sP5teYUqQ+GlI1lTDubavjCnx0vY
         0Xfo8kkLhRfVzA9hMOJLeLUq5BAtEgM9PX16FmDk/wFJbbme6V/S9JnpGu2hQoM4RQgN
         QDYJ+LM/G0SNgPuC3VWOamiFrUIw2s+EPTDaikUh7tb4H3cYZ4YgKgB95GJklHQKbG1N
         hXgglM26KxBE0r0RzaG1mTTbdQrNPR7kAnxJmPcSVt/q7XXSNJkoNJiFwmsvuFDmZbn1
         es1w==
X-Gm-Message-State: AOAM533nVqyaf7K5bLSNqyJ6wnqe/wUaXD0cJwKV/9W1yESnEahq6zOC
        yZtsK5nLqu5bnS6q8i1KP5FRX3nFbsZJdcf33c8=
X-Google-Smtp-Source: ABdhPJx2h27wZ7DI0A3nXkn3Hy3iffKFfjiIK9krKc7BllfMA8KOR2f66Z21MfMVEPeUZj7OjK/1gOQCfkN4j44fB84=
X-Received: by 2002:a81:50c:0:b0:2ef:4c3d:af5a with SMTP id
 12-20020a81050c000000b002ef4c3daf5amr1826257ywf.85.1652914489932; Wed, 18 May
 2022 15:54:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 15:54:49
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 06:54:49 +0800
Message-ID: <CAE2_YrAKMqFAag14fkg4Z_LnxJ42T3c030-9vO9MSHGDt3etCg@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4935]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Can I engage your services?
