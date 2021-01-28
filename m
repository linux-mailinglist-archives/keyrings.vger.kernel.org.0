Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395BE3079C4
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 16:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbhA1Paa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 10:30:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29170 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231718AbhA1PaG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 10:30:06 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10SFLaCT077541;
        Thu, 28 Jan 2021 10:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=GyDjDpNYMVYYyuvqFG01VOsGa4j+Mn3jzM16mD+XQZE=;
 b=eG02fpaE7hmqyVq/g/kVD3NQfgZIRy4Vv8uHKsafFPpD1ptgGlsjaoiDQM1fYA6a/EWi
 8bc4cM920kDV/x88OjpkpqO8f0wvFu8iFdvggK8cQGyeH9zPrRg/K+VBJjME+Vb8ct2f
 KQXcX4F9LXQ7nCKASYtUt3BpJXrHOPEylJ2K8+EW720du4SPBnmiGJwD52rA6w6ykPtP
 SJdYHvO06s/n6GQFHNJk1rfojZfJVpuQZpHM2J6/8ZP+7FWe/Ak4pTOyIMfqdSpKKLRp
 wfz/9Z5JWqYhWIXVhSyp4AaodlS23ciJ7rOT09rWI93h0U8ecwwmbA5JiAfDiM4VjVpM Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36by9chehy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 10:29:17 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SFMnhM085312;
        Thu, 28 Jan 2021 10:29:16 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36by9cheh5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 10:29:16 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SFMCpZ001645;
        Thu, 28 Jan 2021 15:29:13 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma01fra.de.ibm.com with ESMTP id 368be82k5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 15:29:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10SFT37632047484
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 15:29:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4D665AE051;
        Thu, 28 Jan 2021 15:29:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2DA73AE045;
        Thu, 28 Jan 2021 15:29:08 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.115.82])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 15:29:08 +0000 (GMT)
Message-ID: <fb6c895d98596d802c825961ca8c5ee0a91f8d29.camel@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for dbx/mokx
 entries
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     David Howells <dhowells@redhat.com>,
        Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, lszubowi@redhat.com, javierm@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org
Date:   Thu, 28 Jan 2021 10:29:07 -0500
In-Reply-To: <1ff03fa10f78884b399e2c20ca4e376b575d5b0f.camel@linux.ibm.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
         <3568165.1611846997@warthog.procyon.org.uk>
         <1ff03fa10f78884b399e2c20ca4e376b575d5b0f.camel@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-28_08:2021-01-28,2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280074
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2021-01-28 at 10:27 -0500, Mimi Zohar wrote:
> Hi David,
> 
> On Thu, 2021-01-28 at 15:16 +0000, David Howells wrote:
> > Which tree do you envision this going through?  EFI or keyrings - or are you
> > going to ask Linus to pull it directly?  I can pull it if it should go through
> > the keyrings tree.
> 
> There's one more patch, yet to be posted, which updates
> asymmetric_verify().  As long as you're willing to upstream all of the
> patches, that's fine with me.

Oops, wrong thread.  I thought this was Stefan's patch set.

Mimi

