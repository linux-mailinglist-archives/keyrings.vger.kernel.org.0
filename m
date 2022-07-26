Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40D8581A05
	for <lists+keyrings@lfdr.de>; Tue, 26 Jul 2022 20:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiGZSyJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jul 2022 14:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239729AbiGZSyG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jul 2022 14:54:06 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B913206D;
        Tue, 26 Jul 2022 11:54:05 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QIjTjF000395;
        Tue, 26 Jul 2022 18:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=jK2gCVPTH8hIAwxMHJ3UR7BzxHKJx/kZjhc0g9iMAc8=;
 b=Ip5RZR2I9HcjtFdReySSCf9QYscbte49210i+C7jw+DeddsjsXSFk2Mc0zWucqNV70GT
 UZ9OiNVG81PgE85+5gKNODbpoeL71Ie+E2EVLNqAjlP97RH1BA4DPd6vxyDrvyUav/lH
 rNswQJfJv81VmcxzRUfi9FicnycvGwxp+J/tbnJxwxbFsM7ApAhAqGqnp+XddubbZ6Kd
 OzwXUFkDeRyugNCJQ1/Vy74daJYcStiNTYUX5ChUF8+a340YF8zi7id5nc1dJMRSAj4A
 MM4Jj4ereWbyzS8FOVWSmgRAJnVKDCyZ/hqxYY83hqe7kCKeNlOXMifgcco1aOWPfBag Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjntr06u7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jul 2022 18:53:49 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QIjd3k001219;
        Tue, 26 Jul 2022 18:53:49 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjntr06ts-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jul 2022 18:53:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26QIp81O008780;
        Tue, 26 Jul 2022 18:53:48 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma01dal.us.ibm.com with ESMTP id 3hg98s1gvj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jul 2022 18:53:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26QIrl1t11010800
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jul 2022 18:53:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5AE3A112062;
        Tue, 26 Jul 2022 18:53:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BDCDD112061;
        Tue, 26 Jul 2022 18:53:46 +0000 (GMT)
Received: from sig-9-77-138-167.ibm.com (unknown [9.77.138.167])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jul 2022 18:53:46 +0000 (GMT)
Message-ID: <58654fc70b38694df98e51e8e310ce34cec01816.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] arch_vars: create arch specific permanent store
From:   Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reply-To: gjoyce@linux.vnet.ibm.com
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, greg@gilhooley.com, gjoyce@ibm.com
Date:   Tue, 26 Jul 2022 13:53:46 -0500
In-Reply-To: <YtezuVYVQnqX2IsY@infradead.org>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
         <20220718210156.1535955-5-gjoyce@linux.vnet.ibm.com>
         <YtezuVYVQnqX2IsY@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hTi9DWJG_tf8497GjjoGIVFymTJZFO3R
X-Proofpoint-GUID: x9NT1qgxzXc5J_0hLeFcHduzw3YZeFet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_05,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260071
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2022-07-20 at 00:50 -0700, Christoph Hellwig wrote:
> On Mon, Jul 18, 2022 at 04:01:56PM -0500, gjoyce@linux.vnet.ibm.com
> wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Platforms that have a permanent key store may provide unique
> > platform dependent functions to read/write variables. The
> > default (weak) functions return -EOPNOTSUPP unless overridden
> > by architecture/platform versions.
> 
> This is still lacking any useful implementation.  It also seems to be
> used in patch 3 before it actually is used.
> 
> As the functionality seems optional I'd suggest to drop this patch
> for
> now and not call it from patch 3, and do a separate series later that
> adds the infrastructure, at leat one useful backend and the caller.

It's kind of a chicken and egg thing. I'd hoped to add the
infrastructure and follow it up with another pseries specific patchset
that provided platform specific implementations of those functions.

But I can break it up as you suggest. I'll include your other comments
as well as the keyring suggestion from Hannes.

