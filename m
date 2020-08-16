Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C72245876
	for <lists+keyrings@lfdr.de>; Sun, 16 Aug 2020 18:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgHPQG4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 16 Aug 2020 12:06:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22282 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726407AbgHPQGy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 16 Aug 2020 12:06:54 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07GG2FDE148741;
        Sun, 16 Aug 2020 12:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=G1J9oM2w5VWeZ9aqg+YGQQtjK4Y/nLoJ4itoQujL5Ds=;
 b=pL0NxLQUOpqHXnm3X0cTJbLjeRb8WLoWynpGTnNiDmQ8R7AM5UX3HPHx+NJKRMhsPlGN
 GUfAmm27TbNxY+rDyiSgOjdkTb/hZ0WcOASTYKEgU73/ub72AyiB5q4f49D8XNc8q+Fn
 8oLO/RvJrwCmvEeDTjwSKb+Aq+EY+YFXGQarqyKG+siPGJHTpM+QhNKAXB1UsQNlfJUa
 OGQ3gcIFnJsUaijY1NF/VhT6RiRQnwfoSkRsL20U++/oLhsq+abPFVz7TEAN8EpO+7UM
 NbaMjGau5C1OUDfdrUo9QoXXakyAgDUAS2jJBbQ4NzAj8a5Q3ru5UL2cFEGMjt7TVhNK /A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y24he898-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 12:06:48 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07GG4UHN005845;
        Sun, 16 Aug 2020 16:06:47 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma01dal.us.ibm.com with ESMTP id 32x7b8n7be-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 16:06:47 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07GG6fKB55181628
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 16 Aug 2020 16:06:41 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BA71B6A04D;
        Sun, 16 Aug 2020 16:06:45 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4DAFB6A04F;
        Sun, 16 Aug 2020 16:06:40 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Sun, 16 Aug 2020 16:06:40 +0000 (GMT)
Subject: Re: [PATCH RESEND] docs: update trusted-encrypted.rst
To:     Coly Li <colyli@suse.de>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
References: <20200815075143.47082-1-colyli@suse.de>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
Date:   Sun, 16 Aug 2020 12:06:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200815075143.47082-1-colyli@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-16_07:2020-08-14,2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008160128
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 8/15/20 3:51 AM, Coly Li wrote:
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
>   Documentation/security/keys/trusted-encrypted.rst | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
> index 9483a7425ad5..442a2775156e 100644
> --- a/Documentation/security/keys/trusted-encrypted.rst
> +++ b/Documentation/security/keys/trusted-encrypted.rst
> @@ -39,10 +39,9 @@ With the IBM TSS 2 stack::
>   
>   Or with the Intel TSS 2 stack::
>   
> -  #> tpm2_createprimary --hierarchy o -G rsa2048 -o key.ctxt
> +  #> tpm2_createprimary --hierarchy o -G rsa2048 key.ctxt
>     [...]
> -  handle: 0x800000FF


Are you sure about this? My documentation for 4.1.3 on F32 states


-c, --key-context=FILE:

          The file path to save the object context of the generated 
primary object.



> -  #> tpm2_evictcontrol -c key.ctxt -p 0x81000001
> +  #> tpm2_evictcontrol -c key.ctxt 0x81000001
>     persistentHandle: 0x81000001


This seems correct.


>   
>   Usage::
> @@ -115,7 +114,7 @@ append 'keyhandle=0x81000001' to statements between quotes, such as


A note in this file states this:

Note: When using a TPM 2.0 with a persistent key with handle 0x81000001,
append 'keyhandle=0x81000001' to statements between quotes, such as
"new 32 keyhandle=0x81000001".

Now if someone was (still) interested in TPM 1.2 then the below changes 
you are proposing wouldn't work for them. Maybe you should adapt the 
note to state that these keyhandle=... should be removed for the TPM 1.2 
case.

>   
>   ::
>   
> -    $ keyctl add trusted kmk "new 32" @u
> +    $ keyctl add trusted kmk "new 32 keyhandle=0x81000001" @u
>       440502848
>   
>       $ keyctl show
> @@ -138,7 +137,7 @@ append 'keyhandle=0x81000001' to statements between quotes, such as
>   
>   Load a trusted key from the saved blob::
>   
> -    $ keyctl add trusted kmk "load `cat kmk.blob`" @u
> +    $ keyctl add trusted kmk "load `cat kmk.blob` keyhandle=0x81000001" @u
>       268728824
>   
>       $ keyctl print 268728824


