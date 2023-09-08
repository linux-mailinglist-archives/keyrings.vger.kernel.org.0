Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57906798E59
	for <lists+keyrings@lfdr.de>; Fri,  8 Sep 2023 20:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjIHSkt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 8 Sep 2023 14:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbjIHSkt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 8 Sep 2023 14:40:49 -0400
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E65F1FE5
        for <keyrings@vger.kernel.org>; Fri,  8 Sep 2023 11:40:14 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a3d2ff211so452241b3a.0
        for <keyrings@vger.kernel.org>; Fri, 08 Sep 2023 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694198290; x=1694803090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNgNOfTdYwbjd4PNLanFnphvBlBTZnc77El/quqL3m8=;
        b=G2FuMS2AHt6RgUEAL7kI0x/Ze5/n/IodDpejYICJowGKlkG+Tksb5UMcrRysl9XK2W
         CuX0QN9fPfERVJVqXobkT0VGIEd5H1oH7EOrsLga3p0dsQhw12s5s6EjOLqx+0Mv+eCj
         7q97Fh7MR5CXf6ZpDJlxWbe3UKj7UDRvenNW98ItSB/3/PVEQM2Pst9jOu7gsord0lYZ
         yBMP65i5HkTAkkiogw0yR/YaqTX62Zy/XpVLeUoG9gUBsiYQeciXUw3zMmNbO4lP7sMV
         Ma76nZxyxHgcQLH/dnG6B1CAt/hKqJp47Glvtcb+jfBg8UxAAN98euN1H4C9icw6RhMC
         fRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694198290; x=1694803090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNgNOfTdYwbjd4PNLanFnphvBlBTZnc77El/quqL3m8=;
        b=OcMMnj/EfACs+42N3r3upTol5DXEPvidfxiV1IYqc+DGp5gXCxYfbC/YZyy3+iTk7P
         VoyhmT4gpv0RFdacVYNdwtpjA6dD6EgXoxpsvJg9LWhKMfp2k1rB4wPxvcS9mLwUz4rC
         fRJ/oFRKYMJAf8/WheL9OlRApHxOY2GkJyLlJiFZo243mqWqAFbK1PiNgB5wxeFbGWkg
         b5MvTe7CJItlNH2Z9Pz/fXTpQFTM99scmRoWmIqt1vC6S68uZL4iD4AfHiwwhrQLVVrs
         gmVsm2K0Vxirk0fY9RhsUCp7c1+ttvP/pouArrm6JMG2V01XbyRf3cRQcIR5GV53VMWq
         G2Yg==
X-Gm-Message-State: AOJu0Yz6SK8kUoOODgOAPNpfh9hPNASBQm66io+iswUYtdCi/j4ltmwU
        YV9JcOi1geeElRmoMA7iI4KVYBVTDURHhNd245VUGw==
X-Google-Smtp-Source: AGHT+IHTX9ZZx08YvuQBTs1uYS/lar+KHBch4uy/fbt1CHDwQT9BuSsbxjk6CIFexr8qdwmGJFQFzw==
X-Received: by 2002:a05:6a21:194:b0:13f:65ca:52a2 with SMTP id le20-20020a056a21019400b0013f65ca52a2mr3924171pzb.5.1694198290545;
        Fri, 08 Sep 2023 11:38:10 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b00687a4b66697sm1669127pff.16.2023.09.08.11.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 11:38:09 -0700 (PDT)
Message-ID: <e1910f8e-5bcd-4c1c-a751-e4a530282b6b@kernel.dk>
Date:   Fri, 8 Sep 2023 12:38:07 -0600
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
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

Best time to resend is generally once the merge window is closed again,
as I won't start applying patches for the next release before that
happens. I'll try to remember to pick this one up for 6.7.

-- 
Jens Axboe

