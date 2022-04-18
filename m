Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18868504C67
	for <lists+keyrings@lfdr.de>; Mon, 18 Apr 2022 07:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbiDRFw6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 Apr 2022 01:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiDRFwz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 Apr 2022 01:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 07A8755A3
        for <keyrings@vger.kernel.org>; Sun, 17 Apr 2022 22:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650261016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BQi37t5ImtJGz8dpkcjwi4DmC/UUnyTxDNTmEnfJgZE=;
        b=GoCzOFhTpm8SLXiWtq0TPR0F02B7xVkJ4jVON+DpgsfCUnSwa6GHtjz4Pl2IjQM6bA5Wlw
        PO2rwh9CInCh+6B0o5zsPWutpQZjN9Nmmm+5L+YXTQ/WbqQK3wGgPO0lBSEIHOde+AQXKU
        e4gF93qYMQ81wQ30me9sX99sLNvsC2U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-aBWx7wlJP6iTjeBg2sc42g-1; Mon, 18 Apr 2022 01:50:13 -0400
X-MC-Unique: aBWx7wlJP6iTjeBg2sc42g-1
Received: by mail-pj1-f72.google.com with SMTP id r15-20020a17090a4dcf00b001cb7ea0b0bdso8499770pjl.1
        for <keyrings@vger.kernel.org>; Sun, 17 Apr 2022 22:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BQi37t5ImtJGz8dpkcjwi4DmC/UUnyTxDNTmEnfJgZE=;
        b=uYNbubgAdgyq7CoKGeO0evEF8qbrICgX2iSc4slNxaOEL4OOlod3TGUgi1QDYlpQX9
         4dnQ3zXsvSBKfOgb5EgfMg9phZrT5O8Vojxf1j9luFOS+TKZXry3mM/oaIjuKyhQFy0k
         06vUNnOAAIRafEMKwWFVjhEznOFzTKp/fzAEnVsspQGkC/P2rspd8zkIy7OmT/GcjA1P
         Cyl9vW+YAJMCj1MaIfHsd/lTDrLU7COuQ6qvCPN6a1OwZ8vqwtCpAyYKJDVoqVDiZo8j
         p+K3rUQiksXtGuagsEe5mlm53vM6qaJaFlIxgGJ4WlIHcb5jJam/xi0CfPklQYAuIHx0
         5/bg==
X-Gm-Message-State: AOAM5321O/iafv2tIOL9YK0sIVAu7/v8/MKWznEqPxHpuDHsYUOsO7Bq
        WyQo0x4AujHbZIQlmhEGCvNSJApmXGmhEc3SznoXXHwoqWoDYv90OK2glpivo/Z1snhR4nUAsF0
        fV8EIKPKQKxEqyInSMV8=
X-Received: by 2002:a17:902:6b4b:b0:158:d86f:b232 with SMTP id g11-20020a1709026b4b00b00158d86fb232mr9562157plt.106.1650261012670;
        Sun, 17 Apr 2022 22:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoSw0iKfS7lUTSONvN9gfujuFvECmwh9pZuI5ewINby/kFfzo9o5ZOvaHPQ7r4DFG4n6wQNg==
X-Received: by 2002:a17:902:6b4b:b0:158:d86f:b232 with SMTP id g11-20020a1709026b4b00b00158d86fb232mr9562133plt.106.1650261012447;
        Sun, 17 Apr 2022 22:50:12 -0700 (PDT)
Received: from localhost ([240e:3a1:2e1:fc30:496c:36d3:5798:d144])
        by smtp.gmail.com with ESMTPSA id y16-20020a637d10000000b00381268f2c6fsm11661092pgc.4.2022.04.17.22.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 22:50:11 -0700 (PDT)
Date:   Mon, 18 Apr 2022 13:46:12 +0800
From:   Coiby Xu <coxu@redhat.com>
To:     Baoquan He <bhe@redhat.com>
Cc:     kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Dave Young <dyoung@redhat.com>, Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Mimi Zohar <zohar@linux.ibm.com>, Chun-Yi Lee <jlee@suse.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        stable@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: kexec_file: use more system keyrings to
 verify kernel image signature
Message-ID: <20220418054612.54knzv4gqoxbq57a@Rk>
References: <20220414014344.228523-1-coxu@redhat.com>
 <20220414014344.228523-4-coxu@redhat.com>
 <YlzJh8SE8pV1Et+O@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YlzJh8SE8pV1Et+O@MiWiFi-R3L-srv>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 18, 2022 at 10:14:31AM +0800, Baoquan He wrote:
>On 04/14/22 at 09:43am, Coiby Xu wrote:
>> Currently, a problem faced by arm64 is if a kernel image is signed by a
>> MOK key, loading it via the kexec_file_load() system call would be
>> rejected with the error "Lockdown: kexec: kexec of unsigned images is
>> restricted; see man kernel_lockdown.7".
>>
>> This happens because image_verify_sig uses only the primary keyring that
>> contains only kernel built-in keys to verify the kexec image.
>>
>> This patch allows to verify arm64 kernel image signature using not only
>> .builtin_trusted_keys but also .platform and .secondary_trusted_keys
>> keyring.
>>
>> Fixes: 732b7b93d849 ("arm64: kexec_file: add kernel signature verification support")
>
>Cc stable?

Thanks for the reminder! I've added "Cc stable@kernel.org". But it seems
I should Cc stable@vger.kernel.org instead.

>
>Otherwise, LGTM,
>
>Acked-by: Baoquan He <bhe@redhat.com>
>
>> Cc: kexec@lists.infradead.org
>> Cc: keyrings@vger.kernel.org
>> Cc: linux-security-module@vger.kernel.org
>> Cc: stable@kernel.org
>> Co-developed-by: Michal Suchanek <msuchanek@suse.de>
>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>> Acked-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Coiby Xu <coxu@redhat.com>
>> ---
>>  arch/arm64/kernel/kexec_image.c | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index 9ec34690e255..5ed6a585f21f 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -14,7 +14,6 @@
>>  #include <linux/kexec.h>
>>  #include <linux/pe.h>
>>  #include <linux/string.h>
>> -#include <linux/verification.h>
>>  #include <asm/byteorder.h>
>>  #include <asm/cpufeature.h>
>>  #include <asm/image.h>
>> @@ -130,18 +129,10 @@ static void *image_load(struct kimage *image,
>>  	return NULL;
>>  }
>>
>> -#ifdef CONFIG_KEXEC_IMAGE_VERIFY_SIG
>> -static int image_verify_sig(const char *kernel, unsigned long kernel_len)
>> -{
>> -	return verify_pefile_signature(kernel, kernel_len, NULL,
>> -				       VERIFYING_KEXEC_PE_SIGNATURE);
>> -}
>> -#endif
>> -
>>  const struct kexec_file_ops kexec_image_ops = {
>>  	.probe = image_probe,
>>  	.load = image_load,
>>  #ifdef CONFIG_KEXEC_IMAGE_VERIFY_SIG
>> -	.verify_sig = image_verify_sig,
>> +	.verify_sig = kexec_kernel_verify_pe_sig,
>>  #endif
>>  };
>> --
>> 2.34.1
>>
>>
>

-- 
Best regards,
Coiby

