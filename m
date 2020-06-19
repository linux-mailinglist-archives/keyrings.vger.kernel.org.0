Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255F7201BF0
	for <lists+keyrings@lfdr.de>; Fri, 19 Jun 2020 22:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389576AbgFSUEB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Jun 2020 16:04:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:55534 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389021AbgFSUEB (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 19 Jun 2020 16:04:01 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 888B02CD;
        Fri, 19 Jun 2020 20:04:00 +0000 (UTC)
Date:   Fri, 19 Jun 2020 14:03:59 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 03/22] docs: crypto: convert asymmetric-keys.txt to ReST
Message-ID: <20200619140359.47a45e6b@lwn.net>
In-Reply-To: <c2275ea94e0507a01b020ab66dfa824d8b1c2545.1592203650.git.mchehab+huawei@kernel.org>
References: <cover.1592203650.git.mchehab+huawei@kernel.org>
        <c2275ea94e0507a01b020ab66dfa824d8b1c2545.1592203650.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 15 Jun 2020 08:50:08 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This file is almost compatible with ReST. Just minor changes
> were needed:
> 
> - Adjust document and titles markups;
> - Adjust numbered list markups;
> - Add a comments markup for the Contents section;
> - Add markups for literal blocks.
> 
> Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied, thanks.

jon
