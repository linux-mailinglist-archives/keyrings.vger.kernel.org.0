Return-Path: <keyrings+bounces-2408-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174ABA39BC6
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2025 13:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDC9D1717A9
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2025 12:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEB023ED70;
	Tue, 18 Feb 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="XCnwUKZb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981142417C0
	for <keyrings@vger.kernel.org>; Tue, 18 Feb 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880660; cv=none; b=gx5mpkP+Tt5OX57XbOD1y8cwfLH3rGuLIQB60pqiFRyzrwv5BuQ8ostohoir6ZO82Md26ocDYeauRsDYXGQj9kf6H51gjTLOEXkFidtjM3qeBRk98Oqdrq9FN0c2dPaUiejuoi1Knqjrp8Y/86aH2wggCb9h1IErimRPVLB54kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880660; c=relaxed/simple;
	bh=dUkodisuQfvqUn/Qc+Y+fuawCZxijdEcjUklYn1ei5c=;
	h=Subject:Message-ID:Date:MIME-Version:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MWKx2ffaGTIPG1xLub66iTXalxIjEZCzJOXGsx6/5dc83/niK15zmaWEOHzYwvGB+SXxguWKd5BYt0YWcMkwnEA4FOjLplNRNr6fYTd/142gmxa05mzahRRYe9ovfaae4mH9N7ivdEGjGl1J7QK5DioDSRMklW1s/pZBa2WHbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=XCnwUKZb; arc=none smtp.client-ip=52.119.213.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739880658; x=1771416658;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=nWFT7gvWAWuJzNd7rd83igcaMbz4wISWL5PCIsiP67g=;
  b=XCnwUKZb0+MFAW4GLF4ZIEN4dzO10BzqZBoPHpfQytr7glreOZ1z0TrA
   Nzw4GXx0JuYXx8jDvtZkh95tAOghYJWufjhUS0o+QZYa2lokeaDn0yCeA
   OhmMN5wydIAVpHiHyFmM6YevbPTfuWxuXWEk1qItxbRZDlGsq10sVHh4i
   8=;
X-IronPort-AV: E=Sophos;i="6.13,295,1732579200"; 
   d="scan'208";a="67014853"
Subject: Re: [PATCH] Pass "err" argument by address to "_nsError" function
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 12:10:56 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:33540]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.13.33:2525] with esmtp (Farcaster)
 id d1dacd21-a848-4342-b992-b1f3af42a1ac; Tue, 18 Feb 2025 12:10:55 +0000 (UTC)
X-Farcaster-Flow-ID: d1dacd21-a848-4342-b992-b1f3af42a1ac
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 18 Feb 2025 12:10:55 +0000
Received: from [192.168.23.100] (10.106.82.8) by EX19D018EUA004.ant.amazon.com
 (10.252.50.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Tue, 18 Feb 2025
 12:10:54 +0000
Message-ID: <e9c6482f-52a1-43a6-9713-ab77990dc135@amazon.com>
Date: Tue, 18 Feb 2025 12:10:53 +0000
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: <dhowells@redhat.com>, <keyrings@vger.kernel.org>, <benh@amazon.com>,
	<ptyadav@amazon.com>
References: <20250217005452.4873-1-abuehaze@amazon.com>
 <Z7NjZTjRZSt3pmZh@kernel.org>
Content-Language: en-US
From: "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
In-Reply-To: <Z7NjZTjRZSt3pmZh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D015EUA001.ant.amazon.com (10.252.50.229) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)

Hi Jarkko,

On 17/02/2025 16:27, Jarkko Sakkinen wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Mon, Feb 17, 2025 at 12:54:52AM +0000, Hazem Mohamed Abuelfotoh wrote:
>> Commit 0d71523ab584 (“DNS: Support AFS SRV records and
>> cell db config files”) has refactored the "nsError" function
>> by moving some of error handling to "_nsError" function
>> however we are passing the "err" argument to "_nsError"
>> by value not by address which is wrong as that basically
>> waste any processing we do in the "_nsError" function
>> so correcting that by passing "err" by address.
>>
>> Reported-by: Pratyush Yadav <ptyadav@amazon.com>
>> Signed-off-by: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
>> ---
>>   dns.afsdb.c        |  4 ++--
>>   key.dns.h          |  2 +-
>>   key.dns_resolver.c | 20 ++++++++++----------
>>   3 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/dns.afsdb.c b/dns.afsdb.c
>> index 986c0f3..7bffb60 100644
>> --- a/dns.afsdb.c
>> +++ b/dns.afsdb.c
>> @@ -228,7 +228,7 @@ static int dns_query_AFSDB(const char *cell)
>>
>>        if (response_len < 0) {
>>                /* negative result */
>> -             _nsError(h_errno, cell);
>> +             _nsError(&h_errno, cell);
>>                return -1;
>>        }
>>
>> @@ -267,7 +267,7 @@ static int dns_query_VL_SRV(const char *cell)
>>
>>        if (response_len < 0) {
>>                /* negative result */
>> -             _nsError(h_errno, cell);
>> +             _nsError(&h_errno, cell);
>>                return -1;
>>        }
>>
>> diff --git a/key.dns.h b/key.dns.h
>> index 33d0ab3..2fedbc3 100644
>> --- a/key.dns.h
>> +++ b/key.dns.h
>> @@ -59,7 +59,7 @@ extern __attribute__((format(printf, 1, 2)))
>>   void info(const char *fmt, ...);
>>   extern __attribute__((noreturn))
>>   void nsError(int err, const char *domain);
>> -extern void _nsError(int err, const char *domain);
>> +extern void _nsError(int *err, const char *domain);
> 
> Why a function declaration need extern anyway?
> 
> You could do w/o.
> 

I agree that theoretically "extern" in function declaration shouldn't be 
needed as functions implicitly has "extern" by default however I noticed 
that all functions in keyutils are declared like that(not sure if there 
are some stupid compilers which really need this)". "extern" has been 
added to declaration of "_nsError" function in Commit 0d71523ab584 
(“DNS: Support AFS SRV records andcell db config files”) so it's not 
something that I changed in this new patch. Given the previously 
mentioned facts I am more into keeping the current declaration as it's 
to align with the trend in declaring other functions in the package. 
Removing "extern" from all functions' declarations is better to be done 
in another patch unless people have objection on that.

keyctl.h:extern nr void do_command(int, char **, const struct command *, 
const char *);
keyctl.h:extern nr void format(void) __attribute__((noreturn));
keyctl.h:extern nr void error(const char *) __attribute__((noreturn));
keyctl.h:extern key_serial_t get_key_id(char *);
keyctl.h:extern nr void act_keyctl_test(int, char *[]);
keyctl.h:extern nr void act_keyctl_watch(int , char *[]);
keyctl.h:extern nr void act_keyctl_watch_add(int , char *[]);
keyctl.h:extern nr void act_keyctl_watch_rm(int , char *[]);
keyctl.h:extern nr void act_keyctl_watch_session(int , char *[]);
keyctl.h:extern nr void act_keyctl_watch_sync(int , char *[]);


>>   extern __attribute__((format(printf, 1, 2)))
>>   void debug(const char *fmt, ...);
>>
>> diff --git a/key.dns_resolver.c b/key.dns_resolver.c
>> index 7a7ec42..6b16427 100644
>> --- a/key.dns_resolver.c
>> +++ b/key.dns_resolver.c
>> @@ -157,19 +157,20 @@ static const int ns_errno_map[] = {
>>        [NO_DATA]               = ENODATA,
>>   };
>>
>> -void _nsError(int err, const char *domain)
>> +void _nsError(int *err, const char *domain)
>>   {
>>        if (isatty(2))
>> -             fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(err));
>> +             fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(*err));
>>        else
>> -             syslog(LOG_INFO, "%s: %s", domain, hstrerror(err));
>> +             syslog(LOG_INFO, "%s: %s", domain, hstrerror(*err));
>>
>> -     if (err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
>> -             err = ECONNREFUSED;
>> -     else
>> -             err = ns_errno_map[err];
>> +     if (*err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
>> +             *err = ECONNREFUSED;
>> +     else{
>> +             *err = ns_errno_map[*err];
>> +     }
>>
>> -     info("Reject the key with error %d", err);
>> +     info("Reject the key with error %d", *err);
>>   }
>>
>>   void nsError(int err, const char *domain)
>> @@ -177,8 +178,7 @@ void nsError(int err, const char *domain)
>>        unsigned timeout;
>>        int ret;
>>
>> -     _nsError(err, domain);
>> -
>> +     _nsError(&err, domain);
>>        switch (err) {
>>        case TRY_AGAIN:
>>                timeout = 1;
>> --
>> 2.47.1
>>
>>
> 
> BR, Jarkko


