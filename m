Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0D54984F4
	for <lists+keyrings@lfdr.de>; Mon, 24 Jan 2022 17:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243353AbiAXQhO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 24 Jan 2022 11:37:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29776 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236102AbiAXQhM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 24 Jan 2022 11:37:12 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OG5sWS007385
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GksAuTqcgplcxEDbPK0tZIzpzyo6UJe16pSfx0EZjcI=;
 b=YnplvksWjaWiDWKku/E/EKbapyxPaERSTfAVmxz6V/ky9rFwPtA+tZOxILizDiK383Z4
 bTTBLvwBOyq7+EV2JZoop65hrJgN/sXJjGK5j2c9sPEwKSZ/XoGwcloYFHCZQ+pdPrzX
 UQF9TdNmxRqe7s0rX9Cm5p0ITJcVtkvbOAXKOTD/vSxH06RHB3f3zTFpdNIIKqfr8lyn
 4DqBC+U1XPZoFhAfH2Ukv+Zjs72Gg82XyRAyYjmbV9vwuldTqFGV+pLD6KRfOU6lo9cu
 HWDQHzHJxQwIGjcZB5AtzbkFiFWU96XwnBIPHYME6QmxBbquVvUms9770GJ/sGDM40Os KA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3dsxnx1v1d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:37:11 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OGCuVf026915
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:32:11 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma02dal.us.ibm.com with ESMTP id 3dr9ja29wg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:32:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 20OGW8L129622540
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jan 2022 16:32:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4F52E7807C;
        Mon, 24 Jan 2022 16:32:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BAB97780A7;
        Mon, 24 Jan 2022 16:32:07 +0000 (GMT)
Received: from li-85aba201-53f2-11cb-b5ad-ae21909f0c1f.ibm.com (unknown [9.77.149.101])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 24 Jan 2022 16:32:07 +0000 (GMT)
From:   Douglas Miller <dougmill@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org
Cc:     dougmill@linux.vnet.ibm.com, gjoyce@ibm.com
Subject: [PATCH 0/1] keys: Allow access to key_type_lookup()/key_type_put() within kernel.
Date:   Mon, 24 Jan 2022 10:31:59 -0600
Message-Id: <20220124163200.735362-1-dougmill@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YDY9bBPtAYT_VrSyzi0NtjzVJ9V65ph8
X-Proofpoint-GUID: YDY9bBPtAYT_VrSyzi0NtjzVJ9V65ph8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_08,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 mlxlogscore=632 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240110
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Planned changes to block/sed-opal will need to access a Platform Key-Store
(PKS) in a platform-independent manner. Linux keyrings were chosen for
that. This code will need to use key_type_lookup() to check for existence
of the PKS key-type and adapt accordingly.


