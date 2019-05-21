Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD6F24D22
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2019 12:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfEUKr1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Tue, 21 May 2019 06:47:27 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42192 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfEUKr1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 May 2019 06:47:27 -0400
Received: from marcel-macpro.fritz.box (p5B3D2A37.dip0.t-ipconnect.de [91.61.42.55])
        by mail.holtmann.org (Postfix) with ESMTPSA id DA314CF16B;
        Tue, 21 May 2019 12:55:42 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190521100034.9651-1-omosnace@redhat.com>
Date:   Tue, 21 May 2019 12:47:23 +0200
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <A3BC3B07-6446-4631-862A-F661FB9D63B9@holtmann.org>
References: <20190521100034.9651-1-omosnace@redhat.com>
To:     Ondrej Mosnacek <omosnace@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ondrej,

> This patch adds new socket options to AF_ALG that allow setting key from
> kernel keyring. For simplicity, each keyring key type (logon, user,
> trusted, encrypted) has its own socket option name and the value is just
> the key description string that identifies the key to be used. The key
> description doesn't need to be NULL-terminated, but bytes after the
> first zero byte are ignored.

why use the description instead the actual key id? I wonder if a single socket option and a struct providing the key type and key id might be more useful.

Regards

Marcel

