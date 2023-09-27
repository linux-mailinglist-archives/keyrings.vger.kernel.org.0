Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC34D7B0A03
	for <lists+keyrings@lfdr.de>; Wed, 27 Sep 2023 18:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbjI0Q0g (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Sep 2023 12:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjI0Q0g (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Sep 2023 12:26:36 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F83F3;
        Wed, 27 Sep 2023 09:26:34 -0700 (PDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RG9R0U029999;
        Wed, 27 Sep 2023 16:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=lll8jEsZ/2uOvCtv+bjAVqxB3opWrfKxHma7QbwBcUg=;
 b=jGqdH9z9AeaDjz9jBSX1RyguHypUs75AWDFYu3Ps0TovxzIy9edK3KlBOzYfM0vHbvqu
 KkwSH8o/M4mv1m/leVuelZbwapVWTSCyUfH3631/NJFipmf9x936ejHC9CzJXD6qiktC
 jy/ozWv9Z5N/MmGvDJx0l2ouqhmEV7GNU4kcGAtu09vXXXoLy5RSBam7WMvvItNXJXi6
 G1Fxs1ylzjFzLqijnZ5vibbW5z30ULkjGlI073q74kDUjjL1UyXFQy+DNFd+Z3f09jxV
 8nyMXYaqYHkSwzotmnwsYaE9yIpwmuRLgFveINqTBc9MV2Bnsusacm2WB4Pwjh967cxG ag== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnh8vph3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Sep 2023 16:26:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
        by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38RF94cQ008456;
        Wed, 27 Sep 2023 16:26:20 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
        by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3taabsw8m5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Sep 2023 16:26:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
        by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38RGQJmG53281028
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Sep 2023 16:26:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3A2365805F;
        Wed, 27 Sep 2023 16:26:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 09F9D5805E;
        Wed, 27 Sep 2023 16:26:19 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.94.59])
        by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Wed, 27 Sep 2023 16:26:18 +0000 (GMT)
Message-ID: <2d9b580c1507aea010f2a4ab293b8d2e5529f5ad.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
From:   Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reply-To: gjoyce@linux.vnet.ibm.com
To:     Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>
Cc:     linux-block@vger.kernel.org, jarkko@kernel.org,
        nayna@linux.ibm.com, keyrings@vger.kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        akpm@linux-foundation.org, msuchanek@suse.de,
        linuxppc-dev@lists.ozlabs.org
Date:   Wed, 27 Sep 2023 11:26:18 -0500
In-Reply-To: <def46b96-b881-4806-bd0c-ca0b0462e72e@kernel.dk>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
         <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
         <20230913185951.GA3643621@dev-arch.thelio-3990X>
         <def46b96-b881-4806-bd0c-ca0b0462e72e@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 97BG5Te-AldZuCLITosbftCroGKdeiyY
X-Proofpoint-ORIG-GUID: 97BG5Te-AldZuCLITosbftCroGKdeiyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_10,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=724 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270136
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2023-09-13 at 13:15 -0600, Jens Axboe wrote:
> On 9/13/23 12:59 PM, Nathan Chancellor wrote:
> > Hi Greg,
> > 
> > On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com
> >  wrote:
> > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > 
> > > Define operations for SED Opal to read/write keys
> > > from POWER LPAR Platform KeyStore(PLPKS). This allows
> > > non-volatile storage of SED Opal keys.
> > > 
> > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > 
> > After this change in -next as commit 9f2c7411ada9
> > ("powerpc/pseries:
> > PLPKS SED Opal keystore support"), I see the following crash when
> > booting some distribution configurations, such as OpenSUSE's [1]
> > (the
> > rootfs is available at [2] if necessary):
> 
> I'll drop the series for now - I didn't push out the main branch just
> yet as I don't publish the block next tree until at least at -rc2
> time,
> so it's just in a private branch for now.
> 

Agreed. I need to figure out:

1) best place to use plpks_is_available() to prevent a crash when PLPKS
is not present in pseries.

2) Resolve issues compiling with clang

3) declare plpks_init_var() as static

Greg

