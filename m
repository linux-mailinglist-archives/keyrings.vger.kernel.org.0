Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF7307764
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 14:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhA1Nqj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 08:46:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2446 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231690AbhA1Nqd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 08:46:33 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10SDVrv3053136;
        Thu, 28 Jan 2021 08:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FIW7EpF0PvahV3vtW9YfNv1yDpDsFfE3dDb87Izovqs=;
 b=b9OnJFdDla0OmuZGlzbRSdqIfQSepOqj8/Q99er0UuaEP1ENZMmLo6fb7xTA1NHcveIH
 fquyMPDEGP5i2VocGu6tO8WwtAaokc9l5kzqbQ3Y/iK1KRYgZlU+q0Drx2vA3xmRqLip
 VHDzrrqFEgEADqgyvoHOPj+o769X6LgSmbOQ8u14kYD/IFn9aeCnlZGT8OmV9F6oz8ap
 22klJx397Z5AE0/4+P0qXxIzi/G838Xe7z6qsre49tKIILyhFX1JYS9Npi2GzPuGlXNa
 cuRp0lSJ236sIJuZ8toACtm6iF2NuKiqbhG7bzJn3angLoLlKn+GNcc74WTmE1VGpg1G Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5te098c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 08:45:46 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SDWanS057933;
        Thu, 28 Jan 2021 08:45:46 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5te097x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 08:45:45 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SDajjn024057;
        Thu, 28 Jan 2021 13:45:45 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma02dal.us.ibm.com with ESMTP id 36a4mc9egh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 13:45:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10SDjiT533620268
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 13:45:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2E279AC05E;
        Thu, 28 Jan 2021 13:45:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1B8DDAC05B;
        Thu, 28 Jan 2021 13:45:44 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 13:45:44 +0000 (GMT)
Subject: Re: [PATCH v4 0/3] Add support for x509 certs with NIST p256 and p192
 keys
To:     David Howells <dhowells@redhat.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, patrick@puiterwijk.org
References: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
 <3451836.1611825591@warthog.procyon.org.uk>
From:   Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <e561f45e-f9be-19a4-478d-15dd003769cd@linux.ibm.com>
Date:   Thu, 28 Jan 2021 08:45:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3451836.1611825591@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-28_08:2021-01-28,2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280065
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/28/21 4:19 AM, David Howells wrote:
> This (sub)set is intended to go through the keyrings tree or is it all going
> through the crypto tree now?


Patch 1/3 should go through 'crypto', the other ones through 'keyrings'.

    Stefan


>
> David
>

