Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E372B02A1
	for <lists+keyrings@lfdr.de>; Thu, 12 Nov 2020 11:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgKLKUy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 12 Nov 2020 05:20:54 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:36660 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgKLKUy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 12 Nov 2020 05:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605176447;
        s=strato-dkim-0002; d=markus-regensburg.de;
        h=Date:Message-ID:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=lMd+40ZCnpal0YfLhuyaIaMGv3su1HrbJXXccto5G0k=;
        b=VSgAB+K0/C+pwJ2scQ5AzyYvARjWOqi0TBbhmyfAJiGhnGO6SrYVQm6CKet9loC63G
        VTQWP/qgfPM0wgjOTiQH7CbdbJvwygDopiCKRJ76KTyhglAEYigTSSTxCAAVI+T1VnMw
        SkYt9/WwBYRmT7OFesUYY3ia2R+Wnr8XuJSyOqRjCuLL3DbEBiGbvy6sL9d9t1blAUjC
        kKMlSwVv6WlW1nbzLImkP5aVgbH6FDaUfHBOtVNWD0cDfqfHjQcan6gkVfoawCD8EEGe
        FOgYKW/XaUXCBND7bEQu7qMrJeIrBeqgzQFSLfr+ydy9zyUbPHm7MTggiZ4UM0B4v/S5
        XEyQ==
X-RZG-AUTH: ":OGMGfEG7W/Jia0H4RdpQ6UBM+orSOYYzpexsp56HbOixc6mZ0UouEGtpBP1knqc5tUr6mh9s/aSFuPMBsF4CVLlvH23FWKSfXnUC8c1MY4+42pNRzjoG"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:810d:8240:2ce4:98ea:9dff:fed8:3fe0]
        by smtp.strato.de (RZmta 47.3.3 AUTH)
        with ESMTPSA id Y0a0c9wACAJwMfT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 12 Nov 2020 11:19:58 +0100 (CET)
From:   Tobias Markus <tobias@markus-regensburg.de>
To:     linux-crypto@vger.kernel.org
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org
Subject: Null pointer dereference in public key verification (related to SM2
 introduction)
Message-ID: <67250277-7903-2005-b94b-193bce0a3388@markus-regensburg.de>
Date:   Thu, 12 Nov 2020 11:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

running 5.10-rc3, I have come across a null pointer dereference.
It occured while trying to connect to a 802.1x/EAP-protected network using iwd.
However, the bug seems to be limited to iwd's usage of the keyctl API (unrelated to the wireless subsystem).

The bug seems related to the recent changes related to the SM2/SM3 algorithms, commits 215525639631a and 3093e7c16e12d.

I am including both the kernel logs as well as the system logs immediately before and after the null pointer dereference.
public_key_verify_signature+0x189 is crypto/asymmetric_keys/public_key.c:359, i.e.
  if (strcmp(sig->pkey_algo, "sm2") == 0 && sig->data_size) {
    [...]
Note that this block was introduced in commit 215525639631a.

kernel: wlan0: authenticate with <redacted>
kernel: wlan0: send auth to <redacted> (try 1/3)
kernel: wlan0: authenticated
kernel: wlan0: associate with <redacted> (try 1/3)
kernel: wlan0: RX AssocResp from <redacted> (capab=0x411 status=0 aid=24)
kernel: wlan0: associated
iwd[492]: EAP server tried method 52 while client was configured for method 25
kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
kernel: wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by <redacted>
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: PGD 0 P4D 0
kernel: Oops: 0000 [#1] PREEMPT SMP PTI
kernel: CPU: 1 PID: 492 Comm: iwd Tainted: G        W       T 5.10.0-rc3-custom #133
kernel: Hardware name: LENOVO 20HES01100/20HES01100, BIOS N1QET88W (1.63 ) 04/22/2020
kernel: RIP: 0010:public_key_verify_signature+0x189/0x3f0
kernel: Code: 48 8b 40 d0 44 89 c2 4c 89 fe 4c 89 e7 e8 4f 90 e7 00 85 c0 0f 85 67 01 00 00 48 8b 75 30 48 c7 c7 60 7d 85 9d >
kernel: RSP: 0018:ffff9fd6406ffd50 EFLAGS: 00010246
kernel: RAX: 0000000000000000 RBX: ffff8e1090272a40 RCX: 0000000000000004
kernel: RDX: ffff8e1082680400 RSI: 0000000000000000 RDI: ffffffff9d857d60
kernel: RBP: ffff9fd6406ffe88 R08: ffff8e10900ac820 R09: 0000000000000008
kernel: R10: 0000000000000000 R11: 000000000000010a R12: ffff8e1082681200
kernel: R13: ffff8e1082680900 R14: ffff9fd6406ffd88 R15: ffff8e10864df600
kernel: FS:  00007fbcb627e740(0000) GS:ffff8e13f2680000(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000000000000000 CR3: 0000000110304005 CR4: 00000000003706e0
kernel: Call Trace:
kernel:  asymmetric_key_verify_signature+0x5e/0x80
kernel:  keyctl_pkey_verify+0xb6/0x110
kernel:  do_syscall_64+0x33/0x40
kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kernel: RIP: 0033:0x7fbcb637bd5d
kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b >
kernel: RSP: 002b:00007ffd7e69d648 EFLAGS: 00000246 ORIG_RAX: 00000000000000fa
kernel: RAX: ffffffffffffffda RBX: 00007ffd7e69d6d0 RCX: 00007fbcb637bd5d
kernel: RDX: 000056210c5a3420 RSI: 00007ffd7e69d650 RDI: 000000000000001c
kernel: RBP: 000056210c5a3420 R08: 000056210c5a7a6d R09: 0000003024d797a1
kernel: R10: 00007ffd7e69d6d0 R11: 0000000000000246 R12: 000056210c5a7a6d
kernel: R13: 000056210c3b0b30 R14: 000056210c5a7a24 R15: 00007ffd7e69d6d0
kernel: Modules linked in: usblp
kernel: CR2: 0000000000000000
kernel: ---[ end trace ffdad8803dc4f4a6 ]---
kernel: RIP: 0010:public_key_verify_signature+0x189/0x3f0
kernel: Code: 48 8b 40 d0 44 89 c2 4c 89 fe 4c 89 e7 e8 4f 90 e7 00 85 c0 0f 85 67 01 00 00 48 8b 75 30 48 c7 c7 60 7d 85 9d >
kernel: RSP: 0018:ffff9fd6406ffd50 EFLAGS: 00010246
kernel: RAX: 0000000000000000 RBX: ffff8e1090272a40 RCX: 0000000000000004
kernel: RDX: ffff8e1082680400 RSI: 0000000000000000 RDI: ffffffff9d857d60
kernel: RBP: ffff9fd6406ffe88 R08: ffff8e10900ac820 R09: 0000000000000008
kernel: R10: 0000000000000000 R11: 000000000000010a R12: ffff8e1082681200
kernel: R13: ffff8e1082680900 R14: ffff9fd6406ffd88 R15: ffff8e10864df600
kernel: FS:  00007fbcb627e740(0000) GS:ffff8e13f2680000(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000000000000000 CR3: 0000000110304005 CR4: 00000000003706e0
systemd[1]: iwd.service: Main process exited, code=killed, status=9/KILL
systemd[1]: iwd.service: Failed with result 'signal'.


Please advise if you need any further information.

Kind regards,
Tobias
