Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACFD2F812C
	for <lists+keyrings@lfdr.de>; Fri, 15 Jan 2021 17:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbhAOQtI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 11:49:08 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39506 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbhAOQtH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 Jan 2021 11:49:07 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FGiRV8088782;
        Fri, 15 Jan 2021 16:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=ILbzVPXV4XeVV2ur9Xq/DKxJJzAW4T3/Zp9WwpWi4uQ=;
 b=SSelSreVH1DY9G5M5PAOeuhT6vPaEiI9dnIa/6NeQA+e97wTyJIK4jye3XXfUHN4ARQJ
 nLDJRv4Q1dOjDXQkxemRxUJwX4ITgaF3hL6NYKAkMcUFI7qBzaXRi6dDtCxh2biKZZ72
 5wr6nzt1SliVviyMBrjddVTBMb9d7vVnDj+US3rIj/HFVtn1u8ljTFa6oHCKT7sb4T7U
 I5eI0tfAgS8KP6GoYBeKOjwvt6m2OiZUHQc2d76gKtK4vslDRh9F8WDkyUxwLOjngfkt
 whrdOa+MFlmAlg+x09fZhOUdyECP5IQImq2ARsNDhJO1Y87CEhaQO0+CldUPHAGdAw7z ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 360kd05s6g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Jan 2021 16:47:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FGjktf188962;
        Fri, 15 Jan 2021 16:47:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 360kebc9n8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Jan 2021 16:47:58 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FGlhP9010996;
        Fri, 15 Jan 2021 16:47:44 GMT
Received: from dhcp-10-154-96-160.vpn.oracle.com (/10.154.96.160)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 15 Jan 2021 08:47:43 -0800
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <YAFdNiYZSWpB9vOw@kernel.org>
Date:   Fri, 15 Jan 2021 09:49:02 -0700
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        James.Bottomley@hansenpartnership.com,
        Eric Snowberg <eric.snowberg@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CFBF6AEC-2832-44F7-9D7F-F20489498C33@oracle.com>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
 <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
 <2442460.1610463459@warthog.procyon.org.uk>
 <X/9a8naM8p4tT5sO@linux.intel.com>
 <A05E3573-B1AF-474B-94A5-779E69E5880A@oracle.com>
 <YAFdNiYZSWpB9vOw@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150101
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 15, 2021, at 2:15 AM, Jarkko Sakkinen <jarkko@kernel.org> =
wrote:
>=20
> On Wed, Jan 13, 2021 at 05:11:10PM -0700, Eric Snowberg wrote:
>>=20
>>> On Jan 13, 2021, at 1:41 PM, Jarkko Sakkinen =
<jarkko.sakkinen@linux.intel.com> wrote:
>>>=20
>>> On Tue, Jan 12, 2021 at 02:57:39PM +0000, David Howells wrote:
>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>=20
>>>>>> On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> =
wrote:
>>>>>>=20
>>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>>>=20
>>>>>>> Add support for EFI_CERT_X509_GUID dbx entries. When a =
EFI_CERT_X509_GUID
>>>>>>> is found, it is added as an asymmetrical key to the .blacklist =
keyring.
>>>>>>> Anytime the .platform keyring is used, the keys in the =
.blacklist keyring
>>>>>>> are referenced, if a matching key is found, the key will be =
rejected.
>>>>>>=20
>>>>>> Ummm...  Why this way and not as a blacklist key which takes up =
less space?
>>>>>> I'm guessing that you're using the key chain matching logic.  We =
really only
>>>>>> need to blacklist the key IDs.
>>>>>=20
>>>>> I implemented it this way so that certs in the dbx would only =
impact=20
>>>>> the .platform keyring. I was under the impression we didn=E2=80=99t =
want to have=20
>>>>> Secure Boot UEFI db/dbx certs dictate keyring functionality within =
the kernel
>>>>> itself. Meaning if we have a matching dbx cert in any other =
keyring (builtin,
>>>>> secondary, ima, etc.), it would be allowed. If that is not how =
you=E2=80=99d like to=20
>>>>> see it done, let me know and I=E2=80=99ll make the change.
>>>>=20
>>>> I wonder if that is that the right thing to do.  I guess this is a =
policy
>>>> decision and may depend on the particular user.
>>>=20
>>> Why would you want to allow dbx entry in any keyring?
>>=20
>> Today, DB and MOK certs go into the platform keyring.  These certs =
are only
>> referenced during kexec.  They can=E2=80=99t be used for other things =
like validating
>> kernel module signatures.  If we follow the same pattern, the DBX and =
MOKX entries
>> in the blacklist keyring should only impact kexec.=20
>>=20
>> Currently, Micka=C3=ABl Sala=C3=BCn has another outstanding series to =
allow root to update=20
>> the blacklist keyring.  I assume the use case for this is around =
certificates used=20
>> within the kernel, for example revoking kernel module signatures.  =
The question I have
>> is, should another keyring be introduced?  One that carries DBX and =
MOKX, which just
>> correspond to certs/hashes in the platform keyring; this keyring =
would only be
>> referenced for kexec, just like the platform keyring is today. Then, =
the current
>> blacklist keyring would be used for everything internal to the =
kernel.
>=20
> Right, I'm following actively that series.
>=20
> Why couldn't user space drive this process and use that feature to do =
it?

I could see where the user would want to use both. With Micka=C3=ABl =
Sala=C3=BCn=E2=80=99s
series, the blacklist keyring is updated immediately.  However it does
not survive a reboot.  With my patch, the blacklist keyring is updated
during boot, based on what is in the dbx. Neither approach needs a new=20=

kernel build.

