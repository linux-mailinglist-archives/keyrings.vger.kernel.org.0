Return-Path: <keyrings+bounces-93-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756B7EEC12
	for <lists+keyrings@lfdr.de>; Fri, 17 Nov 2023 06:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 535801C20905
	for <lists+keyrings@lfdr.de>; Fri, 17 Nov 2023 05:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEB4D2F2;
	Fri, 17 Nov 2023 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=blastwave.org header.i=@blastwave.org header.b="mI0DHJEA"
X-Original-To: keyrings@vger.kernel.org
X-Greylist: delayed 863 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Nov 2023 21:49:05 PST
Received: from mail.oetec.com (mail.oetec.com [108.160.241.186])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8A21A5;
	Thu, 16 Nov 2023 21:49:05 -0800 (PST)
Received: from [172.16.35.9] (cpe8c6a8d4d360a-cm8c6a8d4d3608.cpe.net.cable.rogers.com [99.253.151.152])
	(authenticated bits=0)
	by mail.oetec.com (8.17.1/8.16.1) with ESMTPSA id 3AH5YCpU064107
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Fri, 17 Nov 2023 00:34:13 -0500 (EST)
	(envelope-from dclarke@blastwave.org)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blastwave.org;
	s=default; t=1700199254;
	bh=PvIxctXLgaHgk2d2RaUgrIbNlEUE181R8LoHySAcYCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mI0DHJEA7W0nohOYB1QCRNdDzlCjLAe3aG2MIeeokSWKRVu6WOeUtRALp1qMZCXuC
	 rbDmk12wtHpzrTzieH1101Au1Zg2HgLXX7P8exdi8rgIECqbkwgURnnVgP+sOlokZf
	 /AGCZE5075eMq7qnvuyhihaLl6W7+HBhuEUjApIltaOijvg8O6qUKHB4ELsxLUIOO+
	 oCZfgKYMl0+KpkVNEYIJuJC32QQ/B+XpZzuqrwDTLOu1NeZbRrN2wSiKBbhDUduE6F
	 hHxEd0zuqut0eLvX8GYH6lSWe3UGjv7yK5M/9+siUly4ZdsIAvsVTOmIrdjH7njsH8
	 rmZ+xpRJg00uA==
Message-ID: <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
Date: Fri, 17 Nov 2023 00:34:12 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: =?UTF-8?Q?Re=3a_Fwd=3a_sign-file=2ec=3a149=3a17=3a_warning=3a_impli?=
 =?UTF-8?Q?cit_declaration_of_function_=e2=80=98ENGINE=5fload=5fbuiltin=5fen?=
 =?UTF-8?B?Z2luZXPigJk=?=
Content-Language: en-CA
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
        Linux Kernel Keyrings <keyrings@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
        David Woodhouse
 <dwmw2@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
From: Dennis Clarke <dclarke@blastwave.org>
Organization: GENUNIX
In-Reply-To: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-oetec-MailScanner-Information: Please contact the ISP for more information
X-oetec-MailScanner-ID: 3AH5YCpU064107
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-From: dclarke@blastwave.org

On 11/16/23 18:41, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a bug report on Bugzilla [1]. Quoting from it:
> 
<snip>
>> Not related to https://bugzilla.kernel.org/show_bug.cgi?id=215750 but I *feel* that
>> this code needs a hug.
> 
> See Bugzilla for the full thread.
> 
> AFAIK, this looks like a bug when the kernel is compiled against custom
> (non-system) version of OpenSSL library.
> 

I do not know what you could possibly mean. There is nothing "custom"
about OpenSSL. For that matter the gcc compiler I am using was also
built by me. Works fine. The sign-file.c source compiles fine.

It fails to compile in the usual way when trying to build the kernel.

Dennis

