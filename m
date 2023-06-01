Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6475071F615
	for <lists+keyrings@lfdr.de>; Fri,  2 Jun 2023 00:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjFAWh7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Jun 2023 18:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjFAWh7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Jun 2023 18:37:59 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D948512C;
        Thu,  1 Jun 2023 15:37:57 -0700 (PDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351MKwYH020630;
        Thu, 1 Jun 2023 22:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=byFrTQuuCLtviO2Lheb8ga1IK+WGPzcqEBnnyC7+NnY=;
 b=XqHg8+iYwcQsWYcJth1Pqs8jg+XEQujoVNg3lAXcpah1VsLIQgRfzPfBmyOmPrbN5W4N
 Utx1GJtXPj899NpDaOtOgiaqxdfKgFxOmRLk4pxxOULTays9YZF39RoFUKTjwwQoFSSB
 jBm5Zv0Fx+vzqx/oN0aDCizloiMjNItbGw2/XLC5KXisHsZBNF3LY9oAkzIlqX9BpVkc
 IlTubTkPzfR1d1nREs30vLwQP6ojPLW8elhfY4CdlTFQs/zg28ARF+hHHN/NXh6aK2lI
 XmGJ344iv4T+jAbSFb39a+RCVCTcmKdLMYmdcw1xeCuKmvg4MJV0c93u8I8sxsrG6S1Y Gw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qy4208akx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jun 2023 22:37:47 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 351LKNW6009524;
        Thu, 1 Jun 2023 22:37:47 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
        by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3qu9g645r6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jun 2023 22:37:46 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
        by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351MbkX021102966
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 1 Jun 2023 22:37:46 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2C1F958064;
        Thu,  1 Jun 2023 22:37:46 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EC87858066;
        Thu,  1 Jun 2023 22:37:45 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.58.163])
        by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  1 Jun 2023 22:37:45 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v4 RESEND 0/3] sed-opal: keyrings, discovery, revert, key store
Date:   Thu,  1 Jun 2023 17:37:42 -0500
Message-Id: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Sjoy-WYTuxEesjBJ3QRuoKHNVh63UnMb
X-Proofpoint-GUID: Sjoy-WYTuxEesjBJ3QRuoKHNVh63UnMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=907 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010194
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
all comments/suggetions have been addressed. I believe that
this patchset is ready for inclusion.

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

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
base-commit: 6a8f57ae2eb07ab39a6f0ccad60c760743051026
-- 
gjoyce@linux.vnet.ibm.com

