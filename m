Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999D92D65C2
	for <lists+keyrings@lfdr.de>; Thu, 10 Dec 2020 20:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393290AbgLJS6o (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Dec 2020 13:58:44 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:37476 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393280AbgLJS60 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Dec 2020 13:58:26 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BAItPjn018585;
        Thu, 10 Dec 2020 18:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=H/4Xhon6gyv1yvafz+CvgbgQzeUprDw4jRoragP4NGM=;
 b=GucSOwhUWl6lgomtvDJdNJQYRaBdvsik5bOjr7hfXN3TY1WDiz6nsCu252BnM+sKgd/o
 0ooRoVzbbhkLgCqe25w+YF2lQbSyBocXpWZ3O4+rVMVVknEB5ID65BQqiomiehQ4jaxE
 jEzEbV8NyNzMPds3WY3C7Lhqf/bEsDNc0xrrphFmEDnv/dkF/GyNqkQjVrGvZg7Nla+K
 zpvYvJu3tM9mWQGkao7uc+knNOFkduj5BULmdc/R5GK1LWsCwLpTVj5xe35X2dT5L4Ai
 ag0FzGAFOJio4SJBjtnw1bVgZg+G25E7dr3wMIJlgRfNE/8oeY3QUXpyMmfGO7JC7gXx Cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 357yqc760v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Dec 2020 18:57:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BAIsl13080562;
        Thu, 10 Dec 2020 18:57:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 358kywrpek-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Dec 2020 18:57:15 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BAIv1Zm011914;
        Thu, 10 Dec 2020 18:57:01 GMT
Received: from dhcp-10-65-174-87.vpn.oracle.com (/10.65.174.87)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Dec 2020 10:57:01 -0800
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <1360578.1607593748@warthog.procyon.org.uk>
Date:   Thu, 10 Dec 2020 11:56:58 -0700
Cc:     dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Eric Snowberg <eric.snowberg@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
References: <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=3 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100118
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> =
wrote:
>=20
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>=20
>> Add support for EFI_CERT_X509_GUID dbx entries. When a =
EFI_CERT_X509_GUID
>> is found, it is added as an asymmetrical key to the .blacklist =
keyring.
>> Anytime the .platform keyring is used, the keys in the .blacklist =
keyring
>> are referenced, if a matching key is found, the key will be rejected.
>=20
> Ummm...  Why this way and not as a blacklist key which takes up less =
space?
> I'm guessing that you're using the key chain matching logic.  We =
really only
> need to blacklist the key IDs.

I implemented it this way so that certs in the dbx would only impact=20
the .platform keyring. I was under the impression we didn=E2=80=99t want =
to have=20
Secure Boot UEFI db/dbx certs dictate keyring functionality within the =
kernel
itself. Meaning if we have a matching dbx cert in any other keyring =
(builtin,
secondary, ima, etc.), it would be allowed. If that is not how you=E2=80=99=
d like to=20
see it done, let me know and I=E2=80=99ll make the change.

> Also, what should happen if a revocation cert rejected by the =
blacklist?

I=E2=80=99m not sure I understand the question. How would it be =
rejected?

>> +int mark_key_revocationlisted(const char *data, size_t size)
>=20
> Hmmm...  The name looks wrong, but I can see the potential issue that =
kernel
> keys can actually be marked revoked as a separate concept.  How about
> add_key_to_revocation_list() and is_key_on_revocation_list().

I'll update the names in the next version.

Thanks.

