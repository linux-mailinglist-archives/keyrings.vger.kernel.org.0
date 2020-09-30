Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7492227F3FF
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 23:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgI3VPh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 17:15:37 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37510 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3VPg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Sep 2020 17:15:36 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UL9gtb188693;
        Wed, 30 Sep 2020 21:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=PWAWzUlMvTLDptw0iAj4vY+L1nGbxFKy2BPdwEzu/50=;
 b=uiBh8hPTRiNe7PdfO9rQZnxU3VrotJTTvPEr53TYBTKBLaTBh9bW9DDyY3IthsMpXy9M
 Ev1GdD69Jlkm0hP7IWbkxwSW8Rq60vOgp6z6NCwj3Lrnt++ATUi6fdLztjyGS/X27R4r
 zhMwgwYznRJOKGcRP4W+rY5V7Zgcb99COwie8aq7nSvaqA91/TkF8LSVd8sguPAy3JIx
 sF0XCzAySJWu+PiWl5Jxgt3+KVtnnNHwAuhbReTkbwPo3XoWr+JokEoOJ5HXZVITU/IZ
 7E420c2mbqI6l2BnJ5iqY/06jgLu37b3d+h5O5PjgtvbZQnPbyd5tPAGUGNd06pH+A3U eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33swkm2u83-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 21:15:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08ULAwmU089432;
        Wed, 30 Sep 2020 21:15:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 33uv2g0e0c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 21:15:23 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08ULFDEm023807;
        Wed, 30 Sep 2020 21:15:18 GMT
Received: from dhcp-10-65-155-193.vpn.oracle.com (/10.65.155.193)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 14:15:13 -0700
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 1/2] certs: Move load_system_certificate_list to a common
 function
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <20200930210254.GB65339@linux.intel.com>
Date:   Wed, 30 Sep 2020 15:15:10 -0600
Cc:     dhowells@redhat.com, dwmw2@infradead.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Eric Snowberg <eric.snowberg@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9E194595-5A19-42F8-9657-7FB36DE59F16@oracle.com>
References: <20200930201508.35113-1-eric.snowberg@oracle.com>
 <20200930201508.35113-2-eric.snowberg@oracle.com>
 <20200930210254.GB65339@linux.intel.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300173
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Sep 30, 2020, at 3:02 PM, Jarkko Sakkinen =
<jarkko.sakkinen@linux.intel.com> wrote:
>=20
> On Wed, Sep 30, 2020 at 04:15:07PM -0400, Eric Snowberg wrote:
>> Move functionality within load_system_certificate_list to a common
>> function, so it can be reused in the future.
>>=20
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>=20
> I rather think now rather than the future. I think this should be part
> of a patch set where the re-use actually happens.

load_certificate_list is being used in the second patch in the series =
[1].
It uses the now common code, to load the revocation certificates, just =
like
the system certificates are being loaded in this patch.


> Without that context, I rather not say anything about this patch.
> Neither an issue for me if it gets applied. This is just a guideline
> that I follow (in order to manage this chaos).
>=20
> Looking at the code change, I do not see anything strikingly wrong in
> it.

Thanks

[1] https://lore.kernel.org/patchwork/patch/1315486/


