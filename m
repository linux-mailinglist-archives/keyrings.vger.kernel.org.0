Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C22E457682
	for <lists+keyrings@lfdr.de>; Fri, 19 Nov 2021 19:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhKSSjI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Nov 2021 13:39:08 -0500
Received: from mga07.intel.com ([134.134.136.100]:2265 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235396AbhKSSjH (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 19 Nov 2021 13:39:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="297887058"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; 
   d="scan'208";a="297887058"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 10:36:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; 
   d="scan'208";a="673310220"
Received: from chardy-mobl.amr.corp.intel.com ([10.209.29.151])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 10:36:04 -0800
Date:   Fri, 19 Nov 2021 10:36:04 -0800 (PST)
From:   Mat Martineau <mathew.j.martineau@linux.intel.com>
To:     =?ISO-8859-15?Q?Stephan_M=FCller?= <smueller@chronox.de>
cc:     herbert@gondor.apana.org.au, ebiggers@kernel.org,
        jarkko@kernel.org, dhowells@redhat.com,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org, simo@redhat.com
Subject: Re: [PATCH v4 4/4] security: DH - use KDF implementation from crypto
 API
In-Reply-To: <4181314.UPlyArG6xL@positron.chronox.de>
Message-ID: <c4b0b368-3168-bb65-a7b8-4f6d4e7015c7@linux.intel.com>
References: <4642773.OV4Wx5bFTl@positron.chronox.de> <4181314.UPlyArG6xL@positron.chronox.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1017921664-1637346964=:1817"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1017921664-1637346964=:1817
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Nov 2021, Stephan Müller wrote:

> The kernel crypto API provides the SP800-108 counter KDF implementation.
> Thus, the separate implementation provided as part of the keys subsystem
> can be replaced with calls to the KDF offered by the kernel crypto API.
>
> The keys subsystem uses the counter KDF with a hash primitive. Thus,
> it only uses the call to crypto_kdf108_ctr_generate.
>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>
> ---
> security/keys/Kconfig |   2 +-
> security/keys/dh.c    | 109 +++++++-----------------------------------
> 2 files changed, 19 insertions(+), 92 deletions(-)

Acked-by: Mat Martineau <mathew.j.martineau@linux.intel.com>


--
Mat Martineau
Intel
--0-1017921664-1637346964=:1817--
