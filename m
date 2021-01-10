Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43702F0529
	for <lists+keyrings@lfdr.de>; Sun, 10 Jan 2021 05:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbhAJEwF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 9 Jan 2021 23:52:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:39470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbhAJEwE (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 9 Jan 2021 23:52:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 023D422B40;
        Sun, 10 Jan 2021 04:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610254284;
        bh=TBhhjgBoU8UThg9VGN2Ft+Vwhzz1p0iu24YgFq+SPKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOE/4qKVNikUN7FzpND1zm2eAyS0AzEk3QHNbmi9849NEp2zrRpwNq8guRGPf9obd
         +UjJnFqaKjKgXEy445Yf247gYr/5U/drVhiRR2lRUMNOJnW9c+sYEYJe7zDMmakb9S
         tgg3shG0uJGodrwAy9yRWELBb10Z7rl3GaA7tlb3JAb+Q/Ly+GLwcjhfDSMEWIpWlx
         suel7abi8+NZTR5rsz5BHYq8VJ3fnQDwFKpOW910GRcOOdeBhSMIeiIfGLv0gswAuu
         EKAN/alVzisBDPQ+iI00Eig6wkeYqOwOR45UU8Zzo1246F7XjW1q7fX3QMuz4PVv5s
         VIzp1lXcmVZ+w==
Date:   Sun, 10 Jan 2021 06:51:18 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH][RESEND] keys: Update comment for
 restrict_link_by_key_or_keyring_chain
Message-ID: <X/qHxnzUZxM3Gj/3@kernel.org>
References: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
 <20210104164048.1378237-2-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104164048.1378237-2-andrew.zaborowski@intel.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jan 04, 2021 at 05:40:48PM +0100, Andrew Zaborowski wrote:
> Add the bit of information that makes
> restrict_link_by_key_or_keyring_chain different from
> restrict_link_by_key_or_keyring to the inline docs comment.
> 
> Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

Picked to git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git

/Jarkko

