Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EE9246CFC
	for <lists+keyrings@lfdr.de>; Mon, 17 Aug 2020 18:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388871AbgHQQjd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 Aug 2020 12:39:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18298 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388881AbgHQQjN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 17 Aug 2020 12:39:13 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07HGWh4W042775;
        Mon, 17 Aug 2020 12:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0BmdVngHH8Y+Vo7jZZrI2s5rUEGFM9MpKOvaz49g28o=;
 b=bSu3s1sb2L3utLcDs5Eax1krHKUC/DLBTHq94cvPAXhWmE+ZdS7T7YDoTssBFOpS0MdV
 RzsFTIDdM9Ng23LpXiX8VyLBaFoCk3VPn6vqrXAKCl9g1EJMgoAdYeQPGg9phKY+Au8i
 1KooFNSrskgYL3muOrwGel7GQnxpRpCc68x2MTYM5MgQDBOIaeuZ5Y3fbNxbPUoZ55Xr
 Iv2g6H6YVUza2GbAVsLiSZolRZ1aTK3MXxwlAvqCKVHpiCWbAL5H2eAt7LRAv0psiKkN
 8hBFzAKw+J006F9uD3uTw88nFUFlGGlOIbgxSXh37jucnP9sVtgFDYjpYQReOI7NfZba iQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y64dqr70-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Aug 2020 12:39:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HGQAGi029357;
        Mon, 17 Aug 2020 16:39:06 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma03wdc.us.ibm.com with ESMTP id 32yaeqpx2y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Aug 2020 16:39:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07HGd5sW44106058
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Aug 2020 16:39:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0246A6A047;
        Mon, 17 Aug 2020 16:39:05 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8953E6A051;
        Mon, 17 Aug 2020 16:39:04 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 17 Aug 2020 16:39:04 +0000 (GMT)
Subject: Re: [PATCH v2] docs: update trusted-encrypted.rst
To:     Coly Li <colyli@suse.de>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
References: <20200817142837.5224-1-colyli@suse.de>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <576928af-7e3f-3651-4125-75b4507b0115@linux.ibm.com>
Date:   Mon, 17 Aug 2020 12:39:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200817142837.5224-1-colyli@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-17_13:2020-08-17,2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170120
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 8/17/20 10:28 AM, Coly Li wrote:
> The parameters in tmp2 commands are outdated, people are not able to
> create trusted key by the example commands.
>
> This patch updates the paramerters of tpm2 commands, they are verified
> by tpm2-tools-4.1 with Linux v5.8 kernel.
>
> Signed-off-by: Coly Li <colyli@suse.de>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> ---
> Changelog:
> v2: remove the change of trusted key related operation.
> v1: initial version.
>
>   Documentation/security/keys/trusted-encrypted.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
> index 9483a7425ad5..1da879a68640 100644
> --- a/Documentation/security/keys/trusted-encrypted.rst
> +++ b/Documentation/security/keys/trusted-encrypted.rst
> @@ -39,10 +39,9 @@ With the IBM TSS 2 stack::
>   
>   Or with the Intel TSS 2 stack::
>   
> -  #> tpm2_createprimary --hierarchy o -G rsa2048 -o key.ctxt
> +  #> tpm2_createprimary --hierarchy o -G rsa2048 -c key.ctxt
>     [...]
> -  handle: 0x800000FF
> -  #> tpm2_evictcontrol -c key.ctxt -p 0x81000001
> +  #> tpm2_evictcontrol -c key.ctxt 0x81000001
>     persistentHandle: 0x81000001
>   
>   Usage::

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


