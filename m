Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577241C564E
	for <lists+keyrings@lfdr.de>; Tue,  5 May 2020 15:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgEENHF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 May 2020 09:07:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:32238 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728268AbgEENHF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 5 May 2020 09:07:05 -0400
IronPort-SDR: KoUn4nb2aAhiNKCjv1sfPktuhmE0vVAWPkF1LR7k9cw1kt3BTKqdAfWxz3kY9K7EeCZUMWIezA
 9UKepL9KmyGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2020 06:07:04 -0700
IronPort-SDR: Cc3+FVB1kxEfoyHvdxM7/OBQ271YB5Cdp3TpMPrOn/mcC3MCzs8p7gmG5e/TAtzxe4eHk2HcJQ
 zsiBvUrhw23w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,355,1583222400"; 
   d="scan'208";a="461374284"
Received: from florinix-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.116])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2020 06:07:01 -0700
Date:   Tue, 5 May 2020 16:07:00 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Will Deacon <will@kernel.org>
Cc:     Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
Subject: Re: [RESEND] security/keys: remove possessor verify after key
 permission check
Message-ID: <20200505130440.GA134046@linux.intel.com>
References: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
 <20200505091958.GD16980@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505091958.GD16980@willie-the-truck>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 05, 2020 at 10:19:59AM +0100, Will Deacon wrote:
> On Thu, Apr 30, 2020 at 10:34:03AM +0300, Alexey Krasikov wrote:
> > In security/keys/keyctl.c: keyctl_read_key() after key_permission() check
> > is called is_key_possessed(). According to the current logic, if the caller is
> > a possessor, then it can read the key regardless of whether it has rights
> > to do so.
> > 
> > if I remove the possessor read rights:
> >     keyctl_setperm(key, KEY_POS_ALL & (~KEY_POS_SETATTR));
> > the calling process will still be able to read the key if it is possessor.
> > 
> > In other words, if the possessor doesn't have read rights, it doesn't matter.
> > 
> > ---
> > I may be misunderstanding the logic behind it, but here's the patch to
> > stir the discussion.
> > 
> > Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
> > ---
> >  security/keys/keyctl.c | 15 +--------------
> >  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> Hmm, looks like this still didn't make it to the keyrings@ list :(
> 
> On the off-chance that my reply /does/ make it, I've left the whole of the
> patch intact below. Please can somebody have a look?
> 
> Will

Hi, I'm on this. Just didn't have time last week. Looking it through
on *some* day this week properly.

/Jarkko
