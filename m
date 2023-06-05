Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB42472320A
	for <lists+keyrings@lfdr.de>; Mon,  5 Jun 2023 23:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjFEVPA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Jun 2023 17:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjFEVOd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Jun 2023 17:14:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C0DF9
        for <keyrings@vger.kernel.org>; Mon,  5 Jun 2023 14:14:32 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64ff1f11054so850848b3a.1
        for <keyrings@vger.kernel.org>; Mon, 05 Jun 2023 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1685999671; x=1688591671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oqx+vgT1KOd/rG0v+EGrhyHZcbzQJ8RW6j/ejKPzyV0=;
        b=j8g3UuzxdgTGjVV1y3R5vC/zbawUoqd0GHOEGH735oclZN5uylfFW29k3ALNqymkKO
         zOI9IJNptXyqvXhuDUohGo6+XB+iqAPTdpS8xnzQbyN9ZzCJb2V48dzwfhNnt29AVlKP
         VLFoQVZ/RzXJ4vShqVQv27MswBglmWDfKZPdwKBYEJDj+Bem9CeQfIxfrgTssr6LpEO1
         NWES731IZKMXHlB1inaKp40+GtlmXq369msNQea0Zdy1Az6CPeljXQoJWOQ1BrI3+n99
         B7Jqj4uJoFy0784kDvEhQTE8TUuagtZ+Pp9TRXRtSLou5H05oXjMmV83/lNRGEwjJYGs
         gAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685999671; x=1688591671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oqx+vgT1KOd/rG0v+EGrhyHZcbzQJ8RW6j/ejKPzyV0=;
        b=DaeERYgb5ldNOXSvR92gy6LrRpp6fH6Z4thA6ubQ4DqIBn/+93wED7xcV7SmA1gCr8
         +k2HFS0iO+rpqQSx2tfLoM4saA885freohx54fqj1RVKr34wkG+m7kejisKoeTdJyTO0
         1OsHNI6K8wv99+gtwT9sgmnMiaZ+j29eKlQE3iD+wMYYoIW8uCvHsZOp0zIQWR6O5Kn/
         6u+rY81JhI0ebLz4SMi/cOT4u+WPy3su2ehqYDHTvpgXzFApD9empjJC8ZyHdllHRlWT
         3Zw6NIZQXxCqFJc/Ocu/IXd8W4/hT+NrcuFmg+f/sZZwzr+YzPz8dsK5fDdpKYbOiDUp
         ccJA==
X-Gm-Message-State: AC+VfDz00chZbVj7PBjGmbI/4P/BudJY3PjRhpeUFHzO3aScV6kFSYGX
        SX6G0+TKcuOJQNBeW5CQzqeJfw==
X-Google-Smtp-Source: ACHHUZ7F4+qQ0Ki8xUwZZjZ6tfxl9MU00ff9sZzRn2/+Pmuj5tNT2z/CfpIZyNw6H1APR47vxOd/1A==
X-Received: by 2002:a05:6a00:139a:b0:656:39af:5137 with SMTP id t26-20020a056a00139a00b0065639af5137mr6836048pfg.0.1685999671519;
        Mon, 05 Jun 2023 14:14:31 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c1::173f? ([2620:10d:c090:400::5:ffbc])
        by smtp.gmail.com with ESMTPSA id a6-20020aa78646000000b0064d4d11b8bfsm5604697pfo.59.2023.06.05.14.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:14:30 -0700 (PDT)
Message-ID: <e340332d-ef64-9fa9-b4d6-927a3c271730@kernel.dk>
Date:   Mon, 5 Jun 2023 15:14:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 RESEND 0/3] sed-opal: keyrings, discovery, revert, key
 store
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, akpm@linux-foundation.org,
        keyrings@vger.kernel.org
References: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 6/1/23 4:37 PM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. I believe that
> this patchset is ready for inclusion.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> The current SED Opal implementation in the block driver
> requires that authentication keys be provided in an ioctl
> so that they can be presented to the underlying SED
> capable drive. Currently, the key is typically entered by
> a user with an application like sedutil or sedcli. While
> this process works, it does not lend itself to automation
> like unlock by a udev rule.
> 
> The SED block driver has been extended so it can alternatively
> obtain a key from a sed-opal kernel keyring. The SED ioctls
> will indicate the source of the key, either directly in the
> ioctl data or from the keyring.
> 
> Two new SED ioctls have also been added. These are:
>   1) IOC_OPAL_REVERT_LSP to revert LSP state
>   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> 
> change log v4:
>         - rebase to 6.3-rc7
> 	- replaced "255" magic number with U8_MAX

None of this applies for for-6.5/block, and I'm a little puzzled
as to why you'd rebase to an old kernel rather than a 6.4-rc at
least?

Please resend one that is current.

-- 
Jens Axboe


