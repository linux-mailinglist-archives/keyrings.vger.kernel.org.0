Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA96563CBBE
	for <lists+keyrings@lfdr.de>; Wed, 30 Nov 2022 00:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiK2XZ1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 29 Nov 2022 18:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiK2XZ0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 29 Nov 2022 18:25:26 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B876DFE9;
        Tue, 29 Nov 2022 15:25:26 -0800 (PST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATMDkts025447;
        Tue, 29 Nov 2022 23:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=WboJhXA+3D0c9oX9kVjsq7SefegsZAj6UY8UwbC3AS8=;
 b=sddN2ZVgoQDZcRKAqTochzc7gZDx0pH9rSsWgYey1Wp+Au390zXYqv6ggIGMhzrtfILj
 HdmuFaxr6/InuhhaHjpgEmXrkx42q8I/3uPrCo4v5qwBFTnzsPRt7FpxZ8fNXs4eVRKN
 TVWAFSw1M0QlumvaDUXzDl3Cl3VdwmUq3KgFYix3bc7xIF9oKnvUZbtoK0YVW48uz2y5
 Y7rFeNub74u4IqO0oTvvZVJT5FRdn3s1NBodq1HD7cJWu22SndW9OjL82zkAIZWwqLcR
 eipLoNShPg6O9taZQ8JfJjnFE0DBYlr7A2LNTXm0RK64JXl0Vwf6L3M5iGe7Wv7kLrKI 6Q== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5tpahgx0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 23:25:11 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATNLQbx019689;
        Tue, 29 Nov 2022 23:25:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma03wdc.us.ibm.com with ESMTP id 3m3ae9g5b6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 23:25:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATNPCaG45744742
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Nov 2022 23:25:12 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D92355803F;
        Tue, 29 Nov 2022 23:25:09 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BA33658060;
        Tue, 29 Nov 2022 23:25:08 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
        by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Tue, 29 Nov 2022 23:25:08 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v3 0/3] sed-opal: keyrings, discovery, revert, key store
Date:   Tue, 29 Nov 2022 17:25:03 -0600
Message-Id: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hpgfMOaHUaxc0efIFlizZvSnGXKQX7yq
X-Proofpoint-ORIG-GUID: hpgfMOaHUaxc0efIFlizZvSnGXKQX7yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290138
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

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

 block/Kconfig                 |   1 +
 block/opal_proto.h            |   4 +
 block/sed-opal.c              | 252 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   5 +
 include/uapi/linux/sed-opal.h |  25 +++-
 5 files changed, 281 insertions(+), 6 deletions(-)

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
base-commit: 59d0d52c30d4991ac4b329f049cc37118e00f5b0
-- 
gjoyce@linux.vnet.ibm.com

