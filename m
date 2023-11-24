Return-Path: <keyrings+bounces-151-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0137F6AA7
	for <lists+keyrings@lfdr.de>; Fri, 24 Nov 2023 03:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 575DD2817CF
	for <lists+keyrings@lfdr.de>; Fri, 24 Nov 2023 02:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FAF1367;
	Fri, 24 Nov 2023 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=blastwave.org header.i=@blastwave.org header.b="BNW7zGXL"
X-Original-To: keyrings@vger.kernel.org
Received: from mail.oetec.com (mail.oetec.com [108.160.241.186])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E101BE;
	Thu, 23 Nov 2023 18:29:13 -0800 (PST)
Received: from [172.16.35.9] (cpe8c6a8d4d360a-cm8c6a8d4d3608.cpe.net.cable.rogers.com [99.253.151.152])
	(authenticated bits=0)
	by mail.oetec.com (8.17.1/8.16.1) with ESMTPSA id 3AO2SFvu006653
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Thu, 23 Nov 2023 21:28:19 -0500 (EST)
	(envelope-from dclarke@blastwave.org)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blastwave.org;
	s=default; t=1700792902;
	bh=JRz+QuHSFTwfDW25GUsrNtjXacUb05swqDkWCTxkAA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BNW7zGXLRrdeN3QwI6yFl0ZSPczO6S18wtTyd1fajx00RENDtEwrEgEbgpDIHDQk1
	 gxwSbQM/SKdn32KslD73V1g+YF6kTBLVD9854eX7o14nObG8Nf/uy38zwgeZHeu8zc
	 dgGIAIeXTAfcpjP7tyr1AVl0I3EECTg3ctdx5pQAF0O4ExMcKp4AHFJ6d6qXgFJvIv
	 MUIqsz5uRQPsLZSAd7AXxVWGQaJ96hjrEl7fz5SrP74D579eY3003Hb5+SYTsMDlOF
	 8BSHROPpIR53R4+AqdcqxPyTlqP6nGzUMDepszvWAIZTh1BmMPOucuGdWQ9x/8i0F6
	 9OciftRgCyLzg==
Message-ID: <267f0b5a-5da4-4145-c0b9-304d5716c225@blastwave.org>
Date: Thu, 23 Nov 2023 21:28:12 -0500
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
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
        Linux Kernel Keyrings <keyrings@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
        David Woodhouse
 <dwmw2@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
 <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
 <164a4d4434e77ba1b65624a081799a073a3aced7.camel@HansenPartnership.com>
From: Dennis Clarke <dclarke@blastwave.org>
Organization: GENUNIX
In-Reply-To: <164a4d4434e77ba1b65624a081799a073a3aced7.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-oetec-MailScanner-Information: Please contact the ISP for more information
X-oetec-MailScanner-ID: 3AO2SFvu006653
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-From: dclarke@blastwave.org

On 11/23/23 09:53, James Bottomley wrote:
> On Fri, 2023-11-17 at 00:34 -0500, Dennis Clarke wrote:
>> On 11/16/23 18:41, Bagas Sanjaya wrote:
>>> Hi,
>>>
>>> I notice a bug report on Bugzilla [1]. Quoting from it:
>>>
>> <snip>
>>>> Not related to
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=215750 but I *feel*
>>>> that this code needs a hug.
>>>
>>> See Bugzilla for the full thread.
>>>
>>> AFAIK, this looks like a bug when the kernel is compiled against
>>> custom (non-system) version of OpenSSL library.
>>>
>>
>> I do not know what you could possibly mean. There is nothing "custom"
>> about OpenSSL. For that matter the gcc compiler I am using was also
>> built by me. Works fine. The sign-file.c source compiles fine.
> 
> This has all the hallmarks of an openssl compiled without engine
> support; is the symbol OPENSSL_NO_ENGINE set?  And which distro did you
> get this library from?
> 
> James
> 


Its okay.

I can fix it.

To work with new OpenSSL 3.2.0 and old stuff .. for a while ....



-- 
--
Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken


