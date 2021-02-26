Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB55325BC2
	for <lists+keyrings@lfdr.de>; Fri, 26 Feb 2021 03:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhBZCvb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 21:51:31 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:60734 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhBZCvb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Feb 2021 21:51:31 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11Q2n3i2108009;
        Fri, 26 Feb 2021 02:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=wVNPwWUIBEiiW+I4VJZZST+oZm3swG92b3zjg8o5mD0=;
 b=dGqs4FoH97HPpS0QS1w8MGaD2P4xM762c0vIl6IXwEHCru4997f30Q16/lR6XCHHbghi
 7Irbf87dGUm5WPJJRF5BP+1z00pcYarYN1qnRCATkJHSMJNl3t2sv/3bV28VEKynn7fD
 qHO8jZe73mJovHasCpwAFugL65dlKk3h+sJIztsMgIcfWck+XhewH6KoHrH5c2YPsl0A
 WKqQrZjAxfLW2wSGFG6eotJAaQRvPSdscwtaBrilx1w+eaYzeCAN0P9yy5RR9+xEOYTz
 WFIrKNteiitbeWstxj7HQRmmGXaWjdw7sZ8FaXxRaHjlsnaN6KKJwuygFk20NvXdbTPp yA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 36vr62awqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Feb 2021 02:50:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11Q2idor196577;
        Fri, 26 Feb 2021 02:50:25 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2054.outbound.protection.outlook.com [104.47.37.54])
        by userp3030.oracle.com with ESMTP id 36ucc22e28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Feb 2021 02:50:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNI6yqVaItY2iUxt3BP60CIUE704rQXKALdk23ajVm1eJHnYOlLMiety4v0d16df4ke2K50/UREdKN7gLPDXHMQj/TCL30Iu/QboGRhHzKKATO9OUQCzLrKG86p1ncI4EiCdqbPgqmp1hKV2bLDMr+DmNh8iai749hmtG+tEALqrvDyA4yc0s9gns2fmYIEu8DjQJTr1KO0VzfKh3pJApxbOgsxOiVvdiPhpYbTKq7EEyWPIAT2gnaIV6ec5kxR/uyuu3wxF3tH/NW6ZqwvfwigULnFUGw5RJDx+Y3NifwERGca1Fl8lSkO99Tg2otuvYfZqpCuCgvIKHVaENPI7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVNPwWUIBEiiW+I4VJZZST+oZm3swG92b3zjg8o5mD0=;
 b=c9PSpYzLbdIhawHXD3WQEU5q1yK/+JHiVm+nzWcnGUiUXURal95ii4ETjcmEqZdDWWpdMo9hSz9mNOqbjJKSa8KW3OCHBidQE0dT5CXdAfpJxpcQcswRpdSDQ4Iou0rbFMvaWh/vyqHTb2HaJagxApU9aJ5sdwsGQXXppJHnYes2cfVgzFQ/JHHFYOHxW+Xtdy7LqdL7ld40W9Dk9RFtzXZxpQvJNdlgzguTQ0K6ecAJpnbPPRt6YT08XJ5N4aj4WThw5VMT+nnQu8Vdss9OMweZHzYXherA/g8I4sGVH2B0Mo5eu+MpUBuOpj1jGLutTL43EHbpjIF7ex/iCdjS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVNPwWUIBEiiW+I4VJZZST+oZm3swG92b3zjg8o5mD0=;
 b=UhXM9/h/EoRKmrJLZHY8E9Nme1le88DsaNgv0+IaVHC9xd2wf33zrYMrnu67QcS2CCYg3O41GSLapVO+HEfrJ9Zf56OrVCmLfnOqGK4lL2ZOy32GyQwFYrqpnGzXRxEdUjKhWC703hIr6lUMBk4/BEsD/mkc0Ga0DNbwcFZGvOU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH0PR10MB5098.namprd10.prod.outlook.com (2603:10b6:610:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 26 Feb
 2021 02:50:23 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3868.034; Fri, 26 Feb 2021
 02:50:23 +0000
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH 0/4] keys: Add EFI_CERT_X509_GUID support for dbx/mokx
 entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
Date:   Thu, 25 Feb 2021 19:50:17 -0700
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Eric Snowberg <eric.snowberg@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com>
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SA9PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:806:22::8) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SA9PR13CA0033.namprd13.prod.outlook.com (2603:10b6:806:22::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.11 via Frontend Transport; Fri, 26 Feb 2021 02:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9489fae9-c1e6-458d-7a09-08d8da014382
X-MS-TrafficTypeDiagnostic: CH0PR10MB5098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR10MB5098C6D2F67F2F4646005337879D9@CH0PR10MB5098.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l2+IAYp20TRVXsNIHrliEH1beiMWw6HDyQuPu6EerVB7CS5HOUuM9lKD/iOTogvwI6DAarlyCcFMNTuFhEzSv2AwCFqPtPECTQ7f7K0ZJIUb20HAVjC5qPvaLZkrKyw6Q51BG7uA28r44RDQkQMTl/2zqJsT2Ukwm/qEwgaX0P0m0pYpLPHShCgzjNnQQbw9Aq+n9+Alqwu4KWqacTjXNZxuCmZaesq1tTbG6bfc3YGT0Q9fq/cYflqq7U0nhfGeuyrQbm5aNtTbsL1cz9RjRXyWpzK+2QkVa3DHNQkwFIbIpSC7rHLupSjfjcVpqDd6jqRqdO+wfHhQJumi8J/4JQ+l9Uaw9YxZIDxwqQRL5mzsjwVS1MGlTUFJIvTnMvcStUflbU8H/fDy6BwWeezilo0qfTJyjyGLV2ITVX5QNVQGPISyZisQ6gu5C5e/rT9jde/BMXeCfS7s5OJ5XhYfZ7zg8xvrNmncggXCokn6c18sQN6kyOPqywN4xWan4baLSwMV8HfYhwPEj6iseNF8pvGm/5jHAqVboC70OZ8RxuWOX/YpOti/7qhOP2wFlUUoEFwjP0vJYYxOkgXo7/8SZrnR0lgpDVw4npQIiEV0VuGIQcKwz6ulXObfV2tpzQNhk5EoLjnrtQB+OK7SOMlaHboJVSmOAOsV6+NmKp+H63s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(346002)(39860400002)(376002)(966005)(6666004)(66556008)(44832011)(86362001)(316002)(4326008)(66476007)(16526019)(66946007)(2906002)(186003)(83380400001)(2616005)(26005)(36756003)(16576012)(6916009)(8936002)(54906003)(956004)(6486002)(478600001)(8676002)(33656002)(53546011)(5660300002)(52116002)(107886003)(7416002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hTtDMs6SFQaIvpHRGGRbYRhAyXrxAsDnnlOwybKPC96UhR2NHciXSDaqYPh2?=
 =?us-ascii?Q?JdcC7AbR4wJ1GeeuvDU9rw7dqU8mD1E+dbX9X66MQCVS7Tu/QT27T4hZob2t?=
 =?us-ascii?Q?Kr3zXE36MCxZQhAKHqYNx1RVctQ4xQA9GWvoL7lnATt+tfssM20xw3nG3TOf?=
 =?us-ascii?Q?zLSFj/6q1exIPWqr5c5BLd93kTxX5y9W/Be3hxj53oJ0k1G6ZD9yCQE+qaq+?=
 =?us-ascii?Q?V1en0nuHYYnZrNQKU1i9QigHGreoTO9ID1JFQpyn892LwuXw6AV6214st4G6?=
 =?us-ascii?Q?UZnjSAXcLlabNku1Y5zNeEemi2KLedilxMrkn52iE/O7VopjBRSMTOnNPLJh?=
 =?us-ascii?Q?264ETNjSYK3aTitejuqyZWCcqHOlD0f4Ns1O3XOGgEeGDRGjJEevqGLQvLYO?=
 =?us-ascii?Q?L8t7GvQX11v+Z8RCPQFc4C+7IUEmSCg0/GMWBIbGM8C1ZB0y7Cy+siktedvm?=
 =?us-ascii?Q?PEXaS2IrI9BnOqSvyfmxMm/4pDSOK0Q4NjeOD2EoRIOKMEJ/+cyvegY9blEj?=
 =?us-ascii?Q?mscY76FdbjDZZyqB9Oec8AF93zBfgDSdSTBVrzuA3wq59XQ7jGpaDim4i+MQ?=
 =?us-ascii?Q?p/Hup4v2Al9/5x0k7fxDiSS4+zk0r/6cupLFspwYTCfBoeaMstJcTKn7iIAh?=
 =?us-ascii?Q?jcVXHgw2zBZ1Fg4rmI6IYpZf0IQfPw9xyqKerOrineIJnh/RvFDG881ijeqr?=
 =?us-ascii?Q?sAsuEmTgdyOIHgNr25gGKkweFR0MFLTdX65pUF/TMqT3dahOZgwYurGRUMH8?=
 =?us-ascii?Q?DQI5/zyrK3EaidgKMqMEiEDW7yTlFc+2TJQTE29wtHWD2XSK/ydcui+sKmzF?=
 =?us-ascii?Q?EyF0xmrgnpawb6/6Zyj6rYqSkh6vJK9gpAetOm5IkxsgjLlcO6DHqSF4QdZ0?=
 =?us-ascii?Q?lEvgPQ8c1yYfxBeT3hasRt8lMROM1WAu/962xxGcN5J+0qPnhpd5y1iTJ33N?=
 =?us-ascii?Q?D8Vw392ZO+HVwun4x2bgnXvNDSTYaVywtv3xBMk726DxYdY0gtaWRla+i3QX?=
 =?us-ascii?Q?HhbUvUUsNpTks0gY3zLAUa0I9z0lRhWZ3F7Wo4mYMKo33HCsbC0qjwzRVkpD?=
 =?us-ascii?Q?pKshXRyNap1h9mtpP926WqOaBxsUW3K7e4iO7GWeh39djj65uqR1aAEo6iqj?=
 =?us-ascii?Q?q6dONM/UGeEnAwtEf58Fw1sieqOEzw60Os1MK2Vd4D8aXQxcJMyKPvMToSSu?=
 =?us-ascii?Q?cazQZVkws9XiCXMRFtLbjcmFOQQBEVYEPgPl2pmnroS6uRaUt9ePf1T4OC38?=
 =?us-ascii?Q?hXEL8NtFdY022LkXbHaEW3e/zph1bNyGoZtjv8YoI2ZmrBY2sK67bwXhlmqS?=
 =?us-ascii?Q?fpuHtwlk/olTazv0bMDaZm3E?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9489fae9-c1e6-458d-7a09-08d8da014382
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 02:50:23.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gGtxCh4TCLfEKWmE8vf/LU7ONqN2OnLnQeHfT4EOY3XIZYcpMzRXPVFTZ2Yi2liWJ101HjNKPf9n/U855jCfZPDDHV16QHO1z47z0kbT6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5098
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260021
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260022
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 25, 2021, at 1:58 PM, David Howells <dhowells@redhat.com> wrote:
>=20
>=20
> Here's my take on v5 of Eric Snowberg's patches[1]:
>=20
> This series of patches adds support for EFI_CERT_X509_GUID entries [2].  =
It has
> been expanded to not only include dbx entries but also entries in the mok=
x.
> Additionally Eric included his patches to preload these certificate [3].
>=20
> The patches can be found on the following branch:
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/lo=
g/?h=3Dkeys-cve-2020-26541-branch
>=20
> Changes:
> - I've modified the first patch in the series to fix a configuration
>   problem[4][5], to move the added functions to a more logical place with=
in the
>   file and to add kerneldoc comments.

Thanks for making these changes.  I reviewed and tested the series again.  =
The only=20
thing I found is we may want to fold in this patch [1] too.  Other than tha=
t,=20
everything LGTM.

[1] https://patchwork.kernel.org/project/keyrings/patch/20210204033208.1389=
901-1-eric.snowberg@oracle.com/


>=20
> Link: https://lore.kernel.org/r/20210122181054.32635-1-eric.snowberg@orac=
le.com [1]
> Link: https://patchwork.kernel.org/project/linux-security-module/patch/20=
200916004927.64276-1-eric.snowberg@oracle.com/ [2]
> Link: https://lore.kernel.org/patchwork/cover/1315485/ [3]
> Link: https://lore.kernel.org/r/bc2c24e3-ed68-2521-0bf4-a1f6be4a895d@infr=
adead.org/ [4]
> Link: https://lore.kernel.org/r/20210225125638.1841436-1-arnd@kernel.org/=
 [5]
>=20
> David
> ---
> Eric Snowberg (4):
>      certs: Add EFI_CERT_X509_GUID support for dbx entries
>      certs: Move load_system_certificate_list to a common function
>      certs: Add ability to preload revocation certs
>      integrity: Load mokx variables into the blacklist keyring
>=20
>=20
> certs/Kconfig                                 |  8 +++
> certs/Makefile                                | 20 ++++++-
> certs/blacklist.c                             | 17 ++++++
> certs/common.c                                | 56 +++++++++++++++++++
> certs/common.h                                |  9 +++
> certs/revocation_certificates.S               | 21 +++++++
> certs/system_keyring.c                        | 49 +---------------
> scripts/Makefile                              |  1 +
> security/integrity/platform_certs/load_uefi.c | 20 ++++++-
> 9 files changed, 150 insertions(+), 51 deletions(-)
> create mode 100644 certs/common.c
> create mode 100644 certs/common.h
> create mode 100644 certs/revocation_certificates.S
>=20
>=20

