Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70284160886
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2020 04:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgBQDQi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 16 Feb 2020 22:16:38 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:4852 "EHLO
        mail3-bck.iservicesmail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbgBQDQh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 16 Feb 2020 22:16:37 -0500
IronPort-SDR: heUSAEWEPXVF9/mN++GnPyVmN3o4EdJnLjn3oefZN3i6c44w5cx6jG6ML799SrhjJR+aIyjxUK
 WT9Pn6F06/YA==
IronPort-PHdr: =?us-ascii?q?9a23=3AGtJiBRyU2hNZLpDXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd1O0VIJqq85mqBkHD//Il1AaPAdyHra0ZwLeN+4nbGkU+or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCeybL9oLhi7rQrdu8kYjIB/Nqs/1x?=
 =?us-ascii?q?zFr2dHdOhR2W5mP0+YkQzm5se38p5j8iBQtOwk+sVdT6j0fLk2QKJBAjg+PG?=
 =?us-ascii?q?87+MPktR/YTQuS/XQcSXkZkgBJAwfe8h73WIr6vzbguep83CmaOtD2TawxVD?=
 =?us-ascii?q?+/4apnVAPkhSEaPDM/7WrZiNF/jLhDrRyvpxJ/2ZDaboKIOvVxYqzTcsgXRX?=
 =?us-ascii?q?ZDU8lNSyBNHp+wY5UJAuEcPehYtY79p14WoBWkGwasGP3gyiVVjXD22q061e?=
 =?us-ascii?q?shGhzB0Qw4GNIOqmjUo8/uOacPV+C1zbLIzSnZb/xMxDjy8pLEchE9ofyVW7?=
 =?us-ascii?q?97bMnfyVE3Gg/bk1mdq5bpMy6b2+gRqWSX8eVtWfihhmMnrQx6vyKhyd02io?=
 =?us-ascii?q?bTg4IY0lXE9SJkz4krPdC4U0t7YcK8EJtXqiGaK5N6QsM8TGFsvyY30rgGto?=
 =?us-ascii?q?S6fCgO0pQo2RrfZ+CIfoSS/BLjU/ueLi12hHJifrKwmQy+/la7yuHkV8m01k?=
 =?us-ascii?q?hFrjZdn9XSq3wA1Qbf5tWJR/dh5EutxzmC2xrd5+xEOUw0kLDUK58lwr4+jJ?=
 =?us-ascii?q?oTtkHDEzfumEXxlq+Wal8r9/O16+ThY7XmvYOcN5VuhQ7jKKsigM2/AfggPg?=
 =?us-ascii?q?gUQ2eb4fi81KHk/UDhQ7VFkP03krPYsJDcKsQbvbW0AxFa0ok98RazFTSm38?=
 =?us-ascii?q?oCnXkBMl1FfAiLj4/zO1HBc7jECqK8jkW2kTFk3NjYMbD7RJbANH7OlPHmZ7?=
 =?us-ascii?q?ku0UNEzBsPyoVn6o5ZEPk+J/T8EhvpucDVFAA+NQO0wOb8At5V2YYXWGbJCa?=
 =?us-ascii?q?icZvD8q1iNs9oiP+SWLLASvjm1f+Ai/eLnpWI/mEQBZ6Cl1N0WdCbrTbxdP0?=
 =?us-ascii?q?yFbC+00Z86GmAQs19mQQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HOOABUBEpelyMYgtlmgkOBPgIBgVV?=
 =?us-ascii?q?SIBKMY4ZsVAZzH4NDhlKEEYEFgQCDM4YHEwyBWw0BAQEBATUCBAEBhECCBCQ?=
 =?us-ascii?q?8Ag0CAw0BAQYBAQEBAQUEAQECEAEBAQEBCBYGhXOCOyKDcCAPOUoMQAEOAYN?=
 =?us-ascii?q?XgksBAQoprQ4NDQKFHoJXBAqBCIEbI4E2AwEBjCEaeYEHgSMhgisIAYIBgn8?=
 =?us-ascii?q?BEgFugkiCWQSNUhIhiUWYNIFqWgSWa4I5AQ+IFoQ3A4JaD4ELgx2DCYFnhFK?=
 =?us-ascii?q?Bf59mhBRXgSBzcTMaCDCBbhqBIE8YDY43jisCQIEXEAJPi0mCMgEB?=
X-IPAS-Result: =?us-ascii?q?A2HOOABUBEpelyMYgtlmgkOBPgIBgVVSIBKMY4ZsVAZzH?=
 =?us-ascii?q?4NDhlKEEYEFgQCDM4YHEwyBWw0BAQEBATUCBAEBhECCBCQ8Ag0CAw0BAQYBA?=
 =?us-ascii?q?QEBAQUEAQECEAEBAQEBCBYGhXOCOyKDcCAPOUoMQAEOAYNXgksBAQoprQ4ND?=
 =?us-ascii?q?QKFHoJXBAqBCIEbI4E2AwEBjCEaeYEHgSMhgisIAYIBgn8BEgFugkiCWQSNU?=
 =?us-ascii?q?hIhiUWYNIFqWgSWa4I5AQ+IFoQ3A4JaD4ELgx2DCYFnhFKBf59mhBRXgSBzc?=
 =?us-ascii?q?TMaCDCBbhqBIE8YDY43jisCQIEXEAJPi0mCMgEB?=
X-IronPort-AV: E=Sophos;i="5.70,451,1574118000"; 
   d="scan'208";a="337942222"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 17 Feb 2020 04:16:36 +0100
Received: (qmail 8807 invoked from network); 17 Feb 2020 02:34:57 -0000
Received: from unknown (HELO 192.168.1.163) (mariapazos@[217.217.179.17])
          (envelope-sender <porta@unistrada.it>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <keyrings@vger.kernel.org>; 17 Feb 2020 02:34:57 -0000
Date:   Mon, 17 Feb 2020 03:34:57 +0100 (CET)
From:   Peter Wong <porta@unistrada.it>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     keyrings@vger.kernel.org
Message-ID: <29293982.93193.1581906897640.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Greetings,
Please check the attached email for a buisness proposal to explore.
Looking forward to hearing from you for more details.
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

