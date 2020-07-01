Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C555210B51
	for <lists+keyrings@lfdr.de>; Wed,  1 Jul 2020 14:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbgGAMuf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 1 Jul 2020 08:50:35 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:61935 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730617AbgGAMuf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 1 Jul 2020 08:50:35 -0400
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 061CnWjI094518;
        Wed, 1 Jul 2020 21:49:32 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Wed, 01 Jul 2020 21:49:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 061CnV4n094515
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Wed, 1 Jul 2020 21:49:32 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: INFO: task hung in request_key_tag
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph Hellwig <hch@infradead.org>
Cc:     syzbot <syzbot+46c77dc7e98c732de754@syzkaller.appspotmail.com>,
        dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
References: <000000000000961dea05a95c9558@google.com>
 <728915db-592b-997f-6970-464cc59441d7@i-love.sakura.ne.jp>
 <20200701122030.GP4332@42.do-not-panic.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <e34e7b99-221f-661b-a299-6cdc35760545@i-love.sakura.ne.jp>
Date:   Wed, 1 Jul 2020 21:49:29 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701122030.GP4332@42.do-not-panic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2020/07/01 21:20, Luis Chamberlain wrote:
> On Wed, Jul 01, 2020 at 07:04:15PM +0900, Tetsuo Handa wrote:
>> I suspect commit 9e9b47d6bbe9df65 ("umh: fix processed error when UMH_WAIT_PROC is used").
>> Maybe the change in kernel/umh.c and/or security/keys/request_key.c made by that commit is
>> affecting call_usermodehelper_keys() == 0 case when complete_request_key() is called.
> 
> That patch has been dropped for now due to another reported issue
> bisected to it and even though we have not root caused that issue [0].
> 
> It would be good to have a reproducer for this reported issue as well,

Reproducer is not available yet.
But at least this patch is changing the behavior of

  call_usermodehelper_keys() == 0 && (test_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags) || key_validate(key) < 0)

case from key_negate_and_link() to key_revoke() in complete_request_key().
Since test_and_clear_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags) might be called from
key_reject_and_link() from key_negate_and_link(), this change might be the cause of
this hung task report.

