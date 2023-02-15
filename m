Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92585697C5D
	for <lists+keyrings@lfdr.de>; Wed, 15 Feb 2023 13:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbjBOMxR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 15 Feb 2023 07:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjBOMxQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 15 Feb 2023 07:53:16 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01olkn2020.outbound.protection.outlook.com [40.92.64.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7137C36695
        for <keyrings@vger.kernel.org>; Wed, 15 Feb 2023 04:53:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMy7NjrM385yqtQrZ+FWzDxnlzH+Ar/7nS6KJ7BYk/3dlfVVY+8vkYXNo6gMLVNxOposRiG8hgHXM7IKYwXTNXX8CidDRBKYsuJJw9MfPBHNQT2YWFOIt4xiL98L5vykB7aIzGXzInZRlUVrEku9x0D8fgoxt5zbWBNB5TkILtWP99NA1W4Exs3wGnFUlIFoO7WgEspqNtnXS5ClivorAFjUettfneiccvvF/fhSXMKUrllRrsNXkZL0pjtXUUveSJ5f1Z6T9k2xQSlcPs9ivPpXU5xaQRaeeK6TbWm+ilUt2yEXgE2NL4WSTQ1Rr0i4WUr6dnaUxgKI/6bTWBnH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZmwIctpL7n6M8E7N5Zw9znEqgGPgODCJk+YSPDDm+M=;
 b=L2DWIwRtsw/xRW/JBsFq9FMWkvAw1mIoP1lPpwwXyeqQQNUf5Wa6IrhfyyLyT9lGEsEaMXnipy6YvQOq6e5egYKcmd/v53bypzucxXw3DGt05PX5RVF0dT8v483RJ3sgLjfl8h9sE+4PrqG9ZssIqjqI6GLIWD8ulhc+aqGq5clYn8fW44WadkTnd2pnr0ntvgMAw1YZLfBxgWC3GU/Wodt8FcaVi1I1RfXioZaoqT2qQv6RXnVFkw2YN3+BN1wkMnNGKNuP+QL4dO21TRIbyfEeCLnAWU+x1inBrc1zfPriKDR1w/pAY/oPe0qaQgLsXDj12QCwsjQhVJhMLKj74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZmwIctpL7n6M8E7N5Zw9znEqgGPgODCJk+YSPDDm+M=;
 b=Y/Ci6Mav5aMQdhiXOFJpsUTGi00m9n+gFIzOndKLOSnmx8I7BtcsfGDic7SyA1+UHFkeC9XQPwYN5EACBHvpPE+NXnBLOve4ubChZ0GDMQQ1n6aDMvEAKWC+joxmSaCe2zsJGNTpY3Ox5WW/g14iRJsTOMkrZKmz9DE9KM6kqhXBWjY2MX1PUFckdCLwMAJqYavskFsgsIJQfabKaBQtobAbY+MjNQj6jy7rX8VVzV02Lf12EdHiuViSOQEboC98g6he4UJsgFExIwhHW5rArXuYfDaLP1FHadAHqfk/wLtG2yUokaWPemTsuqAtjV16gnFU7XC8wMLV0xTFQmYYRA==
Received: from PR3P191MB1406.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:97::23)
 by DB8P191MB0572.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:53:09 +0000
Received: from PR3P191MB1406.EURP191.PROD.OUTLOOK.COM
 ([fe80::da60:dce8:24a4:e6a0]) by PR3P191MB1406.EURP191.PROD.OUTLOOK.COM
 ([fe80::da60:dce8:24a4:e6a0%5]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 12:53:09 +0000
From:   Salman AlHasan <kurt9000g@hotmail.com>
Subject: Offer Last till 
Thread-Topic: Offer Last till 
Thread-Index: AQHZQTxhStRo7G+5v0enDybT2pWxTg==
Date:   Wed, 15 Feb 2023 12:53:09 +0000
Message-ID: <PR3P191MB1406BBD8CE6F46636765047EB9A39@PR3P191MB1406.EURP191.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn:  [cYu6L8nh4/RfqGGyIYVrx0H/XuzF78lj]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P191MB1406:EE_|DB8P191MB0572:EE_
x-ms-office365-filtering-correlation-id: 2ea4388a-e0fa-4cc2-dd85-08db0f53971a
x-ms-exchange-slblob-mailprops: Y7iQSqlERdUGkLsvmQHC/x4RKAuVE2Ev2NluvJxk2dk/B8HrL8I/WAOcgKWdD/MQsF5r73mwVMGwvaaa3IKOL4CHsAXenyLMQC+9qUNEZSf/p58yxpTirDUZLzSAitHzVpSULrqafdguwQ5E0GLDSRuAxX1WaqM9+8/QgIlvOBat+vf0vk1SifdKInp/wwZLdMks8x5DiC14aYhkJhq8DpACiIp6PnILH51fZBX/jyrB0XnvwhT+G3DbWOB2ukKui1DkGpOyDHpQtE0/MBZlR9CvGDlw4rJG/T6S0T5iI05ThDoykl1upt+kZLjOqJMH+ED1xRVrtopVwz2JPq6RlKTwK/zjCxMuCDCYOUU51OSGuIr79IINyADHklNUEw8pocpmNksRjOXE7N39uP20wioIF1ifccoGFicRWQo7A5YAvyAAkt8C9t7NOtLHYE7Fg4zabyWABhvK48PZtUbSMYfKQv2ahACy5jwdfUtEDlOxr44WBPZcsc6aQ6Tngot1ZW+sV2Cl6fZbMw+opoTEJXastMP4DqiQc8oV9mRhGPb2fLjSbxXPTVS3sj6fJ1H4io6Q0I8bLr8g7BLkGSo5NkeMFem//ae+sy/gt/odCd7N7qBC4nrupOJZWREJzVP7letSUR56a0tKQEI3+02zeHZpB1DiTGiOTD7iV4lJjgU=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H7c9KPkqBqrXTBvK7tt2UR49H9vj60c7RiP8sFiAKq/K4lBr21bbRif1DuJrSgBV3mZdWG7l7qy1UF00DVEw3+3ihlqVDXD7OLNHn4eghKScWlvicYXWiR71acoJocX06WreGIf4slVqwMnuKhsixER0G30YS13kwACrb1JeoOIW8hrRQp2BRdZq8aOOx6zxNG1tNUtLhnR2TP+DlTHZKhME4gNmHojC/q1W4MqJeCoEIZQA6zxSgRTl5msol8OZR+IhDkvMnZWzCGe68rPhURJD5l5sJdgo/UdqOtgJc+BmVblSwHP+G+vrndTX7GGrN9lKdfTp9NBraB+tr01G9uormglBpGxzl5AZF5LmzPeWOo06o54YE0YvCZG0VvKFITbrHYXPYuzvA1XjeRgD16rDPy0N82bBYZlcd7ru9V3PibxBghY/XpxXVqFNru+dStQuLNQpKXqskiPimtR/7RVSfaa9J7zr/8zby1/2dwTeDcRs7jtke/XgrExo9MNsab+J59ZuGj+p3lNxlOzT6Q9kOHRGllKXEh9h2l4LH9WhkE+NX9G4N1KEIrf/RQM6Z4a3SZLqnS7uUHcGk8EVU08AkmOCfe+UEOYwDxyWukc=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Mez0IEoAj5papKlw5r/ilWNX6ILApXafddIN2NzdKjIYoI7h9fZSSdTgaf?=
 =?iso-8859-1?Q?XCthX6ntfcHWMI20qX7qgKPbCPdHADbyNRBpzEba3DUNayEVDPWNZJEbaA?=
 =?iso-8859-1?Q?Al2Stbf1K6yXulbyTxhWSBJC4Ue2IXwYpFNHLkjXST2dizLAXARy66kUQI?=
 =?iso-8859-1?Q?a23S0nhZf3tMhZzcsvo1TbHWimIgIHy8SxLTaepWCFzxqoowlbXEruNGOe?=
 =?iso-8859-1?Q?yaR18IlhL2BGo3jNRkusnxVNcBRGuLn3oAuOF5bSUQVa2Xh1pb4BKTZAWR?=
 =?iso-8859-1?Q?rrc4lG36Wc2DS014nXNaIXpztuKh9sZIz9WFOXt7Jeh7zRpAMN8mNI7oqj?=
 =?iso-8859-1?Q?9kNCYNDhENwsBh/kxYpJdObXY/QT+eTM20tyL/BLGcz3+1W+RIigSVKYtr?=
 =?iso-8859-1?Q?8H8JENPyVZpod/g/evkBH3fowuqwCiPvT3N6ocwoLDEyZiY9IzBLthgTgY?=
 =?iso-8859-1?Q?H/uRqW32yNDW74VW/ACvxLAEe3CXoom18oOwxXjhCs4F6hDm08hz0ZfGDf?=
 =?iso-8859-1?Q?txXukrrwcg3Y+WJfhYRX5a/kQADDRsE8zcqYrYxMTITD9HMmq/Z4Eqqk1s?=
 =?iso-8859-1?Q?wzdmi/haoUGLStxzY424tn4jLe2rFlLIHHFnwV+m4HchNiNUh+C827AnP1?=
 =?iso-8859-1?Q?yrJjV2hh0WCo1779kxixTpn9b4B1azUZaH5oIqxqxa2IqPOQ/b3C69JCKP?=
 =?iso-8859-1?Q?Zt2xLjmOv9H9y2HtU5I3c+6z95GtNY+ZiS2Q679WdJqpfGJsbpe4noCua1?=
 =?iso-8859-1?Q?DMj7nqhrN6hLOwH4sQ42fNiIuMflBa2uMk9k3rDf0trG14eHXrvGXizSXf?=
 =?iso-8859-1?Q?dzS7hLbC/iQEQrF3pjzSkwVKn0apDEJvxdJ//9o17wgDbtiin9Us//HTrY?=
 =?iso-8859-1?Q?Ot4VM4Uwv0KYe3L/cbZ3xYENyLfhPOCbpuNjQePCeE7UouwQBai8s1bvHP?=
 =?iso-8859-1?Q?p1+wPRg9cPuQ+TMI6LhHShBJhE9OhLcDvmp7ogZg+Ut8jwhWoI4Zccxthj?=
 =?iso-8859-1?Q?yvDdDrs+ptvWMz3X33G1HxJrrlgzI/XlEj64XdhuXYetf5Fk61eImhFM3O?=
 =?iso-8859-1?Q?GjRqfIXLTXF1lNgOv7fmCaV4cnwIf8ohvcfLMDTa/zk448YfWbhUa3RYk3?=
 =?iso-8859-1?Q?GChi8uCMbCIFdO0/jVqb9jDKOM9XKnypkQHR0pbx8EQVF6m4sOMT/nRWP7?=
 =?iso-8859-1?Q?FOEsQmkHsNpwjY35Blfocrhumiye8Cr/KFcTaL6w0jlUQhMGXXFNU7CXVf?=
 =?iso-8859-1?Q?Hg4rHBtliZYza88I6Db/yndA74Lg4Ra7xnv+PIUQS9449+f7C4kP7yoK/v?=
 =?iso-8859-1?Q?hIQP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-50200.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P191MB1406.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea4388a-e0fa-4cc2-dd85-08db0f53971a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 12:53:09.4410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P191MB0572
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        MALFORMED_FREEMAIL,MISSING_HEADERS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Good day Sir/Ma=0A=
We offer Corporate/Personal Loan for as low as 3% Interest rate, through cu=
tting-edge innovation and so much experience in the field.=0A=
Contact us for more info.=0A=
Salman AlHasan.=
