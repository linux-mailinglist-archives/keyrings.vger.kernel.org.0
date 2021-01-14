Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8132F56E5
	for <lists+keyrings@lfdr.de>; Thu, 14 Jan 2021 02:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbhANByo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 20:54:44 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:51606 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbhANBym (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jan 2021 20:54:42 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10E0A346043862;
        Thu, 14 Jan 2021 00:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=wv4LbNfNmGuHNEYJplMsgxpaEzFXn2PGXl/YPwQ35u8=;
 b=NCTHgPiE8FjZxX2Hxm5lOX0R9hWsfZVYz3hozIuQ6fpDyjyyD4OCkdvfN4GzqCRfw5qE
 GHV8/HB2xGSit6YcfLCPLWayABIn6Sd4deMl3SCV3iOhAKHFkxPMI4C13MmRgPwgCCLy
 hdWabKW2JBpxPvOdthhvGHcE+Q7KwJyY6FVBZguJMO/BFh1qI3+cAtPMCwN3HRwdqKg6
 YVOCwDc8cMp7L6xsR/LLy/EUWAhPGTlssAFKjbknuTzy9ZOvwCl9vRlX0gob31JkWNPN
 s3Z5spcvYEx8ajBdjysHnCIvXO+k7bGwTAedYVH2A/DNK2QJtQVeZiwxg0kKrnyuYkKb 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 360kg1x660-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Jan 2021 00:10:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10E00mn5129806;
        Thu, 14 Jan 2021 00:10:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 360kem99t0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Jan 2021 00:10:12 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10E0A1NU012924;
        Thu, 14 Jan 2021 00:10:02 GMT
Received: from dhcp-10-154-114-135.vpn.oracle.com (/10.154.114.135)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 13 Jan 2021 16:10:01 -0800
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <X/9a8naM8p4tT5sO@linux.intel.com>
Date:   Wed, 13 Jan 2021 17:11:10 -0700
Cc:     dwmw2@infradead.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, jmorris@namei.org, serge@hallyn.com,
        nayna@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>,
        erichte@linux.ibm.com, mpe@ellerman.id.au,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        James.Bottomley@HansenPartnership.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A05E3573-B1AF-474B-94A5-779E69E5880A@oracle.com>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
 <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
 <2442460.1610463459@warthog.procyon.org.uk>
 <X/9a8naM8p4tT5sO@linux.intel.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130147
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 13, 2021, at 1:41 PM, Jarkko Sakkinen =
<jarkko.sakkinen@linux.intel.com> wrote:
>=20
> On Tue, Jan 12, 2021 at 02:57:39PM +0000, David Howells wrote:
>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>=20
>>>> On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> =
wrote:
>>>>=20
>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>=20
>>>>> Add support for EFI_CERT_X509_GUID dbx entries. When a =
EFI_CERT_X509_GUID
>>>>> is found, it is added as an asymmetrical key to the .blacklist =
keyring.
>>>>> Anytime the .platform keyring is used, the keys in the .blacklist =
keyring
>>>>> are referenced, if a matching key is found, the key will be =
rejected.
>>>>=20
>>>> Ummm...  Why this way and not as a blacklist key which takes up =
less space?
>>>> I'm guessing that you're using the key chain matching logic.  We =
really only
>>>> need to blacklist the key IDs.
>>>=20
>>> I implemented it this way so that certs in the dbx would only impact=20=

>>> the .platform keyring. I was under the impression we didn=E2=80=99t =
want to have=20
>>> Secure Boot UEFI db/dbx certs dictate keyring functionality within =
the kernel
>>> itself. Meaning if we have a matching dbx cert in any other keyring =
(builtin,
>>> secondary, ima, etc.), it would be allowed. If that is not how =
you=E2=80=99d like to=20
>>> see it done, let me know and I=E2=80=99ll make the change.
>>=20
>> I wonder if that is that the right thing to do.  I guess this is a =
policy
>> decision and may depend on the particular user.
>=20
> Why would you want to allow dbx entry in any keyring?

Today, DB and MOK certs go into the platform keyring.  These certs are =
only
referenced during kexec.  They can=E2=80=99t be used for other things =
like validating
kernel module signatures.  If we follow the same pattern, the DBX and =
MOKX entries
in the blacklist keyring should only impact kexec.=20

Currently, Micka=C3=ABl Sala=C3=BCn has another outstanding series to =
allow root to update=20
the blacklist keyring.  I assume the use case for this is around =
certificates used=20
within the kernel, for example revoking kernel module signatures.  The =
question I have
is, should another keyring be introduced?  One that carries DBX and =
MOKX, which just
correspond to certs/hashes in the platform keyring; this keyring would =
only be
referenced for kexec, just like the platform keyring is today. Then, the =
current
blacklist keyring would be used for everything internal to the kernel.

