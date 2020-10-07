Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EA228557A
	for <lists+keyrings@lfdr.de>; Wed,  7 Oct 2020 02:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgJGAhK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Oct 2020 20:37:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41698 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725972AbgJGAhJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 6 Oct 2020 20:37:09 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0970aoLu109570;
        Tue, 6 Oct 2020 20:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ae9fLVVid9lF9YcajNxeQMap2FCp+aZ8ZyrOI3ifJD0=;
 b=IdjE18ud6Cu0gfYtNV+FymsXamH+3Llphu664c+UfgXdrtuYbuhtcIgS2D/JItt0/3HJ
 uCPpMDqZM2YLyqws9FWUBIWk68kky4M7aY9zkmjr+wQwUag6o3YCVSFPewijAOqOjl/W
 dgpmK8T7GB1QwpSfHlrmOWE4lfcH6B/HhB34aJ/AecBET52KP+s6LsT2eMXDULFbxzXa
 I1xyp8xvjiUOqYBhbFlaJuhXxvXfmXv2zTaPOR/kVKK/zR5XPnZ+gLydh6jb6NfkPy/o
 FQsxTQlwEukudQi0HS0M0BvYSecwzFxKGlDP1i3h9BceNKDhP0xHiQcQmek4t/Yt6JtR lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3412x9gbgx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Oct 2020 20:37:06 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0970b3X3110265;
        Tue, 6 Oct 2020 20:37:03 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3412x9gbaf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Oct 2020 20:37:02 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0970T5jg011726;
        Wed, 7 Oct 2020 00:33:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03fra.de.ibm.com with ESMTP id 33xgx7sx6k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 00:33:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0970XRQK34341294
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Oct 2020 00:33:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F120E4C044;
        Wed,  7 Oct 2020 00:33:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EAA7A4C058;
        Wed,  7 Oct 2020 00:33:25 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.160.2.83])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  7 Oct 2020 00:33:25 +0000 (GMT)
Message-ID: <ca5aee11d71d825408a4bda71b5d5cfa879e8c18.camel@linux.ibm.com>
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Anatol Pomozov <anatol.pomozov@gmail.com>
Cc:     keyrings@vger.kernel.org
Date:   Tue, 06 Oct 2020 20:33:24 -0400
In-Reply-To: <20201006233900.GA122646@linux.intel.com>
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
         <20201006155624.GC111447@linux.intel.com>
         <20201006155656.GD111447@linux.intel.com>
         <CAOMFOmWbxPZ4=XKPkX89DaGhGez94NZopexYUj7hA7rDXb9x0g@mail.gmail.com>
         <20201006233900.GA122646@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-06_15:2020-10-06,2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060158
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2020-10-07 at 02:39 +0300, Jarkko Sakkinen wrote:
> On Tue, Oct 06, 2020 at 10:18:43AM -0700, Anatol Pomozov wrote:
> > Hi
> > 
> > On Tue, Oct 6, 2020 at 8:59 AM Jarkko Sakkinen
> > <jarkko.sakkinen@linux.intel.com> wrote:
> > >
> > > On Tue, Oct 06, 2020 at 06:56:28PM +0300, Jarkko Sakkinen wrote:
> > > > On Mon, Oct 05, 2020 at 03:52:58PM -0700, Anatol Pomozov wrote:
> > > > > It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> > > > > Adding algo name makes it easier to understand what cipher has failed.
> > > > >
> > > > > Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
> > > >
> > > > NAK, because you are missing David Howells from the CC list.
> > >
> > > Oh and also me. You are essentially missing all the keyring maintainers.
> > 
> > The MAINTAINERS file states following:
> > 
> > KEYS-ENCRYPTED
> > M:      Mimi Zohar <zohar@linux.ibm.com>
> > L:      linux-integrity@vger.kernel.org
> > L:      keyrings@vger.kernel.org
> > S:      Supported
> > F:      Documentation/security/keys/trusted-encrypted.rst
> > F:      include/keys/encrypted-type.h
> > F:      security/keys/encrypted-keys/
> > 
> > Everything seems fine as I included the official maintainer and the
> > project maillist.
> > 
> > If David is not subscribed to the project maillist I'll be glad to CC
> > him as well.
> 
> Ugh, you are right then. Those two lists still confuse me thought
> but that is not your fault.

Please refer to Documentation/security/keys/trusted-encrypted.rst for
an explanation.

> 
> Based on that I can give my ack because the change looks right
> still.
> 
> Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> Thanks for explaining the situation.

Thanks, Jarrko.  I'm on vacation, returning next week.

Mimi

