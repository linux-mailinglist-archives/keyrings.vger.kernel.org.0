Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D66E30778A
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 15:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhA1N6w (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 08:58:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36656 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231159AbhA1N6t (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 08:58:49 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10SDc5uR082575;
        Thu, 28 Jan 2021 08:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KICBQdiPxosM6E6Wp9wouZx2T0oKHT2ZNQCMtMecWlc=;
 b=NK00eXfVCLfi33n+uiwv20Q6fj1+lExRhQnpvedZb+qzV/cwDEEYgF2nXOmIbp2zdqtB
 BB6lUnnO/2r6jnM7Mm2u3AscjcHcCI9Rl/xLMkN5k9j1p9EmysGbQLRrUwQJXBBxKSsS
 Q2CNIWboTCYPcq56JvXqbQxKFLz4uZLsH0uNdqHJLBp9Euek0N0rbNTmwX2vw7ZD0Af7
 XwtUrDIS7CgvcCMlKdALp5RxyjkiEa2Pi4D9i3dkgZR0B2bgNNjeRNYTyt9KPTHtTG6h
 nJ9HPGMwsRlTrjS5SK5cOo3H+r5BMRGMbXFkNCVoQFSocL6gpNvn5NWNp5JshUuSgjTO rA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bqtek91m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 08:58:06 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SDfDGC102369;
        Thu, 28 Jan 2021 08:58:05 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bqtek8yp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 08:58:05 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SDohKr026398;
        Thu, 28 Jan 2021 13:58:04 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma01wdc.us.ibm.com with ESMTP id 36a8uhjwr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 13:58:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10SDw4Qm44564752
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 13:58:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14A52AC059;
        Thu, 28 Jan 2021 13:58:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 056B2AC05E;
        Thu, 28 Jan 2021 13:58:03 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 13:58:03 +0000 (GMT)
Subject: Re: [PATCH v4 0/3] Add support for x509 certs with NIST p256 and p192
 keys
To:     David Howells <dhowells@redhat.com>
Cc:     Stefan Berger <stefanb@linux.vnet.ibm.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, patrick@puiterwijk.org
References: <e561f45e-f9be-19a4-478d-15dd003769cd@linux.ibm.com>
 <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
 <3451836.1611825591@warthog.procyon.org.uk>
 <3561487.1611842073@warthog.procyon.org.uk>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <159fe247-b8c9-c718-1c2d-76cfb637f6dc@linux.ibm.com>
Date:   Thu, 28 Jan 2021 08:58:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3561487.1611842073@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-28_08:2021-01-28,2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280065
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/28/21 8:54 AM, David Howells wrote:
> Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>>> This (sub)set is intended to go through the keyrings tree or is it all going
>>> through the crypto tree now?
>>
>> Patch 1/3 should go through 'crypto', the other ones through 'keyrings'.
> Do 2 & 3 depend on 1?


Functionality-wise, yes, compilation-wise, no.

    Stefan


