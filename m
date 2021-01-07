Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26C12ECBE7
	for <lists+keyrings@lfdr.de>; Thu,  7 Jan 2021 09:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbhAGIvn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 7 Jan 2021 03:51:43 -0500
Received: from apollo.dupie.be ([51.159.20.238]:56502 "EHLO apollo.dupie.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbhAGIvm (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 7 Jan 2021 03:51:42 -0500
X-Greylist: delayed 624 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Jan 2021 03:51:40 EST
Received: from [IPv6:2a02:a03f:fa89:ff01:be0d:d770:d9ac:6ca4] (unknown [IPv6:2a02:a03f:fa89:ff01:be0d:d770:d9ac:6ca4])
        by apollo.dupie.be (Postfix) with ESMTPSA id 7421F1520D68;
        Thu,  7 Jan 2021 09:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
        t=1610008834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lu6BOeuJ9/qM0ieMRJzkmvPrLPggeF4lKZfLUY64B20=;
        b=Mf5lgbWK6wbumo/G+bvHFv0q1h8Zx6bT+0EkzgRNocrMXy4gwLSwHHmGAZIBxTyQH105tE
        uOLvQkfntqRUzX5E+Zcm8CRj1TFeUprY1C4DfGujdjtnod3fnTiE8Ex5LGYUCirTPwvIUC
        9EdFZSUaaU/M8HZ8nSmL1ixyZGC2zwCNCUu9KQ/kRe2Ud0qkRpE+c+u6xttpTZQeLTbR2x
        PI+mvcKFp/zo+2WJumuxxOwStZNFMk88FhP8O5dB0JQfhVZKAE35SmIPeeupbrMD7fM1qi
        2Y6sYsM4JgoRJBiyC4GyYitduSxssToR7nxHhQY1ciyf2fpSaJJmyMJA/4rM/w==
Subject: Re: Null pointer dereference in public key verification (related to
 SM2 introduction)
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tee Hao Wei <angelsl@in04.sg>, linux-crypto@vger.kernel.org
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        Tobias Markus <tobias@markus-regensburg.de>,
        David Howells <dhowells@redhat.com>
References: <67250277-7903-2005-b94b-193bce0a3388@markus-regensburg.de>
 <3092220.1606727387@warthog.procyon.org.uk>
 <96474593-2882-60a1-0dcf-5b3dc7526bfa@markus-regensburg.de>
 <36413597-f802-5816-abff-0f30e86242fb@in04.sg>
 <9f23662e-66b4-b12e-6476-55b0ea6e7c24@linux.alibaba.com>
From:   Jean-Louis Dupond <jean-louis@dupond.be>
Message-ID: <a6943c95-b7e7-9d85-6696-3456cf13c3ab@dupond.be>
Date:   Thu, 7 Jan 2021 09:40:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9f23662e-66b4-b12e-6476-55b0ea6e7c24@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: nl-BE
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

I've hit this bug also when trying to connect to my office Wifi via IWD.

The pkey_algo is indeed NULL/uninitialized:
As we create the sig here: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/crypto/asymmetric_keys/asymmetric_type.c?h=v5.10.5&id=215525639631ade1d67e879fe2c3d7195daa9f59#n565
But as no value is assigned to pkey_algo, we do a strcmp on something 
undefined.

Please submit a fix as soon as possible :) as connecting to office wifi 
is now broken.

Thanks
Jean-Louis

On 7/01/2021 08:58, Tianjia Zhang wrote:
> Hi,
>
> Sorry, I just read this email. I will submit the fix patch as soon as 
> possible. Thanks for reporting.
>
> Best regards,
> Tianjia
>
>
> On 1/7/21 3:27 PM, Tee Hao Wei wrote:
>> On 2/12/20 8:24 pm, Tobias Markus wrote:
>>> Hi David,
>>>
>>> I'm afraid I can't provide an exactly matching disassembly of the 
>>> function since I've since updated to newer -rc kernels.
>>> Another debugging hurdle is that the specific kernel code path seems 
>>> to be triggered by a very specific iwd code path that iwd only uses 
>>> for 802.1X/EAP-secured networks, and I simply wasn't near any 
>>> EAP-secured networks in the last few weeks.
>>> I've tried creating a reproducer using a bash script calling various 
>>> keyctl commands but to no success>
>>> David Howells wrote:
>>>> Tobias Markus <tobias@markus-regensburg.de> wrote:
>>>>
>>>>> kernel: RIP: 0010:public_key_verify_signature+0x189/0x3f0
>>>>
>>>> Is it possible for you to provide a disassembly of this function 
>>>> from the
>>>> kernel you were using?  For this to occur on that line, it appears 
>>>> that sig
>>>> would need to be NULL - but that should trip an assertion at the 
>>>> top of the
>>>> function - or a very small number (which could be RCX, R09 or R11).
>>>>
>>>> Thanks,
>>>> David
>>>>
>>
>> This problem is still in 5.10.4 (with iwd 1.10):
>>
>> ---
>> kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
>> kernel: #PF: supervisor read access in kernel mode
>> kernel: #PF: error_code(0x0000) - not-present page
>> kernel: PGD 0 P4D 0
>> kernel: Oops: 0000 [#6] PREEMPT SMP PTI
>> kernel: CPU: 7 PID: 6089 Comm: iwd Tainted: G S   UD W  OE 
>> 5.10.4-arch2-1 #1
>> kernel: Hardware name: LENOVO 20L7CTO1WW/20L7CTO1WW, BIOS N22ET60P 
>> (1.37 ) 11/25/2019
>> kernel: RIP: 0010:public_key_verify_signature+0x189/0x400
>> kernel: Code: 48 8b 40 d0 44 89 ca 4c 89 fe 4c 89 e7 e8 ef 33 9b 00 
>> 85 c0 0f 85 80 01 00 00 48 8b 75 30 48 c7 c7 f8 84 99 ba b9 04 00 00 
>> 00 <f3> a6 0f 97 c0 1c 00 84 c0 75 0b 8b 45 50 85 c0 0f 85 e0 01 00 00
>> kernel: RSP: 0018:ffffaf6d811b3d50 EFLAGS: 00010246
>> kernel: RAX: 0000000000000000 RBX: ffff99d6a24ba540 RCX: 
>> 0000000000000004
>> kernel: RDX: ffff99d6a2436c00 RSI: 0000000000000000 RDI: 
>> ffffffffba9984f8
>> kernel: RBP: ffffaf6d811b3e88 R08: ffff99d681b58cc0 R09: 
>> 0000000000000008
>> kernel: R10: 0000000000000000 R11: 000000000000000a R12: 
>> ffff99d6a24bab40
>> kernel: R13: ffff99d6a2437200 R14: ffffaf6d811b3d88 R15: 
>> ffff99d5ce134800
>> kernel: FS:  00007f14d1578740(0000) GS:ffff99dac75c0000(0000) 
>> knlGS:0000000000000000
>> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> kernel: CR2: 0000000000000000 CR3: 00000001e26aa005 CR4: 
>> 00000000003706e0
>> kernel: Call Trace:
>> kernel:  asymmetric_key_verify_signature+0x5e/0x80
>> kernel:  keyctl_pkey_verify+0xc0/0x120
>> kernel:  do_syscall_64+0x33/0x40
>> kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> kernel: RIP: 0033:0x7f14d1675d5d
>> kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 
>> 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
>> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 70 0c 00 f7 d8 64 89 01 48
>> kernel: RSP: 002b:00007ffce76da728 EFLAGS: 00000246 ORIG_RAX: 
>> 00000000000000fa
>> kernel: RAX: ffffffffffffffda RBX: 00007ffce76da7b0 RCX: 
>> 00007f14d1675d5d
>> kernel: RDX: 0000565457d08ac0 RSI: 00007ffce76da730 RDI: 
>> 000000000000001c
>> kernel: RBP: 0000565457d08ac0 R08: 0000565457d0b2dd R09: 
>> 000000303ec2c07a
>> kernel: R10: 00007ffce76da7b0 R11: 0000000000000246 R12: 
>> 0000565457d0b2dd
>> kernel: R13: 00007f14d177d9c0 R14: 0000565457d0b294 R15: 
>> 00007ffce76da7b0
>> kernel: Modules linked in: bnep uvcvideo videobuf2_vmalloc 
>> videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc ccm 
>> algif_aead des_generic libdes ecb algif_skcipher cmac md4 algif_hash 
>> af_alg btusb btrtl btbcm btintel bluetooth snd_soc_skl elan_i2c 
>> snd_hda_codec_hdmi snd_soc_sst_ipc snd_soc_sst_dsp ecdh_generic ecc 
>> iTCO_wdt snd_hda_ext_core iwlmvm intel_pmc_bxt 
>> snd_soc_acpi_intel_match mei_hdcp ee1004 iTCO_vendor_support 
>> snd_hda_codec_realtek snd_soc_acpi wmi_bmof intel_wmi_thunderbolt 
>> snd_hda_codec_generic intel_rapl_msr snd_hda_intel mac80211 
>> snd_intel_dspcfg soundwire_intel soundwire_generic_allocation 
>> soundwire_cadence snd_hda_codec x86_pkg_temp_thermal intel_powerclamp 
>> coretemp libarc4 snd_hda_core kvm_intel snd_hwdep nls_iso8859_1 
>> soundwire_bus vfat fat kvm snd_soc_core iwlwifi snd_compress 
>> irqbypass rapl ac97_bus intel_cstate snd_pcm_dmaengine intel_uncore 
>> joydev snd_pcm cfg80211 mousedev mei_me pcspkr e1000e i2c_i801 
>> snd_timer i2c_smbus mei processor_thermal_device
>> kernel:  intel_xhci_usb_role_switch intel_rapl_common 
>> intel_pch_thermal roles intel_soc_dts_iosf thinkpad_acpi wmi 
>> ledtrig_audio rfkill snd int3403_thermal soundcore 
>> int340x_thermal_zone int3400_thermal acpi_thermal_rel acpi_pad 
>> mac_hid pkcs8_key_parser crypto_user fuse acpi_call(OE) bpf_preload 
>> ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 uas 
>> usb_storage dm_crypt cbc encrypted_keys dm_mod trusted tpm rng_core 
>> crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel 
>> aesni_intel crypto_simd cryptd glue_helper serio_raw xhci_pci 
>> xhci_pci_renesas i915 video intel_gtt i2c_algo_bit drm_kms_helper 
>> syscopyarea sysfillrect sysimgblt fb_sys_fops cec drm agpgart
>> kernel: CR2: 0000000000000000
>> kernel: ---[ end trace fcbb482b549250b6 ]---
>> kernel: RIP: 0010:public_key_verify_signature+0x189/0x400
>> kernel: Code: 48 8b 40 d0 44 89 ca 4c 89 fe 4c 89 e7 e8 ef 33 9b 00 
>> 85 c0 0f 85 80 01 00 00 48 8b 75 30 48 c7 c7 f8 84 99 ba b9 04 00 00 
>> 00 <f3> a6 0f 97 c0 1c 00 84 c0 75 0b 8b 45 50 85 c0 0f 85 e0 01 00 00
>> kernel: RSP: 0018:ffffaf6d80ad7d50 EFLAGS: 00010246
>> kernel: RAX: 0000000000000000 RBX: ffff99d61f5611c0 RCX: 
>> 0000000000000004
>> kernel: RDX: ffff99d66714cb00 RSI: 0000000000000000 RDI: 
>> ffffffffba9984f8
>> kernel: RBP: ffffaf6d80ad7e88 R08: ffff99d5c60fe760 R09: 
>> 0000000000000008
>> kernel: R10: 0000000000000000 R11: 000000000000000a R12: 
>> ffff99d5e97afec0
>> kernel: R13: ffff99d66714d600 R14: ffffaf6d80ad7d88 R15: 
>> ffff99d5c6e90a00
>> kernel: FS:  00007f14d1578740(0000) GS:ffff99dac75c0000(0000) 
>> knlGS:0000000000000000
>> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> kernel: CR2: 0000000000000000 CR3: 00000001e26aa005 CR4: 
>> 00000000003706e0
>> systemd[1]: iwd.service: Main process exited, code=killed, status=9/KILL
>> systemd[1]: iwd.service: Failed with result 'signal'.
>> ---
>>
>> Here is the disassembly of public_key_verify_signature around the 
>> faulting instruction
>>
>> ---
>>     0xffffffffb9a4eaf9:    mov    0x30(%rbp),%rsi
>>     0xffffffffb9a4eafd:    mov    $0xffffffffba9984f8,%rdi
>>     0xffffffffb9a4eb04:    mov    $0x4,%ecx
>>     0xffffffffb9a4eb09:    repz cmpsb %es:(%rdi),%ds:(%rsi) # fault here
>>     0xffffffffb9a4eb0b:    seta   %al
>>     0xffffffffb9a4eb0e:    sbb    $0x0,%al
>>     0xffffffffb9a4eb10:    test   %al,%al
>>     0xffffffffb9a4eb12:    jne    0xffffffffb9a4eb1f
>>     0xffffffffb9a4eb14:    mov    0x50(%rbp),%eax
>>     0xffffffffb9a4eb17:    test   %eax,%eax
>>     0xffffffffb9a4eb19:    jne    0xffffffffb9a4ecff
>> ---
>>
>> corresponding to this: 
>> https://elixir.bootlin.com/linux/v5.10.4/source/crypto/asymmetric_keys/public_key.c#L359
>>
>> ---
>>     if (strcmp(sig->pkey_algo, "sm2") == 0 && sig->data_size) {
>>         ret = cert_sig_digest_update(sig, tfm);
>>         if (ret)
>>             goto error_free_key;
>>     }
>> ---
>>
>> So it seems like sig->pkey_algo is null. I will try to debug, but I 
>> don't get access to an EAP-protected network often (maybe once or 
>> twice a week), so it might take a while.
>>
