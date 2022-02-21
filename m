Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2114BE6AB
	for <lists+keyrings@lfdr.de>; Mon, 21 Feb 2022 19:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbiBUOo6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Feb 2022 09:44:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378175AbiBUOoy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Feb 2022 09:44:54 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954F5205D0
        for <keyrings@vger.kernel.org>; Mon, 21 Feb 2022 06:44:31 -0800 (PST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LEciPP020317;
        Mon, 21 Feb 2022 14:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GksAuTqcgplcxEDbPK0tZIzpzyo6UJe16pSfx0EZjcI=;
 b=qDx1xHMRhLkIKJE0Kz5eSeGQ2pNpcLoaXfNXmSMRy0Z2JlJMrue6nMsmsaMR+HMII53Z
 EMJ+KYo8LhD1RhCLXkQcjXED3k6HYEc0hFdDkfflXLM2RAZsVbejaMJLvk3ndhP7UVU+
 AFCV8qN1C150oVlkVpl1z4MKP/RnIzvsQQwupkgyntJtgNdALKrrHRqWz2KBge8SC7po
 6L6yRlgqNrEYVH2eusHLHmDVwTjM0pex4kr5bMmMa7kKMe+rp31W3yElsR5c9A7c22ek
 iObZuDrWFbtIZCWGf/xgoeIoaJei3pEtoe/tdkfQEaj/tSGWa3tdvuKxJHUIpVNHQpxi 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3eca3skuqm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Feb 2022 14:44:28 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LEZVEC023144;
        Mon, 21 Feb 2022 14:44:28 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3eca3skuqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Feb 2022 14:44:28 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LESrSK000768;
        Mon, 21 Feb 2022 14:44:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma02wdc.us.ibm.com with ESMTP id 3ear69hcfe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Feb 2022 14:44:27 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 21LEiQOr34865534
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 21 Feb 2022 14:44:26 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8F704AC05F;
        Mon, 21 Feb 2022 14:44:26 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A5AEDAC066;
        Mon, 21 Feb 2022 14:44:25 +0000 (GMT)
Received: from li-85aba201-53f2-11cb-b5ad-ae21909f0c1f.ibm.com (unknown [9.160.89.71])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon, 21 Feb 2022 14:44:25 +0000 (GMT)
From:   Douglas Miller <dougmill@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org
Cc:     dougmill@linux.vnet.ibm.com, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org
Subject: [PATCH RESEND 0/1] keys: Allow access to key_type_lookup
Date:   Mon, 21 Feb 2022 08:44:23 -0600
Message-Id: <20220221144424.1339241-1-dougmill@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hjN-tZjVJzQVxk7auqZQ49xBTuDnNQLw
X-Proofpoint-ORIG-GUID: p3VE0dmMGl6nZkeB8R5HmNOfkdKR7H0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_07,2022-02-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=691 classifier=spam adjust=0 reason=mlx scancount=1
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

Planned changes to block/sed-opal will need to access a Platform Key-Store
(PKS) in a platform-independent manner. Linux keyrings were chosen for
that. This code will need to use key_type_lookup() to check for existence
of the PKS key-type and adapt accordingly.


