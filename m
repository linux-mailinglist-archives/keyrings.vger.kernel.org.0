Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE012FDD3A
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 00:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbhATXm2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 18:42:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:50078 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387448AbhATWOY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jan 2021 17:14:24 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMBLwC032613;
        Wed, 20 Jan 2021 22:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=NBZolkO8TUzPi4A0jPNuJ8H01dInvYr3OrZswu4IYV0=;
 b=iR0YmkwHlEBAtae3pAviwLvIgMDlbHt43Ys5hZIL0LKqNOFToN/vN+aANmzNanDu6OJp
 Rx9PnpJWRLG1Lq+KfvJFzjuUitId7tm0BRAQyobAzmkP4sxGPvCtNmUhx/oFatJVfM0C
 yFE+NOD4PSjNbnlV/6u3bhb283WOuFarctL3eeX8U1Z5PAyHBDAgbF5y3elXy4xO7+Tz
 tqPsam4rnmFqa7apnI4jPXesqf0X14tZVI1pF2cq0i0xA38cfzaMqrNfPRedUZrb3Hy6
 nBmZR4OCD9Jts8NmOQliUX+CUbOMy0cae5qPOz0QoNDB78kdwz8kvPPJYU1IFKtqhTOB SA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3668qmvpmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jan 2021 22:11:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMAiqU056542;
        Wed, 20 Jan 2021 22:11:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        by userp3020.oracle.com with ESMTP id 3668qx236s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jan 2021 22:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwW8M44l+A70tpXDUzfaSn5WfGcaYprOEKnq4TVkvw9jCHwSMaYnCsMZzG/DGE4QXJvFlNG5ZpjQ/D81zLZc9Jka5RkgARWqQevVHcC9dwHZLDxQveAX6kTtT72AeuQ8gdBKm1GHY+xguOEMSdlIiJ8UDWcfhclkbSSgNbZc+ga0xraCjXuZVUqoWDs0G4d9fL154WTt5pUtsoPUGDj5p681HvJnCWcmOaje5Kuv3ONH/06rj4JCfpXwrzD4BWvvPWIZN1zuavOaKrQt0zD2+Ii/ZmUw1sEL/8SQkwUd1jufT786lfN7uyIQGFgxAgDumVc0CYWrMuNhKFW5c2WYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBZolkO8TUzPi4A0jPNuJ8H01dInvYr3OrZswu4IYV0=;
 b=ijvo7zLEUT+O6QHZyr82cCqVFTuO80D1mtfykAjvCjUvVOO4z+V4eVs8ejE2YbJebCSCEd8GC8axnUDbXCuJMEC1vDbS9i2j6wZJ7RT0qLR0z6K4mDirVgW+bmMcso0LjHdIT3OOGL+AOT3JB6QOkx92td4cBWmu6B7qx5v92SUU8nX5os5US8Ma8OBGquQgmNHG135vJYZ2EPpIWUtJIRqL7m7+uaajpsRc4HT4+aIQz8A+06Fd37vUi3eISEP3NwXuUsb9fVMNBnYuAfDyreM6dUEzaIh3a1lk3CVErZ51NwsDT0AbPpx8SFTVK0sRdTuckvCq+TiWCbs5erJvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBZolkO8TUzPi4A0jPNuJ8H01dInvYr3OrZswu4IYV0=;
 b=l/Jg/fAVj0lH16Se3eb0JALSJZUYbe47ErR/QuGN70pHBRS5UgKfwvpSubBX1JDf20HJvcRGawWrgqjESmbSInfIF4NcgY2wyWR3kblRZmQaTnQy9ktMJkvXDEyym4+Sh1uMz/T3VxVvrKUfmDHWBqLmIbLNpyYryQzHouXU/1E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM6PR10MB2938.namprd10.prod.outlook.com (2603:10b6:5:6c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 22:11:17 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 22:11:17 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <YAgTawk3EENF/P6j@kernel.org>
Date:   Wed, 20 Jan 2021 15:13:11 -0700
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
Message-Id: <D9F5E0BD-E2FC-428F-91B3-35D2750493A0@oracle.com>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
 <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
 <2442460.1610463459@warthog.procyon.org.uk>
 <X/9a8naM8p4tT5sO@linux.intel.com>
 <A05E3573-B1AF-474B-94A5-779E69E5880A@oracle.com>
 <YAFdNiYZSWpB9vOw@kernel.org>
 <CFBF6AEC-2832-44F7-9D7F-F20489498C33@oracle.com>
 <YAgTawk3EENF/P6j@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: CH2PR07CA0064.namprd07.prod.outlook.com
 (2603:10b6:610:5b::38) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by CH2PR07CA0064.namprd07.prod.outlook.com (2603:10b6:610:5b::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 22:11:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6744483-c580-4aef-ec73-08d8bd904efe
X-MS-TrafficTypeDiagnostic: DM6PR10MB2938:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB29389FB0CD77503A949094AF87A20@DM6PR10MB2938.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+XrUBTbtrxE0vupmipZ8N4cNoQ1fFXLnwYb0zzaF29m/gZt+tNSZ205jZtVGCIe2XxT1IRIJRn3E/+Jal0uPacGoI61C1GAtoLAaYTic3PVRaIRm20MrDxDgq6FzdrSr3LGedzJo2iV2nP5FEsmVlRETSmT8Y0W9aEwLQCVoW1a4KZN9q/C+XRLRUYsMPtgtYp5A68bR0riEUwS1XLm5myhBy8nyWHI0+99ABDRJ3mc+aWcVSVi3bhHpfA2jPCb9GNl+5q8wID1cchCl5uokRe59u+EHrk1nor14dHncBMkon23FPghWU9X7nzy2BI7YZ55yJrLSzUuJ7Zrth6D4IJVhHQRrNoYzMage03YQ49NcazQ/j0QWMdh8ib43kgoeBrrW/0PfxcNnqnA4U4ez1CLvkrtVp/Sx8pTFmqFYG/UUtPMmg8xvafamcsdxvxE9ikc/N1+Ef5JBfsuGhaVedDeygco+13CGUBsAyapAWliuPZYCsXuVUSZQwfXKrMAfVciNYh8NiwmzplLJt+nYzCSf3Khq7q2Xy130pcUHyLxNJeOJ2FJiECyCzU8Ycf5UDoIXONFgo0Z0w/Qqx+sFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(346002)(376002)(508600001)(5660300002)(36756003)(53546011)(316002)(83380400001)(7416002)(2906002)(107886003)(66574015)(6916009)(26005)(186003)(16576012)(6666004)(66476007)(44832011)(66556008)(956004)(52116002)(2616005)(16526019)(6486002)(8936002)(8676002)(33656002)(4326008)(54906003)(66946007)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlF0Q2c2SHNpYUFvV2JTbGYyVElHK09RTDBEWVBKTDk1ckhQUWpHSENIYWp4?=
 =?utf-8?B?ZTRmQ0JEKy9TU04xT3VkS3RUa2VXMVpnWmVLejI5cTJ5MXZUWlprMUFpbnh6?=
 =?utf-8?B?TDQ1M3hSK0dqc1RHVGVGb0lRdURHQml4TUZRMStwb0hTYWFCNE9NSFhBQUwv?=
 =?utf-8?B?RmxlUUlhZElkUlcxYUVvWUJIaUxLVzFwZGcrcTV4d1M5RVJGYThMVW1LTkFI?=
 =?utf-8?B?V3hUQU90WUxkRlhTUVlqeFNUaHVmTGw1RTBsbXFBZDNTeVN4TU9kcHlnR2sx?=
 =?utf-8?B?R2FONEtCd0tBWlQrWDdjZXZJRXpRd0dTZ1BjVGM3OGpiSmhsNjMxWjdFL0lX?=
 =?utf-8?B?M3RBSUdYUUlncnl3SVphaUJtQlY3aURFZnNWLzMwb0RobUpMOWk2MXdFVlc0?=
 =?utf-8?B?cjFWd1YyajVKcXl1ZXBRNnRPUzJmZkROSFZjNUxWbkMwTVZ3NGtIQzFpMEVU?=
 =?utf-8?B?VE5MQTNhWWRCclkxVnhoNWordTJxZ0tscG5ES3I1UThlL0tNUWplYy9aMldq?=
 =?utf-8?B?dUhmRWFNWUJxeDVaWHBFV1QrclN2bjd3OGVFaEptRFJGNUo3MHB4Y2pwQzNa?=
 =?utf-8?B?WG5zMGJ4OFdPOFNJTThhR1ZBMnJMSkY5Mmh2dTdDd1dMMTdJakNTWHk5UWpI?=
 =?utf-8?B?N0x2UTlUMEpkOE4xY1VzQUwrYUxoZnRYU1BkOVlNUDlKdHRXTFdubk9BZEh0?=
 =?utf-8?B?YnhFeFVJU0hXSkJlakh6Y2puaE5seHVxRXlmdmJRbXRKUGNrR1ZTczJ6Q01B?=
 =?utf-8?B?VC9MQ2JLYXBFM2hCalZ5SlNDa3VWUWRJSGQxWUZXTmtRcHQwTzQ2dUZrVDhO?=
 =?utf-8?B?MUxVTC82cVdmd2k3aFZVekVqVWU2MW04YUczYlJRZ3Z5RmI2VmFoZEN3MUhm?=
 =?utf-8?B?ZWxYbEd0SjdpSHpxU1IrUTZJOUZyMjlqb3ZITTBmN2dJc0VXcG0rOVJ1VGtI?=
 =?utf-8?B?b2dCTGJLa0hYY2lDUjRWN216VU1NeFdEMERlRkhwMXdRM0FoNE1RWVJLRm5C?=
 =?utf-8?B?bmFDelBRZXl2ekNST09DdDFSV3JxZVd6cHdxS054UnRReCtHZk1qOW9FRU90?=
 =?utf-8?B?MWZtWnMrZm5UZEdNVld1aUFTblRUbU5ZdEhVV1Vydjk2VXYzVld1Rit1REJX?=
 =?utf-8?B?RXhrNmVLMTNwUDRwdHlEL3RFY2ZvSCtpbEhFWWRFQUlzWHd1UU1QbnRHMnM3?=
 =?utf-8?B?OWdxUDJSWjhsUTlGOW16M3hSMzV2ckxLMDBXeHFrWFVmQjhVWHBwbDlZWEIv?=
 =?utf-8?B?bk1Qd0dZaHViMjVrTDhSSHZQV0N2cCtkVVljeWp0SHFZZkc4ZklEcWo1eHcz?=
 =?utf-8?Q?wPDkICzrMBP48=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6744483-c580-4aef-ec73-08d8bd904efe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 22:11:17.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6vet4FfkLxLJo1mzLt6T9Y4F84fI0PsVbwIkVYgioLu1sz4ZVE+OA7QCN+X8ccGPGAI64EuCf49L9OzxN1sdSCX8wRs0OGnWfDHBn5G6zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2938
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200126
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 20, 2021, at 4:26 AM, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Fri, Jan 15, 2021 at 09:49:02AM -0700, Eric Snowberg wrote:
>>=20
>>> On Jan 15, 2021, at 2:15 AM, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>>>=20
>>> On Wed, Jan 13, 2021 at 05:11:10PM -0700, Eric Snowberg wrote:
>>>>=20
>>>>> On Jan 13, 2021, at 1:41 PM, Jarkko Sakkinen <jarkko.sakkinen@linux.i=
ntel.com> wrote:
>>>>>=20
>>>>> On Tue, Jan 12, 2021 at 02:57:39PM +0000, David Howells wrote:
>>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>>>=20
>>>>>>>> On Dec 10, 2020, at 2:49 AM, David Howells <dhowells@redhat.com> w=
rote:
>>>>>>>>=20
>>>>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>>>>>=20
>>>>>>>>> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X=
509_GUID
>>>>>>>>> is found, it is added as an asymmetrical key to the .blacklist ke=
yring.
>>>>>>>>> Anytime the .platform keyring is used, the keys in the .blacklist=
 keyring
>>>>>>>>> are referenced, if a matching key is found, the key will be rejec=
ted.
>>>>>>>>=20
>>>>>>>> Ummm...  Why this way and not as a blacklist key which takes up le=
ss space?
>>>>>>>> I'm guessing that you're using the key chain matching logic.  We r=
eally only
>>>>>>>> need to blacklist the key IDs.
>>>>>>>=20
>>>>>>> I implemented it this way so that certs in the dbx would only impac=
t=20
>>>>>>> the .platform keyring. I was under the impression we didn=E2=80=99t=
 want to have=20
>>>>>>> Secure Boot UEFI db/dbx certs dictate keyring functionality within =
the kernel
>>>>>>> itself. Meaning if we have a matching dbx cert in any other keyring=
 (builtin,
>>>>>>> secondary, ima, etc.), it would be allowed. If that is not how you=
=E2=80=99d like to=20
>>>>>>> see it done, let me know and I=E2=80=99ll make the change.
>>>>>>=20
>>>>>> I wonder if that is that the right thing to do.  I guess this is a p=
olicy
>>>>>> decision and may depend on the particular user.
>>>>>=20
>>>>> Why would you want to allow dbx entry in any keyring?
>>>>=20
>>>> Today, DB and MOK certs go into the platform keyring.  These certs are=
 only
>>>> referenced during kexec.  They can=E2=80=99t be used for other things =
like validating
>>>> kernel module signatures.  If we follow the same pattern, the DBX and =
MOKX entries
>>>> in the blacklist keyring should only impact kexec.=20
>>>>=20
>>>> Currently, Micka=C3=ABl Sala=C3=BCn has another outstanding series to =
allow root to update=20
>>>> the blacklist keyring.  I assume the use case for this is around certi=
ficates used=20
>>>> within the kernel, for example revoking kernel module signatures.  The=
 question I have
>>>> is, should another keyring be introduced?  One that carries DBX and MO=
KX, which just
>>>> correspond to certs/hashes in the platform keyring; this keyring would=
 only be
>>>> referenced for kexec, just like the platform keyring is today. Then, t=
he current
>>>> blacklist keyring would be used for everything internal to the kernel.
>>>=20
>>> Right, I'm following actively that series.
>>>=20
>>> Why couldn't user space drive this process and use that feature to do i=
t?
>>=20
>> I could see where the user would want to use both. With Micka=C3=ABl Sal=
a=C3=BCn=E2=80=99s
>> series, the blacklist keyring is updated immediately.  However it does
>> not survive a reboot.  With my patch, the blacklist keyring is updated
>> during boot, based on what is in the dbx. Neither approach needs a new=20
>> kernel build.
>=20
> I don't want to purposely challenge this, but why does it matter
> that it doesn't survive the boot? I'm referring here to the golden
> principle of kernel defining a mechanism, not policy. User space
> can do the population however it wants to for every boot.
>=20
> E.g. systemd service could do this.
>=20
> What am I missing here?

This change simply adds support for a missing type.  The kernel=20
already supports cert and hash entries (EFI_CERT_X509_SHA256_GUID,
EFI_CERT_SHA256_GUID) that originate from the dbx and are loaded=20
into the blacklist keyring during boot.  I=E2=80=99m not sure why a cert=20
defined with EFI_CERT_X509_GUID should be handled in a different=20
manner.

I suppose a user space tool could be created. But wouldn=E2=80=99t what is
currently done in the kernel in this area need to be removed?

