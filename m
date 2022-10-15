Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88CF5FF82C
	for <lists+keyrings@lfdr.de>; Sat, 15 Oct 2022 05:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJODXx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Oct 2022 23:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJODXw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Oct 2022 23:23:52 -0400
X-Greylist: delayed 407 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Oct 2022 20:23:51 PDT
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FC46E2E7
        for <keyrings@vger.kernel.org>; Fri, 14 Oct 2022 20:23:51 -0700 (PDT)
Date:   Sat, 15 Oct 2022 05:16:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
        t=1665803819; bh=U8xvXcEsK7tvXOqJfIaOyDf2VD0+6rvjfEmv0MNaC+Q=;
        h=Date:From:To:Cc:Subject:From;
        b=axNeRpntvhmaeNQl+2N0orJkCMTpoi0tRmDwmw+MtkebVJQMFBPafdMYfk2u9t4qT
         /ZictVzSMznKwbeLSER/xJ1V52PSYYphxfNVylX0ylG5Bdx+tdDkvqFm10WzfsJ92X
         0AKiWvf9HKDgMD1iXuo4g7PuSoLNW370lxyYV1I0=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Mark Pearson <markpearson@lenovo.com>
Subject: [BUG] blacklist: Problem blacklisting hash (-13) during boot
Message-ID: <c8c65713-5cda-43ad-8018-20f2e32e4432@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

Since 5.19 during boot I see lots of the following entries in dmesg:

blacklist: Problem blacklisting hash (-13)

This happens because the firmware contains duplicate blacklist entries.
As commit 6364d106e041 [0] modified the "blacklist" keyring to reject updates
this now leads to the spurious error messages.

The machine is a Thinkpad X1 Cargon Gen9 with BIOS revision 1.56 and firmware
revision 1.33.

[0] 6364d106e041 ("certs: Allow root user to append signed hashes to the blacklist keyring")
