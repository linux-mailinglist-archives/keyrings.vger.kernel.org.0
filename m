Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A647348F996
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 22:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbiAOVm2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 16:42:28 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:38372 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbiAOVm2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 16:42:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D412FCE0AE5;
        Sat, 15 Jan 2022 21:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5635C36AE5;
        Sat, 15 Jan 2022 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642282945;
        bh=UCi6bl9WDlzd/MWB+FRVtRgWBjSR8OlEmFFmEb6dAi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B58kPCzqiyScd1n3Ah6Q3i0BWS5b4CYajs8TPWvhJMzvNaQtiUQ96G9ompxOOHe0h
         IYdF1j6qqWHxz3cfkOkH/1qlpZLfyj+fgZLsw7dMxWOO2iSxNYj6TxvP9AzMey4Wdx
         oeyPX/uD8qN2uKkkVK+AbTz2U91BPGK8kQ323X19XNxVX+tZoW+tVvsPj6wHxWVuYQ
         UnNZbpXeJ3simSKa1nDpYjiWHqQCN3OXhsCnQ8j5NEiBH53zxZ5Ua5JxcVCaTLjUkK
         8aDKi6L0Y7596H0IumHS1l17MqgPkUFVEFLHj99kiI9FATgSuesYkg46kJI4OuGASs
         25dE1vOWbBeFQ==
Date:   Sat, 15 Jan 2022 23:42:12 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Denis Kenzior <denkenz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 0/3] KEYS: fixes for asym_tpm keys
Message-ID: <YeM/tAuyjKVT0YS4@iki.fi>
References: <20220113235440.90439-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113235440.90439-1-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 03:54:37PM -0800, Eric Biggers wrote:
> This series fixes some bugs in asym_tpm.c.
> 
> Eric Biggers (3):
>   KEYS: asym_tpm: fix buffer overreads in extract_key_parameters()
>   KEYS: asym_tpm: fix incorrect comment
>   KEYS: asym_tpm: rename derive_pub_key()
> 
>  crypto/asymmetric_keys/asym_tpm.c | 44 +++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 17 deletions(-)
> 
> 
> base-commit: feb7a43de5ef625ad74097d8fd3481d5dbc06a59
> -- 
> 2.34.1
> 

I really appreciate your effort to go and fix this key type. Thank you.

BR, Jarkko
