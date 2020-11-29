Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5AA2C774C
	for <lists+keyrings@lfdr.de>; Sun, 29 Nov 2020 03:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgK2CjV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 28 Nov 2020 21:39:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:33558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgK2CjV (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 28 Nov 2020 21:39:21 -0500
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30A7020771;
        Sun, 29 Nov 2020 02:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606617521;
        bh=qmNaiFJiaf3GXtWj9hIC5YPea6KbOy4BRr7xwGtuv+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PxjZ8nl/oWZxc1BoQGbsHQEbotsu5wJCvqdliBVV7jFtutx4KD/pE82TDKQFYpdNv
         fFDpub0EyuIlJcPkuQ+9NBBj1UHZTgbhFr2K6+ODtskQmUdMyZ3jKkhE0VHc2+/gkw
         B0oJN1fBhnbpPq1DZj6siTQdl++rqwkQMggIpwaQ=
Date:   Sun, 29 Nov 2020 04:38:36 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Gabriel Krisman Bertazi <krisman@collabora.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2] watch_queue: Drop references to /dev/watch_queue
Message-ID: <20201129023836.GA39488@kernel.org>
References: <20201124202802.645739-1-krisman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124202802.645739-1-krisman@collabora.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Nov 24, 2020 at 03:28:02PM -0500, Gabriel Krisman Bertazi wrote:
> The merged API doesn't use a watch_queue device, but instead relies on
> pipes, so let the documentation reflect that.
> 
> Fixes: f7e47677e39a ("watch_queue: Add a key/keyring notification facility")
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
