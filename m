Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02841C835E
	for <lists+keyrings@lfdr.de>; Thu,  7 May 2020 09:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgEGHY0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 7 May 2020 03:24:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:63853 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgEGHYZ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 7 May 2020 03:24:25 -0400
IronPort-SDR: nQ3E1Yi5vgqefCwes8TbW0Rmm7YHoY+Z02E7XdTZ3fhhBXwRotPu6zA+0Iiqcx/pE9tGy3k7Pw
 9TuNdy0J4zrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 00:24:25 -0700
IronPort-SDR: s4pxmF68o2XMLzIgYIj7CiTihP0YtcuuK8tuZ4zpHjZH0C5VVJRh9ngTAOsapZwXL1Kl7QxIUE
 bNJrhctiz+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; 
   d="scan'208";a="251439066"
Received: from seemahan-mobl.ger.corp.intel.com ([10.252.42.92])
  by fmsmga008.fm.intel.com with ESMTP; 07 May 2020 00:24:23 -0700
Message-ID: <d0c93316324c3815cb4f9f1c5423530c5e363111.camel@linux.intel.com>
Subject: Re: [RESEND] security/keys: remove possessor verify after key
 permission check
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     security@kernel.org, yc-core@yandex-team.ru
In-Reply-To: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
References: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160
 Espoo
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 07 May 2020 10:24:08 +0300
User-Agent: Evolution 3.36.1-2 
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2020-04-30 at 10:34 +0300, Alexey Krasikov wrote:
> In security/keys/keyctl.c: keyctl_read_key() after key_permission() check
> is called is_key_possessed(). According to the current logic, if the caller is
> a possessor, then it can read the key regardless of whether it has rights
> to do so.
> 
> if I remove the possessor read rights:
>     keyctl_setperm(key, KEY_POS_ALL & (~KEY_POS_SETATTR));
> the calling process will still be able to read the key if it is possessor.
> 
> In other words, if the possessor doesn't have read rights, it doesn't matter.
> 
> ---
> I may be misunderstanding the logic behind it, but here's the patch to
> stir the discussion.
> 
> Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>

Tried this:

$ KEYID=$(keyctl add user john smith @u)
$ keyctl setperm $KEYID 0x20000000
$ keyctl read $KEYID
keyctl_read_alloc: Permission denied

You did not provide a full example like this so I have to assume that
this is what you meant.

/Jarkko

