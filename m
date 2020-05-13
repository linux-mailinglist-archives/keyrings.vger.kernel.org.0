Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079441D1B93
	for <lists+keyrings@lfdr.de>; Wed, 13 May 2020 18:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732574AbgEMQuQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 May 2020 12:50:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:2250 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732510AbgEMQuQ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 13 May 2020 12:50:16 -0400
IronPort-SDR: BNL8i4NYQS3LFCu6BZvs32Y1HYADm3gWuqTFka9VK1FB2l2Lm1hht9HJsRHdy/7zbdZdJq9LbX
 8f9uV6hn68cw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 09:50:16 -0700
IronPort-SDR: 5xp/XJ1NeLL3edOSgA4YUiOe/0eQCRXVVr2fuusdd6qII3FVz6qct8MTdNqEenz++oXzXZz/XJ
 I2kn6Y8E4ILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="287093084"
Received: from tvladisl-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.129])
  by fmsmga004.fm.intel.com with ESMTP; 13 May 2020 09:50:13 -0700
Date:   Wed, 13 May 2020 19:50:12 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     =?utf-8?B?0JDQu9C10LrRgdC10Lkg0JrRgNCw0YHQuNC60L7Qsg==?= 
        <alex-krasikov@yandex-team.ru>
Cc:     "dhowells@redhat.com" <dhowells@redhat.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "security@kernel.org" <security@kernel.org>,
        "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Subject: Re: [RESEND] security/keys: remove possessor verify after key
 permission check
Message-ID: <20200513165012.GB25598@linux.intel.com>
References: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
 <d0c93316324c3815cb4f9f1c5423530c5e363111.camel@linux.intel.com>
 <120411588840530@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <120411588840530@mail.yandex-team.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 07, 2020 at 11:39:48AM +0300, Алексей Красиков wrote:
>     
>    You've removed all the attributes except the reading.
>    Nothing can be done with the key if it can't be found.
>    Try this:
>     
>    $ KEYID=$(keyctl add user john smith @u)
>    $ keyctl describe $KEYID
>    $ keyctl setperm $KEYID 0x3d000000
>    $ keyctl describe $KEYID
>    $ keyctl print $KEYID
>     
>    /Alexey

Hi please re-respond with plain text.

HTML mails do not go to vger.kernel.org. Also please try to avoid
top posting (i.e. quote and respond inline).


/Jarkko
