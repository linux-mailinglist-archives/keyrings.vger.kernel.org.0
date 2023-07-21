Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9696A75D664
	for <lists+keyrings@lfdr.de>; Fri, 21 Jul 2023 23:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjGUVUy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 Jul 2023 17:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjGUVUw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 Jul 2023 17:20:52 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374C0123;
        Fri, 21 Jul 2023 14:20:52 -0700 (PDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36LL7xdT006381;
        Fri, 21 Jul 2023 21:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cerl8JoRzYTLeZVOg1Rb7TGweKEVrhtE6Xio6YNlz2s=;
 b=kWMsbKdI1egElN0yAiAUvVKTH1WvC1eZC6+PelaTyAiXRf9G9sJED0+J9ymvlCsx6Lrg
 yRgfnMD4Uo2y6X/pAzc7uaE0wGqR9fZRnzrQUbb4p8MGkDgdHi2BxWeIWfWnVwRNuYKw
 eeYNa/B6ksLzxKfX4Am9rB/HWp+A9WGQh7Pmz0X5b6xLeBBBJBdr3oR+fLzwVRH6njC9
 wyrlPCoxJ3yWO825jW7av4wHMRFkz/tUVDs/odDVLSheie3/XY2Kvtf4VN9DcVzUhFEE
 x9joYuA94vV+sUxuPQ3DAegt0Dd27t2VrQhpmWZc1Qg9Q7064+OSPfc79moL72e9917K HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rypxsypuy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 21:15:38 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36LL8lgg007997;
        Fri, 21 Jul 2023 21:15:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rypxsypu9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 21:15:37 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36LK46iS029098;
        Fri, 21 Jul 2023 21:15:36 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
        by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv6sn1r0y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 21:15:36 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
        by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36LLFZZf31457756
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jul 2023 21:15:35 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5B83E58055;
        Fri, 21 Jul 2023 21:15:35 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 249D158043;
        Fri, 21 Jul 2023 21:15:35 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.29.102])
        by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Fri, 21 Jul 2023 21:15:35 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org,
        okozina@redhat.com, dkeefe@redhat.com
Subject: [PATCH v5 0/3 RESEND] sed-opal: keyrings, discovery, revert, key store
Date:   Fri, 21 Jul 2023 16:15:31 -0500
Message-Id: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f1868qvCuH18xFUHMDc3mxWQ3LhYwDuj
X-Proofpoint-ORIG-GUID: dYOUrODjqTc5HL2V-_xeejk8TuoFbrQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=824 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210186
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

This patchset has gone through numerous rounds of review and
all comments/suggetions have been addressed. The reviews have
covered all relevant areas including reviews by block and keyring
developers as well as the SED Opal maintainer. The last
patchset submission has not solicited any responses in the
six weeks since it was last distributed. The changes are
generally useful and ready for inclusion.

TCG SED Opal is a specification from The Trusted Computing Group
that allows self encrypting storage devices (SED) to be locked at
power on and require an authentication key to unlock the drive.

The current SED Opal implementation in the block driver
requires that authentication keys be provided in an ioctl
so that they can be presented to the underlying SED
capable drive. Currently, the key is typically entered by
a user with an application like sedutil or sedcli. While
this process works, it does not lend itself to automation
like unlock by a udev rule.

The SED block driver has been extended so it can alternatively
obtain a key from a sed-opal kernel keyring. The SED ioctls
will indicate the source of the key, either directly in the
ioctl data or from the keyring.

Two new SED ioctls have also been added. These are:
  1) IOC_OPAL_REVERT_LSP to revert LSP state
  2) IOC_OPAL_DISCOVERY to discover drive capabilities/state

change log v5:
        - rebase to for-6.5/block

change log v4:
        - rebase to 6.3-rc7
        - replaced "255" magic number with U8_MAX

change log:
        - rebase to 6.x
        - added latest reviews
        - removed platform functions for persistent key storage
        - replaced key update logic with key_create_or_update()
        - minor bracing and padding changes
        - add error returns
        - opal_key structure is application provided but kernel
          verified
        - added brief description of TCG SED Opal


Greg Joyce (3):
  block: sed-opal: Implement IOC_OPAL_DISCOVERY
  block: sed-opal: Implement IOC_OPAL_REVERT_LSP
  block: sed-opal: keyring support for SED keys

 block/Kconfig                 |   2 +
 block/opal_proto.h            |   4 +
 block/sed-opal.c              | 252 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   5 +
 include/uapi/linux/sed-opal.h |  25 +++-
 5 files changed, 282 insertions(+), 6 deletions(-)


base-commit: 1341c7d2ccf42ed91aea80b8579d35bc1ea381e2
-- 
gjoyce@linux.vnet.ibm.com

