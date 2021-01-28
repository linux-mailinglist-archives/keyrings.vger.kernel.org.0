Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB813079BC
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 16:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhA1P3B (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 10:29:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35124 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231924AbhA1P2y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 10:28:54 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10SFLm9C068637;
        Thu, 28 Jan 2021 10:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=T59iizbde6nlJE+dn/NHQkyZoh4iipcPhYD4lPePkLY=;
 b=XsSWgVisg/8XGSJAWQKjTEIfZvmQI5cm2hX54Aeb0OJXI9Z01anPM0q+L+Ic2iMu7vFc
 M6q4B6pwc5veCXkHTRKHNALAbV6Qgm9nMgIEzVdofT+Ce4PfF3nuQ1JdA5ObqnEDUwWl
 AbWKQCBL35kUAf6OjSFrcaIW9Ck+jx77md5brV/OBtoQB9CDrGfrdCbYRLpcIRzrHPQI
 4JfCWXLZItTaNQaiBdA6M0MTf3867sXyUwYyWWVdbtla805GEiQM2X5lk9RCfAEQ+9ky
 4CyuGBENYaezc+H9P8H4vsFQCFRUQgnQr6/ofrtKr6Lcnmbae1w7yeEAM7eaRv4147xp 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bqx3ykr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 10:27:57 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SFMV3B071534;
        Thu, 28 Jan 2021 10:27:56 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bqx3ykpx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 10:27:56 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SFMPY6019181;
        Thu, 28 Jan 2021 15:27:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma02fra.de.ibm.com with ESMTP id 368be8ak9s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 15:27:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10SFRp4A45547890
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 15:27:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B694AA4053;
        Thu, 28 Jan 2021 15:27:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8F63FA4040;
        Thu, 28 Jan 2021 15:27:48 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.115.82])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 15:27:48 +0000 (GMT)
Message-ID: <1ff03fa10f78884b399e2c20ca4e376b575d5b0f.camel@linux.ibm.com>
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
Date:   Thu, 28 Jan 2021 10:27:47 -0500
In-Reply-To: <3568165.1611846997@warthog.procyon.org.uk>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
         <3568165.1611846997@warthog.procyon.org.uk>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-28_08:2021-01-28,2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280074
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi David,

On Thu, 2021-01-28 at 15:16 +0000, David Howells wrote:
> Which tree do you envision this going through?  EFI or keyrings - or are you
> going to ask Linus to pull it directly?  I can pull it if it should go through
> the keyrings tree.

There's one more patch, yet to be posted, which updates
asymmetric_verify().  As long as you're willing to upstream all of the
patches, that's fine with me.

thanks!

Mimi

