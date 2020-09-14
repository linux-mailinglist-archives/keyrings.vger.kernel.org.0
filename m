Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7552268EAA
	for <lists+keyrings@lfdr.de>; Mon, 14 Sep 2020 16:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgINO6f (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Sep 2020 10:58:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24011 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726702AbgINO6P (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 14 Sep 2020 10:58:15 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08EEWJ84130719
        for <keyrings@vger.kernel.org>; Mon, 14 Sep 2020 10:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=Eg5pTzzAeOgEE+kKZulRZPZMoks11s9ZZMjuBkkWXrE=;
 b=TZaF7rxUECxpzVXonYt8zDJ2SpNeQpIYi1EpdDdL3kDNG2LuvhbL+sAt+nMMSTuhtR2B
 q47BC1tquil74dnqmi4wradCSYIoX0+4JRlnVzGIe1dBwFmrnlaMOH7xvvetZcpayIQI
 yoIObFBKhimBmA8j2BinB8lrNL9lgT9vXSZJDh7oXSJU5Brxu/8C4q7LCfb5NNRl00v9
 pHrulTslsVoFCaI7QKyUM3CfU9xgfJdr6jE89+/K3IwZeHotN1RN2I/jYS14k4g8ToTF
 b/OVGQSBt0ueZlAqXKwkCZolvvqP9ziMFhE2k+I9jRbREn7gxnteOPrxxrzsPEm6qG4w fw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33ja4rhaxs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Mon, 14 Sep 2020 10:58:08 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08EEWQLW131585
        for <keyrings@vger.kernel.org>; Mon, 14 Sep 2020 10:58:08 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33ja4rhax4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Sep 2020 10:58:08 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08EEvTaK018295;
        Mon, 14 Sep 2020 14:58:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03fra.de.ibm.com with ESMTP id 33gny8181c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Sep 2020 14:58:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08EEw4Gr29032880
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Sep 2020 14:58:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 34568AE053;
        Mon, 14 Sep 2020 14:58:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6C93FAE056;
        Mon, 14 Sep 2020 14:58:03 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.110.17])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon, 14 Sep 2020 14:58:03 +0000 (GMT)
Message-ID: <aa7a1f5ae2b44b0f87ceca7e7719c80346b71cac.camel@linux.ibm.com>
Subject: Re: [PATCH] keys: Print more useful debug info if encryption algo
 is not available
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Anatol Pomozov <anatol.pomozov@gmail.com>, keyrings@vger.kernel.org
Date:   Mon, 14 Sep 2020 10:58:02 -0400
In-Reply-To: <20200825215040.307947-1-anatol.pomozov@gmail.com>
References: <20200825215040.307947-1-anatol.pomozov@gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-14_04:2020-09-14,2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=914 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140115
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Anatol,

On Tue, 2020-08-25 at 14:50 -0700, Anatol Pomozov wrote:
> Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>

The subject should be prefixed with "encrypted-keys:".   The patch
description is missing.

Mimi


