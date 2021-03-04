Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B7F32CA89
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 03:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhCDCr6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Mar 2021 21:47:58 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35952 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbhCDCre (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Mar 2021 21:47:34 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1242dwUB014525;
        Thu, 4 Mar 2021 02:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=vyyWtnotVQlMzlhSFB08j1YrNvcz0DFISLQx525JYXM=;
 b=t1j2bQAoD+v5HJaVEqGzL8fJU5a9TEadJ053J3x4YWrWAWgsAz1HOa/oujCkIk7qS9f5
 SZYN5Z0ApAQzeRXwUwH6mC3S/fqqXkYAKg2OP3toF+76DpZz6b1CAFAn/DkwC2HmRVqd
 Lmv0JhJG4/TwrWzi/+9RqP9eDSFF025D7Pt1AgEvuqII5Vbmcu10p/0Y/6jsi/Illklj
 5ZxI8OT+SCY0I71c7wT+A7H2JHZgM+wAkHt/ZhY+bQ91V1CKJhzmhO83+FweR98hJMHY
 gHjXQHABlQx2g24l0P6kw5gXZ0r4JcTPr245+qsyI6vcZbEPVqydXr+fyaEGTMyBB0Eg Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 371hhc6xrs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Mar 2021 02:45:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1242f5Te098276;
        Thu, 4 Mar 2021 02:45:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by aserp3030.oracle.com with ESMTP id 36yynraqdv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Mar 2021 02:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWg7+Re+TGE6TisRQPUGXsuVJFI+dHvZNSf1rpAE67sLxaO+bDGPKp7C/MTmFq2jbV6Qh4aSKl4918EPUgjgOWORnAneJsUQI8UqcJcLZ2V/TPlfqe2XTAByE+43NdJEGjEXxT6BegPGXpCFO6GdYNskW3sd/R6f38TCMzC2Wt0bPd0rwQNCsvJolM6OllrdUna/PC9d/h+vlrIyzYugFz9cr30MwNzDJ99AceEeyWhKjFJHraJc4hRbcUwQrIXCuZu3AbMPn3olR/CFWT+L10saEN5eRX5F1mlJurxS1Cgb39F1uPJ1g2xmc/osflGyUSpdqm17auHJtd4DnYQ8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyyWtnotVQlMzlhSFB08j1YrNvcz0DFISLQx525JYXM=;
 b=YtJd+CZ9yYe1WbZBBS0yKWEEZe8BXe7+iAwiHTiUZCN4wI7++W9ZPuiNATrminzDj5CYHV5277HL1+L1EgKhKCTP9CnQbVWaeiy1OLsxTkauddm7O+19zj5tZPN+VvXIO4qikf/rsPgfn9NRV799lULX8ELf4lmoLIxwIrVgQG+BfTi81Lr7iTtkZuqIo82XsXNp4mNcyjHa4qerr+hRSUeTYF0O+UuLRCbP+8UNXv438pATTx6SagpwkUf5h4NyqYukouQIHVRV7YD8O+fWLHsKm9lsRK5DZtF71fHsTTPSshOwyiV/8+hqevOKvnH2OIVTkD3hZGNJ2Fynu8KtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyyWtnotVQlMzlhSFB08j1YrNvcz0DFISLQx525JYXM=;
 b=bovNeMSJVnNzwO7VAUvGGkMAPYk5C35U21EzyMHxQ9uYXfyz4waRRnznLtDRmSFD1BFoa+ag8mx/slOcLBNiqNEiEjCPCng8FG/T7muxnxWMT2uBn3jrYYgskhSv7KPMEVUQCz4ap35g7F9/dsyLORUc19UcqsM6XL1/b8zTuqY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH0PR10MB4892.namprd10.prod.outlook.com (2603:10b6:610:dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 4 Mar
 2021 02:45:44 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3912.017; Thu, 4 Mar 2021
 02:45:43 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH] certs: Fix wrong kconfig option used for
 x509_revocation_list
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <2033457.1614763481@warthog.procyon.org.uk>
Date:   Wed, 3 Mar 2021 19:45:38 -0700
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eric Snowberg <eric.snowberg@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <10ECA885-8F0B-4BB1-8CD9-B3D1993E20E0@oracle.com>
References: <20210303034418.106762-1-eric.snowberg@oracle.com>
 <2033457.1614763481@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SN7PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:806:f2::11) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SN7PR04CA0006.namprd04.prod.outlook.com (2603:10b6:806:f2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 02:45:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d0beb9d-ee53-4201-1f67-08d8deb79ac8
X-MS-TrafficTypeDiagnostic: CH0PR10MB4892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR10MB4892EEAD9587E0683838D14187979@CH0PR10MB4892.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dE23rBPZE+k8v3QNqjXFaA/FwTbcWlGgs14DiAnKVwAdCa1dqkTXe4W3ik7xKgGl6FTG0t+4YWu3zIgkUE8oZGvpJz0tNg1c5Gw6bJJyV8UwWljPJMcLhGduiSUXsYzk58A0CDDVrI3QziGVK0pJVZ8HlK0fudO/2ziZSLm+PSyPLMYDmVab8CGWoS2gV4+sdf0mUgwbkRqdFBr3Sn74Rh2684l241mJzpsJ/T+/AoNZ16Gv7UEPuN1+E8kcrpB/Zi1ZPLTE4SGAjgdIbGT9wIxdbtlSZyl5Vlji4D7RKzudjHdNcrplgFyJYFe2LBTVUxpuWFkpDFTFvYvw3cnBs21YkJERlkh8Kh/gIPLJTghpGKYOokKdpYfUBOXjuL5X8MsND6hpZiff2bLTTUSAKDDnn+DKS6tFY8Gd2kXP9i4DqsGP4rDxVIwEU3G6YgQE5N9E1YJu2Rli1PzKsiKEi3ZpaINeoAQLPFSwgD9bETOhczI46gh/a1mEIZk9+IKAg4md2zLAUgCf1A3u7lFPJkU5NgfNx4Hmz6rDg/wJm69WLL1Y8wxNkN9/SY6Pcy/TJ1IRA9fx+Oa9FcMk4T9PmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39860400002)(366004)(376002)(44832011)(5660300002)(66556008)(956004)(66476007)(6916009)(8936002)(6666004)(52116002)(66946007)(53546011)(316002)(36756003)(16576012)(2906002)(6486002)(86362001)(33656002)(186003)(54906003)(2616005)(478600001)(8676002)(26005)(107886003)(16526019)(4326008)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWU3QzN5aG01Y1FTM1lMVDRld2NrWmZmbnA3Ui9vbURFZWhqQ3ZYU1RRMXlO?=
 =?utf-8?B?enRrY2hvdmVPQ2h2VWFEOVdJU1ZOcjk4SmNaTFhMRER4eHdOK2M3K0FLTkRy?=
 =?utf-8?B?eHdLV29KcVhLNDJYTU1MY1F1RThkdnllMkcxZEhjRkVOOS9tWFhibTlWZ2c4?=
 =?utf-8?B?RnA3VUJLNDVZZ3plRkVJcE5aN3BEaENmQncrcUYvLzdoUTB4MWR2VnhoelRa?=
 =?utf-8?B?R3Y5TG9ZMmpCSWJjZmRCVzIrL2MwbktYU24xTVlnSGRVRUdNZVVXNDZjV2Yy?=
 =?utf-8?B?TUI5SkdmRVlGb3lrYm95NHNFb1NydUFIb2FsOW1XZEZBSnZzbkZNN3BKSTJZ?=
 =?utf-8?B?UGViK29PUG9nM002ZE5heDlwZ2tUV0FIZ1pQQjg5TUMyWGtwVk4zMmlQSENM?=
 =?utf-8?B?Z3NKODZvK2ZoMEs3QnNNNTJETjh0b0xFMTRXMEZPTVZ4Y1l5NjFuTE1yTXBv?=
 =?utf-8?B?U3JVNHBuL1RzNE5leGk2dGx4OW80WlA3eVdzMnpVNjFVSWN4Ulo2VVlDMThv?=
 =?utf-8?B?SS9HNjJWV3Bnc2Mzam5UZnQyMktvak9tNEtSbThZR3NNUU1YSU9lZXgyUHVu?=
 =?utf-8?B?Q1piLzNydTNGaTNmdWJ5Rkx4VW9kdDEzb1p4eVNva2J6cDVUMVpWVFlPdnF1?=
 =?utf-8?B?ajBxbzY3TnlYTzk2ZU1hSXNBaEFnV2JVaytGa3RhYWRuQ3BnL25Lb25ERy81?=
 =?utf-8?B?WWZYMEdxQldTK3ZzRVBjN2hQS2svV3pDdzJTQ3NNRXFZTkxxSnorazRmWk9h?=
 =?utf-8?B?cFpJVkcwSGJKMWtrMjJaQjlpWUd2dFk3NU9MWU5ZMzc1V3RYRHZIM002L2g4?=
 =?utf-8?B?RlRCNGZpcUh0a0MvUDQrRGs2ZXhWMUlVWG9nQjNRSDFJOXRjMW1Qa1NSdU1X?=
 =?utf-8?B?OEVCbHBXWFh0bWRqTmFURUI0NHRxSmkzWHFFV2pDUkV5VXgyMjQralZSUFFL?=
 =?utf-8?B?U1B4bWlmY2dKaWdCSVBwTXY0VVZ5UVdTYTZIQUdMNFFlVHRMSjJuQlNEQnNz?=
 =?utf-8?B?NGNIVTZpbkZhc1U5VThabkdRQjJjeSt2cE5VTVBrREtQSWhNM1BKbGxaK0dl?=
 =?utf-8?B?T3ZnbG9jMmpXeFExWnAzMExmMm5WMnpxWHlNdGVQK000bzkyTDk2cDJ1Mkcx?=
 =?utf-8?B?NXYyYWplekNIaGdtU2ZmNkV3R1JscFZsSzlid09oNjFNbUhHdGxhUm5lV0J1?=
 =?utf-8?B?UU9uaXJDeGJGbkdQSU1mNWZhYTVCNDJIdTh4SENTREszOFhDSEgxK1dpQTVQ?=
 =?utf-8?B?K0ovTHVhbTQ2d3ljNEI4UUIyejhORGJBN3Y5ZUJMeDdlaWM0YmVlNWNDdjdo?=
 =?utf-8?B?elg1TFk5ZmhaWmIxYzVjYldtWElKL2NtbzE1K3o0WjVkOURDWHNad1dnTFZq?=
 =?utf-8?B?eHJKOXNPaDM4SVZyaU01SWVkdEMvNE92QVpuTzZ3S0ZRMHZRcUpCTVJxdTkw?=
 =?utf-8?B?VVZlaVJJeEFHeEkzb0hLWmIzRVVDaWVMNHRhTENXRWtYc0YyK1Ird2JzQWtY?=
 =?utf-8?B?UmJXUXBCaWt1cGdiYzFjOVdmOXl6d3JUZlNsVUgvR0EwOFR4cVEzeGVDRDht?=
 =?utf-8?B?S1VmOGpNU2V2c05LckFNVnpybnhHVzNuR2tjU0J1bVZuTFl2WjZsdlkwMEdy?=
 =?utf-8?B?R3RyTWxGZ3orQnZ6N0lwU0VxNmx4SDRzUmlnUHpFTGZoRDhjTGl3RzRLRW9P?=
 =?utf-8?B?WmVMcVI5NW4wTFVMWjlzSS9kSjJ6UDhqOThQL2R6dUpPZEpJSGZzWmtpZzUy?=
 =?utf-8?Q?3nUCYiEZDdVGIl/j+wS/TP6mgUX9hlLJnBmQJRF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0beb9d-ee53-4201-1f67-08d8deb79ac8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 02:45:43.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKWXZ5fbJlr8Q2vD6F6O1xK2CuiXX64XidkqCh6Nkf7ibXTok76oLF9bO5TRgQOs7v6QurawVRvondR5ybwW0EJBpJ8y9GtL+LIkuT5O2MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4892
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9912 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040009
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9912 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040009
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 3, 2021, at 2:24 AM, David Howells <dhowells@redhat.com> wrote:
>=20
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>=20
>> +ifeq ($(CONFIG_SYSTEM_REVOCATION_LIST),y)
>> +obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) +=3D revocation_certificates.o
>> +endif
>=20
> Should the ifeq be referring to CONFIG_SYSTEM_REVOCATION_KEYS rather than
> CONFIG_SYSTEM_REVOCATION_LIST?  In fact, since S_R_K depends indirectly o=
n
> S_B_K, you should be able to just do:
>=20
> 	+obj-$(CONFIG_SYSTEM_REVOCATION_KEYS) +=3D revocation_certificates.o

Since S_R_K is a string, I could not get that to work.  I could get this
to work:

obj-$(CONFIG_SYSTEM_REVOCATION_LIST) +=3D revocation_certificates.o

If there is another way of doing this with S_R_K instead, let me know.

>> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
>=20
> Here also?

When S_R_L is defined, S_R_K will also always be defined too.  Either as an
empty string or a path to a file.  With my change, it works the same as the=
=20
current code in CONFIG_SYSTEM_TRUSTED_KEYS and CONFIG_SYSTEM_TRUSTED_KEYRIN=
G,
which also uses the extract_certs script.  It can properly handle a NULL=20
string. If I changed it to S_R_K here, it seems confusing to me, since one=
=20
might assume it is only defined when someone adds a string to S_R_K.  But,=
=20
I can change it if you=E2=80=99d like.


>> + hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)   +=3D extract-cer=
t
>=20
> And here too?


