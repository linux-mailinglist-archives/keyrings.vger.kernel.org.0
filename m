Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E889165D735
	for <lists+keyrings@lfdr.de>; Wed,  4 Jan 2023 16:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbjADPWO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Jan 2023 10:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239693AbjADPV5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Jan 2023 10:21:57 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF824EB1
        for <keyrings@vger.kernel.org>; Wed,  4 Jan 2023 07:21:55 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j17so41375173lfr.3
        for <keyrings@vger.kernel.org>; Wed, 04 Jan 2023 07:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1yIshDAwY2l6P6LO1Ce2mlMv1iVbbSlAL0V/skV+yqg=;
        b=XD0hVcWJou3PxD/DEkZ6ESrAFD8f4CglePuCm5xvKhsLQw5Qm/XCAoUzIbXGnJMQJC
         1LoY2ryclBay514WIy9/DXVo0tiHFD1voqJ1eMd5+876kaRVD86/PyHGvuI+InZMUkBE
         WCw8eTmYlHgC5o9D3xUfbETWXIDcDDD6EP8SutnuVlstQv7qpb9YiAVK0U0okLwHRwW+
         UanD0rjCcZcwWNKSc+HCADMyAfXzBGFOiFBU4qAGg/oRKd1Y7JPLlT2DJbHgIS9QkPd8
         YgdZR1WE97I63rKR/B2JnUWX6lxZBCJVh82ScntpfW8S9lxoh5bFPbS056/oD8fs3Y6G
         lsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yIshDAwY2l6P6LO1Ce2mlMv1iVbbSlAL0V/skV+yqg=;
        b=zm8FveThelgruwFSmQRGUMYc9AXuOVDYixBhtrOeAX6jUOInFHbjrmhapVxDf6xyJj
         +4SlGCtoZSo5aY9u1N9/jz0FnxjIJBjGLdvyKxfy0PWxmjSbQSL/d429pzc2vVyRbZaS
         fB5a6Sl7st2CgpQc1rP1b45wYbcrQiVsSQAcyaKXjK1YPkfUHWVfVQQI3eu9ZpdqbelK
         FJT+Yl0vDRLrlJzimAzfJNF4v75ATj1vb6sLHP0QqajGcMy5ibNoWKNhtEjtISZHLf2t
         3XjuYYrsNsBAg1IfM4HHE6GJvCS6XAOpwP8uaeCGJZA+/Vwm7CMnFaT9OsoA4fX0h4Lz
         Mp7A==
X-Gm-Message-State: AFqh2koN/os3PfSTTfhQPvFSZ2i//dKkToEBFk6sy2BHnVvSaGv+gLmS
        Do/8OE5ZsUtbszOSdJTvGsqHHi9OPF+wPIt2x0M=
X-Google-Smtp-Source: AMrXdXs7+tqWvEsp72Vn+qmxXSO8xIY3TlReoGLDyiGv0r4ztCqm0Cgi4i9WvT/hdQzd6oYJywOB24hs9Wx49Je7ImU=
X-Received: by 2002:ac2:52a1:0:b0:4b5:a12f:4172 with SMTP id
 r1-20020ac252a1000000b004b5a12f4172mr3270160lfm.112.1672845713982; Wed, 04
 Jan 2023 07:21:53 -0800 (PST)
MIME-Version: 1.0
References: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
In-Reply-To: <CAGypqWx7=ntjEjMJk=qHj+DVKogmOwLWTCgY+3Y4xP-f+KPP6g@mail.gmail.com>
From:   Shyam Prasad N <nspmangalore@gmail.com>
Date:   Wed, 4 Jan 2023 20:51:42 +0530
Message-ID: <CANT5p=pwK7RLVC=26HwjwGNieySqmJQLfsJF8-ZwY=XXMYV5ag@mail.gmail.com>
Subject: Re: dns_query from cifs returning EKEYEXPIRED during reconnect operations
To:     Bharath SM <bharathsm.hsk@gmail.com>
Cc:     dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org,
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

On Wed, Jan 4, 2023 at 8:27 PM Bharath SM <bharathsm.hsk@gmail.com> wrote:
>
> Hi All,
>
> I am Bharath and I contribute to the linux kernel CIFS file system
> module. I noticed the issue below during dns_query operation from
> cifs, please have a look at this and let me know your
> comments/thoughts.
>
> Cifs module uses dns_resolver module for dns resolution and
> dns_resolver will use kernel keys infrastructure for key management.
>
> In this scenario, cifs module calling dns_query during reconnect for
> dns resolution. We noticed an issue with dns resolution when there are
> multiple reconnect operations from cifs. In such scenario dns_query
> function returns EKEYEXPIRED to cifs. This issue happens only when
> CONFIG_KEYS_REQUEST_CACHE is enabled.
>
> To reproduce the issue mount multiple SMB shares on device with
> nosharesock mount option and try disconnecting connections few times
> using "ss -K src dport 445".
>
> Logs from dns_resolver:
> Notice that 2nd time, we can see dns_query returning -127.
>
> Disconnected first time and got right response for dns_query:
>
> [Wed Jan  4 13:07:02 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Wed Jan  4 13:07:02 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Wed Jan  4 13:07:02 2023] [key.dn] ==> dns_resolver_preparse('
> 20.150.20.136',14)
> [Wed Jan  4 13:07:02 2023] [key.dn] no options
> [Wed Jan  4 13:07:02 2023] [key.dn] store result
> [Wed Jan  4 13:07:02 2023] [key.dn] <== dns_resolver_preparse() = 0
> [Wed Jan  4 13:07:02 2023] [cifsd ] <== dns_query() = 13
> [Wed Jan  4 13:07:02 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Wed Jan  4 13:07:02 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Wed Jan  4 13:07:02 2023] [cifsd ] ==>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.file.core.windows.net)
> [Wed Jan  4 13:07:02 2023] [cifsd ] <== dns_resolver_cmp() = 1
> [Wed Jan  4 13:07:02 2023] [cifsd ] <== dns_query() = 13
>
> Disconnected second time, but this time we can see one of the
> dns_query request is failing with -127
>
> [Wed Jan  4 13:07:10 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Wed Jan  4 13:07:10 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Wed Jan  4 13:07:10 2023] [cifsd ] ==>
> dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
> [Wed Jan  4 13:07:10 2023] [cifsd ] call
> request_key(,storagesouthcus1.file.core.windows.net,)
> [Wed Jan  4 13:07:10 2023] [cifsd ] ==>
> dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.file.core.windows.net)
> [Wed Jan  4 13:07:10 2023] [cifsd ] <== dns_resolver_cmp() = 1
> [Wed Jan  4 13:07:10 2023] [cifsd ] <== dns_query() = -127
> [Wed Jan  4 13:07:10 2023] [key.dn] ==> dns_resolver_preparse('
> 20.150.20.136',14)
> [Wed Jan  4 13:07:10 2023] [key.dn] no options
> [Wed Jan  4 13:07:10 2023] [key.dn] store result
> [Wed Jan  4 13:07:10 2023] [key.dn] <== dns_resolver_preparse() = 0
> [Wed Jan  4 13:07:10 2023] [cifsd ] <== dns_query() = 13
>
>
> More details:
>
> The dns_query call happens from cifs during reconnect and calls below
> functions in given order:
> dns_query->request_key_net->request_key_tag->request_key_and_link.
>
> In 'request_key_and_link()' function, if key is not present in current
> task_struct cache and if 'search_process_keyrings_rcu()' returns a key
> then we are inserting the key into the task_struct cache using
> cache_requested_key().
> Next time, when the 'request_key_and_link()' is called from another
> dns_query from cifs, it checks for cached keys using the
> 'check_cached_key' function. It returns the key if the current
> task_struct has already has the cached key. (Note: It doesn't check if
> the key is expired or not). And the same key will be returned to
> dns_query function. At the end dns_query function it checks if key is
> expired or not using key_validate() function, if it finds out that key
> has expired then it returns EKEYEXPIRED to caller(cifs). This is how
> we are hitting EKEYEXPIRED in our case.
> Should we add a check for key expiry in 'check_cached_key()' function
> so that it returns the key only if it's not expired.?
>
> Code from check_cached_key which gets called from request_key_and_link
> and doesnt check for key expiry:
> static struct key *check_cached_key(struct keyring_search_context *ctx)
> {
> #ifdef CONFIG_KEYS_REQUEST_CACHE
>     struct key *key = current->cached_requested_key;
>
>     if (key &&
>         ctx->match_data.cmp(key, &ctx->match_data) &&
>         !(key->flags & ((1 << KEY_FLAG_INVALIDATED) |
>                 (1 << KEY_FLAG_REVOKED))))
>         return key_get(key);
> #endif
>     return NULL;
> }

Agree with Bharath. The above code makes an assumption that if the key
matches, we can use the cached key.
The Problem is that this cached key may have expired, and we may need
to look up for a new instance of the key.
So we should also check if the key has expired before returning it.

>
> Code from key_validate which gets called from dns_query and checks for
> key expiry:
> key_validate()
>     if (expiry) {
>         if (ktime_get_real_seconds() >= expiry)
>             return -EKEYEXPIRED;
>     }
>
>
> As I understood from code, every key will be garbage collected after
> 300 Seconds, but cifs module dns_query will still be getting
> EKEYEXPIRED even after 5 minutes. It looks like it's because,
> 'request_key_link()' function first checks if we have cached key at
> process, if it find key in cache then we just return from there.
> cached_requested_key seems to become a permanent entry for cifsd
> process and dns resolution fails every time after that. I don't see
> anyone invalidating the cached key in cifsd task. Please let me know,
> who is responsible for clearing the cached_requested_key from a
> task_struct if the thread never dies.?
>
> Note: If there is only a tcp connection from cifs [or] disconnect one
> connection at a time, I didn't see this issue. Looks like in these
> cases we are not inserting the key into task_struct cache.
>
> Please have a look at the issue and let us know your comments.
> Let me know if you need additional details.
>
>
> Thanks,
> Bharath



-- 
Regards,
Shyam
