Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A565B1E4EB1
	for <lists+keyrings@lfdr.de>; Wed, 27 May 2020 21:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgE0T6Z (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 May 2020 15:58:25 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:53858 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726839AbgE0T6Y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 May 2020 15:58:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 307EF8EE16A;
        Wed, 27 May 2020 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1590609504;
        bh=OWPvaxiA9rL/gjzclc2mC2Jdu8Qynp93pFR+i83MJbo=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=WcQ+KOzt3X4+WrawGrkoVBXAKV+qpgvQBg1vfeQoCtKAmbdVzLvruzDqjT1PJqGL2
         0Q16vGS9E+Rl75DxcO7lI3uh/INmzD6ciQJ8YJ4cFi5lND8fDe9F4/7ZAe13j7RRLA
         Ewh6of3IOwGAhekMPsDq5ZSjbtk3eorG7d1W8GFo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XIzd9Dr5SwtX; Wed, 27 May 2020 12:58:24 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6CA118EE0EA;
        Wed, 27 May 2020 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1590609503;
        bh=OWPvaxiA9rL/gjzclc2mC2Jdu8Qynp93pFR+i83MJbo=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=OcJum/O7zohaJ87mV1C94Sdt099HltMQwzXPIhWjnLQXH7PeUOaWXN6jtGjsqmvgN
         S4G86LYiIbUk4OK5zkId3qJswhWAPRtxubdIBZBrq4r4EX/ljBB5UU9tYry7soECLg
         caeOkVhcfkk1++kmBVlHmE93KrgON8QdF3FXtX+c=
Message-ID: <1590609501.4731.3.camel@HansenPartnership.com>
Subject: Re: [RESEND] security/keys: remove possessor verify after key
 permission check
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
Cc:     "security@kernel.org" <security@kernel.org>,
        "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Date:   Wed, 27 May 2020 12:58:21 -0700
In-Reply-To: <cce1dc1bf68c72ad3229b4de4cf46e905d254424.camel@linux.intel.com>
References: <20200430073403.26484-1-alex-krasikov@yandex-team.ru>
         <d0c93316324c3815cb4f9f1c5423530c5e363111.camel@linux.intel.com>
         <120411588840530@mail.yandex-team.ru>
         <8809d669-1644-82b3-2489-b0abcacf8848@yandex-team.ru>
         <8564965a-b7a4-c493-93c0-0685132d3113@yandex-team.ru>
         <cce1dc1bf68c72ad3229b4de4cf46e905d254424.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2020-05-27 at 22:47 +0300, Jarkko Sakkinen wrote:
[...]
> > ping
> 
> Please send a new version with a full example of the scenario that
> you are referring. This thread became too messy to follow with the
> HTML emails included (that do no reach vger).

Yes, please ... I'm missing most of the emails because of the vger and
html problem.  I think the request is to remove the possessor check in
keyctl_read, but just done blindly that would completely destroy our
namespaced security system for keys, so it doesn't sound like a good
idea at all.  What's the actual problem this is trying to solve?  It's
annoying that root has to join the session keyring to read a key, but
the reason for it is well justified and the fact that even root can't
reach some session keyrings is a feature not a bug.

James

