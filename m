Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549BA300BA2
	for <lists+keyrings@lfdr.de>; Fri, 22 Jan 2021 19:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbhAVSmx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Jan 2021 13:42:53 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48548 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729478AbhAVSNO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 22 Jan 2021 13:13:14 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIAYHh038664;
        Fri, 22 Jan 2021 18:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=DMKcsxiE+hz4KSFJzcEn4Oe/oEfcG+vxodo42Whu5q0=;
 b=oVCj1M5y3CjLrRT6pWeSuF6et28/j/W98PrwIxYnV6pN56KtjXVdLLOntOTnCxotN3HB
 Iy+SNNlvbzSGsLo9Yf2zN6hG8yVDaWSqmS7e208/Idl9K+lJLlL1FNislQho3SglKV9n
 ArwCerTOFAu2IXzJ5BqJH38PEcD/ira0Q6Tj6oGluP79jsLzq0x3BTQOrq4p/+Sup1mP
 AgkyokvJm5pWlox9l4kFnTLAdWHNSO0ofaQVJsiR1tqu5adq0xXqDHl3fkcverQRS/Of
 OVDl0DJji5OWwE3OAVbGZYZrAKWUWGTurD9ddkNR3dNXgEd6QwheFFY/DZguI2RD0cNI eA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3668qn5cg4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MI4xS6149933;
        Fri, 22 Jan 2021 18:11:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by userp3020.oracle.com with ESMTP id 3668r1dq72-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBwDLrvdGZfkuW2N4yQdIQmmbom+UIoULyOPYOOq5N7/kHGyHdQVvQE16LDuDugCAbqu5tv+Z0xbOdds782k28UFSiHb7WcCb7kq/qL/JTcfCKmuLudYLGWr1ovA9HLCcr4DKlTMQ/u0EcXgXiTE7FBKqbqRlwsY0FGydcno8uBhyqB0nBvjtB/weoPbIUXAo9oqFc9TZuyOVkHIlxCx5N4Cg7duifZzW5k4hwSm46l0W0XpDIRhJpBEIv4KLXiv3j/u6hLQ03HWNQCeFCW2UYyAeMxVU73G5jfD4vofoTvJ6XmgLXTn1XmJBgqAxEJ0/gASB9lu212j0Fea0UQo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMKcsxiE+hz4KSFJzcEn4Oe/oEfcG+vxodo42Whu5q0=;
 b=QdZi/x0PLbMK5zEJzoRN0wgCV+YrZQCBxkVrhrnpUck8eyw4oGMVD74sODAgOQAGiQqIoy0N9gvdJP0DHX+1MZggOfQGwgIm8UemYF41j5mjN5TCf9+7iHyV88+Kh2VsnshTW/rJ7lXPZUe6/0CQ7Dv75qk6ebBn/hkzN6kVkHTh3O0dU1rut/pb0QP1BV5rZ/IB7HtaYsZD6scf8qEdtjHdFVhQ6M7uUYfRg0L9kp0UxMiKUTxeMcOSXChcquWF8/7D6eGQtcY+IjLKH18xdxxIUrEGvFEDyW7S+NSOKOOKSiQQB96ZV3Mla8dyr1AYkf/AYZ6Qrcl70NoEpH4psQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMKcsxiE+hz4KSFJzcEn4Oe/oEfcG+vxodo42Whu5q0=;
 b=bTSNTzHhuy2/xzGfB4J2JhPPpyvLb/WzpVyy6GJT0LOCTEQDBbqzd7zctHfxx9AiFgt7gNzP1/IxmsP7gmm7J3Py2cU3g39tsT+/yP9Goon17Wlzu6BfYDUrnymYAOmvxksA2SGIT96u10Y5D+wkA/4vNXoxCQP/C+4jUZ8tDjQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM5PR10MB1673.namprd10.prod.outlook.com (2603:10b6:4:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Fri, 22 Jan 2021 18:11:34 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3763.017; Fri, 22 Jan 2021
 18:11:34 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, jmorris@namei.org,
        serge@hallyn.com, eric.snowberg@oracle.com, ardb@kernel.org,
        zohar@linux.ibm.com, lszubowi@redhat.com, javierm@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v5 1/4] certs: Add EFI_CERT_X509_GUID support for dbx entries
Date:   Fri, 22 Jan 2021 13:10:51 -0500
Message-Id: <20210122181054.32635-2-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210122181054.32635-1-eric.snowberg@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: CH2PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:610:4c::16) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 18:11:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7e26343-5667-419c-167c-08d8bf0126a9
X-MS-TrafficTypeDiagnostic: DM5PR10MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB16739A746B71D40D675806A387A09@DM5PR10MB1673.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDOgBED2KAxt72Q9wD6PqTRbEo4BkjpuhCjMwcWvjIKFN+AzHIGiTHYVEdkD6dU6mHmrYmNsnsC54wZZ92YsMnjnMaLvPgvqPdYUyxEmpFiyOD/MCSyn6ZR5LSgQa8hiSox0jC8kxYmq+9hFVJS5+PPZtLQoGTxfLvw7jdcpUkHqnYVMeJcaJpWdG2XaFO8gV9Y6iYi11+MSqwelZa+hXOnNtNjlZoEI8bfrlREHcvW3ZlN25geDGUoHOU9I3YTggnXp6Pmc2zZQ03uO6JxcIVxkh+uZGnolzC7HRfzNt/gdp1rqnsLGpSRbjvZshVSCF7/QCr0TbV0GL7P/dI8n0hH2KyFzCsLAAuKqLD09+t2qHM8NliLnaQsGVK1z2Weq6J8EJSzQcrq1bbFMdZw12210ZznxYeInLoQJxLDwacsgMHuTYlu/X+5k2Px1ytbb4gMIOv5Zg4vBqK4OUKFdVhIY9SIAtgMQenpHxINXhec6u1vXZUJWBPpDj7+ykYfdpgobJpSvaENjtFB5q4YrEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(366004)(136003)(346002)(316002)(7416002)(6486002)(7696005)(2616005)(1076003)(52116002)(5660300002)(4326008)(44832011)(2906002)(8676002)(16526019)(26005)(66946007)(478600001)(186003)(956004)(36756003)(83380400001)(66556008)(66476007)(8936002)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5KOF73UHLP0s3YAsZrgomBGJNeWg6NSRNyOaDVz/Q6k11dlGpmRVAC/LAMG0?=
 =?us-ascii?Q?LGFSZBj5ELM7w7nZvD1E6pRi4nXtrtXVG6H3STuAyaDvqgIC2LmI6KW0er4W?=
 =?us-ascii?Q?TWFBXBLGZIz0nm93krCHBnD+Cr2KRsfC2F7s+9Q/emrB6Eb7N5lsfhg6T4pR?=
 =?us-ascii?Q?/4Nyl9B5tkFpjyVmNPZ6ds+ATiFN4ugPhvcZs02AMd3J6Lo1FwCu0HVzOu3d?=
 =?us-ascii?Q?Uk5uU/pk8Kxyg92RAuCY4GV2wFSOJ6NDy+LjqBveOYBRkWoMo+l5TUSw024I?=
 =?us-ascii?Q?db8V96puUvqju1Rf0ZSdiQ2+4Ys3pdZXSi+/lv7s6uC6LhBk7ROo+SzZFj4v?=
 =?us-ascii?Q?/zr2CoW0n7HoTcpJXp90hqDugW4aINnUOcF7ty+rNWSRys04NQntte2h1att?=
 =?us-ascii?Q?fo//X36AdkTXFZbU4gLd9GeFsywh6dr/ZU/j9pb2divKybmGPboIWJx7+ZSu?=
 =?us-ascii?Q?I+1sS+KDf+zmSAYWeoFdaQRiwAuG3Fmgl/jMEux4eCENUD5i3y42lik4iKZG?=
 =?us-ascii?Q?Z9U/vhcu4eUt6OhzOIj7ctixEZWPIYNPxM7l8aNwuzTvxsbm91JsTJAOKUfu?=
 =?us-ascii?Q?0w+LW2tISnFgeDFO1gX2iusMArjNz7S4U+S4Qg8OEl16sm1Bsuq2yv0NDnEG?=
 =?us-ascii?Q?2ZEQkY9+X4sMnbN69PSk+w4fd9NugcUnMrD61aVZA4u6+lQYmYNcPYfcEdOc?=
 =?us-ascii?Q?0mEhVmcrEUiWcf+MF7UIuXDci5guUckm+HpG/T+bUIL+gZOO/Hsp6srzKjVw?=
 =?us-ascii?Q?2dni3nCvJ3eRqMaZbcQ4mzkIT/uSX6b/mNbgL7kMdIEH/95A7unuS/mnKxxS?=
 =?us-ascii?Q?RMUHbaqcXXGLfeYjAf+X5d9Tu9vlj3XEobZcLoXReknKuV0MfRJAHpxuBniW?=
 =?us-ascii?Q?/Ql259XNLouvWr1jG6+SlGvGGX++8fxNiMRfy+buLgIXUJtbKX9TCeixS/Zc?=
 =?us-ascii?Q?qNbmcd12PAZyTX6BIIhAR8siAuddPABtVfE14kR/hnY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e26343-5667-419c-167c-08d8bf0126a9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:11:33.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URb1nKsiZTdCThTkPt7Q+fD1OE0QrBQ/qHxqtB4v+/+VMTL7w1GUo+8yt64U4y20ac1X6699pvIX5BRjf0oQAVVTvf9rn5kxyAQR7/vHhNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1673
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220093
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This fixes CVE-2020-26541.

The Secure Boot Forbidden Signature Database, dbx, contains a list of now
revoked signatures and keys previously approved to boot with UEFI Secure
Boot enabled.  The dbx is capable of containing any number of
EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
entries.

Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
skipped.

Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
is found, it is added as an asymmetrical key to the .blacklist keyring.
Anytime the .platform keyring is used, the keys in the .blacklist keyring
are referenced, if a matching key is found, the key will be rejected.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---
v5: Function name changes done by David Howells
---
 certs/blacklist.c                             | 32 +++++++++++++++++++
 certs/blacklist.h                             | 12 +++++++
 certs/system_keyring.c                        |  6 ++++
 include/keys/system_keyring.h                 | 11 +++++++
 .../platform_certs/keyring_handler.c          | 11 +++++++
 5 files changed, 72 insertions(+)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 6514f9ebc943..a7f021878a4b 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -100,6 +100,38 @@ int mark_hash_blacklisted(const char *hash)
 	return 0;
 }
 
+int add_key_to_revocation_list(const char *data, size_t size)
+{
+	key_ref_t key;
+
+	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
+				   "asymmetric",
+				   NULL,
+				   data,
+				   size,
+				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
+				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
+
+	if (IS_ERR(key)) {
+		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
+		return PTR_ERR(key);
+	}
+
+	return 0;
+}
+
+int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
+{
+	int ret;
+
+	ret = validate_trust(pkcs7, blacklist_keyring);
+
+	if (ret == 0)
+		return -EKEYREJECTED;
+
+	return -ENOKEY;
+}
+
 /**
  * is_hash_blacklisted - Determine if a hash is blacklisted
  * @hash: The hash to be checked as a binary blob
diff --git a/certs/blacklist.h b/certs/blacklist.h
index 1efd6fa0dc60..420bb7c86e07 100644
--- a/certs/blacklist.h
+++ b/certs/blacklist.h
@@ -1,3 +1,15 @@
 #include <linux/kernel.h>
+#include <linux/errno.h>
+#include <crypto/pkcs7.h>
 
 extern const char __initconst *const blacklist_hashes[];
+
+#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
+#define validate_trust pkcs7_validate_trust
+#else
+static inline int validate_trust(struct pkcs7_message *pkcs7,
+				 struct key *trust_keyring)
+{
+	return -ENOKEY;
+}
+#endif
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 798291177186..cc165b359ea3 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
 			pr_devel("PKCS#7 platform keyring is not available\n");
 			goto error;
 		}
+
+		ret = is_key_on_revocation_list(pkcs7);
+		if (ret != -ENOKEY) {
+			pr_devel("PKCS#7 platform key is on revocation list\n");
+			goto error;
+		}
 	}
 	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
 	if (ret < 0) {
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index fb8b07daa9d1..61f98739e8b1 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -31,11 +31,14 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
 #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by_builtin_trusted
 #endif
 
+extern struct pkcs7_message *pkcs7;
 #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
 extern int mark_hash_blacklisted(const char *hash);
+extern int add_key_to_revocation_list(const char *data, size_t size);
 extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
 			       const char *type);
 extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
+extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
 #else
 static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
 				      const char *type)
@@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
 {
 	return 0;
 }
+static inline int add_key_to_revocation_list(const char *data, size_t size)
+{
+	return 0;
+}
+static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
+{
+	return -ENOKEY;
+}
 #endif
 
 #ifdef CONFIG_IMA_BLACKLIST_KEYRING
diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
index c5ba695c10e3..5604bd57c990 100644
--- a/security/integrity/platform_certs/keyring_handler.c
+++ b/security/integrity/platform_certs/keyring_handler.c
@@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const char *source,
 	uefi_blacklist_hash(source, data, len, "bin:", 4);
 }
 
+/*
+ * Add an X509 cert to the revocation list.
+ */
+static __init void uefi_revocation_list_x509(const char *source,
+					     const void *data, size_t len)
+{
+	add_key_to_revocation_list(data, len);
+}
+
 /*
  * Return the appropriate handler for particular signature list types found in
  * the UEFI db and MokListRT tables.
@@ -76,5 +85,7 @@ __init efi_element_handler_t get_handler_for_dbx(const efi_guid_t *sig_type)
 		return uefi_blacklist_x509_tbs;
 	if (efi_guidcmp(*sig_type, efi_cert_sha256_guid) == 0)
 		return uefi_blacklist_binary;
+	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0)
+		return uefi_revocation_list_x509;
 	return 0;
 }
-- 
2.18.4

