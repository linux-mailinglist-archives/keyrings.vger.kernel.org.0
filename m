Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73702AFB3A
	for <lists+keyrings@lfdr.de>; Wed, 11 Nov 2020 23:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgKKWSP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 11 Nov 2020 17:18:15 -0500
Received: from mout02.posteo.de ([185.67.36.66]:45775 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgKKWSP (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 11 Nov 2020 17:18:15 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 1B6C32400FB
        for <keyrings@vger.kernel.org>; Wed, 11 Nov 2020 23:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1605133086; bh=Gsw1k2n3vc8f6m+MkIn6AWqm4cTs/iuraWOSWgB7f4A=;
        h=From:Subject:To:Cc:Autocrypt:Date:From;
        b=JOoAEx1aNo89g2/hfn2/t/NaDjc+nRWbbb4T/H4tjE0uW5rYsafgneZ/lO4QNQ1rF
         bBpSbR3cpFPbIW9BharblHQBHK05UC+H10vKYiUEH1qb+NJm0O3Il4mHi+BDsRW6ta
         AZ6vQ5/EWteMRQslUzvOtSnXqQwW8jXqvmdg1ewGpkJGsxajQWgBWv+95fRtby8nvv
         4Oi2TK9m5HyF4UcDn7DcRE+uwMtmikZOH4irikGKJ3J4BfOLZQadnYFOah+yzNu/Kf
         HknOkKj4TRgdHsNw9gzuHPqfEmvLapg1yIIoJIXASZTW3byQmHpfc0q+oo3qKHOgf1
         6aSo0B3erZ09g==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4CWfHx4Xkwz6tmD;
        Wed, 11 Nov 2020 23:18:05 +0100 (CET)
From:   Lennart Braun <lenerd@posteo.de>
Subject: PROBLEM: "BUG: kernel NULL pointer dereference" in
 "public_key_verify_signature"
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Autocrypt: addr=lenerd@posteo.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2fa6503d-60a0-7372-f536-83cf37290b11@posteo.de>
Date:   Wed, 11 Nov 2020 23:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello everyone,

I experience a recurring NULL pointer dereference error in Linux
5.10-rc3 when iwd tries to connect to some 802.1x wireless network
(eduroam) and wants to verify a signature.  The error seems to be
reproducible for me, but I am not sure how one would trigger the bug in
other environments.  With Linux 5.9.6 everything worked fine.

The Oops message (together with some related iwd context that might be
helpful) is pasted below.  I ran it through decode_stacktrace.sh to get
some line numbers.

From the position in the source code and the git history, it seems the
bug may be related to the recent patch series regarding OSCCA
certificate handling.

Please let me know if you need me to gather more information or if there
is anything else I can do to help.

Best regards

Lennart


---


Nov 11 17:55:16 euler kernel: wlan0: Limiting TX power to 17 dBm as advertised
by cc:46:d6:69:3b:8f
Nov 11 17:55:16 euler iwd[2039]: PEAP: tls_tx_handshake:868 Sending a
TLS_CLIENT_HELLO of 117 bytes
Nov 11 17:55:16 euler iwd[2039]: PEAP: l_tls_start:2802 New state
TLS_HANDSHAKE_WAIT_HELLO
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_handshake:2308 Handling a
TLS_SERVER_HELLO of 70 bytes
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_server_hello:1818 Negotiated
TLS 1.2
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_server_hello:1854 Negotiated
TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_server_hello:1865 Negotiated
CompressionMethod.null
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_server_hello:1868 New state
TLS_HANDSHAKE_WAIT_CERTIFICATE
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_handshake:2308 Handling a
TLS_CERTIFICATE of 4856 bytes
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_cert_domains_match_mask:718 Trying to
match DNSName: 'radius.hrz.tu-darmsta>
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_certificate:1995 New state
TLS_HANDSHAKE_WAIT_KEY_EXCHANGE
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_handshake:2308 Handling a
TLS_SERVER_KEY_EXCHANGE of 329 bytes
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_handshake:2397 New state
TLS_HANDSHAKE_WAIT_HELLO_DONE
Nov 11 17:55:17 euler iwd[2039]: PEAP: tls_handle_ecdhe_server_key_xchg:506
Negotiated secp256r1
Nov 11 17:55:17 euler kernel: BUG: kernel NULL pointer dereference, address:
0000000000000000
Nov 11 17:55:17 euler kernel: #PF: supervisor read access in kernel mode
Nov 11 17:55:17 euler kernel: #PF: error_code(0x0000) - not-present page
Nov 11 17:55:17 euler kernel: PGD 0 P4D 0
Nov 11 17:55:17 euler kernel: Oops: 0000 [#25] PREEMPT SMP NOPTI
Nov 11 17:55:17 euler kernel: CPU: 14 PID: 2039 Comm: iwd Tainted: G      D
     5.10.0-rc3-1-mainline #1
Nov 11 17:55:17 euler kernel: Hardware name: LENOVO 20UES00L00/20UES00L00, BIOS
R1BET36W(1.05 ) 06/11/2020
Nov 11 17:55:17 euler kernel: RIP: 0010:public_key_verify_signature
(crypto/asymmetric_keys/public_key.c:359)
Nov 11 17:55:17 euler kernel: Code: 48 8b 40 d0 44 89 ca 4c 89 fe 4c 89 e7 e8 ff
27 9b 00 85 c0 0f 85 68 01 00 00 48 8>

Code starting with the faulting instruction
===========================================
   0:	48 8b 40 d0          	mov    -0x30(%rax),%rax
   4:	44 89 ca             	mov    %r9d,%edx
   7:	4c 89 fe             	mov    %r15,%rsi
   a:	4c 89 e7             	mov    %r12,%rdi
   d:	e8 ff 27 9b 00       	callq  0x9b2811
  12:	85 c0                	test   %eax,%eax
  14:	0f 85 68 01 00 00    	jne    0x182
  1a:	48                   	rex.W
  1b:	08                   	.byte 0x8
Nov 11 17:55:17 euler kernel: RSP: 0018:ffff9ee2c16d7d50 EFLAGS: 00010246
Nov 11 17:55:17 euler kernel: RAX: 0000000000000000 RBX: ffff997ac93c91c0 RCX:
0000000000000004
Nov 11 17:55:17 euler kernel: RDX: ffff997adfef0000 RSI: 0000000000000000 RDI:
ffffffff9e79bf38
Nov 11 17:55:17 euler kernel: RBP: ffff9ee2c16d7e88 R08: ffff997b009aa760 R09:
0000000000000008
Nov 11 17:55:17 euler kernel: R10: 0000000000000000 R11: 000000000000000a R12:
ffff997ac93c9600
Nov 11 17:55:17 euler kernel: R13: ffff997adfef0600 R14: ffff9ee2c16d7d88 R15:
ffff997afe09c200
Nov 11 17:55:17 euler kernel: FS:  00007fbd1eca9740(0000)
GS:ffff997dbfb80000(0000) knlGS:0000000000000000
Nov 11 17:55:17 euler kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Nov 11 17:55:17 euler kernel: CR2: 0000000000000000 CR3: 000000011d7e0000 CR4:
0000000000350ee0
Nov 11 17:55:17 euler kernel: Call Trace:
Nov 11 17:55:17 euler kernel: asymmetric_key_verify_signature
(crypto/asymmetric_keys/asymmetric_type.c:575)
Nov 11 17:55:17 euler kernel: keyctl_pkey_verify (security/keys/keyctl_pkey.c:315)
Nov 11 17:55:17 euler kernel: do_syscall_64 (arch/x86/entry/common.c:46)
Nov 11 17:55:17 euler kernel: entry_SYSCALL_64_after_hwframe
(arch/x86/entry/entry_64.S:127)
Nov 11 17:55:17 euler kernel: RIP: 0033:0x7fbd1eda6d5d
Nov 11 17:55:17 euler kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f
1e fa 48 89 f8 48 89 f7 48 89 d6 48 8>

Code starting with the faulting instruction
===========================================
   0:	00 c3                	add    %al,%bl
   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   9:	00 00 00
   c:	90                   	nop
   d:	f3 0f 1e fa          	endbr64
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48                   	rex.W
  1b:	08                   	.byte 0x8
Nov 11 17:55:17 euler kernel: RSP: 002b:00007fff490b4f68 EFLAGS: 00000246
ORIG_RAX: 00000000000000fa
Nov 11 17:55:17 euler kernel: RAX: ffffffffffffffda RBX: 00007fff490b4ff0 RCX:
00007fbd1eda6d5d
Nov 11 17:55:17 euler kernel: RDX: 0000556100c732c0 RSI: 00007fff490b4f70 RDI:
000000000000001c
Nov 11 17:55:17 euler kernel: RBP: 0000556100c732c0 R08: 0000556100c7638d R09:
000000302e9f2766
Nov 11 17:55:17 euler kernel: R10: 00007fff490b4ff0 R11: 0000000000000246 R12:
0000556100c7638d
Nov 11 17:55:17 euler kernel: R13: 00005560ff388b30 R14: 0000556100c76344 R15:
00007fff490b4ff0
Nov 11 17:55:17 euler kernel: Modules linked in: xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_t>
Nov 11 17:55:17 euler kernel:  tpm_crb rapl psmouse input_leds typec_ucsi
tpm_tis k10temp i2c_piix4 rfkill snd libphy >
Nov 11 17:55:17 euler kernel: CR2: 0000000000000000
Nov 11 17:55:17 euler kernel: ---[ end trace b6f21d0c7ffe6cc2 ]---
Nov 11 17:55:17 euler kernel: RIP: 0010:public_key_verify_signature
(crypto/asymmetric_keys/public_key.c:359)
Nov 11 17:55:17 euler kernel: Code: 48 8b 40 d0 44 89 ca 4c 89 fe 4c 89 e7 e8 ff
27 9b 00 85 c0 0f 85 68 01 00 00 48 8>

Code starting with the faulting instruction
===========================================
   0:	48 8b 40 d0          	mov    -0x30(%rax),%rax
   4:	44 89 ca             	mov    %r9d,%edx
   7:	4c 89 fe             	mov    %r15,%rsi
   a:	4c 89 e7             	mov    %r12,%rdi
   d:	e8 ff 27 9b 00       	callq  0x9b2811
  12:	85 c0                	test   %eax,%eax
  14:	0f 85 68 01 00 00    	jne    0x182
  1a:	48                   	rex.W
  1b:	08                   	.byte 0x8
Nov 11 17:55:17 euler kernel: RSP: 0018:ffff9ee2c17a7d50 EFLAGS: 00010246
Nov 11 17:55:17 euler kernel: RAX: 0000000000000000 RBX: ffff997ac515f440 RCX:
0000000000000004
Nov 11 17:55:17 euler kernel: RDX: ffff997ac6496400 RSI: 0000000000000000 RDI:
ffffffff9e79bf38
Nov 11 17:55:17 euler kernel: RBP: ffff9ee2c17a7e88 R08: ffff997ac5a75220 R09:
0000000000000008
Nov 11 17:55:17 euler kernel: R10: 0000000000000000 R11: 000000000000000a R12:
ffff997ac515fac0
Nov 11 17:55:17 euler kernel: R13: ffff997ac6496b00 R14: ffff9ee2c17a7d88 R15:
ffff997ac578c800
Nov 11 17:55:17 euler kernel: FS:  00007fbd1eca9740(0000)
GS:ffff997dbfb80000(0000) knlGS:0000000000000000
Nov 11 17:55:17 euler kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Nov 11 17:55:17 euler kernel: CR2: 0000000000000000 CR3: 000000011d7e0000 CR4:
0000000000350ee0
Nov 11 17:55:17 euler kernel: audit: type=1131 audit(1605113717.462:211): pid=1
uid=0 auid=4294967295 ses=4294967295 m>
Nov 11 17:55:17 euler audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295
ses=4294967295 msg='unit=iwd comm="systemd" e>
Nov 11 17:55:17 euler systemd[1]: iwd.service: Main process exited, code=killed,
status=9/KILL
Nov 11 17:55:17 euler systemd[1]: iwd.service: Failed with result 'signal'.
Nov 11 17:55:17 euler kernel: wlan0: deauthenticating from cc:46:d6:69:3b:8f by
local choice (Reason: 3=DEAUTH_LEAVING)
Nov 11 17:55:17 euler systemd-networkd[501]: wlan0: Link DOWN


