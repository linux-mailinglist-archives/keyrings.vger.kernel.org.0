Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433AD27F313
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 22:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgI3UPp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 16:15:45 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:39632 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3UPp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Sep 2020 16:15:45 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UKA0s8101746;
        Wed, 30 Sep 2020 20:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=kA10ux8sEmUomQTdSpnRyEQE3PCf5YCGA8wUNrifkR0=;
 b=KuKc2cZb0nn/uqJuwnq4zHgepqfRiZ9kMVajvjOvn9f6ds3IoFxRlk6dSMsb1Ly8mXX+
 r4pmBpP/k4u8zO5NJdMkkiXp64w2SoUIHHtHb3WxymL52Ughy916pdUyQgoU63XXhY1f
 Ie/fazs/axP5t0Whq0yNEvfXEU5Slms6zMU1w41PLCEIUauGIJz7tjWQpEhQsOYyAJT8
 k7boaleo0aVq3/8/AIVRH3LZgyKOqmicYA9nalT8p2Bn6hbMPNdmr25Qj9aruSuopfSG
 FfksyLqKSERE/guNcf87n5iytbPSZkxByxBmk2NErOGoaKo5z9LWzLVK9PGleazKZ00t KQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 33su5b2psh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 20:15:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UKEW2x118016;
        Wed, 30 Sep 2020 20:15:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 33tfj0pcgb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 20:15:30 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UKFOBJ028086;
        Wed, 30 Sep 2020 20:15:24 GMT
Received: from localhost.us.oracle.com (/10.147.27.2)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 13:15:23 -0700
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, jarkko.sakkinen@linux.intel.com,
        eric.snowberg@oracle.com
Subject: [PATCH 0/2] Preloaded revocation keys
Date:   Wed, 30 Sep 2020 16:15:06 -0400
Message-Id: <20200930201508.35113-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300163
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The Secure Boot Forbidden Signature Database, dbx, contains a list of
now revoked signatures and keys previously approved to boot with UEFI
Secure Boot enabled.  Currently EFI_CERT_X509_SHA256_GUID and
EFI_CERT_SHA256_GUID can be preloaded (at build time) into the system
blacklist keyring.

Add the ability to also preload EFI_CERT_X509_GUID dbx entries.

This series can be applied on its own; however to use preloaded
revocation certificates, [1] should be applied first.

[1] https://www.spinics.net/lists/keyrings/msg08422.html


Eric Snowberg (2):
  certs: Move load_system_certificate_list to a common function
  certs: Add ability to preload revocation certs

 certs/Kconfig                   |  8 +++++
 certs/Makefile                  | 20 ++++++++++--
 certs/blacklist.c               | 17 ++++++++++
 certs/common.c                  | 56 +++++++++++++++++++++++++++++++++
 certs/common.h                  |  9 ++++++
 certs/revocation_certificates.S | 21 +++++++++++++
 certs/system_keyring.c          | 49 ++---------------------------
 scripts/Makefile                |  1 +
 8 files changed, 132 insertions(+), 49 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h
 create mode 100644 certs/revocation_certificates.S


base-commit: 02de58b24d2e1b2cf947d57205bd2221d897193c
-- 
2.18.1

