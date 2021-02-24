Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6B6323556
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 02:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhBXBam (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Feb 2021 20:30:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:35652 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbhBXB15 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 23 Feb 2021 20:27:57 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11O1PACL185990;
        Wed, 24 Feb 2021 01:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=06im/rp1W0KlPGho/wHM3gkvLHUT8T0JvKS2FI7G7jU=;
 b=lO6mdHlWCIq03t6K9NdDK62/3LnfAQ0QLy9kQfK8xuuumodiSRpI8QH32LnPmpGdDvC2
 laxWr4jApxbyG3mAdFqiX4flfsdi5OgoUjYNIa2c2ek/xdUXpHcZTvbe4EMI9NtGqcRn
 HIIllhKICaxBnOEVk5jPBvMX2DUlsJHdDFtb56OS56gz5sKpG/yxpO9apBnpGvFD+0bw
 4cmdJKZx88bk9kgacwiY/9jILX/aFXOVnalyLbuRHpXbEL2L8Pwvtj26Xt3S1Io9djim
 vtQ+IbI63BjVpo2SvUiN5Jx+naVDverSljUVgGSRiuLTmKr1OwjUfjsQZ10ZJ8JEjoNw xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 36ttcm9b5x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Feb 2021 01:26:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11O1QTHL181065;
        Wed, 24 Feb 2021 01:26:50 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2051.outbound.protection.outlook.com [104.47.46.51])
        by aserp3030.oracle.com with ESMTP id 36v9m5ata6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Feb 2021 01:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVgbMTfXrZPIcf/MAfXEolJOfGy0w6Gzo8WKSUmWj7RF55FtQDeSD1kU3e6CDs0nVhBeHCE3r6kmQdKAxTCdUNr3IGEBQ67aNmbg5PdMbjzTGieOgawVAAAKeDzq0dd10mwS6M1/eXcQtdHzXVLrqXyYjnP6mJLHA8zd+ptfo9R3OHDt0u1QWX5W+3FBxZeeEfLf8VXE5fYEzIOObHAnPkSYZVT4LVhLlDveq7YGs+K7gSxOHXK0Jc2+MHqU2hBGKsIMx0zWTQ0tu8ETCyjmqe5ImipUVT9LHz1jQ+tSOvOWS91Gwx5DIroH8enyna+prFvOqW6jHV7WnL+lnvoHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06im/rp1W0KlPGho/wHM3gkvLHUT8T0JvKS2FI7G7jU=;
 b=X5zGGKAfseooBiHQAJnM3oKNiaIu9llT4S/XtBdp+O/0WKtUPVE1fuOCUP6+DhbA6xbasxImu+gA6RbEn8SgWDIVprq9g6Jb7siNHyh2C6NlLoI1MEcNDf2lYX1AhCo+BfHqRwIzHGRf9Z3G3Cuhdg5Qg7YzM1+Q5BgS2pHRhEuLXgGGM7ld9iHnbDArYey/LbeEjtvupJJFvHUDaY3mso1DQ/VnkoO/aga3FoJYzi1SSWJ1FCWgVaVP4OBsMVxufKqm8xfQwdl3ednw6A1CwxW1X8LeYxT0J9ikJ2rCYK6czTOo8sqsIL0SsY0vyGI1J0T5lpoTK8yLv+kAb2ISCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06im/rp1W0KlPGho/wHM3gkvLHUT8T0JvKS2FI7G7jU=;
 b=aEeztd8F35G1htnS42vBmWhWE3ufDF4eokYHCaoJ+HLTRJT6xKODhIOXSgX5ofOMm5M5kA6HOxEVcL7n08NnXxaLi6qwZyCwk8MmMsyD2iH/1vW728spbdtbZtFuWMGy8qOJ2hFaMI9na6KxZ9mQzLNU6s44Z0x07UGybpcaNBA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH0PR10MB5388.namprd10.prod.outlook.com (2603:10b6:610:ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 01:26:49 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 01:26:48 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <3524595.1614124044@warthog.procyon.org.uk>
Date:   Tue, 23 Feb 2021 18:26:43 -0700
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com>
References: <20210217165058.1336155-1-eric.snowberg@oracle.com>
 <3524595.1614124044@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SA0PR11CA0159.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::14) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SA0PR11CA0159.namprd11.prod.outlook.com (2603:10b6:806:1bb::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 01:26:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97175058-e89b-43d9-32d4-08d8d8634187
X-MS-TrafficTypeDiagnostic: CH0PR10MB5388:
X-Microsoft-Antispam-PRVS: <CH0PR10MB538856D6DD4C7F19EEA3EE94879F9@CH0PR10MB5388.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22ImJv2wmKNege3hFBmF+XN/y4Xcn3yiWv5ZQ1LxlutoH4084le1XNjNBeRlUEP2y8LIDSba0wulpAaRQdpmuk8yk/gu7EqED2J+Hio0VqwfjiDZd3P88oDkcefxhJV37nGlJ53zMsCU+1ewhcsnxWRNkS+Bzux0tWKwJjJphytn9E14/4LHcGG5F3O+OQk3dkVSGo0nKXzW5ay9lb07Y4mLJ79ETz7p85Q/Nq9pp+RyGh/kZ01MMcAAhCHRSz3nghwMppbFfvOYlLBzdHrWKfi3A+UCNCLteJJn0GBPyipEx4LPG50o7HeswphRwd3PPK3MyRHUuZY0wPiRtQTIc8Kz7jE7d79MlzDVoO8nY6GfzE2jrQLUhwg2/9uksRqrKSM80tB7B+7lEEnldjdFGSCffNtzb32/9XtBg5VGMx5DtSj++hwjjTA4aKsFTges7VD3MrkAQpw646i7jb+xtYOu6QtqaJXdlUHqdi7q0WND/N5WoBx7zwswW1RHjKzN6qkexGeWndKFKPfHhZNbBW/Emf3n3TJt/BqQAlpSNypm/J7u1aA4+O0e2zHUC+XQVucm//gUQPBVuotfYh/khQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(366004)(346002)(396003)(83380400001)(52116002)(6916009)(54906003)(16576012)(5660300002)(316002)(6666004)(86362001)(2616005)(44832011)(36756003)(956004)(478600001)(6486002)(53546011)(8676002)(16526019)(66476007)(66556008)(33656002)(66946007)(2906002)(4326008)(186003)(26005)(8936002)(15650500001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nkd3TEwxWFNCdHhTWEpZdis3dm1OYlVtT3FBVFpzWlNGNEpsS1VtcHhZckxj?=
 =?utf-8?B?MEdzK3RkQ1F3VlpOL0tveldYa3h6V2VsUWhDUm5xRXVSdHZxbXdSZFEzQTZx?=
 =?utf-8?B?ekgxTU9VSThIOWtMbEJGdnNudGJEQlRLYVhHQXh1Qkt0em9HSUw0bEkyYmVQ?=
 =?utf-8?B?aFpGc0thUzJhNzlhZlUwRmwyMFZhdVFBUzZqdkR0UGhTKzZGdnVqVkErZzRj?=
 =?utf-8?B?M3VmSDg2U1phcUhPK2h1RzBQYnJlWldFbStISTMxZG9PU01MWTV6cDk0c2Rt?=
 =?utf-8?B?dC93aFpXS2NwdlcrUVcrZldIcmtBYWw5NVNmVS8vUzU1aUtHbjliaW9yOFEz?=
 =?utf-8?B?R0NXaVFiRzdrR01BbENjK2wxTG1VUU1NODhMcmZUWTh6RGxJWkNYUjkrRmJE?=
 =?utf-8?B?WVJHUVZtM3AveXc3MDdOUHYwNnBHcnNuYzYvRFcxTUVJUmVpNVdXR2t1ak80?=
 =?utf-8?B?dmw1QmhFLzRFZUxjMk53WU0vR0ZrejVHQ09rSXkxL3J4WHQxSC9wY2plTTAz?=
 =?utf-8?B?Nld6aDg3OEljVW0vc1EzT053ZzN0UEYvdkIvL1h3NThKMXo1Mjg0eE1mMlhC?=
 =?utf-8?B?blR6cENHL05KRDBnWTVBZ0RQUEtONDdFTmZzZHJVVkdwQVQxQUhHWUhHT2pG?=
 =?utf-8?B?bGpodHI3VWphMmtiV3lMelVUSmlrMWdFeUkwMkRScFRtUldOdDh6cVVUV1Vu?=
 =?utf-8?B?eDRvajVpNUM3TTRQL29ycXBHbmdqN0ZIRVZxWURFTmR0ZldadEJMZVB0WnU2?=
 =?utf-8?B?S0JBT1ZjS0gxU2pDRURnTDh3bmh5TEd0ZCtJMHZ0SURJbnZkRXhyOGQvU2t0?=
 =?utf-8?B?Tm90Wk5KeUNqdjgrd3ZpR245c2UyNHB4M0FjUmxEbmhWU3VDekxNamVROWZP?=
 =?utf-8?B?VHZCUXRRbThrK0NTcEFQVjhJRnM0RVFkTEk1YUdteDM0SjE0TGRUMmsxeXJw?=
 =?utf-8?B?eDhjMnRiaW5YMzdwMDhnK1NBSVQvT20vSHdTSHVjb0M0QVhOOUZwb3NCZ0Jt?=
 =?utf-8?B?QzZ5QTU3QmZ6Mzk4cDViUGNIVjBWd2hhRzNVQ0hrcmRFU2VBVUUwKzNpdlNN?=
 =?utf-8?B?c3UyMXlaeExBWDFKcHNRdnBSZWJONldoWGFGM2RuaEQ0dU5rZVdaVURDNitO?=
 =?utf-8?B?MVpLRzlLMUJqeGhWVTdNamhtTWNHb0JFQjRjaTZxUkJMbFVFWWN4OFBmUERJ?=
 =?utf-8?B?NTB4SVRTeEloQ2huemVLNGV3UmNoUTQxWXgzdkVpMXUrWG9rdTRINWpiTTJZ?=
 =?utf-8?B?M0RCRGo1RW9GUkJpUXFnWUl1ZEFwQjFWU2czOGhobVhiZlJGSmo2dlRHU2Qr?=
 =?utf-8?B?anRGdFJPK3l6UnRzRTY4SUpVQzFJR0pYUVdmdDIzRUtuL2dVRHp5MXI3aElD?=
 =?utf-8?B?ckRWMG1sZThJRlMzS1BzNzEvSFBVem9FdmtKYU9pSlpscGgzTjVrMDIzZmZp?=
 =?utf-8?B?TVgvRS92cTNwQ1NQdkhWVDZHSTVSN1IwYXQxZHp4YkxFWEJMOEtYTy9uR0E4?=
 =?utf-8?B?cHd0UVlETVMrcE44R0lBWmsvNFVZa0ZJNnJlRXVtd1dxZjYzbjRmSDdEclRo?=
 =?utf-8?B?a29DNWo1Q0VNRUpkV3NrVmJEQ3QzNnFNUFZPclkvZEM3V0tpR0tHZThsNzFz?=
 =?utf-8?B?SGpNZjE0cXVEOG50N1YrMkpwL0RyWUhRclNadFFDVUdtbmZlN2l2THQ4TDRB?=
 =?utf-8?B?WUpaQUM0a1A5ZWVQbEwyc0F3WmNnYlpFRCthOHhXaTJYQTRjbmdxQ3hMeEhq?=
 =?utf-8?Q?b4WJJiALegEoe0v7eys4ZpqABx3VIMwgI2uIzKC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97175058-e89b-43d9-32d4-08d8d8634187
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 01:26:48.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PME9vj5OG/pFa8VixmJSdWpBrozLqZXRRride4TV0Yt312bx7ZS0iCvqbZdYlUeBv81p2mNapx4p7Nx+z8qebZSEYLUv/+NPpy93/H3z38U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5388
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240008
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240008
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 23, 2021, at 4:47 PM, David Howells <dhowells@redhat.com> wrote:
>=20
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>=20
>> The kernel test robot reports when building with Kconfig
>> CONFIG_INTEGRITY_PLATFORM_KEYRING defined and=20
>> CONFIG_SYSTEM_DATA_VERIFICATION undefined:
>>=20
>> ld.lld: error: undefined symbol: pkcs7_validate_trust
>> referenced by blacklist.c:128 (certs/blacklist.c:128)
>>             blacklist.o:(is_key_on_revocation_list) in archive certs/bui=
lt-in.a
>>=20
>> Make CONFIG_SYSTEM_DATA_VERIFICATION a dependency for validate_trust.
>>=20
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>=20
> I wonder if it's better to provide a separate config option for the revoc=
ation
> list, say:
>=20
> 	config SYSTEM_REVOCATION_LIST
> 		bool "Add revocation certs to the blacklist keyring"
> 		depends on SYSTEM_BLACKLIST_KEYRING
> 		depends on PKCS7_MESSAGE_PARSER
> 		help
> 		  ...
>=20
> and use that in blacklist.c.
>=20
> In keys/system_keyring.h, is_key_on_revocation_list() can then be default=
ed to
> return 0 if that is disabled.

I tried something like that in the past.  The problem I ran into is someone=
=20
could create a config with PKCS7_MESSAGE_PARSER=3Dm.  Then pkcs7_validate_t=
rust=20
would give an undefined reference error.=20

SYSTEM_DATA_VERIFICATION was the only thing I could find that guaranteed=20
everything was available.  I supposed I could do:

	config SYSTEM_REVOCATION_LIST
		bool "Add revocation certs to the blacklist keyring"
		depends on SYSTEM_BLACKLIST_KEYRING
		depends on SYSTEM_DATA_VERIFICATION
		help
		  =E2=80=A6

Would you rather I do that instead?

> Btw, I've just noticed that add_key_to_revocation_list() and
> is_key_on_revocation_list() lack kernel doc comments.

I=E2=80=99ll prepare a patch to add the kernel-doc comments.

