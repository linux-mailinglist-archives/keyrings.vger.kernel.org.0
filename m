Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7035147889
	for <lists+keyrings@lfdr.de>; Fri, 24 Jan 2020 07:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgAXGZk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 24 Jan 2020 01:25:40 -0500
Received: from relay.sw.ru ([185.231.240.75]:51990 "EHLO relay.sw.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgAXGZk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 24 Jan 2020 01:25:40 -0500
Received: from vvs-ws.sw.ru ([172.16.24.21])
        by relay.sw.ru with esmtp (Exim 4.92.3)
        (envelope-from <vvs@virtuozzo.com>)
        id 1iusP1-0007tx-MM; Fri, 24 Jan 2020 09:25:11 +0300
From:   Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH 0/1] keys: seq_file .next functions should increase position
 index
To:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <fb5351fb-1557-43af-86c0-c6d7e56c70b9@virtuozzo.com>
Date:   Fri, 24 Jan 2020 09:25:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

In Aug 2018 NeilBrown noticed 
commit 1f4aace60b0e ("fs/seq_file.c: simplify seq_file iteration code and interface")
"Some ->next functions do not increment *pos when they return NULL...
Note that such ->next functions are buggy and should be fixed. 
A simple demonstration is
   
dd if=/proc/swaps bs=1000 skip=1
    
Choose any block size larger than the size of /proc/swaps.  This will
always show the whole last line of /proc/swaps"

Described problem is still actual. If you make lseek into middle of last output line 
following read will output end of last line and whole last line once again.

$ dd if=/proc/swaps bs=1  # usual output
Filename				Type		Size	Used	Priority
/dev/dm-0                               partition	4194812	97536	-2
104+0 records in
104+0 records out
104 bytes copied

$ dd if=/proc/swaps bs=40 skip=1    # last line was generated twice
dd: /proc/swaps: cannot skip to specified offset
v/dm-0                               partition	4194812	97536	-2
/dev/dm-0                               partition	4194812	97536	-2 
3+1 records in
3+1 records out
131 bytes copied

There are lot of other affected files, I've found 30+ including
/proc/net/ip_tables_matches and /proc/sysvipc/*

Following patch fixes the problem in keys-related file.

https://bugzilla.kernel.org/show_bug.cgi?id=206283

Vasily Averin (1):
  proc_keys_next should increase position index

 security/keys/proc.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.8.3.1

