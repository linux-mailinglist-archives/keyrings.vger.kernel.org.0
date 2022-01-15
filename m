Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F4348F8F4
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 20:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiAOTHa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 14:07:30 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55586 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbiAOTH3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 14:07:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 474AA60F32;
        Sat, 15 Jan 2022 19:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C3EC36AE7;
        Sat, 15 Jan 2022 19:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642273648;
        bh=S1PGjRcYAK/0fVHe8V0BoeTf1Z1KBPSFBoQyA0RLHwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gLTu5ddrgr8ANO5rdAWSi6CoNHatczrYTFq454sE4t+aHZrXrWAtrHxQYKCQRqUaC
         dooM7fnNp8uR1QmMUQrQ4anSYK6tIymwq3Zkeyz6AbdPSZlI7XbA9Sab30R7AHNBOS
         hThjWSdvwmKaP//mUrX4yn3vLE2pzdYOT1i6gLVI+el9Of2tEulZFBC6iIOUr3FiHH
         U8Uv7NcT6/fx3cHDXUiqYgRWbxaYNvr4FWsqtDywYqjDI0C4TL8pjw93j/j7PxCZwi
         +Nnltx3mQsERRUqBMWrD3Y2tuue1OaB0J1P//gb0UZgsLzhZu9pa/bnVPbMQbwA8mE
         1E2C2QXVFv6sg==
Date:   Sat, 15 Jan 2022 21:07:16 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 4/4] KEYS: x509: remove dead code that set
 ->unsupported_sig
Message-ID: <YeMbZAEwJmLBkKUq@iki.fi>
References: <20220114002920.103858-1-ebiggers@kernel.org>
 <20220114002920.103858-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114002920.103858-5-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 04:29:20PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The X.509 parser always sets cert->sig->pkey_algo and
> cert->sig->hash_algo on success, since x509_note_sig_algo() is a
> mandatory action in the X.509 ASN.1 grammar, and it returns an error if
> the signature's algorithm is unknown.  Thus, remove the dead code which
> handled these fields being NULL.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
 
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
