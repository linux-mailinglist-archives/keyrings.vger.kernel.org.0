Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF8748F8F6
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 20:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbiAOTJY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 14:09:24 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:56272 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiAOTJY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 14:09:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05BD560F13;
        Sat, 15 Jan 2022 19:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32EEC36AE7;
        Sat, 15 Jan 2022 19:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642273763;
        bh=vYuDKBu1ebs6LVtPI58WDuyUt2brGnRZGyXtZb1/PY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VWvcvmVUGWMipo2wPIxDpCPqaZf5Y8JuWAmkx2Qz2Yhe4awmCw3n0HgJwVoV/PVVh
         pV9QAsntfeGxNT6Xgtr/E8bfsfGuYm2feo4rowxz7RF+VsmCYkY3ye69pMnnyDV0PZ
         ZaV2/fQVs6SxY7l49MgGTf+uRBPBY8mleSrqMfrQg3iPmXu8Eq7NBlyY1gyZjfVScs
         +yppCA9YKwF48VieToUH7O+uOGKMJjYpImTxwfTsB8kotLo4VIg8WiIExGS8VNZ3xo
         lIgSzqlhujvVN5EV1qgqdtZQ4B9NYe/FXxOhteFF5MI+Rn75+s3BNwJDK3ZfxSbI6a
         ys9W/zt49vMJA==
Date:   Sat, 15 Jan 2022 21:09:10 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Denis Kenzior <denkenz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 3/3] KEYS: asym_tpm: rename derive_pub_key()
Message-ID: <YeMb1sblN0KqCO/x@iki.fi>
References: <20220113235440.90439-1-ebiggers@kernel.org>
 <20220113235440.90439-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113235440.90439-4-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 03:54:40PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> derive_pub_key() doesn't actually derive a key; it just formats one.
> Rename it accordingly.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
