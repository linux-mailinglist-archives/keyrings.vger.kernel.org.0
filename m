Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F3D245894
	for <lists+keyrings@lfdr.de>; Sun, 16 Aug 2020 18:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgHPQgd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 16 Aug 2020 12:36:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39696 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729270AbgHPQg2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 16 Aug 2020 12:36:28 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07GGVwM5058499;
        Sun, 16 Aug 2020 12:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=pWPUnCfTTmcgB53FCS/Fqgx50gn2aVg6wZ+tQejc1bY=;
 b=pZOtNhvILgop3LaQn9adf3GMnMO+eYlsprkn347cWXSYAZWxa/jJtf86eYRgmE+aVcRf
 3sv41IxlvA6YVx5U5xJWvTkUy/3REeyfsghVD0R3RyKBQm7hhLeIX6kRXkQdua2gkIxY
 flA7h+LJHTUT0Za52sIJhAy9oOhY3bCxtHM7GnC2ve37r/bwaTFlHwPAl+TVnuvc5ry8
 cHNVB9liIW1GBJpVQRdl5TfcFyYMcu1h7x4Pzg1aimD+hEObHR0CsUb42wdL3vhB+136
 l0dBAkyrfvOpUlS+Cxx/IG9LMQbdK56/4bAk71kGCRRUIK/YlZOmmEIq3QUQw9xTIHkw LA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32y24hepdd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 12:36:24 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07GGYXlo020987;
        Sun, 16 Aug 2020 16:36:23 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma04wdc.us.ibm.com with ESMTP id 32x7b82pyt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 16 Aug 2020 16:36:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07GGaLSi41222416
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 16 Aug 2020 16:36:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AC3E278064;
        Sun, 16 Aug 2020 16:36:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4EC5878060;
        Sun, 16 Aug 2020 16:36:10 +0000 (GMT)
Received: from [153.66.254.174] (unknown [9.80.233.55])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Sun, 16 Aug 2020 16:36:10 +0000 (GMT)
Message-ID: <1597595769.8344.7.camel@linux.ibm.com>
Subject: Re: [PATCH RESEND] docs: update trusted-encrypted.rst
From:   James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To:     Stefan Berger <stefanb@linux.ibm.com>, Coly Li <colyli@suse.de>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Date:   Sun, 16 Aug 2020 09:36:09 -0700
In-Reply-To: <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
References: <20200815075143.47082-1-colyli@suse.de>
         <cf667ea0-dab7-a242-886c-938582c62ff6@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-16_07:2020-08-14,2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=870 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008160132
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, 2020-08-16 at 12:06 -0400, Stefan Berger wrote:
[...]
> A note in this file states this:
> 
> Note: When using a TPM 2.0 with a persistent key with handle
> 0x81000001, append 'keyhandle=0x81000001' to statements between
> quotes, such as "new 32 keyhandle=0x81000001".
> 
> Now if someone was (still) interested in TPM 1.2 then the below
> changes you are proposing wouldn't work for them. Maybe you should
> adapt the  note to state that these keyhandle=... should be removed
> for the TPM 1.2 case.

Actually, I also have a plan to match what userspace does and simply
assume a keyhandle of 40000001 (generate an EC Storage Primary Key on
the fly) if it's not specified, which will make the TPM1.2 and 2.0
versions of this the same.  Unfortunately the necessary precursor
patches are taking an age to get upstream.

James

