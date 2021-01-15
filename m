Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952BB2F891C
	for <lists+keyrings@lfdr.de>; Sat, 16 Jan 2021 00:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbhAOXDE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 18:03:04 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:39242 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbhAOXDD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 Jan 2021 18:03:03 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FMtUw5143992;
        Fri, 15 Jan 2021 23:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=vwI1S6MedWZIivl9RaecNBXX0A7OEkx5Ubykr5olZOY=;
 b=QVozDoSzkR77ZpD28RT3wkHZBsrO5gFb7tfRhMkHtHfUcy+3oHz5oOf+2sk/jw91w9yG
 TqQaXXuedfp7Jhhp5uadszlszE9HbnV+5mKaKwvUH7VzHkjsnnskEd5zsYLlhhrdJbFC
 3CRjHlGTv9AwvQHHG6xjW4bsCI7vObA6qCUfyxSSNl2xPBWFN6KQrUh8ZLkUMx8HKpvu
 bbFTnoRMiQ/d44ZITtcdRCZn7NEdZD8oDsj5txBacf6kwMgTcxkg+WGoEgC8Pd+HeQXy
 FW94olgk/dy66ie9hpSOV5l4/9rHZpari6iIRoeBetkHqwFOJ6TRwNlVj+lIpWuH+FdS wg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 360kvkf07f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Jan 2021 23:01:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FMslXI130905;
        Fri, 15 Jan 2021 22:59:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 360kfbp7ng-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Jan 2021 22:59:47 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10FMxdqI031193;
        Fri, 15 Jan 2021 22:59:39 GMT
Received: from dhcp-10-154-190-197.vpn.oracle.com (/10.154.190.197)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 15 Jan 2021 14:59:39 -0800
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <0659f965b3321e793fee03136ae50cbbcd4a53bf.camel@HansenPartnership.com>
Date:   Fri, 15 Jan 2021 16:01:00 -0700
Cc:     David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C40CED72-E44A-47DF-A965-04BFFE440B3A@oracle.com>
References: <20200916004927.64276-1-eric.snowberg@oracle.com>
 <0659f965b3321e793fee03136ae50cbbcd4a53bf.camel@HansenPartnership.com>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150138
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 15, 2021, at 10:21 AM, James Bottomley =
<James.Bottomley@HansenPartnership.com> wrote:
>=20
> On Tue, 2020-09-15 at 20:49 -0400, Eric Snowberg wrote:
>> The Secure Boot Forbidden Signature Database, dbx, contains a list of
>> now revoked signatures and keys previously approved to boot with UEFI
>> Secure Boot enabled.  The dbx is capable of containing any number of
>> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and
>> EFI_CERT_X509_GUID entries.
>>=20
>> Currently when EFI_CERT_X509_GUID are contained in the dbx, the
>> entries are skipped.
>>=20
>> Add support for EFI_CERT_X509_GUID dbx entries. When a
>> EFI_CERT_X509_GUID is found, it is added as an asymmetrical key to
>> the .blacklist keyring. Anytime the .platform keyring is used, the
>> keys in the .blacklist keyring are referenced, if a matching key is
>> found, the key will be rejected.
>>=20
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>=20
> If you're using shim, as most of our users are, you have no access to
> dbx to blacklist certificates.  Plus our security envelope includes =
the
> Mok variables, so you should also be paying attestion to MokListX (or
> it's RT equivalent: MokListXRT).
>=20
> If you add this to the patch, we get something that is mechanistically
> complete and which also allows users to add certs to their Mok
> blacklist.

That make sense. I=E2=80=99ll work on a patch to add this ability.

