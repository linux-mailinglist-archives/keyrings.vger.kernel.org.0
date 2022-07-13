Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D0B573D1C
	for <lists+keyrings@lfdr.de>; Wed, 13 Jul 2022 21:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiGMT3L (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jul 2022 15:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiGMT3L (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jul 2022 15:29:11 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D52CE01
        for <keyrings@vger.kernel.org>; Wed, 13 Jul 2022 12:29:10 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 189so11714220vsh.2
        for <keyrings@vger.kernel.org>; Wed, 13 Jul 2022 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=OL3O/G/Nbo5X3/2odV+Cm73Whf7ZFg1+5Kj8Tw8EDYI=;
        b=n75Dupk3Rwzwgzire3llt98BG76ATuguS/Rw0sUOFD0GTesQSXTlEHsLT8VJU0cju7
         grJcveLgz9hjbBR8kehJ4kdfkGpyBekDPt4SQow3leEQw1Fwjw0gIXHf/rN7N8S81ZSK
         hA988LlIbqK62qMPJchqW9iw5GoNoakQ50wTToVkQl+IHLZuMgQ7E48yDJHGQCEQ7+cF
         TKS0qzOuUzOVhUTRT9+gsa9SZtpzXd/RXoUeHyD2rXh/dqr+Vz1VzHOMnM5CCX9VT5JR
         J7rmOrEM6fCAqM6vc0XSxOS+3LVCnOMuhuYzHrCp3+zuqbZ8dfrCynv2/BU0A9N9VFQn
         wVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=OL3O/G/Nbo5X3/2odV+Cm73Whf7ZFg1+5Kj8Tw8EDYI=;
        b=RRsyuGiieyzag8SIQYBhc03K1O8JQ/ibgLn7I9rb2oC469oT5QvM0hdsbxlOKLBEoV
         YAPxkmfSKcD57U7oLj9lJQ1/Vh5beJxCOoJgcM1nIzggFJ5gGyzDfoEw9lHiJKm5IQYo
         poAmiNnNtw0cHNJJy0qK0XoYfonQXCrivYyD7IhHXxXxfm0SgmeOUOlJ4iBUof0Z96Zr
         jhzz5TjR8xyRHKG82hczcgqJbJ+mgnVpLm/wlQ2NQku++KoyUK1JQCEpPNEH3XehDB8l
         svyvFkbbYoPaCVO9uUnXnjzYP7BmcC0plwJvCB67clcLXXS7ESg2kAkD9tMEZXVsuKqT
         I2LA==
X-Gm-Message-State: AJIora/96azerhsS9yHDkAfkiJ4oIgsCkj4zQVmuo2mDXWGR6hiZGTTR
        lABz/B8T39OvhWvJK0jqzFOiQDuTNcIj823U8G0=
X-Google-Smtp-Source: AGRyM1vlrANlOsNGe6PWc0qySUVBtQTpu6rlvZ0pjYiOLOYy74Rdco9dwG9Dg4xzohG9OjwzhRquM3kQXZuqdtOeEek=
X-Received: by 2002:a67:d081:0:b0:357:3498:6696 with SMTP id
 s1-20020a67d081000000b0035734986696mr2105984vsi.62.1657740549155; Wed, 13 Jul
 2022 12:29:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:19c2:0:0:0:0:0 with HTTP; Wed, 13 Jul 2022 12:29:08
 -0700 (PDT)
Reply-To: pstefanopessina80@gmail.com
From:   STEFANO PESSINA <syndrecorporation@gmail.com>
Date:   Wed, 13 Jul 2022 22:29:08 +0300
Message-ID: <CAHPUkw2YGxJ9Mb3_vojTuha-VunHErahJU1Zogn8Auyo8cGT=Q@mail.gmail.com>
Subject: donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [syndrecorporation[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [pstefanopessina80[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--=20
Congratulations!
The sum of =E2=82=AC1,500,000.00 has been donated to you by STEFANO PESSINA=
.
Kindly get back for more info via pstefanopessina80@gmail.com
