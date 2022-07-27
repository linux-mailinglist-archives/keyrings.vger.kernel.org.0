Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A388E58329F
	for <lists+keyrings@lfdr.de>; Wed, 27 Jul 2022 21:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiG0TCG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jul 2022 15:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbiG0TBt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jul 2022 15:01:49 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40FD3B4;
        Wed, 27 Jul 2022 11:14:32 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RI0mnf017174;
        Wed, 27 Jul 2022 18:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=mX9UjlQhgON6JzhcyOXEP4/7UWi/azjDmN7basxV9w4=;
 b=eb4QHb0yOZ5Aab85KBu/TUXHxEwa0VYTMVzhsngE2H4Y2Ou3M0EM2nUTtOED8Q7J5ld6
 OORpmB9dixRB8NXlbwiWcrmxBQryXDCu10KIHA7WEgM0XP2y/1CFFPmRd8WYZCZnvk/X
 9fz5a92FeFQtCIg42VlMoFw8UTg0STDNcwPcUG16P3YlgWxrFwX41J+5r7KtFGJ2GMuv
 MvbdeMrF5LpBspKsLsCKKau2B0ZyadjGomGBJ5S08RlSu/GvX1NXI0faGCXfAfaAWrvE
 tkTSrP0nM7D2DBzTKRRCrC427ur7ctc/TUhznZM04FotlDD8mXKVMutAxeXNDqdJT8JO RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka8tgdcx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jul 2022 18:14:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RI14Kd017856;
        Wed, 27 Jul 2022 18:14:27 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka8tgdbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jul 2022 18:14:27 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RI7vJO004915;
        Wed, 27 Jul 2022 18:14:26 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma03wdc.us.ibm.com with ESMTP id 3hg97s2rmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jul 2022 18:14:26 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26RIEPSC57147686
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jul 2022 18:14:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 64E33124055;
        Wed, 27 Jul 2022 18:14:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D3EB7124053;
        Wed, 27 Jul 2022 18:14:24 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.77.138.167])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Jul 2022 18:14:24 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        gjoyce@ibm.com, nayna@linux.ibm.com
Subject: [PATCH 0/3] sed-opal: keyrings, discovery, revert and key store
Date:   Wed, 27 Jul 2022 13:14:19 -0500
Message-Id: <20220727181422.3504563-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pKTIM34pTdDRo0d_8pFL7ucruvS1N2S0
X-Proofpoint-GUID: ADRxlWOyMgT7n4RtQcQkWsQiDQ1U6s8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_07,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270077
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

Updates:
	- removed platform functions for persistent variable storage
	- replaced key update logic with key_create_or_update()
	- minor bracing and padding changes
	- add error returns
	- opal_key structure is application provided but kernel
	  verified

Greg Joyce (3):
  block: sed-opal: Implement IOC_OPAL_DISCOVERY
  block: sed-opal: Implement IOC_OPAL_REVERT_LSP
  block: sed-opal: keyring support for SED Opal keys

 block/Kconfig                 |   1 +
 block/opal_proto.h            |   4 +
 block/sed-opal.c              | 252 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   5 +
 include/uapi/linux/sed-opal.h |  25 +++-
 5 files changed, 281 insertions(+), 6 deletions(-)


Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
-- 
2.27.0

