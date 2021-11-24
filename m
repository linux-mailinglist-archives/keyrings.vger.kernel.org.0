Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FC245C13D
	for <lists+keyrings@lfdr.de>; Wed, 24 Nov 2021 14:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347708AbhKXNPt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Nov 2021 08:15:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9632 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348694AbhKXNN4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Nov 2021 08:13:56 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AOBm0jq004725;
        Wed, 24 Nov 2021 13:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=BdiExVAdatLHkjItbjJaPTR1gsgrwTgcXvTxI9FIeVw=;
 b=JNAX6QEBZT7OWffOxFgyqMErIsK+wjCURw01kDnntdIX6lUTplC3/+60pMdODRLBLD4n
 dU6RORYMM1YneOEpEYG/V20rznSJnEiZzvKAjtzJWEtUyOBP/Pm3r5jA/IcK6aAgBNNL
 Mw5raUTgitan3XVTV3g8cMBb6CvNt2ajXU6++iiOu2sIko0zgM4eYoZ6t0NfXWFTJvrL
 kp2C2EuT3+Y/UZupnF3zLNWkCuOWlXI7kNu6qbHnWH/ZiGmLkXckgYYDd+j3hzxQINwx
 ++GZGxZSBPlskPwiyAEbSQl66x+YbF9ihFskzpbXLMpN+gLqmmQ9LS/NZBRSdsdgPEG5 gw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3chmu19q55-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Nov 2021 13:10:23 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AOCxf1G003362;
        Wed, 24 Nov 2021 13:10:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3chmu19q4f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Nov 2021 13:10:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AOD8dOD024202;
        Wed, 24 Nov 2021 13:10:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma01fra.de.ibm.com with ESMTP id 3cern9rhxp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Nov 2021 13:10:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1AODAErK18219516
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Nov 2021 13:10:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 25FA5A405B;
        Wed, 24 Nov 2021 13:10:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B4B75A4054;
        Wed, 24 Nov 2021 13:10:10 +0000 (GMT)
Received: from sig-9-65-87-230.ibm.com (unknown [9.65.87.230])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 24 Nov 2021 13:10:10 +0000 (GMT)
Message-ID: <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Philipp Rudo <prudo@redhat.com>
Cc:     Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
        Nayna <nayna@linux.vnet.ibm.com>, keyrings@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jessica Yu <jeyu@kernel.org>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Frank van der Linden <fllinden@amazon.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Daniel Axtens <dja@axtens.net>, buendgen@de.ibm.com
Date:   Wed, 24 Nov 2021 08:10:10 -0500
In-Reply-To: <20211124120950.57c10a9f@rhtmp>
References: <cover.1635948742.git.msuchanek@suse.de>
         <87czneeurr.fsf@dja-thinkpad.axtens.net>
         <20211105131401.GL11195@kunlun.suse.cz>
         <87a6ifehin.fsf@dja-thinkpad.axtens.net>
         <20211108120500.GO11195@kunlun.suse.cz>
         <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
         <20211112083055.GA34414@kunlun.suse.cz>
         <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
         <20211116095343.GG34414@kunlun.suse.cz>
         <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
         <20211119111823.GC34414@kunlun.suse.cz>
         <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
         <20211124120950.57c10a9f@rhtmp>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W1hmjShiQJ4RGVtO1-gItT9P1q_sYdp7
X-Proofpoint-ORIG-GUID: DsbinSytcni9CLx-5b8acxCYrTickBxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=862
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240073
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2021-11-24 at 12:09 +0100, Philipp Rudo wrote:
> Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely on all
> architectures using the same mechanism and thus reduce maintenance cost.
> On the way there he even makes some absolutely reasonable improvements
> for everybody.
> 
> Why is that so controversial? What is the real problem that should be
> discussed here?

Nothing is controversial with what Michal wants to do.  I've already
said, "As for adding KEXEC_SIG appended signature support on PowerPC
based on the s390 code, it sounds reasonable."

thanks,

Mimi

