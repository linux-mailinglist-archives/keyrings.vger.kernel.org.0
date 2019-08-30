Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080B5A34FB
	for <lists+keyrings@lfdr.de>; Fri, 30 Aug 2019 12:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfH3Kc0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Aug 2019 06:32:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65076 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726660AbfH3Kc0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 30 Aug 2019 06:32:26 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7UAW9JN046735
        for <keyrings@vger.kernel.org>; Fri, 30 Aug 2019 06:32:24 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2uq0tsavh2-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Fri, 30 Aug 2019 06:32:23 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <keyrings@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Fri, 30 Aug 2019 11:32:10 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 30 Aug 2019 11:32:06 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7UAW5bT51904560
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Aug 2019 10:32:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D22E8A4053;
        Fri, 30 Aug 2019 10:32:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9AB8DA4040;
        Fri, 30 Aug 2019 10:32:04 +0000 (GMT)
Received: from [9.199.196.167] (unknown [9.199.196.167])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 30 Aug 2019 10:32:04 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from
 LTP
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20190830085646.14740-1-hdanton@sina.com>
Date:   Fri, 30 Aug 2019 16:02:03 +0530
Cc:     dhowells@redhat.com, linuxppc-dev@ozlabs.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
References: <20190830085646.14740-1-hdanton@sina.com>
To:     Hillf Danton <hdanton@sina.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19083010-0012-0000-0000-000003449A8B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19083010-0013-0000-0000-0000217EDE26
Message-Id: <C41D3A16-835C-421C-9059-AABB7273E664@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-30_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908300114
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



> On 30-Aug-2019, at 2:26 PM, Hillf Danton <hdanton@sina.com> wrote:
> 
> 
> On Fri, 30 Aug 2019 12:18:07 +0530 Sachin Sant wrote:
>> 
>> [ 8074.351033] BUG: Kernel NULL pointer dereference at 0x00000038
>> [ 8074.351046] Faulting instruction address: 0xc0000000004ddf30
>> [ 8074.351052] Oops: Kernel access of bad area, sig: 11 [#1]
>> [ 8074.351056] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> 
> Add rcu gp.
> 
> --- a/security/keys/request_key_auth.c
> +++ b/security/keys/request_key_auth.c
> @@ -64,12 +64,19 @@ static int request_key_auth_instantiate(
> static void request_key_auth_describe(const struct key *key,
> 				      struct seq_file *m)
> {
> -	struct request_key_auth *rka = dereference_key_rcu(key);
> +	struct request_key_auth *rka;
> +
> +	rcu_read_lock();
> +	rka = dereference_key_rcu(key);
> +	if (!rka)
> +		goto out;
> 

Thanks for the patch. Works for me. Test ran fine without any problems.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin

