Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891CE79C282
	for <lists+keyrings@lfdr.de>; Tue, 12 Sep 2023 04:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbjILCPc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 11 Sep 2023 22:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235848AbjILCPF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 11 Sep 2023 22:15:05 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB6710BF69
        for <keyrings@vger.kernel.org>; Mon, 11 Sep 2023 16:27:23 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c3aa44c0faso3510025ad.1
        for <keyrings@vger.kernel.org>; Mon, 11 Sep 2023 16:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694474750; x=1695079550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iiUitO1C45IpsjxwGwdvQemaaRHBGSkxcQvlW7NOoGw=;
        b=izAhBemTJbrC/JJ/qwOcT46I25zQW4ATRjIiir6WCPCvvP66YO2T9Gx7GRFY+Vugie
         nLf2FdzUui5wLz1dNLudEp+JxTZCWeQWBffMMwyfLe82X031cPlaEcKawpDQu0PWGZ95
         6gBCdDSy4dbWD+57uekmIDQopNO+qVORc9r1I1XoieK3TEBJyNIt4zRUYSAsKN35q+hQ
         xRzXG7FvT30grsB55EAfM6evaqzNJRHds7Rnyh7tjcwqPmduqHZAhiSAq6HhLi2tIKW+
         U684//3iOF6otbImtxLJBjyMVgiJQ0vHCpbDkpv1kfgTj1/I7WQPzDg/xaNb44BJVZLc
         8fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694474750; x=1695079550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiUitO1C45IpsjxwGwdvQemaaRHBGSkxcQvlW7NOoGw=;
        b=Q9RqLnU+am29Qa4vlnRnsa55EfsqRzrOFTkn/nI/r0HdZDXMlUUEb68WW0aDm/Qv21
         JCwMQFiNRV6Tazgi47goaVseXcmRaj/PMX+8fU9V1T4kZG457/GUDOtZTohP4OkGv+Rq
         v9vh++dsf3qB/92lZdcBHRVz4qvzp52Jx+Nz+t1YGXFs/HC7S9Rzcn12YBYLIitwd6O0
         UN9ANHo4thiYouXBQVnwTg/HeYhme2uKTh5XWwFJUHRH6h97M0lJK9aXzg2yIPnpYFl1
         oeDQGlnlNB3qjaG8Zh7kJg5eAAleSAEcCEQ5v9K39MuRw5rOmySSmCMhSbd4BAUZM2uB
         Q6dw==
X-Gm-Message-State: AOJu0YxnGYeb4u7jIZMJvAaTDdePFrwYkMLBhb+MrFyZ4+BHCybK5mnJ
        if6UUxNxWRmkAbHeMOQHic2mnLG+cSUVPBObcWrEXA==
X-Google-Smtp-Source: AGHT+IEIG7J/4uQXyapv3ec696MJuuJpu5Z5SUZiYUFG6GJOQa+L0fXAy+FH7WO2a2Nx/sq9gGkHJA==
X-Received: by 2002:a17:90a:3ea5:b0:268:ca63:e412 with SMTP id k34-20020a17090a3ea500b00268ca63e412mr10497992pjc.4.1694470755891;
        Mon, 11 Sep 2023 15:19:15 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id rj14-20020a17090b3e8e00b00268032f6a64sm7850906pjb.25.2023.09.11.15.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 15:19:15 -0700 (PDT)
Message-ID: <1a8f8c46-a048-4bd7-90f1-e5378b81968b@kernel.dk>
Date:   Mon, 11 Sep 2023 16:19:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3 RESEND] generic and PowerPC SED Opal keystore
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org,
        jarkko@kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, akpm@linux-foundation.org,
        keyrings@vger.kernel.org
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 9/8/23 9:30 AM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This patchset extends the capabilites incorporated into for-6.6/block
> (https://git.kernel.dk/cgit/linux/commit/?h=for-6.6/block&id=3bfeb61256643281ac4be5b8a57e9d9da3db4335) by allowing the SED Opal key to be seeded into
> the keyring from a secure permanent keystore.
> 
> It has gone through numerous rounds of review and all comments/suggetions
> have been addressed. The reviews have covered all relevant areas including
> reviews by block and keyring developers as well as the SED Opal
> maintainer. The last patchset submission has not solicited any responses
> in the six weeks since it was last distributed. The changes are
> generally useful and ready for inclusion.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> Generic functions have been defined for accessing SED Opal keys.
> The generic functions are defined as weak so that they may be superseded
> by keystore specific versions.
> 
> PowerPC/pseries versions of these functions provide read/write access
> to SED Opal keys in the PLPKS keystore.
> 
> The SED block driver has been modified to read the SED Opal
> keystore to populate a key in the SED Opal keyring. Changes to the
> SED Opal key will be written to the SED Opal keystore.

Applied for 6.7, thanks.

-- 
Jens Axboe


