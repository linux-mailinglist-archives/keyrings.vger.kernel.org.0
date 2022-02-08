Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D364AD953
	for <lists+keyrings@lfdr.de>; Tue,  8 Feb 2022 14:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbiBHNQC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Feb 2022 08:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356811AbiBHMYM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Feb 2022 07:24:12 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9C8C03FECA
        for <keyrings@vger.kernel.org>; Tue,  8 Feb 2022 04:24:11 -0800 (PST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2189cFvk023009;
        Tue, 8 Feb 2022 12:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Wk7vhwBCxdNbH4TAChdqJ6CbU5AQVw9ePezYoJv0iTc=;
 b=J8M5tjsG541pwFCoObKCCWoXYiP8mIJpbTG/miO/NIflK6uyM+IRrJ9Hxd8aZCvCb+hx
 mBLYoY+TEF5FlD3YVMJoIK7dMNM00AcmAsVhVQhw/Kotxx4cLIdj4MnAAgLXwTH+Uq3T
 lFsfVsf+lN04UDVyXgX43eMSygi7aGCzT7VLoqZcjfDB7fspYx7DGznattwoJqbPg4xn
 6HIMA8qymcqd6TBfeaiZgitfiqRhHkoN0q87YpwWst+MuXwFjULqrDsZ/Lg3oLSolOvR
 3lmX589GwG4D0Rv2nBO9/jPj8hxHaXhCrZTn2Ye2wfegq0am79vbsI5LBbPNsKOYrENd xw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kqrdhw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Feb 2022 12:24:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 218BQIlN015043;
        Tue, 8 Feb 2022 12:24:08 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kqrdhp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Feb 2022 12:24:08 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218CNeIK019754;
        Tue, 8 Feb 2022 12:24:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma03wdc.us.ibm.com with ESMTP id 3e1gvathtx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Feb 2022 12:24:08 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 218CO6W929098330
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 8 Feb 2022 12:24:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D2C11112065;
        Tue,  8 Feb 2022 12:24:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CD70A112071;
        Tue,  8 Feb 2022 12:24:05 +0000 (GMT)
Received: from li-85aba201-53f2-11cb-b5ad-ae21909f0c1f.ibm.com (unknown [9.160.89.71])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  8 Feb 2022 12:24:05 +0000 (GMT)
From:   Douglas Miller <dougmill@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org
Cc:     dougmill@linux.vnet.ibm.com, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org
Subject: [PATCH 1/1] keys: Allow access to key_type_lookup()/key_type_put() within kernel.
Date:   Tue,  8 Feb 2022 06:24:03 -0600
Message-Id: <20220208122403.622369-1-dougmill@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yjHvjR1VPZe-yWgOBT5zRh8BK3WBYA_j
X-Proofpoint-ORIG-GUID: 0gYQFaeXbyIu8PhCDy3TGnP-rOh9DNoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_03,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080073
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Signed-off-by: Douglas Miller <dougmill@linux.vnet.ibm.com>
---
 include/linux/key-type.h | 2 ++
 security/keys/key.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index 7d985a1dfe4a..868a6fb368f3 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -165,6 +165,8 @@ extern struct key_type key_type_keyring;
 
 extern int register_key_type(struct key_type *ktype);
 extern void unregister_key_type(struct key_type *ktype);
+extern struct key_type *key_type_lookup(const char *type);
+extern void key_type_put(struct key_type *ktype);
 
 extern int key_payload_reserve(struct key *key, size_t datalen);
 extern int key_instantiate_and_link(struct key *key,
diff --git a/security/keys/key.c b/security/keys/key.c
index c45afdd1dfbb..3091fd6d65a7 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -719,6 +719,7 @@ struct key_type *key_type_lookup(const char *type)
 found_kernel_type:
 	return ktype;
 }
+EXPORT_SYMBOL(key_type_lookup);
 
 void key_set_timeout(struct key *key, unsigned timeout)
 {
@@ -744,6 +745,7 @@ void key_type_put(struct key_type *ktype)
 {
 	up_read(&key_types_sem);
 }
+EXPORT_SYMBOL(key_type_put);
 
 /*
  * Attempt to update an existing key.
-- 
2.27.0

