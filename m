Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F3412F916
	for <lists+keyrings@lfdr.de>; Fri,  3 Jan 2020 15:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgACOPr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 3 Jan 2020 09:15:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46508 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727610AbgACOPr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 3 Jan 2020 09:15:47 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 003ECIOK177294
        for <keyrings@vger.kernel.org>; Fri, 3 Jan 2020 09:15:46 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xa2c4ft8r-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Fri, 03 Jan 2020 09:15:45 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <keyrings@vger.kernel.org> from <zohar@linux.ibm.com>;
        Fri, 3 Jan 2020 14:15:43 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 3 Jan 2020 14:15:40 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 003EFd7031523070
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 3 Jan 2020 14:15:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8976EA4040;
        Fri,  3 Jan 2020 14:15:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E7FB3A404D;
        Fri,  3 Jan 2020 14:15:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.213.69])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  3 Jan 2020 14:15:37 +0000 (GMT)
Subject: Re: [PATCH v6 1/3] IMA: Define workqueue for early boot key
 measurements
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        James.Bottomley@HansenPartnership.com,
        linux-integrity@vger.kernel.org
Cc:     eric.snowberg@oracle.com, dhowells@redhat.com,
        mathew.j.martineau@linux.intel.com, matthewgarrett@google.com,
        sashal@kernel.org, jamorris@linux.microsoft.com,
        linux-kernel@vger.kernel.org, keyrings@vger.kernel.org
Date:   Fri, 03 Jan 2020 09:15:37 -0500
In-Reply-To: <20200103055608.22491-2-nramas@linux.microsoft.com>
References: <20200103055608.22491-1-nramas@linux.microsoft.com>
         <20200103055608.22491-2-nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010314-0008-0000-0000-000003463B2B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010314-0009-0000-0000-00004A6674CA
Message-Id: <1578060937.5874.140.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-03_04:2020-01-02,2020-01-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=787 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001030133
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Lakshmi,

On Thu, 2020-01-02 at 21:56 -0800, Lakshmi Ramasubramanian wrote:
> Measuring keys requires a custom IMA policy to be loaded.
> Keys created or updated before a custom IMA policy is loaded should
> be queued and the keys should be processed after a custom policy
> is loaded.
> 
> This patch defines workqueue for queuing keys when a custom IMA policy
> has not yet been loaded.
> 
> A flag namely ima_process_keys is used to check if the key should be
> queued or should be processed immediately.
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Reported-by: kbuild test robot <lkp@intel.com>

The changes based on "kernel test robot" reports are properly folded
into this patch, but unless the tag - "Acked-by", "Reported-by" - is
qualified, it refers to the entire patch.  Let's limit it as:

Reported-by: kernel test robot <rong.a.chen@intel.com> # sleeping
function called from invalid context
Reported-by: kbuild test robot <lkp@intel.com> # sparse symbol
ima_queued_key() should be static

Mimi

