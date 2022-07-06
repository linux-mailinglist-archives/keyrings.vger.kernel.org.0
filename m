Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98987568B36
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 16:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbiGFO3H (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Jul 2022 10:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233399AbiGFO3E (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Jul 2022 10:29:04 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763272658;
        Wed,  6 Jul 2022 07:28:57 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266EGfhH014880;
        Wed, 6 Jul 2022 14:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=K8I/xFNNYnKZsWrRatGZ+DWv4j8ApzU7WSvXTR4REvg=;
 b=A1EHVr/SK41RsV9YRGY832WhBWXhcplqnwVIgmLzWs1NvZZkWMN6GXK6gkXy8Oeuemoy
 xFlTVhZtSrjjaDTctseIICXUR9hw7gfRc9te+ovJMaEZI91d6L6iWyCbQR2GfjJcz4J9
 yn5pMrcP5JQk0ZMe7I7epNId7FCvP+CEdf+RSa73tZO1i6J/JXgkzO4X3+Bd3Pc1ydNs
 13I6zCTmG6RbUMY2GjRpkvWhYpWqW+MSMDIqiKbxZgX+RoqLFL4F7ygl6G3CEywK0HMT
 fbi29JE7XQojyHmIOW2LEmbnhrznH3Gw9azXEgQonqUlbhV/c3IxnptDL78tJyLe0Hru Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5c1109u7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 14:28:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 266EHI3K020915;
        Wed, 6 Jul 2022 14:28:34 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5c1109tt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 14:28:34 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 266ELPDp001198;
        Wed, 6 Jul 2022 14:28:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma01wdc.us.ibm.com with ESMTP id 3h4ud1mx7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 14:28:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 266ESWFt31064504
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 6 Jul 2022 14:28:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C50C5BE04F;
        Wed,  6 Jul 2022 14:28:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CDC56BE059;
        Wed,  6 Jul 2022 14:28:31 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.160.24.101])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  6 Jul 2022 14:28:31 +0000 (GMT)
Message-ID: <ba904e767b52ce511dfe8442a628ef72714846be.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] arch_vars: create arch specific permanent store
From:   Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reply-To: gjoyce@linux.vnet.ibm.com
To:     Christoph Hellwig <hch@infradead.org>
Cc:     keyrings@vger.kernel.org, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org, andrzej.jakowski@intel.com,
        jonathan.derrick@linux.dev, drmiller.lnx@gmail.com,
        linux-block@vger.kernel.org, brking@linux.vnet.ibm.com
Date:   Wed, 06 Jul 2022 09:28:31 -0500
In-Reply-To: <YsVDmPyjHLIZm+Qn@infradead.org>
References: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
         <20220706023935.875994-5-gjoyce@linux.vnet.ibm.com>
         <YsVDmPyjHLIZm+Qn@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qm5iga0niUJXQrCeVyoclwvJJS3hbkXJ
X-Proofpoint-ORIG-GUID: xeGT0snnfM9Ik8B5fchT4D83jzwJr3GD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_08,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=996
 impostorscore=0 clxscore=1011 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060056
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2022-07-06 at 01:11 -0700, Christoph Hellwig wrote:
> On Tue, Jul 05, 2022 at 09:39:35PM -0500, gjoyce@linux.vnet.ibm.com
> wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Platforms that have a permanent key store may provide unique
> > platform dependent functions to read/write variables. The
> > default (weak) functions return -EOPNOTSUPP unless overridden
> > by architecture/platform versions.
> 
> Which is none as of this patch set, as is the number of of users of
> this API.  Did this slip in by accident?

You are correct, there are currently no platforms that utilize this
key store interface. However, there is a pseries platform store that 
has a driver that will provide the interfaces. This is in a separate
patchset that is currently being submitted.

