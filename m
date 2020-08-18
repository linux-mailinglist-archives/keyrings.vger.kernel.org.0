Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239D6248B59
	for <lists+keyrings@lfdr.de>; Tue, 18 Aug 2020 18:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgHRQTc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Aug 2020 12:19:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10194 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgHRQTa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Aug 2020 12:19:30 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07IG4TWP152846;
        Tue, 18 Aug 2020 12:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=quBROx0PPUmNUPal3IBeWBa32dTEExSGSpW/ECogBQQ=;
 b=hccc7h6Cf0edFtWu1C8knXD/aazJBJEgCqrvoP7Zz1WXHYuP+bRe8GXNtVhzGkGfKIQZ
 2kyYmih1z+wbIV7iVSz6JQWFcL8pAgLZkwLeFTOv6N2h2Oc6ottld5QklShSUNvCP/fX
 fO3aiR21ttVfEIvGMZxjPTbb7H1IXz6xPZQETmIN+rmHRe9a32zT0FLsaoA0C9//qbba
 qNekH9YGZltOfkPKNoYy8sj4JEwM+i0vcxCtZYLILIUlEktySjipcTStCLB/hDORdxvH
 0zD8o/yzcTyqw4i2PGfM5KDj0psVVTz7eB1UhXCJHhnfp5UIKd8Ai3XnP9di0olKiRQ0 ig== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3304tdnewr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Aug 2020 12:19:24 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07IGAPlf009666;
        Tue, 18 Aug 2020 16:19:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03wdc.us.ibm.com with ESMTP id 3304cdw9cq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Aug 2020 16:19:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07IGJMRG1507970
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Aug 2020 16:19:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A13317805F;
        Tue, 18 Aug 2020 16:19:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D93DA7805C;
        Tue, 18 Aug 2020 16:19:20 +0000 (GMT)
Received: from [153.66.254.174] (unknown [9.80.233.55])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 18 Aug 2020 16:19:20 +0000 (GMT)
Message-ID: <1597767558.3898.14.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND] docs: update trusted-encrypted.rst
From:   James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Coly Li <colyli@suse.de>, Stefan Berger <stefanb@linux.ibm.com>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Date:   Tue, 18 Aug 2020 09:19:18 -0700
In-Reply-To: <20200818154444.GA137138@linux.intel.com>
References: <20200815075143.47082-1-colyli@suse.de>
         <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
         <1597595769.8344.7.camel@linux.ibm.com>
         <f9d4c4a9-5059-eae2-bc89-51f16e8ca4d9@suse.de>
         <1597597933.8344.13.camel@linux.ibm.com>
         <20200818154444.GA137138@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_10:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=807 malwarescore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180112
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2020-08-18 at 18:44 +0300, Jarkko Sakkinen wrote:
> On Sun, Aug 16, 2020 at 10:12:13AM -0700, James Bottomley wrote:
> > On Mon, 2020-08-17 at 00:57 +0800, Coly Li wrote:
> > > On 2020/8/17 00:36, James Bottomley wrote:
> > > > On Sun, 2020-08-16 at 12:06 -0400, Stefan Berger wrote:
> > > > [...]
> > > > > A note in this file states this:
> > > > > 
> > > > > Note: When using a TPM 2.0 with a persistent key with handle
> > > > > 0x81000001, append 'keyhandle=0x81000001' to statements
> > > > > between quotes, such as "new 32 keyhandle=0x81000001".
> > > > > 
> > > > > Now if someone was (still) interested in TPM 1.2 
> > > > > adapt the  note to state that these keyhandle=... should be
> > > > > removed for the TPM 1.2 case.
> > > > 
> > > > Actually, I also have a plan to match what userspace does and
> > > > simply assume a keyhandle of 40000001 (generate an EC Storage
> > > > Primary Key on the fly) if it's not specified, which will make
> > > > the TPM1.2 and 2.0 versions of this the same.  Unfortunately
> > > > the necessary precursor patches are taking an age to get
> > > > upstream.
> > > 
> > > Hi James,
> > > 
> > > Do you have a plan to push such patches into upstream soon? If
> > > yes than I may wait for your patch and withdraw this one.
> > 
> > Well, as I said above it depends on not yet upstream precursor
> > patches.  They have been pending for about a year, so I've no real
> > idea of the timeline.
> > 
> > James
> 
> As far as I remember there was not much left in the previous version
> to do. Some time has passed when it was discussed but I recall it was
> mainly about documenting the key format.

Actually, no, unfortunately it's not in that update.  Generating an on-
the-fly primary would involve the cryptographic security patch (same
mechanism as used to generate the null primary).  I was thinking I'd
extract just that piece and use it in a follow on.  So both the rework
of the key format and this extra patch that's not yet even broken out
of the TPM security series are required precursors.

James

