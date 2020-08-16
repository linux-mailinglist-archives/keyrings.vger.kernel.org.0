Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFE42458AE
	for <lists+keyrings@lfdr.de>; Sun, 16 Aug 2020 19:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgHPRM3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 16 Aug 2020 13:12:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30098 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726699AbgHPRM2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 16 Aug 2020 13:12:28 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07GH35XV022562;
        Sun, 16 Aug 2020 13:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=RsfgZtUQAo1LpXzLcpX2+GUrJbZ2v1vQ8EAR++E51mA=;
 b=WHLKpEAgjyUYv/vRWCmVwmfbhIrvwo5ZaFXbmF0F0rkQQluHxfiaLijKgdJOTPVkqyrt
 QD8wjxhKrP8Y8VRcA3G2DZBfcn+TqHnsxXj+gd0UNBtYWEyMqBrhOLRrJaTcR8NuHPwf
 /ihy+juFOUwRpE5qISP+jXlv0WAvqDtF99gY6s5SCLn8ioW/ZLQqOI/gK4/WdCToZbTx
 F4hrBXVbvkJXu/TX2V0ulIBTs5dE0iREb2IX6+11fe1dhYYDQleqwq0bJojt7ysU2MPI
 hrVwp4wvR3tvzbLacx57nwVtzMQOjePRCePztVieARXy6wC9mOFKPmZohQTWJeCR6HFC MQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y4kw4mqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 13:12:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07GH8ft6009647;
        Sun, 16 Aug 2020 17:12:22 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma03wdc.us.ibm.com with ESMTP id 32x7b8jvs9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 17:12:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07GHCLIm36700582
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 16 Aug 2020 17:12:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 94D4278068;
        Sun, 16 Aug 2020 17:12:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3E0127805F;
        Sun, 16 Aug 2020 17:12:15 +0000 (GMT)
Received: from [153.66.254.174] (unknown [9.80.233.55])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Sun, 16 Aug 2020 17:12:14 +0000 (GMT)
Message-ID: <1597597933.8344.13.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND] docs: update trusted-encrypted.rst
From:   James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To:     Coly Li <colyli@suse.de>
Cc:     Stefan Berger <stefanb@linux.ibm.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Date:   Sun, 16 Aug 2020 10:12:13 -0700
In-Reply-To: <f9d4c4a9-5059-eae2-bc89-51f16e8ca4d9@suse.de>
References: <20200815075143.47082-1-colyli@suse.de>
         <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
         <1597595769.8344.7.camel@linux.ibm.com>
         <f9d4c4a9-5059-eae2-bc89-51f16e8ca4d9@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-16_07:2020-08-14,2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=801
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008160141
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-08-17 at 00:57 +0800, Coly Li wrote:
> On 2020/8/17 00:36, James Bottomley wrote:
> > On Sun, 2020-08-16 at 12:06 -0400, Stefan Berger wrote:
> > [...]
> > > A note in this file states this:
> > > 
> > > Note: When using a TPM 2.0 with a persistent key with handle
> > > 0x81000001, append 'keyhandle=0x81000001' to statements between
> > > quotes, such as "new 32 keyhandle=0x81000001".
> > > 
> > > Now if someone was (still) interested in TPM 1.2 
> > > adapt the  note to state that these keyhandle=... should be
> > > removed for the TPM 1.2 case.
> > 
> > Actually, I also have a plan to match what userspace does and
> > simply assume a keyhandle of 40000001 (generate an EC Storage
> > Primary Key on the fly) if it's not specified, which will make the
> > TPM1.2 and 2.0 versions of this the same.  Unfortunately the
> > necessary precursor patches are taking an age to get upstream.
> 
> Hi James,
> 
> Do you have a plan to push such patches into upstream soon? If yes
> than I may wait for your patch and withdraw this one.

Well, as I said above it depends on not yet upstream precursor patches.
 They have been pending for about a year, so I've no real idea of the
timeline.

James

