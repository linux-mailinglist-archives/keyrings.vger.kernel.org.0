Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0871C339947
	for <lists+keyrings@lfdr.de>; Fri, 12 Mar 2021 22:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbhCLVwE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 16:52:04 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50306 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbhCLVvu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 16:51:50 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12CLnwac170246;
        Fri, 12 Mar 2021 21:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=+VXcL9rrRt+DBi7AQOEQsbLwDvYEsv7AKWtjgzfxEBc=;
 b=IBZZfaYAc476qmRzgp2w4N2gb4hx7BKHSFXM6oqr2KqgOx48WsxfhTrfUv4/Ov2orvs2
 VAYvlhLWiVldp9+WfKnR+w+8f9NALCB7/IldSjylaCPV0zzbBqY5VrScBTHU7sx8htol
 gp1/Z/abXmmiMCPizv1QLkE8CXF8ggSCqLNypKMAUzIPFPZ1wg3F8Rabo3u13oRjWRK4
 s+ATDaQaSBXyOmxpaDi5pRGV2jV2iNV7vjPBKRduN9PNUU6/FStuYu25HhxowYHK2fIl
 SkBiyU1d7yhwunJLAhXwNz2BXYrPWxCk1LgdipjtmSWrTaGBFnKqEOcQDPK7exHZSIas rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 3742cnkatk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 21:51:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12CLpAoc017844;
        Fri, 12 Mar 2021 21:51:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        by aserp3020.oracle.com with ESMTP id 378c9snkbu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 21:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIW5EdF9YoNZ98L2zZRa5m11qaPbzT3uQE/6nlHcABOB9VIFbMFIWd7429ltjNtnOhl7I+g7ecS2oGxCilNmc2RHFW/9+BwA47adTnZgifteqx9+EPENIKZO6J+uxxaLeEr0LUOx7spWM4s65nvQ/aeuBEi9HCxQShBeDGg26idsC8+1h3HWfg7D0EZZwECilJi+d/VeiraiYbV5u2bknQ9CnnZygtQX2gJhvBf7VGar47uL7tlsN5S8Fl1d51vjBHyizGuWma3bc7ZWuyePhglUjDoYpNBeFZsHxlrXgFLqR99EE1HygXssRsC1wPRJX8Ox+D+mOBwsX3haoPU0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VXcL9rrRt+DBi7AQOEQsbLwDvYEsv7AKWtjgzfxEBc=;
 b=Wnv6jC+k8cvd45LEe2Hn/hiHG4TTl/XpGcgQbWb1hEGyqGLq5Wca0I1ECjRuG3nifIYHO5pA3G+BUODP08fuGT7Dl1nAZz0VXDd5s/V067g68E8AyFud0ldn7BRtHu8SsWILRzaAJrtdWXJuMIJixjR13xbC1x2Np0Ai4kyn/bS9X5b80D95JESGwLz7008sSj+jfFyazvzGOzVa250gHTytRVBjKIM8dNqgzZtKE3KwhD/njm2FzJDsU/yrqEeX04gJhlB54iSTSQeO2Gm3cAa/d2XPHLzXAFOpBP+MNZrYSQJejY5YKORoePnu/V7hYD/lOpJiVIUWhaAvU3f/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VXcL9rrRt+DBi7AQOEQsbLwDvYEsv7AKWtjgzfxEBc=;
 b=tZGgysBcN9/6lNltK/sMzubiooRN5RlG4mPqYkcUh9N0uWbaAsEJ+hTrUl22hWebCtgQu9bso0CoJshf7dDhVJdJ2f+/psoiHEUbnrTJl07GGqw7GjFew3ZMSSm72/2VtKVMiVJhjZs2N/zynAbpgN5CPonUwwJooAHepclYWIw=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH2PR10MB3879.namprd10.prod.outlook.com (2603:10b6:610:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Fri, 12 Mar
 2021 21:49:12 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3933.032; Fri, 12 Mar 2021
 21:49:12 +0000
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH 4/4] integrity: Load mokx variables into the blacklist
 keyring
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com>
Date:   Fri, 12 Mar 2021 14:49:05 -0700
Cc:     David Howells <dhowells@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
 <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk>
 <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com>
To:     Dimitri John Ledkov <dimitri.ledkov@canonical.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SJ0PR13CA0118.namprd13.prod.outlook.com (2603:10b6:a03:2c5::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend Transport; Fri, 12 Mar 2021 21:49:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99fccd70-d80b-4854-6929-08d8e5a0ac4f
X-MS-TrafficTypeDiagnostic: CH2PR10MB3879:
X-Microsoft-Antispam-PRVS: <CH2PR10MB3879C30418C177E2F67A396D876F9@CH2PR10MB3879.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFKnnMY8+rw8aGGglDy2UBP1DEqPZLdudAwloDMqVpb8O6HdMlenGkOeYts2u7o+O7M/Pblb06LWHsq3pKeIHkPHk7tTP7zgL2u5Qtjk8lY9kEe162ZSrf96IFZSRn+zTiX4Px7NQ3q8BO7s7D/RFmvVSH1M7n6qKRg1wtP/KK/2AjbovAPr8iuHrQdm2Hp6Yx7el6ycYFc48WsfCOqp05M0NjiNxdQc58z2srbCaGivNLC/5d6R9jbFgZ7sXfTbGbFEGV6w7n0+WfrZrnkifiPDQl3zdqNN5vB3XIGA0+GgU32I59Jn+Div7pJe3H9lVxJ9L+qlemC9GRo9WyLTH/1DHX/jXL30g/w59J6pfjqJxpxGKYOc2HXCWD7MFkLhaxIi5ofS1OWZw6HJOTn+FUhK7ZgFNj+mczenVl3+eaVaq4WnnW+8yp7d/24oh+inYjfv1V8tba0/IHwH5P0NsjG6XbQiQW0yW/jvPgP4Rjzm2BGnEjrICzTDflN2hY1O6QZncsYYorKKt0xaqqjuQnDWaEwkqx22Cdm3nEPMXr9qws0HWYQUWWrJ37zngY08Iw5yZZWPmZxT5iXRjtWVnr/sS5ULefeaWMhhD1a6pXgO2x2JjSS0jPJAdZzbjadgEj8WiAcQsGyqV4pdjAosZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(376002)(396003)(366004)(956004)(2616005)(4326008)(8676002)(966005)(8936002)(86362001)(2906002)(478600001)(83380400001)(53546011)(44832011)(6916009)(54906003)(36756003)(16576012)(316002)(16526019)(6486002)(5660300002)(66556008)(66476007)(186003)(26005)(66946007)(33656002)(6666004)(52116002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I39IC6aSkNSSfp7I4zsLYe9LREq1ZEX9LQeqnMe78dct32eMaS0vKDXTFrTL?=
 =?us-ascii?Q?qk715EvgXhxtbh1MoXoc5s5M04G53SQtYm7cq/GSn0aF+2UKMI2NSscA6tHh?=
 =?us-ascii?Q?8jXMO1FtfPYTd5mt8HKmXKnWkYN+bmsc6STp94sc4iPI38co2GY9byuSlXnB?=
 =?us-ascii?Q?CCX7qTHcXlCaKQy4ST0Ptle/aKUcOlCyzGr+Qr956dP2xaQgp0ZjKRxGE8Zr?=
 =?us-ascii?Q?n5LTJFgkQvHpVYslv0rourIlxJQMykUKJshNvAONcBRX7bcyG8j+aUgsRoQr?=
 =?us-ascii?Q?O1qZGLORRmS4+qK98IULV+pfIh8hil0Zt1hPpu41nR0ZhtLbvvJpbhHSoAbz?=
 =?us-ascii?Q?z7XTGXtnEJHuBZOMrBxNI5PuIl+7++hrx0bcbTQauOYkqHBzCt2Dkp8liOPz?=
 =?us-ascii?Q?sdzaChUOIZ9N+Ezx6Xrs760z1zvZx2oLOaStyarfL3kjMqTTGxD/KDkrHBct?=
 =?us-ascii?Q?jckQpwERqvFpNkrty+W/Zdt0CsuUUVE6ixWzHnE2ijOxFupJGjWjdjsCb7fa?=
 =?us-ascii?Q?T03b10viQIN0amrvopQPb4yfLObCqw7Vd/ed9/UtDiID3YCap3t4A9gKo7LF?=
 =?us-ascii?Q?XQb3/7TSf3u1TnNxhgLjYNrC7kg1leCbOrt4SjX2dzYQ0j6bQj6a616t0Gyi?=
 =?us-ascii?Q?4xr/SSWlVzd2jlwgG4J4yKUkSSpI7csRwQzNPG10qgG92egtxkJZVheMeWIU?=
 =?us-ascii?Q?yu9HSTo2LSThnQ4BSMQTQ9b8HCO5rMDuFyV6ecwwJm3PiC0eEkpzVQWnhDT0?=
 =?us-ascii?Q?P+jsykhFKUX1N9MxWR9Iib9B5iq9wysi5+0ukFQM/Bk11hBQ1VnMGO7U4Ply?=
 =?us-ascii?Q?PfL/rnlWgQh7gVIGK4WKB+2XcoQjDIJt/S5iD1VNnfRYzV3kOMSQQzA3tUl6?=
 =?us-ascii?Q?zsnf3F2WFlTB0D7NSTwsObvq1MZJyYyzJeFvTUBKrVAy5BbUpO7mb5BZUUAW?=
 =?us-ascii?Q?76qPd79PI4Yew/zHbb5c53rgvOBuIhTMKTU3yEv64Cg7bCBnHY4GpPmqBe8M?=
 =?us-ascii?Q?CE/ZavnCMwWxz/S20ov+91P3rDRHvSGRI90YBFkDjoEhFwWzeURdsjm3qd4g?=
 =?us-ascii?Q?dUqr+2YlIxjOWiLonOAK/MZjyfHBlWsdtasZqukDo1o1vOfakL2/NrHElFpE?=
 =?us-ascii?Q?B6Zlf87SYprG1J+XxnyDp28qGgkVOOPF7qjf5fwZafLJdeqrS+TwRE7BhKQ0?=
 =?us-ascii?Q?AaYS7xMeKlFfXN/hz+PvOH+1ZghkgLkm2Zdv/L2sblZBSN4qFlBghHawwUka?=
 =?us-ascii?Q?TC8m1Fh8z/AS40f5ImMwXMBqUeMCRWyx18OsRGa117JEweDJvRrd+8uHvkK6?=
 =?us-ascii?Q?Kd3SwolyK2rbwoghR9rdi5y0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fccd70-d80b-4854-6929-08d8e5a0ac4f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 21:49:12.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUpS1F/GvrvO5tD3QxIWkw1xsbf2KAEAuBPiR7JAso9l0P3dnHWVduFKXs7ErUt+B9DBx5kOHw5jocC+YiGJrqJiHGRyMLRcW1OYOzvWBOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3879
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9921 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120158
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9921 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 clxscore=1011 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120158
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 12, 2021, at 11:39 AM, Dimitri John Ledkov <dimitri.ledkov@canonic=
al.com> wrote:
>=20
> On 25/02/2021 20:59, David Howells wrote:
>> From: Eric Snowberg <eric.snowberg@oracle.com>
>>=20
>> During boot the Secure Boot Forbidden Signature Database, dbx,
>> is loaded into the blacklist keyring.  Systems booted with shim
>> have an equivalent Forbidden Signature Database called mokx.
>> Currently mokx is only used by shim and grub, the contents are
>> ignored by the kernel.
>>=20
>> Add the ability to load mokx into the blacklist keyring during boot.
>>=20
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>> Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Signed-off-by: David Howells <dhowells@redhat.com>
>> cc: Jarkko Sakkinen <jarkko@kernel.org>
>> Link: https://lore.kernel.org/r/20210122181054.32635-5-eric.snowberg@ora=
cle.com/ # v5
>> Link: https://lore.kernel.org/r/c33c8e3839a41e9654f41cc92c7231104931b1d7=
.camel@HansenPartnership.com/
>> ---
>>=20
>> security/integrity/platform_certs/load_uefi.c |   20 ++++++++++++++++++-=
-
>> 1 file changed, 18 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/security/integrity/platform_certs/load_uefi.c b/security/in=
tegrity/platform_certs/load_uefi.c
>> index ee4b4c666854..f290f78c3f30 100644
>> --- a/security/integrity/platform_certs/load_uefi.c
>> +++ b/security/integrity/platform_certs/load_uefi.c
>> @@ -132,8 +132,9 @@ static int __init load_moklist_certs(void)
>> static int __init load_uefi_certs(void)
>> {
>> 	efi_guid_t secure_var =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
>> -	void *db =3D NULL, *dbx =3D NULL;
>> -	unsigned long dbsize =3D 0, dbxsize =3D 0;
>> +	efi_guid_t mok_var =3D EFI_SHIM_LOCK_GUID;
>> +	void *db =3D NULL, *dbx =3D NULL, *mokx =3D NULL;
>> +	unsigned long dbsize =3D 0, dbxsize =3D 0, mokxsize =3D 0;
>> 	efi_status_t status;
>> 	int rc =3D 0;
>>=20
>> @@ -175,6 +176,21 @@ static int __init load_uefi_certs(void)
>> 		kfree(dbx);
>> 	}
>>=20
>> +	mokx =3D get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
>> +	if (!mokx) {
>> +		if (status =3D=3D EFI_NOT_FOUND)
>> +			pr_debug("mokx variable wasn't found\n");
>> +		else
>> +			pr_info("Couldn't get mokx list\n");
>> +	} else {
>> +		rc =3D parse_efi_signature_list("UEFI:MokListXRT",
>> +					      mokx, mokxsize,
>> +					      get_handler_for_dbx);
>> +		if (rc)
>> +			pr_err("Couldn't parse mokx signatures %d\n", rc);
>> +		kfree(mokx);
>> +	}
>> +
>=20
>=20
> My preference would be if the above hunk was moved into the
> load_moklist_certs() function which is called just below. Such that
> loading of MokListRT & MOkListXRT are done next to each other.
>=20
> And also implement loading the same way it is done for MokListRT -
> specifically via the EFI MOKvar config table & then via a variable.
>=20
> See 726bd8965a5f112d9601f7ce68effa1e46e02bf2 otherwise large MokListXRT
> will fail to parse.

Is this support available from shim now?  Previously I thought only
MOK could be loaded from the config table, not MOKx.


