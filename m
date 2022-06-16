Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B772A54D759
	for <lists+keyrings@lfdr.de>; Thu, 16 Jun 2022 03:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350246AbiFPBu0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 15 Jun 2022 21:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350268AbiFPBuX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 15 Jun 2022 21:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 386CD580D4
        for <keyrings@vger.kernel.org>; Wed, 15 Jun 2022 18:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655344222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fVV/WU4SmfLzF3DDklDbzisp7F5k+JmdrLDWS6yeIfg=;
        b=Uy0VDXVEcVSBA/zkshdj+FXGfdTZ00lbjYXYjKw2p2ydQbFWLW/QfWx4FswLcMUyaroStJ
        cEgA8/5IKf9+vSQvEH61z2yfHfeMySiKRE+wG+EE22323HvkAVMf9oTVQPwn4ZrqpFBgYl
        F1by0PCqMaxSRa+JykOtnPjro2fbWbk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-5ebqsw02Nbms547RsRgs_Q-1; Wed, 15 Jun 2022 21:50:19 -0400
X-MC-Unique: 5ebqsw02Nbms547RsRgs_Q-1
Received: by mail-pg1-f200.google.com with SMTP id n6-20020a654886000000b003fda8768883so7326490pgs.14
        for <keyrings@vger.kernel.org>; Wed, 15 Jun 2022 18:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fVV/WU4SmfLzF3DDklDbzisp7F5k+JmdrLDWS6yeIfg=;
        b=SvM14BYTOwKpzgLKRWBjBJPooLqywPQr96Loy/QIEIeug7xPXkhyGlIeL47XlI/TNR
         dErO5XhMNO6AYo1G6oK+3or7H5gfNSVnJuB11ium8lEzeWfmZ85rapnijb65AFK3EMwi
         PbXOJ6aErY+bjHcLUgFiDQFhCtE2KXmG/IjU46nOHopLiEpzUCSoAOSfcL6DSrAnT4mb
         GqdzMLw0aN4h7sXDBf1Fld8FWouTMPXDuCeNgQcUUp5HcJoscYSzJSyfl5FDCctWZ4hc
         n8Jtjk9YDyExV83KsYi/81D3XeS4BgHOOb8YT3/IzE5gEa241qBfy6tBF3wWfRCLq5ND
         SNkA==
X-Gm-Message-State: AJIora9BnXjlz19srXotqMVperq14Dy/K/Jf+F9H95RRxjSKthAkcunX
        no0Eechw7AKv7Ds2L5w7NSUsvHKf2lPgVgne8p/oqfsBATKLkUMihvMcsVUbBI6J43GJVA5GhL6
        uKOig+7pdzZ1CkhPm4N8=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id d10-20020a656b8a000000b003db7dc5fec2mr2271729pgw.223.1655344218185;
        Wed, 15 Jun 2022 18:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tat2EzR0T5nORvsBcX3iBlSsbkY9k1dYVtfU8jZxFaMpWCPS32EidaNFNhOavM/bEZa8rfiQ==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id d10-20020a656b8a000000b003db7dc5fec2mr2271708pgw.223.1655344217907;
        Wed, 15 Jun 2022 18:50:17 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id z11-20020a63b90b000000b00408b89e4282sm280945pge.47.2022.06.15.18.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 18:50:17 -0700 (PDT)
Date:   Thu, 16 Jun 2022 09:47:48 +0800
From:   Coiby Xu <coxu@redhat.com>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Chun-Yi Lee <jlee@suse.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/4] kexec, KEYS: make the code in
 bzImage64_verify_sig generic
Message-ID: <20220616014748.ys3abgfakedckvag@Rk>
References: <20220512070123.29486-1-coxu@redhat.com>
 <20220512070123.29486-3-coxu@redhat.com>
 <5db507747b2be22499e7357ce65f1800b36e1de4.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5db507747b2be22499e7357ce65f1800b36e1de4.camel@linux.ibm.com>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Mimi,

On Thu, Jun 09, 2022 at 06:18:44PM -0400, Mimi Zohar wrote:
>Hi Coiby,
>
>On Thu, 2022-05-12 at 15:01 +0800, Coiby Xu wrote:
>> commit 278311e417be ("kexec, KEYS: Make use of platform keyring for
>> signature verify") adds platform keyring support on x86 kexec but not
>> arm64.
>>
>> The code in bzImage64_verify_sig makes use of system keyrings including
>> .buitin_trusted_keys, .secondary_trusted_keys and .platform keyring to
>> verify signed kernel image as PE file. Make it generic so both x86_64
>> and arm64 can use it.
>
>^uses the keys on the .builtin_trusted_keys, .machine, if configured
>and enabled, .secondary_trusted_keys, also if configured, and .platform
>keyrings to verify the signed kernel image as PE file.
>
>>
>> @@ -202,6 +203,12 @@ int arch_kexec_apply_relocations(struct purgatory_info *pi,
>>  				 const Elf_Shdr *relsec,
>>  				 const Elf_Shdr *symtab);
>>  int arch_kimage_file_post_load_cleanup(struct kimage *image);
>> +#ifdef CONFIG_KEXEC_SIG
>> +#ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
>> +int kexec_kernel_verify_pe_sig(const char *kernel,
>> +				    unsigned long kernel_len);
>
>Please join this line with the previous one.
>
>> +#endif
>> +#endif
>>  int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf);
>>
>>  extern int kexec_add_buffer(struct kexec_buf *kbuf);

I've applied the two suggestions, thanks!

>
>thanks,
>
>Mimi
>

-- 
Best regards,
Coiby

