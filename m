Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBF948F8F2
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 20:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbiAOTFR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 14:05:17 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54740 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbiAOTFR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 14:05:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EAADF60F2A;
        Sat, 15 Jan 2022 19:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29B9C36AE7;
        Sat, 15 Jan 2022 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642273516;
        bh=w6HI7GitBlXZZNImPpoSjxwbbCFlZk5FVn4DxRIpiWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FpCpY0KWQX8nJ6YzC7Y9nzsTXVpTVrKJd+o7FZnHNNQBpcY/5DYe2lj+4jPODDw2Z
         SXNAgIBaqhUIXnm0hgQaMF81NiMfasU9/gP0ABa6EW/ulVxl6vgV/9bD6N0GgUyIgG
         ANvstjDQYed42cfDaCnPnq5ldP1ACYfTIwrILHL1ZwpAqwMazfyqESg3AQvFYo/42m
         6u6avGYMDfkVy23uyixHtrSmvgBIq00PpZ2tlTy+b8WRORrbDWPkI6ol6GtskJs4WP
         N0UZR5Y2c9fVxCLTbCPVilFDzUEOe7oaJ5z45AvvStgNOsYMR8/Wc06XlZ4PEqFb68
         MJGpm8XssvJkg==
Date:   Sat, 15 Jan 2022 21:05:03 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 2/4] KEYS: x509: remove unused fields
Message-ID: <YeMa32Rn34kaP3jI@iki.fi>
References: <20220114002920.103858-1-ebiggers@kernel.org>
 <20220114002920.103858-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114002920.103858-3-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 04:29:18PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Remove unused fields from struct x509_parse_context.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
