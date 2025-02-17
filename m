Return-Path: <keyrings+bounces-2406-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC84A38773
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 16:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2379916C0CE
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 15:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A902A223302;
	Mon, 17 Feb 2025 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="G8NlfatT"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED99A2248AF
	for <keyrings@vger.kernel.org>; Mon, 17 Feb 2025 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805913; cv=none; b=R8Z0HS+o7oszIm9P0hotrZpZB3kfzzV95D8UpBktD2v6gFGqqH1gMpB2FPcgi9o3cqFe69z04YYzYsVm1KunO3RrNr1XzDzRVYd6d3s/y/lPZLrBeVZJ/3+Phv98lwybWJbLr5Ka1c++ycNzNGLB7Fps+reae7URZUjCeOrK24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805913; c=relaxed/simple;
	bh=X0apXU18bUmO8jtsrz8+T1aNWsSSlbHXnWgvH1vWChU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jV4rDs2pLSOyG9zMZ2FtrWZCkmidrNHwSHpHxRqJFRX6HpUvA6UXetDmAkIGkcWuHOIwS6FiGUx6s0MB3+z+6Riq7TZtCOlKEnMo0dRgDdki/ciiEjlcczSRya4S7GoJtoexnP/x5Rxd5ikiHwnYz1r+kHa3YV2lnLOcVxcb5BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=G8NlfatT; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739805912; x=1771341912;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H7LUTEXt8sPt5qEjChEzwhpCZ9e7ZGFFUMJ8MIpe8fA=;
  b=G8NlfatTibh7Vi2dRlwoJnIK44wGBzz+R5bQ0lJr4vxT9cB8sY4GuD6v
   Zv+8yW9Dz/fvckgjquzRSWFnKshz7XbAHYHLrI+tqGNrsAS78dkC3UP9Z
   buOSVzqoytRGwq+/BQITtjP58n1FH1P9NGWxeqMwGzkX2xrcJaXkJ1wOv
   4=;
X-IronPort-AV: E=Sophos;i="6.13,293,1732579200"; 
   d="scan'208";a="799481158"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 15:25:06 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.10.100:49744]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.6.237:2525] with esmtp (Farcaster)
 id ac15d66b-ed08-4ec7-9cf7-b210b84127dc; Mon, 17 Feb 2025 15:25:04 +0000 (UTC)
X-Farcaster-Flow-ID: ac15d66b-ed08-4ec7-9cf7-b210b84127dc
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 17 Feb 2025 15:25:04 +0000
Received: from [192.168.15.192] (10.106.83.5) by EX19D018EUA004.ant.amazon.com
 (10.252.50.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Mon, 17 Feb 2025
 15:25:03 +0000
Message-ID: <eb595b46-c28b-498f-b60e-298f14ce44a3@amazon.com>
Date: Mon, 17 Feb 2025 15:25:02 +0000
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Pass "err" argument by address to "_nsError" function
To: Pratyush Yadav <ptyadav@amazon.de>
CC: <dhowells@redhat.com>, <keyrings@vger.kernel.org>, <benh@amazon.com>,
	<ptyadav@amazon.com>
References: <20250217005452.4873-1-abuehaze@amazon.com>
 <mafs0h64sn2oy.fsf@amazon.de>
Content-Language: en-US
From: "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
In-Reply-To: <mafs0h64sn2oy.fsf@amazon.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D009EUA003.ant.amazon.com (10.252.50.105) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)


Hi Pratyush,

On 17/02/2025 13:03, Pratyush Yadav wrote:
> Hi Hazem,
> 
> On Mon, Feb 17 2025, Hazem Mohamed Abuelfotoh wrote:
> 
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
>>   	if (response_len < 0) {
>>   		/* negative result */
>> -		_nsError(h_errno, cell);
>> +		_nsError(&h_errno, cell);
>>   		return -1;
>>   	}
>>   
>> @@ -267,7 +267,7 @@ static int dns_query_VL_SRV(const char *cell)
>>   
>>   	if (response_len < 0) {
>>   		/* negative result */
>> -		_nsError(h_errno, cell);
>> +		_nsError(&h_errno, cell);
>>   		return -1;
>>   	}
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
>>   extern __attribute__((format(printf, 1, 2)))
>>   void debug(const char *fmt, ...);
>>   
>> diff --git a/key.dns_resolver.c b/key.dns_resolver.c
>> index 7a7ec42..6b16427 100644
>> --- a/key.dns_resolver.c
>> +++ b/key.dns_resolver.c
>> @@ -157,19 +157,20 @@ static const int ns_errno_map[] = {
>>   	[NO_DATA]		= ENODATA,
>>   };
>>   
>> -void _nsError(int err, const char *domain)
>> +void _nsError(int *err, const char *domain)
>>   {
>>   	if (isatty(2))
>> -		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(err));
>> +		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(*err));
>>   	else
>> -		syslog(LOG_INFO, "%s: %s", domain, hstrerror(err));
>> +		syslog(LOG_INFO, "%s: %s", domain, hstrerror(*err));
>>   
>> -	if (err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
>> -		err = ECONNREFUSED;
>> -	else
>> -		err = ns_errno_map[err];
>> +	if (*err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
>> +		*err = ECONNREFUSED;
>> +	else{
>> +		*err = ns_errno_map[*err];
>> +	}
>>   
>> -	info("Reject the key with error %d", err);
>> +	info("Reject the key with error %d", *err);
>>   }
>>   
>>   void nsError(int err, const char *domain)
>> @@ -177,8 +178,7 @@ void nsError(int err, const char *domain)
>>   	unsigned timeout;
>>   	int ret;
>>   
>> -	_nsError(err, domain);
>> -
>> +	_nsError(&err, domain);
> 
> Doing this breaks the switch block below since it checks against the
> h_errno instead of the errno that err now contains. So it would end up
> always using the default case. So we should either update the switch
> block below or make _nsError() return the errno instead of modifying
> err. IMO the latter is neater way of doing it. In that case, we could do
> something like:


Nice catch. You are absolutely right, the switch conditions has to be 
changed
to check for "h_errno" matching the previous version of that function,
otherwise we will always go to default. I thought about returning 
converted error number from "_nsError" while writing this patch but I 
chose passing the error argument by pointer as there are other functions
like "dns_query_AFSDB" & "dns_query_VL_SRV" that don't seem to care 
about the return value of "_nsError", Also in "nsError" there's kind of 
duplication in the switch condition where we are checking for "case 0" 
(which is not very descriptive) & "case NO_RECOVERY" and both lead to 
the same action so I feel like using single condition with descriptive 
name like "ECONNREFUSED" is better. Lastly the "_nsError" used mainly 
for logging & error conversion and it looks like "nsError" the only 
function where converted error post processing is happening so it's very 
unlikely for other users of "_nsError" to care about the return code. 
Given these facts I will go ahead with submitting v2 of this patch to 
accommodate the proposed switch condition changes.

static int dns_query_AFSDB(const char *cell)
{
         int     response_len;           /* buffer length */
         ns_msg  handle;                 /* handle for response message */
         union {
                 HEADER hdr;
                 u_char buf[NS_PACKETSZ];
         } response;             /* response buffers */

         debug("Get AFSDB RR for cell name:'%s'", cell);

         /* query the dns for an AFSDB resource record */
         response_len = res_query(cell,
                                  ns_c_in,
                                  ns_t_afsdb,
                                  response.buf,
                                  sizeof(response));

         if (response_len < 0) {
                 /* negative result */
                 _nsError(&h_errno, cell);
                 return -1;
         }

static int dns_query_VL_SRV(const char *cell)
{
         int     response_len;           /* buffer length */
         ns_msg  handle;                 /* handle for response message */
         union {
                 HEADER hdr;
                 u_char buf[NS_PACKETSZ];
         } response;
         char name[1024];

         snprintf(name, sizeof(name), "_afs3-vlserver._udp.%s", cell);

         debug("Get VL SRV RR for name:'%s'", name);

         response_len = res_query(name,
                                  ns_c_in,
                                  ns_t_srv,
                                  response.buf,
                                  sizeof(response));

         if (response_len < 0) {
                 /* negative result */
                 _nsError(&h_errno, cell);
                 return -1;
         }

         if (ns_initparse(response.buf, response_len, &handle) < 0)
                 error("ns_initparse: %m");

         /* look up the hostnames we've obtained to get the actual 
addresses */
         srv_hosts_to_addrs(handle, ns_s_an);

         info("DNS query VL SRV RR results:%u ttl:%u", payload_index, 
key_expiry);
         return 0;
}



