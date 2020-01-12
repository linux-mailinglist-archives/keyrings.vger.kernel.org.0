Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4A613859C
	for <lists+keyrings@lfdr.de>; Sun, 12 Jan 2020 09:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732495AbgALInL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 12 Jan 2020 03:43:11 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:45301 "EHLO
        mail3-bck.iservicesmail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732485AbgALInK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 12 Jan 2020 03:43:10 -0500
IronPort-SDR: l7+gObfj6HBMYqAgTvRCCXQwgu+evNpzdK1YYir6Dp1j+5XC2/VsMdzn9XWCDLqlVkkRcbHMHy
 mohT22vmmCag==
IronPort-PHdr: =?us-ascii?q?9a23=3AmrxGmBamNPSV5AaEvs8bwaL/LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZr8S+bnLW6fgltlLVR4KTs6sC17ON9fq+Bidav96oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIhi6txvdu8gUjIdtNKo8yw?=
 =?us-ascii?q?bCr2dVdehR2W5mP0+YkQzm5se38p5j8iBQtOwk+sVdT6j0fLk2QKJBAjg+PG?=
 =?us-ascii?q?87+MPktR/YTQuS/XQcSXkZkgBJAwfe8h73WIr6vzbguep83CmaOtD2TawxVD?=
 =?us-ascii?q?+/4apnVAPkhSEaPDI/923Zl9B/g7heoBOhvhBy3YnUYJuNNPp5ZKPSZ88aSn?=
 =?us-ascii?q?RYUslPUSxNG5+xb5cTD+UbIelYr5fyp14Qohu4GQmgHf3gyjlRinHx2q061f?=
 =?us-ascii?q?ouEAHf0AM+GdIFrXDYodvpOKsOVOy4yrTDwzfeYPNMwTrz5ojGcgo/r/+PQL?=
 =?us-ascii?q?x/ftbex0Y0GgPZjFiftZDpMy+J2ugTtWWQ8upuVfioi24iswx/uCagxtsyhY?=
 =?us-ascii?q?nTm4kaylfE9SN2wI0oItC4UFB0YcK6H5tKuSCaMI12Qsw5TmFooyY10aEJtY?=
 =?us-ascii?q?SncygNzZQr3R7fa/+efoWO/xntV/6RLC9miH54er+znQu+/Ea8xuHmSMW530?=
 =?us-ascii?q?xGoyRFn9TKq3sDzQbc6tKdRft45kqh3DGP2B3N5excOkA0kLbbK4Ymwr4tip?=
 =?us-ascii?q?ofqUTDETHymEXxlKKWc18r+ums6+T9fLrmooOQOoBuhgHgNaQhh9awAeo/Mg?=
 =?us-ascii?q?gIQWeX4/qz1Kb78U34RrVFkOE2n7HHvJzHJ8kXvLO1DgFJ3oo59RqyAC2q3d?=
 =?us-ascii?q?oYkHUfKVJKYhOHj4znO1HUJ/D4CO+yg0yynzd32f/GJLPgApLLLnjMi7rhfa?=
 =?us-ascii?q?195FVAxwYp0d9f4JdUBqsBIPLwQkPxrsDXDgclMwyoxObqENZ92Z0eWGKVA6?=
 =?us-ascii?q?+ZNqzSsUST6+IxLOmDepUVtCz+K/c7/f7ui2E2mVsHcamux5sXZyPwIvMzIE?=
 =?us-ascii?q?iIe3vqjcwpD2gHpEw9QfbshVnEViRcNEy/R6Yt2jZuMI+6AJ2LeYerj/TVxC?=
 =?us-ascii?q?qnE4dJYWZJClOMCn3jX4qBUvYILimVJ5kyvCYDUO2ZRpMsz1mRswn1g+5/I/?=
 =?us-ascii?q?bZ4DIfs53L1MN/7KvYkhR09T8iXJfV6H2EU2whxzBAfDQxxq0q+hQlxw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HtAgDR2xpemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYFoBAEBAQELAQEBGggBgSWBTVIgEpNQgU0?=
 =?us-ascii?q?fg0OLY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQE?=
 =?us-ascii?q?BAQEFBAEBAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUo?=
 =?us-ascii?q?MQAEOAVODBIJLAQEzhUmYKgGNBA0NAoUdgjsECoEJgRojgTYBjBgagUE/gSM?=
 =?us-ascii?q?hgisIAYIBgn8BEgFsgkiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQM?=
 =?us-ascii?q?QgkUPgQmIA4ROgX2jN1d0AYEecTMagiYagSBPGA2IG44tQIEWEAJPjFuCMgE?=
 =?us-ascii?q?B?=
X-IPAS-Result: =?us-ascii?q?A2HtAgDR2xpemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYFoBAEBAQELAQEBGggBgSWBTVIgEpNQgU0fg0OLY4EAgx4Vh?=
 =?us-ascii?q?gcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABA?=
 =?us-ascii?q?QEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUoMQAEOAVODBIJLA?=
 =?us-ascii?q?QEzhUmYKgGNBA0NAoUdgjsECoEJgRojgTYBjBgagUE/gSMhgisIAYIBgn8BE?=
 =?us-ascii?q?gFsgkiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4ROg?=
 =?us-ascii?q?X2jN1d0AYEecTMagiYagSBPGA2IG44tQIEWEAJPjFuCMgEB?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; 
   d="scan'208";a="323280962"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 12 Jan 2020 09:42:52 +0100
Received: (qmail 3712 invoked from network); 12 Jan 2020 04:35:46 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <keyrings@vger.kernel.org>; 12 Jan 2020 04:35:46 -0000
Date:   Sun, 12 Jan 2020 05:35:45 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     keyrings@vger.kernel.org
Message-ID: <26741608.382569.1578803746327.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

