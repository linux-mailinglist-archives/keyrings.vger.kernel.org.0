Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F125578C59
	for <lists+keyrings@lfdr.de>; Mon, 18 Jul 2022 23:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbiGRVCU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 Jul 2022 17:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236224AbiGRVCN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 Jul 2022 17:02:13 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2C0326FD;
        Mon, 18 Jul 2022 14:02:13 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IKgMVT015167;
        Mon, 18 Jul 2022 21:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PTV9YFElxqILgefCjkjnAfj5j2t/pkdF8PvMmAQSas8=;
 b=gBDCu4Q7i3GX6aqC+LhWPm9KSk9AU651PtQ4OOny7Yi9j/wxTrv7MT3zei2I4Z+J5D6h
 r2+ayfMZNDSy8SgLCst4R041Nf0WNpsj3Zq4Lo9qJPzmmnyJHmeaS35d2gmAj1pBv82L
 fgo4KZZnGu3ym7gOcFKuNVVKGGUoncdu0LTqDmTzyYGz5O9n9TIyx6bHmPCvs0u8cZb0
 +mzAt83TgEjbvFsjcdpXnxfmjm7EeaNO/rnp4wlUdsngT52KT3sYY/LR2MY91V2FV7XR
 kHTaNv/7i9UUTL8uzsNi364EQH/EqChVm8DSSM7JyTo+hl5+/ihMuHNEOgE1tdViZnd0 Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdesh8c36-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:01 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26IKqMuX029011;
        Mon, 18 Jul 2022 21:02:01 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdesh8c2e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26IKpRij002678;
        Mon, 18 Jul 2022 21:02:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma02dal.us.ibm.com with ESMTP id 3hbmy9axay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26IL1x4e33292652
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 21:01:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1715BC6055;
        Mon, 18 Jul 2022 21:01:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3E275C6057;
        Mon, 18 Jul 2022 21:01:58 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.81.14])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 18 Jul 2022 21:01:57 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        greg@gilhooley.com, gjoyce@ibm.com
Subject: [PATCH 0/4] sed-opal: keyrings, discovery, revert and key store 
Date:   Mon, 18 Jul 2022 16:01:52 -0500
Message-Id: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hz1YGnkprz5ItN-WfjbpThe1_zSqpRBc
X-Proofpoint-ORIG-GUID: yTYYHdi1Q-7kRwunPVKg1k8NoJ9WMnth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180088
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

The current TCG SED Opal implementation in the block
driver requires that authentication keys be provided
in an ioctl so that they can be presented to the
underlying SED Opal capable drive. Currently, the key
is typically entered by a user with an application
like sedutil or sedcli. While this process works, it
does not lend itself to automation like unlock by a udev
rule.

Extend the SED block driver so it can alternatively
obtain a key from a sed-opal kernel keyring. The SED
ioctls will indicate the source of the key, either
directly in the ioctl data or from the keyring.

Two new SED ioctls have also been added. These are:
  1) IOC_OPAL_REVERT_LSP to revert LSP state
  2) IOC_OPAL_DISCOVERY to discover drive capabilities/state

Also, for platforms that have a permanent key store, the
platform may provide unique platform dependent functions
to read/write variables. The SED block driver has been
modified to attempt to read a key from the platform key
store. If successful, the key value is saved in the kernel
sed-opal keyring. If the platform does not support a
permanent key store, the read will fail and a key will
not be added to the keyring. This patchset does not include
any providers of the variable read/write functions.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
base-commit: ff6992735ade75aae3e35d16b17da1008d753d28

Greg Joyce (4):
  block: sed-opal: Implement IOC_OPAL_DISCOVERY
  block: sed-opal: Implement IOC_OPAL_REVERT_LSP
  block: sed-opal: keyring support for SED Opal keys
  arch_vars: create arch specific permanent store

 block/Kconfig                 |   1 +
 block/opal_proto.h            |   4 +
 block/sed-opal.c              | 274 +++++++++++++++++++++++++++++++++-
 include/linux/arch_vars.h     |  23 +++
 include/linux/sed-opal.h      |   5 +
 include/uapi/linux/sed-opal.h |  24 ++-
 lib/Makefile                  |   2 +-
 lib/arch_vars.c               |  25 ++++
 8 files changed, 351 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c


-- 
2.27.0

