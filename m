Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0AA43D7F1
	for <lists+keyrings@lfdr.de>; Thu, 28 Oct 2021 02:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbhJ1APQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Oct 2021 20:15:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11614 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229437AbhJ1APQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Oct 2021 20:15:16 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RNGrmZ020299;
        Thu, 28 Oct 2021 00:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JQfn+YDEuSEBpiuw2kNP5wGK5U/Tl6YuZKRspV0yObo=;
 b=lFbYy2j9R9rePXTiquYiTjU8OiXzC1sGz4V37dlpbiZkYy9j9l4TH7o9RHyLgtTeMoWy
 2rr/JeTUgNh2wtyLfL1B5Y7TiyF9iWIs9zxHDMDp9/LbEdhapqJALUrvRNSqgDaUKAzW
 QNBdESC+f7Ad/+2TQrQUhTX76TZcmnSp2Nb2DYF9bbZ5KMK5PT8kO782X06noECyefu4
 KYhpxzOPau4gyjQ2Lqwo0JhSTCzTEo8FB0qFmK+dxZr45vwwKMFGMwz59kaL0C872D6j
 8sqSC+ckFo3HsoDWs93N4F6QSS4A/jlbw8PqxPvtstnpklIcCUQkRO844r8dFjSx2Uf+ UA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3byga78rhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Oct 2021 00:12:44 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19S007hO008318;
        Thu, 28 Oct 2021 00:12:43 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3byga78rhc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Oct 2021 00:12:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19S090PF016110;
        Thu, 28 Oct 2021 00:12:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma06ams.nl.ibm.com with ESMTP id 3bx4f1kra2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Oct 2021 00:12:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19S0Ccxt59900382
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Oct 2021 00:12:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9F45B4204B;
        Thu, 28 Oct 2021 00:12:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B815F42045;
        Thu, 28 Oct 2021 00:12:37 +0000 (GMT)
Received: from sig-9-65-78-33.ibm.com (unknown [9.65.78.33])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 28 Oct 2021 00:12:37 +0000 (GMT)
Message-ID: <2ed333a24e8a3009acd4ef406ff8c2c39e95e2cf.camel@linux.ibm.com>
Subject: Re: [PATCH] certs: system_keyring.c: clean up kernel-doc
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Date:   Wed, 27 Oct 2021 20:12:37 -0400
In-Reply-To: <20211025003813.5164-1-rdunlap@infradead.org>
References: <20211025003813.5164-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3YJAV5kM681TurNM6-Vp9HwanSc_DIT9
X-Proofpoint-ORIG-GUID: UsK2DJ-W5IiPRMvBCyuGf4SasP5ZRTql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1011 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270131
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Randy,

On Sun, 2021-10-24 at 17:38 -0700, Randy Dunlap wrote:
> Fix some kernel-doc warnings in system_keyring.c:
> 
> system_keyring.c:43: warning: expecting prototype for restrict_link_to_builtin_trusted(). Prototype was for restrict_link_by_builtin_trusted() instead
> system_keyring.c:77: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Allocate a struct key_restriction for the "builtin and secondary trust"
> system_keyring.c:77: warning: missing initial short description on line:
>  * Allocate a struct key_restriction for the "builtin and secondary trust"
> 
> Fix the warnings above and then see & fix these:
> 
> system_keyring.c:43: warning: No description found for return value of 'restrict_link_by_builtin_trusted'
> system_keyring.c:62: warning: No description found for return value of 'restrict_link_by_builtin_and_secondary_trusted'
> system_keyring.c:190: warning: No description found for return value of 'verify_pkcs7_message_sig'
> system_keyring.c:275: warning: No description found for return value of 'verify_pkcs7_signature'
> 
> This still leaves non-exported two functions that do not have their
> functions parameters documented: restrict_link_by_builtin_trusted() and
> restrict_link_by_builtin_and_secondary_trusted().
> 
> Use '%' preceding constants in kernel-doc notation.
> 
> Use "builtin" consistently instead of "built in" or "built-in".
> 
> Don't use "/**" to begin a comment that is not in kernel-doc format.
> 
> Document the use of VERIFY_USE_SECONDARY_KEYRING and
> VERIFY_USE_PLATFORM_KEYRING.
> 

Thanks, Randy.  Even after these changes there are additional kernel
doc warnings.   Missing are the parameter definitions for
restrict_link_by_builtin_trusted() and
restrict_link_by_builtin_and_secondary_trusted().   The first three are
exactly the same as for restrict_link_by_signature().  The fourth parm
needs to be tweaked.

Mimi

