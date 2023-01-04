Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3265D6AE
	for <lists+keyrings@lfdr.de>; Wed,  4 Jan 2023 15:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbjADO5V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Jan 2023 09:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbjADO5N (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Jan 2023 09:57:13 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DBE1AA20
        for <keyrings@vger.kernel.org>; Wed,  4 Jan 2023 06:57:06 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id c124so36728586ybb.13
        for <keyrings@vger.kernel.org>; Wed, 04 Jan 2023 06:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BvVQBtEBQC7mIDB+4xS4g0NbKqNw9moXJW7c2wPc4+I=;
        b=lQxDx8HjgeOhKHhikrA1TbyCsv+0vQQJ6s5dAfZ36EVOQrQmDAZM7H5McD/fCzHkhw
         mlCFyk12yZB58IvfRXIc/CROudXZUpJKI1dpb0H9X7QOqD91uurEzJQI4A3f+GK3/7me
         twaLtuwnjb6oG9Sk/cvzgDEepOAX1Z8O9X2u+mIyi8SqqbJr0PuPyoqQAnplCWVhN6y2
         8gkm9yFwy+UORWqEgdEp/xHq8ttX79zCZXLUWCahDnPj6aHT6yNpIAQ/jFN6f6JKQDaS
         srUMKjDJsbuUD3OqNG5kwLtfcdNafhX8ueM1WBf/F/kXGQlW0skYnvINdNuXz91m/1j4
         15Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvVQBtEBQC7mIDB+4xS4g0NbKqNw9moXJW7c2wPc4+I=;
        b=JZikkccecaPTK0CPKYf19+yY8rqykh5Wp6Pb+gRI9czQnCVGprn8GY1ttNCvuxMLgp
         vCo3QL1cnJA/QzTn94aS5XYWcja2oSAVJxkaXoELYkCy92x5cMn/YXTbz6XHdtMpvRmt
         dgibIvDlwezwObPK4GSWuhLEL2pbiDLUN7vjZkCuiUb0W4sCf4ZLZLaXzTmG4492li5B
         Qox8DNtIGTCu/Bd0XzB55fLvQuTQKeCojCrbOf2jpCKJnkpDuPSa7k4EvimUzAsHPtMp
         yA72VSmmi8ssOSITGCXrKLYEI2fZyc5kRplSbSpLzgJYh3zEO9JupC9mt5spjldFI0Z2
         t99A==
X-Gm-Message-State: AFqh2kqGknaBlFG9GoIW1/uh/3pXRMw3rjRosxp3PRJToQN64976ICYU
        NFn9fwlZqtUEwhtRH12UPOoZtAUtzA64Z4UzgfpLtKAXTdY=
X-Google-Smtp-Source: AMrXdXtC3KO9Ze1WC1mEMt+UcwrzuJh9kHsmar1k0CC6rSkTf2h76/0DX2CIIOuXrvxB/Qy4I8e0ILUiR5DUSSE7Ing=
X-Received: by 2002:a5b:102:0:b0:6f9:b6d8:5af with SMTP id 2-20020a5b0102000000b006f9b6d805afmr3060873ybx.268.1672844225173;
 Wed, 04 Jan 2023 06:57:05 -0800 (PST)
MIME-Version: 1.0
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Wed, 4 Jan 2023 20:26:54 +0530
Message-ID: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
Subject: dns_query from cifs returning EKEYEXPIRED during reconnect operations
To:     dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org
Cc:     Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi All,

I am Bharath and I contribute to the linux kernel CIFS file system
module. I noticed the issue below during dns_query operation from
cifs, please have a look at this and let me know your
comments/thoughts.

Cifs module uses dns_resolver module for dns resolution and
dns_resolver will use kernel keys infrastructure for key management.

In this scenario, cifs module calling dns_query during reconnect for
dns resolution. We noticed an issue with dns resolution when there are
multiple reconnect operations from cifs. In such scenario dns_query
function returns EKEYEXPIRED to cifs. This issue happens only when
CONFIG_KEYS_REQUEST_CACHE is enabled.

To reproduce the issue mount multiple SMB shares on device with
nosharesock mount option and try disconnecting connections few times
using "ss -K src dport 445".

Logs from dns_resolver:
Notice that 2nd time, we can see dns_query returning -127.

Disconnected first time and got right response for dns_query:

[Wed Jan  4 13:07:02 2023] [cifsd ] ==>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Wed Jan  4 13:07:02 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Wed Jan  4 13:07:02 2023] [key.dn] ==> dns_resolver_preparse('
20.150.20.136',14)
[Wed Jan  4 13:07:02 2023] [key.dn] no options
[Wed Jan  4 13:07:02 2023] [key.dn] store result
[Wed Jan  4 13:07:02 2023] [key.dn] <== dns_resolver_preparse() = 0
[Wed Jan  4 13:07:02 2023] [cifsd ] <== dns_query() = 13
[Wed Jan  4 13:07:02 2023] [cifsd ] ==>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Wed Jan  4 13:07:02 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Wed Jan  4 13:07:02 2023] [cifsd ] ==>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.file.core.windows.net)
[Wed Jan  4 13:07:02 2023] [cifsd ] <== dns_resolver_cmp() = 1
[Wed Jan  4 13:07:02 2023] [cifsd ] <== dns_query() = 13

Disconnected second time, but this time we can see one of the
dns_query request is failing with -127

[Wed Jan  4 13:07:10 2023] [cifsd ] ==>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Wed Jan  4 13:07:10 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Wed Jan  4 13:07:10 2023] [cifsd ] ==>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Wed Jan  4 13:07:10 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Wed Jan  4 13:07:10 2023] [cifsd ] ==>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.file.core.windows.net)
[Wed Jan  4 13:07:10 2023] [cifsd ] <== dns_resolver_cmp() = 1
[Wed Jan  4 13:07:10 2023] [cifsd ] <== dns_query() = -127
[Wed Jan  4 13:07:10 2023] [key.dn] ==> dns_resolver_preparse('
20.150.20.136',14)
[Wed Jan  4 13:07:10 2023] [key.dn] no options
[Wed Jan  4 13:07:10 2023] [key.dn] store result
[Wed Jan  4 13:07:10 2023] [key.dn] <== dns_resolver_preparse() = 0
[Wed Jan  4 13:07:10 2023] [cifsd ] <== dns_query() = 13


More details:

The dns_query call happens from cifs during reconnect and calls below
functions in given order:
dns_query->request_key_net->request_key_tag->request_key_and_link.

In 'request_key_and_link()' function, if key is not present in current
task_struct cache and if 'search_process_keyrings_rcu()' returns a key
then we are inserting the key into the task_struct cache using
cache_requested_key().
Next time, when the 'request_key_and_link()' is called from another
dns_query from cifs, it checks for cached keys using the
'check_cached_key' function. It returns the key if the current
task_struct has already has the cached key. (Note: It doesn't check if
the key is expired or not). And the same key will be returned to
dns_query function. At the end dns_query function it checks if key is
expired or not using key_validate() function, if it finds out that key
has expired then it returns EKEYEXPIRED to caller(cifs). This is how
we are hitting EKEYEXPIRED in our case.
Should we add a check for key expiry in 'check_cached_key()' function
so that it returns the key only if it's not expired.?

Code from check_cached_key which gets called from request_key_and_link
and doesnt check for key expiry:
static struct key *check_cached_key(struct keyring_search_context *ctx)
{
#ifdef CONFIG_KEYS_REQUEST_CACHE
    struct key *key = current->cached_requested_key;

    if (key &&
        ctx->match_data.cmp(key, &ctx->match_data) &&
        !(key->flags & ((1 << KEY_FLAG_INVALIDATED) |
                (1 << KEY_FLAG_REVOKED))))
        return key_get(key);
#endif
    return NULL;
}

Code from key_validate which gets called from dns_query and checks for
key expiry:
key_validate()
    if (expiry) {
        if (ktime_get_real_seconds() >= expiry)
            return -EKEYEXPIRED;
    }


As I understood from code, every key will be garbage collected after
300 Seconds, but cifs module dns_query will still be getting
EKEYEXPIRED even after 5 minutes. It looks like it's because,
'request_key_link()' function first checks if we have cached key at
process, if it find key in cache then we just return from there.
cached_requested_key seems to become a permanent entry for cifsd
process and dns resolution fails every time after that. I don't see
anyone invalidating the cached key in cifsd task. Please let me know,
who is responsible for clearing the cached_requested_key from a
task_struct if the thread never dies.?

Note: If there is only a tcp connection from cifs [or] disconnect one
connection at a time, I didn't see this issue. Looks like in these
cases we are not inserting the key into task_struct cache.

Please have a look at the issue and let us know your comments.
Let me know if you need additional details.


Thanks,
Bharath
