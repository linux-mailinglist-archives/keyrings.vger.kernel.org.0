Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9A275D648
	for <lists+keyrings@lfdr.de>; Fri, 21 Jul 2023 23:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjGUVP4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 Jul 2023 17:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjGUVPz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 Jul 2023 17:15:55 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6255A123;
        Fri, 21 Jul 2023 14:15:54 -0700 (PDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36LL8A6s006742;
        Fri, 21 Jul 2023 21:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Vdtjy7KMBO+X9Z7rUqm5H88eVKYCvsbAqEigHgRUlN8=;
 b=AL/SW/duLMyXuAnBbV2t9KEBI6UoUS1fvuIY8Y7GWn/mwWLwX4l3RXkiEihuppBjT2Xj
 okqzU0AucTLWY3+C2OXMZ1RcXVp1YAX8BdqSKJhA821dmrOy3NteTwQuOHt7Mnr3rKt8
 WBAQCDf9elzG+VTe9eTGtsMfMYjF6OxSZaToCW/F4sKI3rm7HUVYM2Ux60BxICI32MEk
 wuD1NHg47VET1rJMGI1Q6OY8Ls54hbSiGO+HTb/erdJDxHSFyIcUFvJO4H9IbMfa7Edg
 jsd6xtZ7PdPUUOxXGTyuiiknpWCKuF7BO2IaEnEQcOb/E+SCtbeb6SZTGiWCwAbJp649 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rypxsypv6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 21:15:38 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36LLFb9O024887;
        Fri, 21 Jul 2023 21:15:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rypxsypum-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 21:15:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
        by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36LKA0ZP017218;
        Fri, 21 Jul 2023 21:15:36 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
        by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv5ssanyj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 21:15:36 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
        by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36LLFZlI31916792
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jul 2023 21:15:36 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9BB6558059;
        Fri, 21 Jul 2023 21:15:35 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 618BD5805D;
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
Subject: [PATCH v5 1/3 RESEND] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Date:   Fri, 21 Jul 2023 16:15:32 -0500
Message-Id: <20230721211534.3437070-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
References: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bJX79HL7hX46QJ1GxeuktM0ELpkm9uMP
X-Proofpoint-ORIG-GUID: xzA5Xjx1kZadHkDWems-Ffy7qygn69bI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Add IOC_OPAL_DISCOVERY ioctl to return raw discovery data to a SED Opal
application. This allows the application to display drive capabilities
and state.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/sed-opal.c              | 38 ++++++++++++++++++++++++++++++++---
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h |  6 ++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index c18339446ef3..67c6c4f2b4b0 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -463,8 +463,11 @@ static int execute_steps(struct opal_dev *dev,
 	return error;
 }
 
-static int opal_discovery0_end(struct opal_dev *dev)
+static int opal_discovery0_end(struct opal_dev *dev, void *data)
 {
+	struct opal_discovery *discv_out = data; /* may be NULL */
+	u8 __user *buf_out;
+	u64 len_out;
 	bool found_com_id = false, supported = true, single_user = false;
 	const struct d0_header *hdr = (struct d0_header *)dev->resp;
 	const u8 *epos = dev->resp, *cpos = dev->resp;
@@ -480,6 +483,15 @@ static int opal_discovery0_end(struct opal_dev *dev)
 		return -EFAULT;
 	}
 
+	if (discv_out) {
+		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
+		len_out = min_t(u64, discv_out->size, hlen);
+		if (buf_out && copy_to_user(buf_out, dev->resp, len_out))
+			return -EFAULT;
+
+		discv_out->size = hlen; /* actual size of data */
+	}
+
 	epos += hlen; /* end of buffer */
 	cpos += sizeof(*hdr); /* current position on buffer */
 
@@ -565,13 +577,13 @@ static int opal_discovery0(struct opal_dev *dev, void *data)
 	if (ret)
 		return ret;
 
-	return opal_discovery0_end(dev);
+	return opal_discovery0_end(dev, data);
 }
 
 static int opal_discovery0_step(struct opal_dev *dev)
 {
 	const struct opal_step discovery0_step = {
-		opal_discovery0,
+		opal_discovery0, NULL
 	};
 
 	return execute_step(dev, &discovery0_step, 0);
@@ -2435,6 +2447,22 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
 	return ret;
 }
 
+static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
+{
+	const struct opal_step discovery0_step = {
+		opal_discovery0, discv
+	};
+	int ret = 0;
+
+	mutex_lock(&dev->dev_lock);
+	setup_opal_dev(dev);
+	ret = execute_step(dev, &discovery0_step, 0);
+	mutex_unlock(&dev->dev_lock);
+	if (ret)
+		return ret;
+	return discv->size; /* modified to actual length of data */
+}
+
 static int opal_erase_locking_range(struct opal_dev *dev,
 				    struct opal_session_info *opal_session)
 {
@@ -3056,6 +3084,10 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GET_GEOMETRY:
 		ret = opal_get_geometry(dev, arg);
 		break;
+	case IOC_OPAL_DISCOVERY:
+		ret = opal_get_discv(dev, p);
+		break;
+
 	default:
 		break;
 	}
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index bbae1e52ab4f..ef65f589fbeb 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -47,6 +47,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_GET_STATUS:
 	case IOC_OPAL_GET_LR_STATUS:
 	case IOC_OPAL_GET_GEOMETRY:
+	case IOC_OPAL_DISCOVERY:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index dc2efd345133..7f5732c5bdc5 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -173,6 +173,11 @@ struct opal_geometry {
 	__u8  __align[3];
 };
 
+struct opal_discovery {
+	__u64 data;
+	__u64 size;
+};
+
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
 #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
@@ -192,5 +197,6 @@ struct opal_geometry {
 #define IOC_OPAL_GET_STATUS         _IOR('p', 236, struct opal_status)
 #define IOC_OPAL_GET_LR_STATUS      _IOW('p', 237, struct opal_lr_status)
 #define IOC_OPAL_GET_GEOMETRY       _IOR('p', 238, struct opal_geometry)
+#define IOC_OPAL_DISCOVERY          _IOW('p', 239, struct opal_discovery)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
gjoyce@linux.vnet.ibm.com

