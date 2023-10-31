Return-Path: <keyrings+bounces-3-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDED7DC4BD
	for <lists+keyrings@lfdr.de>; Tue, 31 Oct 2023 04:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22C0B1C20A66
	for <lists+keyrings@lfdr.de>; Tue, 31 Oct 2023 03:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3C7111A;
	Tue, 31 Oct 2023 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=jilayne.com header.i=@jilayne.com header.b="VrGRTETH"
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F093110C
	for <keyrings@vger.kernel.org>; Tue, 31 Oct 2023 03:08:12 +0000 (UTC)
X-Greylist: delayed 2679 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Oct 2023 20:08:10 PDT
Received: from mx1.supremebox.com (mx2.supremebox.com [198.23.53.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DFCC5;
	Mon, 30 Oct 2023 20:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jilayne.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/gjbVBqD6wUd83Ic/WpsYkTAScFG89GoRNlWHJQ3pyY=; b=VrGRTETHeUXeMg6iB+ujy5itQJ
	dAieB6ad/PZVlJCtyprHmz/ZEW2BwJfm/uh67cFTRrvAP2Hh+Y5YCDKIZeEn/hm/zQGwSD/2Waqat
	DlU2ogG0KEtbQFm7TbqXakazRbrpQbEm2cqKPakg3jDm/RWbnnlsPh/p8DDCksE45TLk=;
Received: from 71-211-137-107.hlrn.qwest.net ([71.211.137.107] helo=[192.168.1.162])
	by mx1.supremebox.com with esmtpa (Exim 4.92)
	(envelope-from <opensource@jilayne.com>)
	id 1qxePf-0005Ei-PH; Tue, 31 Oct 2023 02:23:27 +0000
Message-ID: <ccf41bd2-e627-424c-8486-47f22553820d@jilayne.com>
Date: Mon, 30 Oct 2023 20:23:25 -0600
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Add SPDX identifier to IETF ASN.1 modules
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>, Richard Fontana <rfontana@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spdx@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Tadeusz Struk
 <tadeusz.struk@linaro.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>,
 linux-cifs@vger.kernel.org, Taehee Yoo <ap420073@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org
References: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
 <CAC1cPGx-cb+YZ9KgEFvSjtf+fp9Dhcn4sm9qHmFFDRDxb=7fHg@mail.gmail.com>
 <20231022085319.GA25981@wunner.de>
From: J Lovejoy <opensource@jilayne.com>
In-Reply-To: <20231022085319.GA25981@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Sender-Ident-agJab5osgicCis: opensource@jilayne.com



On 10/22/23 4:53 AM, Lukas Wunner wrote:
> On Sat, Oct 21, 2023 at 09:23:55AM -0400, Richard Fontana wrote:
>> On Sat, Oct 21, 2023 at 7:25???AM Lukas Wunner <lukas@wunner.de> wrote:
>>> Per section 4.c. of the IETF Trust Legal Provisions, "Code Components"
>>> in IETF Documents are licensed on the terms of the BSD-3-Clause license:
>>>
>>> https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/
>>>
>>> The term "Code Components" specifically includes ASN.1 modules:
>>>
>>> https://trustee.ietf.org/documents/trust-legal-provisions/code-components-list-3/
>> Sorry if this seems super-pedantic but I am pretty sure the license
>> text in the IETF Trust Legal Provisions does not actually match SPDX
>> `BSD-3-Clause` because of one additional word in clause 3 ("specific"
>> before "contributors"), so IMO you should get SPDX to modify its
>> definition of `BSD-3-Clause` prior to applying this patch (or get IETF
>> to change its version of the license, but I imagine that would be more
>> difficult).
> I've submitted a pull request to modify the SPDX definition of
> BSD-3-Clause for the IETF variant:
>
> https://github.com/spdx/license-list-XML/pull/2218
>
> I assume this addresses your concern?  Let me know if it doesn't.
>
> If anyone has further objections to this patch please speak up.
Thanks for submitting the PR! Usually this is something that would be 
discussed via an issue before making a PR. I made one here 
https://github.com/spdx/license-list-XML/issues/2242 and will have a 
closer look shortly. Also ideally, this patch would not be applied until 
the additional markup is confirmed by SPDX (in case this is deemed a new 
license and needs a new/different identifier)

thanks,
Jilayne
> Thanks,
>
> Lukas


