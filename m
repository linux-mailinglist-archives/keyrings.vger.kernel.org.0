Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26C12458A9
	for <lists+keyrings@lfdr.de>; Sun, 16 Aug 2020 19:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgHPRId (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 16 Aug 2020 13:08:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30424 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726825AbgHPRIc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 16 Aug 2020 13:08:32 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07GH36N7022608;
        Sun, 16 Aug 2020 13:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=4nXD3aImX6M64sQgFxiSKLNFtYkND9wGT+mb610YBpM=;
 b=KyeXjMgm510MnIEDW5c8NBtutiuAAWGxDzP6EB0YgU5TlpmtU3A7t6ve8r1/fZ0pTYev
 frwhBxa27Q2ienHvEgY45Mrwgqn1rDyfYRVNxJxxn/BKrdKZQfCkVBq+BNIom+M2ApD1
 b8ikOChjOn/7zm2CBEPheQer5hallhk24L/tQ+bwyIc0byAgaHuxBhhr5Qr9KmQa/FP4
 qSEN30WhErX3/leJh4uaKas3PdS6COZoONq+chAINTrBHsQJVJneUc1RlOxp85Z7tgNV
 mTJ/tF2q007hLUveAnmV3AwyIA+4fM6HYSamXAVSRZkYUN7hqg5zj0w9/M5aMzRu0EjH ZQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y4kw4juj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 13:08:24 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07GH2ZYh021533;
        Sun, 16 Aug 2020 17:08:23 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma02wdc.us.ibm.com with ESMTP id 32x7b8auj3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 17:08:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07GH8McF62521822
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 16 Aug 2020 17:08:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9830A78060;
        Sun, 16 Aug 2020 17:08:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2D3DB7805E;
        Sun, 16 Aug 2020 17:08:21 +0000 (GMT)
Received: from [153.66.254.174] (unknown [9.80.233.55])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Sun, 16 Aug 2020 17:08:20 +0000 (GMT)
Message-ID: <1597597699.8344.11.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND] docs: update trusted-encrypted.rst
From:   James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To:     Coly Li <colyli@suse.de>, Stefan Berger <stefanb@linux.ibm.com>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Date:   Sun, 16 Aug 2020 10:08:19 -0700
In-Reply-To: <096636f4-a928-dd00-dba6-216651c3d63b@suse.de>
References: <20200815075143.47082-1-colyli@suse.de>
         <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
         <096636f4-a928-dd00-dba6-216651c3d63b@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-16_07:2020-08-14,2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=799
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008160141
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-08-17 at 01:01 +0800, Coly Li wrote:
> On 2020/8/17 00:06, Stefan Berger wrote:
> > On 8/15/20 3:51 AM, Coly Li wrote:
[...]
> > >     Usage::
> > > @@ -115,7 +114,7 @@ append 'keyhandle=0x81000001' to statements
> > > between quotes, such as
> > 
> > 
> > A note in this file states this:
> > 
> > Note: When using a TPM 2.0 with a persistent key with handle
> > 0x81000001, append 'keyhandle=0x81000001' to statements between
> > quotes, such as "new 32 keyhandle=0x81000001".
> > 
> > Now if someone was (still) interested in TPM 1.2 then the below
> > changes you are proposing wouldn't work for them. Maybe you should
> > adapt the note to state that these keyhandle=... should be removed
> > for the TPM 1.2 case.
> > 
> 
> I agree. Indeed I have no idea why number 0x81000001 is used, and I
> don't have practice experience with TPM 1.2. Now the purpose of this
> patch accomplished: experts response and confirm my guess :-)

It was the conventional persistent value for the RSA 2048 version of
the primary storage seed.  Originally the PC spec required the
manufacturer provision this on all TPM 2.0 based PC class systems. 
Unfortunately in spite of it being in the Windows Hardware guide no
manufacturer ever did, meaning you either have to create it yourself or
do something different.  Because of usability problems, every consumer
of TPM key function has opted to do something different, namely derive
the EC primary if no parent is specified.

James

