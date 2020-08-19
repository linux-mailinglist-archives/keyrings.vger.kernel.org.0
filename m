Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6782124A9C9
	for <lists+keyrings@lfdr.de>; Thu, 20 Aug 2020 01:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgHSXD7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Aug 2020 19:03:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28280 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726209AbgHSXD7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 19 Aug 2020 19:03:59 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JN1gKs148416;
        Wed, 19 Aug 2020 19:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4s6ipMZo3PZmhZJSQMcgq/OpgKjCrEZX8FoVbwMjgJU=;
 b=kOsX/kv0YYOvZ/xidjKLiZkp31HfVUWkaPlQiclr+9X5wNn9EFNzuOd0dghk8fVhFjCZ
 3bQY+y8YL7P/Z/y3VRa6L0b6snKNkzdKnjd1nOYrM9mNiatKGbEk5/2+GVhxOI1ZgT4I
 t0Htj7/N4Vs4LwFG6uJrVeTI2sMHAfW8kCppi7+/SwZwbDIwCV0e8TFQW9HVAzFhS4im
 TimpU/s1ZaS8DIZ1BCQQLnsLOqJKkVuqQ5MMz3gVLbVw+6Lg4FqL0rm8xcpQiyyInVkZ
 TGjgbLpDx4N5UQle18SnnnZnu2qV1ODcoPAKEDyhpxfYLMzjOczVLIm7vKDCfX6gFyDD CA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com with ESMTP id 330yctarr8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Aug 2020 19:03:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JN0GTQ013674;
        Wed, 19 Aug 2020 23:03:52 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma02wdc.us.ibm.com with ESMTP id 3304scygqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Aug 2020 23:03:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JN3pA430277992
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Aug 2020 23:03:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5FC6B6A05D;
        Wed, 19 Aug 2020 23:03:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 195466A04D;
        Wed, 19 Aug 2020 23:03:49 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 19 Aug 2020 23:03:49 +0000 (GMT)
Subject: Re: [PATCH v3] docs: trusted-encrypted.rst: update parameters for
 command examples
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Coly Li <colyli@suse.de>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>
References: <20200818170002.38145-1-colyli@suse.de>
 <20200819210234.GB9942@linux.intel.com>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <ec431164-21ae-8019-a9c0-b1e15004e4b9@linux.ibm.com>
Date:   Wed, 19 Aug 2020 19:03:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200819210234.GB9942@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_13:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190182
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 8/19/20 5:02 PM, Jarkko Sakkinen wrote:
> On Wed, Aug 19, 2020 at 01:00:02AM +0800, Coly Li wrote:
>> The parameters in command examples for tpm2_createprimary and
>> tpm2_evictcontrol are outdated, people (like me) are not able to create
>> trusted key by these command examples.
>>
>> This patch updates the parameters of command example tpm2_createprimary
>> and tpm2_evictcontrol in trusted-encrypted.rst. With Linux kernel v5.8
>> and tpm2-tools-4.1, people can create a trusted key by following the
>> examples in this document.
>>
>> Signed-off-by: Coly Li <colyli@suse.de>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: James Bottomley <jejb@linux.ibm.com>
>> Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>> Cc: Mimi Zohar <zohar@linux.ibm.com>
>> Cc: Stefan Berger <stefanb@linux.ibm.com>
> OK, now it is clear. Thank you.
>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>
> /Jarkko
>
>> ---
>> Changelog:
>> v3: update commit log with review comments from Jarkko Sakkinen.
>> v2: remove the change of trusted key related operation.
>> v1: initial version.
>>
>>   Documentation/security/keys/trusted-encrypted.rst | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
>> index 9483a7425ad5..1da879a68640 100644
>> --- a/Documentation/security/keys/trusted-encrypted.rst
>> +++ b/Documentation/security/keys/trusted-encrypted.rst
>> @@ -39,10 +39,9 @@ With the IBM TSS 2 stack::
>>   
>>   Or with the Intel TSS 2 stack::
>>   
>> -  #> tpm2_createprimary --hierarchy o -G rsa2048 -o key.ctxt
>> +  #> tpm2_createprimary --hierarchy o -G rsa2048 -c key.ctxt
>>     [...]
>> -  handle: 0x800000FF
>> -  #> tpm2_evictcontrol -c key.ctxt -p 0x81000001
>> +  #> tpm2_evictcontrol -c key.ctxt 0x81000001
>>     persistentHandle: 0x81000001
>>   
>>   Usage::
>> -- 
>> 2.26.2
>>

