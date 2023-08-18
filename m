Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451EF780ED1
	for <lists+keyrings@lfdr.de>; Fri, 18 Aug 2023 17:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240875AbjHRPNh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 18 Aug 2023 11:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378082AbjHRPN3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 18 Aug 2023 11:13:29 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E3035A1;
        Fri, 18 Aug 2023 08:13:28 -0700 (PDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IEqorR012483;
        Fri, 18 Aug 2023 15:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=8h4zR/PmlOXLOh62i2/d1IwWmmQUDQiqemDALncI/7I=;
 b=UHUoqQKhmemCloOoIvoSAZ96I3jeaaL+bCp4TUEf8L6M2gUEv03YStrbUxvFw4xQ+N24
 pJXA/tObzOyukRDflSMVmcvVKHaZkO3yqxJXclo2M0zn4jikAA6L2x1UuvNHsjv0/7qj
 YoIoqRR1+uLoOQ4F2NSVtp7+I9wFNwt31R4Yu5a3nP/GGME/Q+nBMEG5xbFw+wejxfAr
 MtHaYtMuKoTFyWoKnbpw3YL+srNtpdzOZWfoQfFv691Vcf/3q5W1vynd0nmq8bhsrxzj
 FAglYZFK+9W/A6Zq4TZ6HTumVwrDTLaXbHr5UStql8muJBm0xlqV8g0/6EfMgGCH8HPd Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sjasygmm8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Aug 2023 15:12:59 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37IExWX6004564;
        Fri, 18 Aug 2023 15:12:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sjasygmm0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Aug 2023 15:12:59 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37IDkkeo007871;
        Fri, 18 Aug 2023 15:12:58 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
        by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwkyss4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Aug 2023 15:12:58 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
        by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37IFCwxO7143978
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Aug 2023 15:12:58 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 63C9A5805A;
        Fri, 18 Aug 2023 15:12:58 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BFC9B5805D;
        Fri, 18 Aug 2023 15:12:57 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.60.97])
        by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Fri, 18 Aug 2023 15:12:57 +0000 (GMT)
Message-ID: <0d768e42d671b2ff84ff10bc3f84531f15a5c57c.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
From:   Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reply-To: gjoyce@linux.vnet.ibm.com
To:     Hannes Reinecke <hare@suse.de>, linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org, okozina@redhat.com, dkeefe@redhat.com
Date:   Fri, 18 Aug 2023 10:12:57 -0500
In-Reply-To: <997311ee-a63b-75ea-dedc-78ed2f90b322@suse.de>
References: <20230721211949.3437598-1-gjoyce@linux.vnet.ibm.com>
         <20230721211949.3437598-2-gjoyce@linux.vnet.ibm.com>
         <997311ee-a63b-75ea-dedc-78ed2f90b322@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yNeQjn14sXgQ7XuwyB1a9nMwdPHPfiHA
X-Proofpoint-ORIG-GUID: FLNOAWhQXsVjZYPAQMFl-x8uoNJ_kM2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=944 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180137
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2023-08-17 at 07:42 +0200, Hannes Reinecke wrote:
> On 7/21/23 23:19, gjoyce@linux.vnet.ibm.com wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Add read and write functions that allow SED Opal keys to stored
> > in a permanent keystore.
> > 
> Probably state that these are dummy functions only.
> 
> > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > ---
> >   block/Makefile               |  2 +-
> >   block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> >   include/linux/sed-opal-key.h | 15 +++++++++++++++
> >   3 files changed, 40 insertions(+), 1 deletion(-)
> >   create mode 100644 block/sed-opal-key.c
> >   create mode 100644 include/linux/sed-opal-key.h
> > 
> > diff --git a/block/Makefile b/block/Makefile
> > index 46ada9dc8bbf..ea07d80402a6 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
> >   obj-$(CONFIG_BLK_WBT)		+= blk-wbt.o
> >   obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
> >   obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
> > -obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
> > +obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o sed-opal-key.o
> >   obj-$(CONFIG_BLK_PM)		+= blk-pm.o
> >   obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-
> > crypto-profile.o \
> >   					   blk-crypto-sysfs.o
> > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > new file mode 100644
> > index 000000000000..16f380164c44
> > --- /dev/null
> > +++ b/block/sed-opal-key.c
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * SED key operations.
> > + *
> > + * Copyright (C) 2022 IBM Corporation
> > + *
> > + * These are the accessor functions (read/write) for SED Opal
> > + * keys. Specific keystores can provide overrides.
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/errno.h>
> > +#include <linux/sed-opal-key.h>
> > +
> > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> 
> Hmm. We do have security/keys, which is using a 'struct key' for
> their operations.
> Why don't you leverage that structure?
> 
> Cheers,
> 
> Hannes

Thanks for the review Hannes. Are you referring to struct key in
linux/key.h? If so, that may a bit heavy for just specifying key data
and key length.

-Greg

