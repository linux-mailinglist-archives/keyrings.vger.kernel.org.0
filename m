Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524011E4E82
	for <lists+keyrings@lfdr.de>; Wed, 27 May 2020 21:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgE0TrN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 May 2020 15:47:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:51145 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387410AbgE0TrK (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 27 May 2020 15:47:10 -0400
IronPort-SDR: mGzLuWn1MslNAjPZe7ppr8+9z2uP0sw2kOQ7iRwtlxm6ugZYPuhd7bLRkf13P/GaNNH0IT2EMR
 OyKUcqhBoiQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 12:47:09 -0700
IronPort-SDR: 4qLkMzpG8Gj8N83VemiEcvkBZ1JKGA1apTmANW67waELd6rKSnj9PzPbbC4SiXGQ6Y54mZ+L56
 roQWqphRgeyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; 
   d="scan'208";a="468837577"
Received: from lkakolx-mobl.ger.corp.intel.com ([10.249.43.73])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2020 12:47:06 -0700
Message-ID: <cce1dc1bf68c72ad3229b4de4cf46e905d254424.camel@linux.intel.com>
Subject: Re: [RESEND] security/keys: remove possessor verify after key
 permission check
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
Cc:     "security@kernel.org" <security@kernel.org>,
        "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Date:   Wed, 27 May 2020 22:47:05 +0300
In-Reply-To: <8564965a-b7a4-c493-93c0-0685132d3113@yandex-team.ru>
References: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
         <d0c93316324c3815cb4f9f1c5423530c5e363111.camel@linux.intel.com>
         <120411588840530@mail.yandex-team.ru>
         <8809d669-1644-82b3-2489-b0abcacf8848@yandex-team.ru>
         <8564965a-b7a4-c493-93c0-0685132d3113@yandex-team.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-05-25 at 13:56 +0300, Alexey Krasikov wrote:
> 14.05.2020 12:46, Alexey Krasikov пишет:
> > > 07.05.2020, 10:24, "Jarkko Sakkinen" <jarkko.sakkinen@linux.intel.com>:
> > > 
> > >     Tried this:
> > > 
> > > 
> > >     $ KEYID=$(keyctl add user john smith @u)
> > >     $ keyctl setperm $KEYID 0x20000000
> > >     $ keyctl read $KEYID
> > >     keyctl_read_alloc: Permission denied
> > > 
> > >     You did not provide a full example like this so I have to assume 
> > > that
> > >     this is what you meant.
> > > 
> > >     /Jarkko
> > > 
> > > 
> > 
> > You've removed all the attributes except the reading.
> > Nothing can be done with the key if it can't be found.
> > Try this:
> > $ KEYID=$(keyctl add user john smith @u)
> > $ keyctl describe $KEYID
> > $ keyctl setperm $KEYID 0x3d000000
> > $ keyctl describe $KEYID
> > $ keyctl print $KEYID
> > /Alexey
> 
> ping

Please send a new version with a full example of the scenario that
you are referring. This thread became too messy to follow with the
HTML emails included (that do no reach vger).

/Jarkko

