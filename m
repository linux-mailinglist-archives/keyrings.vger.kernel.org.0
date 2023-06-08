Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1398E728877
	for <lists+keyrings@lfdr.de>; Thu,  8 Jun 2023 21:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235886AbjFHT3j (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Jun 2023 15:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235855AbjFHT3f (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Jun 2023 15:29:35 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206912D70;
        Thu,  8 Jun 2023 12:29:33 -0700 (PDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358JPQA9024276;
        Thu, 8 Jun 2023 19:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=xfxvt66nwFhNT4QzvINjK+p/O52X8zvxvkFCZfbndJE=;
 b=JGvikONH7EFb89+dTlXIaylW5xQoyKS5OowWEogCzT46nCVBL3/2FbCX9KsBR7zkFdzG
 fDF7vfAOQKU0m/dPqZdFQ8AYqkXpdT6LDmwuYb5kAxzSZuZUXMUt/JgIYs6PnjPVDMzh
 aTkG6qItZ13mTjInVuXFLneNiESxAsypwVZk+2EANt6TNgd6otTOv9atTcaH4/hYqLRK
 n2sYrqfyNTDuopfy1CmqFcvp6q2qLDGfQhVHavjAn7OnaF100aMDKZlIblaZklW0TBKn
 RKlfSrAULTeku+rD3SlnCeReYnR4yzJrtxhN7WWG7P0Q1tFuX1X+2JF2lsVMYu3U/u6G zg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3n4qr2md-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 19:29:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 358GlLsh032737;
        Thu, 8 Jun 2023 19:29:20 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
        by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3r2a76t7ey-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 19:29:20 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
        by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 358JTJFG66978166
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 8 Jun 2023 19:29:19 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 03D725805A;
        Thu,  8 Jun 2023 19:29:19 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C6EC558052;
        Thu,  8 Jun 2023 19:29:18 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.61.30])
        by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  8 Jun 2023 19:29:18 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v7 0/3] generic and PowerPC SED Opal keystore
Date:   Thu,  8 Jun 2023 14:29:15 -0500
Message-Id: <20230608192918.516911-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RWBFmvnulvjoocY5oxhn2KB1ZieUdwTE
X-Proofpoint-ORIG-GUID: RWBFmvnulvjoocY5oxhn2KB1ZieUdwTE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_14,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=807 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080165
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

Patchset rebase to for-6.5/block

This patchset has gone through numerous rounds of review and
all comments/suggetions have been addressed. I believe that
this patchset is ready for inclusion.

TCG SED Opal is a specification from The Trusted Computing Group
that allows self encrypting storage devices (SED) to be locked at
power on and require an authentication key to unlock the drive.

Generic functions have been defined for accessing SED Opal keys.
The generic functions are defined as weak so that they may be superseded
by keystore specific versions.

PowerPC/pseries versions of these functions provide read/write access
to SED Opal keys in the PLPKS keystore.

The SED block driver has been modified to read the SED Opal
keystore to populate a key in the SED Opal keyring. Changes to the
SED Opal key will be written to the SED Opal keystore.

Patch 3 "keystore access for SED Opal keys" is dependent on:
        https://lore.kernel.org/keyrings/20220818143045.680972-4-gjoyce@linux.vnet.ibm.com/T/#u

Changelog
v7:	- rebased to for-6.5/block

v6:     - squashed two commits (suggested by Andrew Donnellan)

v5:     - updated to reflect changes in PLPKS API

v4:
        - scope reduced to cover just SED Opal keys
        - base SED Opal keystore is now in SED block driver
        - removed use of enum to indicate type
        - refactored common code into common function that read and
          write use
        - removed cast to void
        - added use of SED Opal keystore functions to SED block driver

v3:
        - No code changes, but per reviewer requests, adding additional
          mailing lists(keyring, EFI) for wider review.

v2:
        - Include feedback from Gregory Joyce, Eric Richter and
          Murilo Opsfelder Araujo.
        - Include suggestions from Michael Ellerman.
        - Moved a dependency from generic SED code to this patchset.
          This patchset now builds of its own.



Greg Joyce (3):
  block:sed-opal: SED Opal keystore
  block: sed-opal: keystore access for SED Opal keys
  powerpc/pseries: PLPKS SED Opal keystore support

 arch/powerpc/platforms/pseries/Kconfig        |   6 +
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 114 ++++++++++++++++++
 block/Kconfig                                 |   1 +
 block/Makefile                                |   2 +-
 block/sed-opal-key.c                          |  24 ++++
 block/sed-opal.c                              |  18 ++-
 include/linux/sed-opal-key.h                  |  15 +++
 8 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c
 create mode 100644 block/sed-opal-key.c
 create mode 100644 include/linux/sed-opal-key.h


base-commit: 1341c7d2ccf42ed91aea80b8579d35bc1ea381e2
-- 
gjoyce@linux.vnet.ibm.com

