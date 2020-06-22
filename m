Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DECC204409
	for <lists+keyrings@lfdr.de>; Tue, 23 Jun 2020 00:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731066AbgFVWt2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Jun 2020 18:49:28 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33641 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730943AbgFVWt2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Jun 2020 18:49:28 -0400
Received: by mail-pj1-f66.google.com with SMTP id b7so375780pju.0;
        Mon, 22 Jun 2020 15:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRLLTFiwZxDKq/UwBSbDFy971kDvxfQAmSgAS+YPpaA=;
        b=uPz3YtzHuyLYMBof6VftY3TdbFJiIoc1iRxNn433KLM9AJoPnJgY8ZSSe4++QJKGuL
         tP9N0qUtl7fNHDsd6FjouXNr74XnWF7kuJQqXRLWFFOYBoRG69UR45VjrmWOsdoMTed7
         RrabgUNDHObny/pj0geLy8PZFNUwyOxQC5XqvOEhsoPsOjZbHDqq9BpmEs9NZ4v6uRzV
         dMXYkPl7n6Q6g0bOdpOIffF+hAwS6MaamLc81DEE2UGHLWig0CYwM1nmnzloAI1n5cJ0
         aS3gexJDS6J0qDzS6tZYM3InY9qWDPCuwg8J2WJ9T0zSPZQR7WGqmXxPVUHvQCjZ8KTx
         9VQg==
X-Gm-Message-State: AOAM533/3Svu6lnRysE5SXz7hdoJ23xJ6BgCvtJjimgJalYqPQnFuK25
        sI+qPjy9t7wOwWGMaIE+AMY=
X-Google-Smtp-Source: ABdhPJx/+PEc3BXj+aia8dA4DGanmyAqnY+W338FP/SRY+vlhb8mNBBvvVGc8cPShawEulLOlDWGKw==
X-Received: by 2002:a17:902:fe02:: with SMTP id g2mr20581503plj.204.1592866163068;
        Mon, 22 Jun 2020 15:49:23 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id l83sm15073102pfd.150.2020.06.22.15.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:49:21 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id B728940430; Mon, 22 Jun 2020 22:49:20 +0000 (UTC)
Date:   Mon, 22 Jun 2020 22:49:20 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     LTP List <ltp@lists.linux.it>,
        open list <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>
Subject: Re: LTP: crypto: af_alg02 regression on linux-next 20200621 tag
Message-ID: <20200622224920.GA4332@42.do-not-panic.com>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 23, 2020 at 12:04:06AM +0530, Naresh Kamboju wrote:
> LTP crypto regressions noticed on linux next 20200621.
> 
> The common case for all tests is timeout after 15 minutes which
> means tests got hung and LTP timers killed those test runs after
> timeout.
> The root cause of the failure is under investigation.
> 
>   ltp-crypto-tests:
>     * af_alg02 - failed
>     * af_alg05 - failed
>   ltp-syscalls-tests:
>     * keyctl07 - failed
>     * request_key03 - failed
> 
> Output log:
> --------------
> af_alg02:
> af_alg02.c:52: BROK: Timed out while reading from request socket.
> 
> Test code at line number 52 is
> 
> pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> SAFE_PTHREAD_CREATE(&thr, NULL, verify_encrypt, NULL);
> 
> TST_CHECKPOINT_WAIT(0);
> 
> while (pthread_kill(thr, 0) != ESRCH) {
>     if (tst_timeout_remaining() <= 10) {
>         pthread_cancel(thr);
>         tst_brk(TBROK,
>                    "Timed out while reading from request socket.");
> 
> 
> af_alg05:
> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> [  362.599868] kworker/dying (137) used greatest stack depth: 11600 bytes left
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try
> exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> request_key03:
> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> request_key03.c:65: CONF: kernel doesn't support key type 'encrypted'
> request_key03.c:65: CONF: kernel doesn't support key type 'trusted'
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try
> exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> keyctl07
> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try
> exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: 5a94f5bc041ea9e4d17c93b11ea6f6a2e5ad361b
>   git describe: next-20200621
>   kernel-config:
> https://builds.tuxbuild.com/PB-45Luvlx0yYJ8MZgpijA/kernel.config
> 
> ref:
> https://lkft.validation.linaro.org/scheduler/job/1511938#L2211
> https://lkft.validation.linaro.org/scheduler/job/1511935#L9225

Can you try reverting:

d13ef8e10756873b0a8b7cc8f230a2d1026710ea

The patch is titled "umh: fix processed error when UMH_WAIT_PROC is used"

If this fixes the  issue we have to ask ourselves then why, given that
anything other than 0 is a return code and prior to this patch we were
not accepting negative return codes, but we were never getting them
as the invalid return code was being returned when UMH_WAIT_PROC was
used and an error code was returned. So now, *any* non-zero value is
a return code.  The onlything I can think of is that we may want to
special-case the -ENOMEM error code, or maybe some other one to not
skip it as in the below patch.

If reverting the commit does not fix the issue, this is not the droid
we are looking for.

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index ff462f3d46ca..94ed23a8991f 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -193,7 +193,7 @@ static int call_sbin_request_key(struct key *authkey, void *aux)
 	ret = call_usermodehelper_keys(request_key, argv, envp, keyring,
 				       UMH_WAIT_PROC);
 	kdebug("usermode -> 0x%x", ret);
-	if (ret != 0) {
+	if (ret != -ENOMEM && ret != 0) {
 		/* ret is the exit/wait code */
 		if (test_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags) ||
 		    key_validate(key) < 0)
