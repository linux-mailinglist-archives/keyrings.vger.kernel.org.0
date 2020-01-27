Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C04114AA76
	for <lists+keyrings@lfdr.de>; Mon, 27 Jan 2020 20:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgA0T3L (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Jan 2020 14:29:11 -0500
Received: from relay.sw.ru ([185.231.240.75]:47718 "EHLO relay.sw.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgA0T3L (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 27 Jan 2020 14:29:11 -0500
Received: from vvs-ws.sw.ru ([172.16.24.21])
        by relay.sw.ru with esmtp (Exim 4.92.3)
        (envelope-from <vvs@virtuozzo.com>)
        id 1iwA31-00072K-M9; Mon, 27 Jan 2020 22:27:47 +0300
Subject: Re: [PATCH 1/1] proc_keys_next should increase position index
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
References: <af9dcaa7-6e4f-281a-2bae-fb605cc55d2d@virtuozzo.com>
 <1451508.1580125174@warthog.procyon.org.uk>
From:   Vasily Averin <vvs@virtuozzo.com>
Message-ID: <eaacb0b2-fd0d-480e-1868-0a1284c20185@virtuozzo.com>
Date:   Mon, 27 Jan 2020 22:27:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1451508.1580125174@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/27/20 2:39 PM, David Howells wrote:
> I don't see the effect you're talking about with /proc/keys.  I see the
> following:
> 
> 	[root@andromeda ~]# dd if=/proc/keys bs=40 skip=1
> 	dd: /proc/keys: cannot skip to specified offset
> 
> and then it follows up with the normal content with no obvious duplicates (the
> lines are numbered ascendingly in the first column).
> 
> I think I may be being confused by what you mean by "the last line".

on unpatched kernel

$ uname -a
Linux vvsx1 5.3.0-26-generic #28~18.04.1-Ubuntu SMP Wed Dec 18 16:40:14 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

$ dd if=/proc/keys bs=1  # VvS: full usual output
0f6bfdf5 I--Q---     2 perm 3f010000  1000  1000 user      4af2f79ab8848d0a: 740
1fb91b32 I--Q---     3 perm 1f3f0000  1000 65534 keyring   _uid.1000: 2
27589480 I--Q---     1 perm 0b0b0000     0     0 user      invocation_id: 16
2f33ab67 I--Q---   152 perm 3f030000     0     0 keyring   _ses: 2
33f1d8fa I--Q---     4 perm 3f030000  1000  1000 keyring   _ses: 1
3d427fda I--Q---     2 perm 3f010000  1000  1000 user      69ec44aec7678e5a: 740
3ead4096 I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.1000: 1
521+0 records in
521+0 records out
521 bytes copied, 0,00123769 s, 421 kB/s

$ dd if=/proc/keys bs=500 skip=1  # read after lseek in middle of last line
dd: /proc/keys: cannot skip to specified offset
g   _uid_ses.1000: 1        <<<< end of last line
3ead4096 I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.1000: 1   <<<< and whole last lien again
0+1 records in
0+1 records out
97 bytes copied, 0,000135035 s, 718 kB/s

$ dd if=/proc/keys bs=1000 skip=1   # read after lseek beyond end of file
dd: /proc/keys: cannot skip to specified offset
3ead4096 I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.1000: 1   <<<< generates last line
0+1 records in
0+1 records out
76 bytes copied, 0,000119981 s, 633 kB/s

On patched kernel:
[test@localhost ~]$ uname -a
Linux localhost.localdomain 5.5.0-rc6-00151-gd8d014f #8 SMP Fri Jan 24 13:25:06 MSK 2020 x86_64 x86_64 x86_64 GNU/Linux

[test@localhost ~]$ dd if=/proc/keys bs=1
06e8bec5 I--Q---     4 perm 1f3f0000  1000 65534 keyring   _uid.1000: empty
1b7ee8ed I--Q---    11 perm 3f030000  1000  1000 keyring   _ses: 1
2c1a365d I--Q---     1 perm 1f3f0000  1000 65534 keyring   _uid_ses.1000: 1
3f5823b4 I--Q---     6 perm 3f030000  1000  1000 keyring   _ses: 1
286+0 records in
286+0 records out
286 bytes copied, 0,000414581 s, 690 kB/s

[test@localhost ~]$ dd if=/proc/keys bs=270 skip=1  # VvS: read after lseek in middle of last line
dd: /proc/keys: cannot skip to specified offset
yring   _ses: 1   <<<< only end of last line was generated, as expected
0+1 records in
0+1 records out
16 bytes copied, 7,7199e-05 s, 207 kB/s

[test@localhost ~]$ dd if=/proc/keys bs=1000 skip=1   # VvS: read after lseek beond end of file
dd: /proc/keys: cannot skip to specified offset
0+0 records in   <<<< nothing was generated, as expected
0+0 records out
0 bytes copied, 8,8036e-05 s, 0,0 kB/s



