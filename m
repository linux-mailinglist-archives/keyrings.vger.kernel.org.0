Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C058F4BE302
	for <lists+keyrings@lfdr.de>; Mon, 21 Feb 2022 18:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378174AbiBUOpA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Feb 2022 09:45:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378176AbiBUOoz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Feb 2022 09:44:55 -0500
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDA5205DB
        for <keyrings@vger.kernel.org>; Mon, 21 Feb 2022 06:44:32 -0800 (PST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LCTcbh011944;
        Mon, 21 Feb 2022 14:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wk7vhwBCxdNbH4TAChdqJ6CbU5AQVw9ePezYoJv0iTc=;
 b=qR+FQxqUhV9qJdueiJ8NbXigobUFzjbt+WQet2A3XVnUU+W5QKiEiLhgUQSD2+/nyomD
 VVhs6wVl/+kIWD+CtBGZyZRVVg6O43qw0FeDhMPh8wT5kbxd20JxvYmGyvhqLt5csh8a
 kCko2edj1FynauZQUHNWM+mab4rcVQR+kEZ/u6wryd1WhNk00oWszb29Euz19cPGxEUW
 bm9FEQhzmh8iJ8fZkpaCZRbY7rMt2efAZKW3524MlHkHVjVyJFRucPi73VNnJOlE5Gm6
 7SdkYpfsEGtj5guymzx0XXknqJxFzUvij/TOMMBar5nfU0fHlZWuftK3fbprCinETOzo mA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3eby66yxfa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Feb 2022 14:44:30 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LDTdd5010931;
        Mon, 21 Feb 2022 14:44:30 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3eby66yxf4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Feb 2022 14:44:30 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LESweW005067;
        Mon, 21 Feb 2022 14:44:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma04dal.us.ibm.com with ESMTP id 3ear69yked-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Feb 2022 14:44:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 21LEiRBG9110526
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 21 Feb 2022 14:44:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CA5FBAC05B;
        Mon, 21 Feb 2022 14:44:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CC026AC05F;
        Mon, 21 Feb 2022 14:44:26 +0000 (GMT)
Received: from li-85aba201-53f2-11cb-b5ad-ae21909f0c1f.ibm.com (unknown [9.160.89.71])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon, 21 Feb 2022 14:44:26 +0000 (GMT)
From:   Douglas Miller <dougmill@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org
Cc:     dougmill@linux.vnet.ibm.com, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org
Subject: [PATCH RESEND 1/1] keys: Allow access to key_type_lookup()/key_type_put() within kernel.
Date:   Mon, 21 Feb 2022 08:44:24 -0600
Message-Id: <20220221144424.1339241-2-dougmill@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220221144424.1339241-1-dougmill@linux.vnet.ibm.com>
References: <20220221144424.1339241-1-dougmill@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2tf_iRtwZuZhZpGDdnuPUoJQOWGd-ChF
X-Proofpoint-GUID: NW-v8bTtvwlOrU_WiILcF8H91-5SE--N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_07,2022-02-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210087
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

