Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E39C10FD8E
	for <lists+keyrings@lfdr.de>; Tue,  3 Dec 2019 13:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfLCMZy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 3 Dec 2019 07:25:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37526 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725907AbfLCMZy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 3 Dec 2019 07:25:54 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB3CMx6G125808
        for <keyrings@vger.kernel.org>; Tue, 3 Dec 2019 07:25:53 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6sp99pr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Tue, 03 Dec 2019 07:25:52 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <keyrings@vger.kernel.org> from <zohar@linux.ibm.com>;
        Tue, 3 Dec 2019 12:25:50 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 3 Dec 2019 12:25:48 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xB3CP7YJ49611108
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Dec 2019 12:25:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 50C9DA4055;
        Tue,  3 Dec 2019 12:25:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 49AC7A4051;
        Tue,  3 Dec 2019 12:25:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.191.79])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue,  3 Dec 2019 12:25:46 +0000 (GMT)
Subject: Re: [PATCH v9 5/6] IMA: Add support to limit measuring keys
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        linux-integrity@vger.kernel.org
Cc:     eric.snowberg@oracle.com, dhowells@redhat.com,
        matthewgarrett@google.com, sashal@kernel.org,
        jamorris@linux.microsoft.com, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org
Date:   Tue, 03 Dec 2019 07:25:45 -0500
In-Reply-To: <20191127015654.3744-6-nramas@linux.microsoft.com>
References: <20191127015654.3744-1-nramas@linux.microsoft.com>
         <20191127015654.3744-6-nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120312-0016-0000-0000-000002D0578F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120312-0017-0000-0000-0000333250B9
Message-Id: <1575375945.5241.16.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-12-02,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=720 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030098
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Lakshmi,

On Tue, 2019-11-26 at 17:56 -0800, Lakshmi Ramasubramanian wrote:
> Limit measuring keys to those keys being loaded onto a given set of
> keyrings only.
> 
> This patch defines a new IMA policy option namely "keyrings=" that
> can be used to specify a set of keyrings. If this option is specified
> in the policy for "measure func=KEY_CHECK" then only the keys
> loaded onto a keyring given in the "keyrings=" option are measured.
> 
> Added a new parameter namely "keyring" (name of the keyring) to
> process_buffer_measurement(). The keyring name is passed to
> ima_get_action() to determine the required action.
> ima_match_rules() is updated to check keyring in the policy, if
> specified, for KEY_CHECK function.
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

A keyring can be created by any user with any keyring name, other than
 ones dot prefixed, which are limited to the trusted builtin keyrings.
 With a policy of "func=KEY_CHECK template=ima-buf keyrings=foo", for
example, keys loaded onto any keyring named "foo" will be measured.
 For files, the IMA policy may be constrained to a particular uid/gid.
 An additional method of identifying or constraining keyring names
needs to be defined.

Mimi 

