Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73B263F5C7
	for <lists+keyrings@lfdr.de>; Thu,  1 Dec 2022 17:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiLAQ6r (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Dec 2022 11:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiLAQ6q (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Dec 2022 11:58:46 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AB39F4AC;
        Thu,  1 Dec 2022 08:58:45 -0800 (PST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1GmhNE010439;
        Thu, 1 Dec 2022 16:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=pj58WVXXNN609Xhw996yx5QlHJylHM682FuOaw78+cA=;
 b=HmfjuEQEFBQRViBfY4yvfQXkknQbsqcXuhcuhyIsXy5c4FuC6rEgxfXBelPbkFSJiKg0
 2AMDZgDCgfrVEvVog1BIlknly5yOwSB2CrXHJ+mzGB7qnTCoL5SzYwfoWH+t/P+w4JC0
 prjCv42breooTvrrfSrYbXk8aDhqHbbQ4pwZhdLZZ7Brm9K7nR5PTfeBhGLS2lDb+1VJ
 xDle6zr1Jfv5vv4MJg5UoAvFKeh5tECh2YnZNSe0TujloQFa8aP7tCBFkHI20EoPfkAH
 7hBOZIXYUiJQ9AN2hunwv7EUYjZOU3h1/cgoNxYwRq/Df1rugovCjoCWPTjnFZJGgKm2 qw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m7049g6x0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Dec 2022 16:58:28 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1Go4df008135;
        Thu, 1 Dec 2022 16:58:27 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
        by ppma02dal.us.ibm.com with ESMTP id 3m3aea50xq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Dec 2022 16:58:27 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
        by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B1GwQvn47972664
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 1 Dec 2022 16:58:26 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3B49158068;
        Thu,  1 Dec 2022 16:58:26 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A93EE58050;
        Thu,  1 Dec 2022 16:58:24 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.160.99.100])
        by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  1 Dec 2022 16:58:24 +0000 (GMT)
Message-ID: <1067c2c05bdbc8c11ef91cf2ba56445ad4ba4673.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
From:   Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reply-To: gjoyce@linux.vnet.ibm.com
To:     Ben Boeckel <me@benboeckel.net>
Cc:     Hannes Reinecke <hare@suse.de>, linux-block@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org
Date:   Thu, 01 Dec 2022 10:58:24 -0600
In-Reply-To: <Y4jSi+pd8D069w4D@megas.dev.benboeckel.internal>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
         <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
         <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
         <2133c00e5e7c53c458dbb709204c955bac8bee88.camel@linux.vnet.ibm.com>
         <Y4gjgf2xHOYTVnSc@farprobe>
         <044c90dc7feb3959b5740154addc230ba9a57216.camel@linux.vnet.ibm.com>
         <Y4jSi+pd8D069w4D@megas.dev.benboeckel.internal>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ICqBmfOIUzWSlQWRRm8rcbB4Kpnrcoad
X-Proofpoint-GUID: ICqBmfOIUzWSlQWRRm8rcbB4Kpnrcoad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010123
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2022-12-01 at 11:12 -0500, Ben Boeckel wrote:
> On Thu, Dec 01, 2022 at 09:29:36 -0600, Greg Joyce wrote:
> > On Wed, 2022-11-30 at 22:46 -0500, Ben Boeckel wrote:
> > > Perhaps naming it `OPAL_MAX_KEY_LEN` would help clarify this?
> > 
> > I'm not averse to changing it because it would be clearer. My
> > concern
> > is that it's been OPAL_KEY_MAX for 5+ years (the original SED Opal
> > commit). Unless there is strong consensus to change it, I'm going
> > to
> > leave it as the original name.
> 
> I don't care about the name (very much in the peanut gallery), just
> it
> not being a magic number :) .
> 
> --Ben

Now I get you! I think that you mean changing to this:

                if (ret > 0) {
                        if (ret > sizeof(key->key_len)) {
                                ret = -ENOSPC;
                                goto error;
                        }
                        key->key_len = ret;
                        key->key_type = OPAL_INCLUDED;
                }

