Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A776B78483B
	for <lists+keyrings@lfdr.de>; Tue, 22 Aug 2023 19:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238017AbjHVRKp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Aug 2023 13:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238014AbjHVRKm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Aug 2023 13:10:42 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCF2124
        for <keyrings@vger.kernel.org>; Tue, 22 Aug 2023 10:10:40 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-77dcff76e35so40577439f.1
        for <keyrings@vger.kernel.org>; Tue, 22 Aug 2023 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1692724240; x=1693329040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcSl7eIOF7x7GbMvE67YmruU3FXlviD1D6eE8yEnwjw=;
        b=lc9+wps82YDm5s/Dm7c0JdZ7ZBrVXBgf9MbrtGr0lNiY9OhGOp6nE3SB1K3JqHbzjt
         Zz4xyX9zZ60kc7fT9LuM8TKxX/FEQQUcSKkrPh4XRWcVoPq+nH536zXr/tcijZ0nkcui
         XUeJp2QAPi08zIrVE2xGnwuQRdJvKMdp87vkavGMhkMahZh/wFecRkUbPLguG8jBt3sa
         Hs9umPLrkEANbOKFlZsm0NARh5o278n8CYXY7lI0icXaUlV63wMgs+o4UaCG98bMxpjl
         ptWfuiFw3YyK4O8PUtqBdFGRq6lsJU0iCs3fKFP/Rig/1x9FPDsS3Jo2HGU720GEVVjA
         LvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692724240; x=1693329040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcSl7eIOF7x7GbMvE67YmruU3FXlviD1D6eE8yEnwjw=;
        b=FkcT3Bn9UOaawD0ap2io77OlRIS0nkxrajat7uYGkwk5RpgiHVtPSmMElmfhBjRs/H
         gb3l/uv7T8LG3NNIwv/q86xfd8zr88yPCAldc5GwP4rYS05IezpT7g7rXGdivBMFcsgC
         Lqiy9IAeO3uUI9BwJjC8A5Yr7315epk4cfoTwey/zLZutVq5FZjeZAiZPhfdwZ3NNxKQ
         mw9Uxr0LDfvYEQ1gn9WmVsQqYUeQSEewZe+VCRZaecjRyauVlZoBFQPrbKG1lBErrCkL
         D7/8lfiWMHo1qwlw+l0o3ewGcJxdC7OPXHOtRKYPlwArg5iwD9yN5B9320Lh0w8JAPgv
         10UA==
X-Gm-Message-State: AOJu0YyDjyNHfRtSJfLgwg4XPtDqYBUh+K4Jwnzg1zKgANfQZygQf1kB
        3NIfs6LIEqYZ8h/hjS3iGTkwdA+WfRAO1sqEuY0=
X-Google-Smtp-Source: AGHT+IEHbxaNNBJVjkW+ouhZWazYh5LGgU5X43YP5LQHZaIFzDLkUfgAH7lPfM/IT3rJdo0KA0zacQ==
X-Received: by 2002:a6b:4e17:0:b0:790:958e:a667 with SMTP id c23-20020a6b4e17000000b00790958ea667mr11702982iob.2.1692724240238;
        Tue, 22 Aug 2023 10:10:40 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a13-20020a029f8d000000b0040908cbbc5asm3276898jam.68.2023.08.22.10.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 10:10:39 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-block@vger.kernel.org, gjoyce@linux.vnet.ibm.com
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, akpm@linux-foundation.org,
        keyrings@vger.kernel.org, okozina@redhat.com, dkeefe@redhat.com
In-Reply-To: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
References: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/3 RESEND] sed-opal: keyrings, discovery, revert,
 key store
Message-Id: <169272423884.46393.6970317689418988820.b4-ty@kernel.dk>
Date:   Tue, 22 Aug 2023 11:10:38 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On Fri, 21 Jul 2023 16:15:31 -0500, gjoyce@linux.vnet.ibm.com wrote:
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. The reviews have
> covered all relevant areas including reviews by block and keyring
> developers as well as the SED Opal maintainer. The last
> patchset submission has not solicited any responses in the
> six weeks since it was last distributed. The changes are
> generally useful and ready for inclusion.
> 
> [...]

Applied, thanks!

[1/3] block: sed-opal: Implement IOC_OPAL_DISCOVERY
      commit: 9fb10726ecc5145550180aec4fd0adf0a7b1d634
[2/3] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
      commit: 5c82efc1aee8eb0919aa67a0d2559de5a326bd7c
[3/3] block: sed-opal: keyring support for SED keys
      commit: 3bfeb61256643281ac4be5b8a57e9d9da3db4335

Best regards,
-- 
Jens Axboe



