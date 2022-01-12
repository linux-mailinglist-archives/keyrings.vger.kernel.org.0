Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341B248C819
	for <lists+keyrings@lfdr.de>; Wed, 12 Jan 2022 17:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355061AbiALQUG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 Jan 2022 11:20:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21244 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355148AbiALQT5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 Jan 2022 11:19:57 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CEpYUH021916;
        Wed, 12 Jan 2022 16:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=ce6e6aaaWScr3YcKSeQl0DRtRkuBRP0VGE83AygbjFE=;
 b=d6Uh4aXRC2QgMRnetHZHV18LdLBx8UzPVgS4hTPTnckFak4Qc4xo2XsM8jn2LJ4kMeYf
 rAgX26DatTKl984GC2I2iFzfTTDzNtkpzl2TNg+HiCWPYKC4EL8c7PlS5YP+DhEqU2kl
 rwCSFYWAAPiV5VnluHhcm9C7FZ3/85OyVizWruwC48tYpgxYFVEc7f2+pyrjbRlqvERc
 ul8O5gcnrafudGvKqaQjJQEFZq3HxZHNgDZYH/oLAB+mOvAFpHB9/Z9LocVk2/rD6bNu
 DRb8GFzSxOsyvAzrCqT3q9/m3M8kIWhNZBhbKOMbYVoFZsKyrJWXqdVE4crKNmGVCuep 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3dj14a1wgu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jan 2022 16:19:55 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CF4wbR004402;
        Wed, 12 Jan 2022 16:19:54 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3dj14a1wgd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jan 2022 16:19:54 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CG9s8K007679;
        Wed, 12 Jan 2022 16:19:54 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma02wdc.us.ibm.com with ESMTP id 3df28b6w6n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jan 2022 16:19:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 20CGJqkL34144604
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Jan 2022 16:19:52 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C801A11206B;
        Wed, 12 Jan 2022 16:19:52 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0F766112063;
        Wed, 12 Jan 2022 16:19:52 +0000 (GMT)
Received: from [9.77.149.101] (unknown [9.77.149.101])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 12 Jan 2022 16:19:51 +0000 (GMT)
Message-ID: <9ee87a11-3e0f-63c7-45a4-af5fe168fae9@linux.vnet.ibm.com>
Date:   Wed, 12 Jan 2022 10:19:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, gjoyce@ibm.com
From:   Douglas Miller <dougmill@linux.vnet.ibm.com>
Subject: RESEND: security: keys: Making key_type_lookup() public
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yb1eHQu0cELQdoobIB2Tic6pAx5aHWID
X-Proofpoint-GUID: IKyfD4jyw68FeSK1Z0b7ngj5tAZt9FKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120103
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I'd like to explore the possibility of making key_type_lookup() 
available to other kernel components, the same way that 
[un]register_key_type() is available. I'm wondering if there is a reason 
that this function shouldn't be available for use.


The reason we would like to use this function is for support of SED-OPAL 
drives using block/sed-opal.c. On certain PowerPC platforms there is a 
Platform Key Store (PKS) available and we want to use that as a
repository for SED-OPAL PEKs.


Rather than add platform-specific code to block/sed-opal.c, we are 
looking at using the Linux keyring facility, and then providing a 
special key_type, for the PKS driver, on platforms that support it. We 
would like to have block/sed-opal.c simply call key_type_lookup() for 
the PKS key type, and then (if found) instantiate the keys into the 
keyring. On platforms without a PKS, the same keyring can be used to 
instantiate keys of other types, manually or automatically. These keys 
can then be used directly in SED-OPAL commands without the need to read 
them into userland process memory and pass them in system calls. Any 
platform (non-PowerPC) that might have a Platform Key Store could 
implement this PKS key type as well.


Please let us know if this acceptable. It seems that key_type_lookup() 
is a natural companion to [un]register_key_type() - which are already 
exported symbols.

Thanks,
Doug
