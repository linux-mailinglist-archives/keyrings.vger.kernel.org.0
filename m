Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E1C63F5D8
	for <lists+keyrings@lfdr.de>; Thu,  1 Dec 2022 18:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiLARB1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Dec 2022 12:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiLARBZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Dec 2022 12:01:25 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B78A555A;
        Thu,  1 Dec 2022 09:01:22 -0800 (PST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1GKnuc022886;
        Thu, 1 Dec 2022 17:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=q+BvG6UhlQSlzQh257hTl3BMT3FiMpCJw8aw57fwUr0=;
 b=gDz/aUlYTUllaJrwkQQEdiCScCKC7pv4zBs3qtmgOEVZLBpSlO9cCiihXCfbfm+EgB9W
 8CqkBDPPbdUMCQzALYQ4AK38ThNcsWK96MekPPJ584vZC+daiQgfzsmQRw3Pcx9d+F82
 OrsTgVvLw8pQr16Y86IqMYdeUB/nlzWRmjjppvAIvIz8sv/7+TkHat2CRWzMLA7B27s0
 Gt8nztP/lA1mykwdCDafuNjVACFxv1POUQHgtrd0kEwPSQ0HqCcb7aUgxRVj2kpbIQUa
 QQ6ZYdCuRK8lVn9tAPKMvlkYykLt3DFGtdxFi4ZZZjrh5LedsoSTI5QNoagxa4oT6BCZ Gw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6ypv93m9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Dec 2022 17:00:43 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1GnbIq007007;
        Thu, 1 Dec 2022 17:00:42 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
        by ppma01wdc.us.ibm.com with ESMTP id 3m3ae9v40v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Dec 2022 17:00:42 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
        by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B1H0gGr41484620
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 1 Dec 2022 17:00:42 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F3C865804E;
        Thu,  1 Dec 2022 17:00:40 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D48BE58067;
        Thu,  1 Dec 2022 17:00:39 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.160.99.100])
        by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  1 Dec 2022 17:00:39 +0000 (GMT)
Message-ID: <69f867ba78c1d139bf552bcc69f2fd9a12b376df.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
From:   Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reply-To: gjoyce@linux.vnet.ibm.com
To:     Ben Boeckel <me@benboeckel.net>
Cc:     Hannes Reinecke <hare@suse.de>, linux-block@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org
Date:   Thu, 01 Dec 2022 11:00:39 -0600
In-Reply-To: <1067c2c05bdbc8c11ef91cf2ba56445ad4ba4673.camel@linux.vnet.ibm.com>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
         <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
         <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
         <2133c00e5e7c53c458dbb709204c955bac8bee88.camel@linux.vnet.ibm.com>
         <Y4gjgf2xHOYTVnSc@farprobe>
         <044c90dc7feb3959b5740154addc230ba9a57216.camel@linux.vnet.ibm.com>
         <Y4jSi+pd8D069w4D@megas.dev.benboeckel.internal>
         <1067c2c05bdbc8c11ef91cf2ba56445ad4ba4673.camel@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 00v4axaZakHBN3rF-XuCa3MtXRuzEChq
X-Proofpoint-ORIG-GUID: 00v4axaZakHBN3rF-XuCa3MtXRuzEChq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010123
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2022-12-01 at 10:58 -0600, Greg Joyce wrote:
> On Thu, 2022-12-01 at 11:12 -0500, Ben Boeckel wrote:
> > On Thu, Dec 01, 2022 at 09:29:36 -0600, Greg Joyce wrote:
> > > On Wed, 2022-11-30 at 22:46 -0500, Ben Boeckel wrote:
> > > > Perhaps naming it `OPAL_MAX_KEY_LEN` would help clarify this?
> > > 
> > > I'm not averse to changing it because it would be clearer. My
> > > concern
> > > is that it's been OPAL_KEY_MAX for 5+ years (the original SED
> > > Opal
> > > commit). Unless there is strong consensus to change it, I'm going
> > > to
> > > leave it as the original name.
> > 
> > I don't care about the name (very much in the peanut gallery), just
> > it
> > not being a magic number :) .
> > 
> > --Ben
> 
> Now I get you! I think that you mean changing to this:
> 
>                 if (ret > 0) {
>                         if (ret > sizeof(key->key_len)) {
>                                 ret = -ENOSPC;
>                                 goto error;
>                         }
>                         key->key_len = ret;
>                         key->key_type = OPAL_INCLUDED;
>                 }

Sorry, that's incorrect. I think that you just meant removing the 255.

