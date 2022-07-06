Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7EC567C0B
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 04:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbiGFCj4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Jul 2022 22:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiGFCjz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Jul 2022 22:39:55 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52AA1A052;
        Tue,  5 Jul 2022 19:39:54 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2661jmMP016625;
        Wed, 6 Jul 2022 02:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=1EZwPBRHZPAcnjmWs1UFbWv6tFf0FTt8oOk/6AZ/wOA=;
 b=DxOtwggB6E3FMmq4vnTWDMkvnT6FXf6eKPmYYzL1kYD9YCBwiMpJcWkKLpZ9RMPpwYhI
 rJttM56SUFs8HWT/Cxfntxapcxy69sP2oU5PK/6JH1/+WmXVr/h8ZQRJLK7o0+qKc2xV
 6V4LDAP+yR8Zid7wuuRan2ITltWUTEauxcYVfGZcH59Vnol/AEYYyhU0gJSXZBHRBOLv
 XHF97QjFJWbMa6O+zZmozwtYtmjC+nBiEVt7XPq54748RVignwBT4QgFcHgBPJkoUku1
 0pJ2jron6I/LBcW6MTF5oCbXwzslfdPap6M9SXUTh3xg77jmJowrqnmFx4Gw1MSvXe2S ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5111gvsd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:40 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2662coTr009912;
        Wed, 6 Jul 2022 02:39:40 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5111gvs1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:40 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2662aVJ4016513;
        Wed, 6 Jul 2022 02:39:38 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma03wdc.us.ibm.com with ESMTP id 3h4ucnhudf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2662dcmh32309650
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 6 Jul 2022 02:39:38 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5A2A3AE060;
        Wed,  6 Jul 2022 02:39:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BD27AAE062;
        Wed,  6 Jul 2022 02:39:37 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.24.101])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed,  6 Jul 2022 02:39:37 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     keyrings@vger.kernel.org
Cc:     gjoyce@ibm.com, dhowells@redhat.com, jarkko@kernel.org,
        andrzej.jakowski@intel.com, jonathan.derrick@linux.dev,
        drmiller.lnx@gmail.com, linux-block@vger.kernel.org,
        greg@gilhooley.com
Subject: [PATCH 0/4] sed-opal: keyrings, discovery, revert and key store 
Date:   Tue,  5 Jul 2022 21:39:31 -0500
Message-Id: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 78-GaPJ0fDTQ4aVsHRdK4V1skzMl-IYJ
X-Proofpoint-GUID: vEWfU8oP0rnmEhLFLapqcBKsx7g1FGug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_02,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060008
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
not be added to the keyring.


Greg Joyce (4):
  block: sed-opal: Implement IOC_OPAL_DISCOVERY
  block: sed-opal: Implement IOC_OPAL_REVERT_LSP
  block: sed-opal: keyring support for SED Opal keys.
  arch_vars: create arch specific permanent store

 block/opal_proto.h            |   4 +
 block/sed-opal.c              | 274 +++++++++++++++++++++++++++++++++-
 include/linux/arch_vars.h     |  23 +++
 include/linux/sed-opal.h      |   5 +
 include/uapi/linux/sed-opal.h |  24 ++-
 lib/Makefile                  |   2 +-
 lib/arch_vars.c               |  25 ++++
 7 files changed, 350 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c

-- 
gjoyce@linux.vnet.ibm.com

