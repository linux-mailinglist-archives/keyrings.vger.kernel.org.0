Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E13052E7D7
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 00:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfE2WL4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 18:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfE2WLz (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 18:11:55 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26B5A24267;
        Wed, 29 May 2019 22:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559167915;
        bh=yyCYB5nepYomhKdtZmDXoTT2rs0Aa58mNTc+P7MYo7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGaSEB+h1N8d0nvnlbVB8O7cKkzk/s61qeRNaFiP6we0HZk4qnDCkxmbolDlrsSPo
         NkoZdV+a3OtanpzHsvtdHV9XPR74TEaccnL/7sZVLTOodEZhAZROZHwq+p1uWcggKm
         USFimOC4sbJ1dp2TNhZfX3GwWJiloNvTtNp8nxTU=
Date:   Wed, 29 May 2019 15:11:53 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     James Morris <jmorris@namei.org>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] keys: Miscellany
Message-ID: <20190529221152.GD141639@gmail.com>
References: <18289.1559167295@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18289.1559167295@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 29, 2019 at 11:01:35PM +0100, David Howells wrote:
> 
>  (2) Implement a keyctl to allow a key to be moved from one keyring to
>      another, with the option of prohibiting key replacement in the
>      destination keyring.
> 

What is the use case, and where are the tests and documentation for this?

- Eric
