Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E9F49CC1E
	for <lists+keyrings@lfdr.de>; Wed, 26 Jan 2022 15:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242041AbiAZORV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 26 Jan 2022 09:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbiAZORV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 26 Jan 2022 09:17:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE57C06161C;
        Wed, 26 Jan 2022 06:17:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F174CB81E6E;
        Wed, 26 Jan 2022 14:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C21C340E3;
        Wed, 26 Jan 2022 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643206638;
        bh=4A5Z1ofVNOBQr56c22FE/jCyEBHvNDT//2QoIQO9wA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I2VtTvq6g9ehHbWv8ceOIPHmJQDjz9TbFnOJNDMWRDf/ST9IfmFt6HzoioV3BvlpM
         9VaxVxo16hS+NqTYOyEvfzKEx5Q1uKiOqPU5AwYm9SE8Bf8xthHKpziFjpcStGfLU2
         dPsZ5EqnP/WhIg4WqnHbKJc5OSQUN0pJ8paCZLfJ1Fl2ei1t89lu8si/s7ihGW7WBV
         DDuZeHize2o+pjNXMOHs3kzDGFMSTCImGgbH/FfbMlQ/ooW2L++JwlNIP7d202vayP
         7fMthByPzKnHXF0bXXJGUk1Y0fbuu64WchBjtqsAevS21gu7hZP2SJoYjkwSXTNmPl
         C+PPO/sGXDKrQ==
Date:   Wed, 26 Jan 2022 16:16:58 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 0/4] KEYS: x509: various cleanups
Message-ID: <YfFX2mJtauudkaaB@iki.fi>
References: <20220119005436.119072-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119005436.119072-1-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 18, 2022 at 04:54:32PM -0800, Eric Biggers wrote:
> This series cleans up a few things in the X.509 certificate parser.
> 
> Changed v1 => v2:
>   - Renamed label in patch 3
>   - Added Acked-by's
> 
> Eric Biggers (4):
>   KEYS: x509: clearly distinguish between key and signature algorithms
>   KEYS: x509: remove unused fields
>   KEYS: x509: remove never-set ->unsupported_key flag
>   KEYS: x509: remove dead code that set ->unsupported_sig
> 
>  crypto/asymmetric_keys/pkcs7_verify.c     |  7 ++---
>  crypto/asymmetric_keys/x509.asn1          |  2 +-
>  crypto/asymmetric_keys/x509_cert_parser.c | 34 ++++++++++++-----------
>  crypto/asymmetric_keys/x509_parser.h      |  1 -
>  crypto/asymmetric_keys/x509_public_key.c  | 18 ------------
>  5 files changed, 21 insertions(+), 41 deletions(-)
> 
> -- 
> 2.34.1
> 

I'll apply these (with ackd -> reviewed).


/Jarkko
