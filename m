Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634082F599B
	for <lists+keyrings@lfdr.de>; Thu, 14 Jan 2021 04:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbhANDu6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 22:50:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:59038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbhANDu6 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 13 Jan 2021 22:50:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3E432389E;
        Thu, 14 Jan 2021 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610596218;
        bh=RVokMZWq9rRs3WD8NYZX1AGE4s6tHutTCt7qQgO1RHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s65vU7TfUgrTKsxVc+7hi03efTRmB+Hw/v3WiIu+DwZ6+UWZ3FfBFP5buVjKlTDWa
         +JhR6ynKE/N5jHPim98LPecmYpR7WOTkqrR4mcrrBFWhJtxsBXlsrdUGUNS1Li4vpa
         thbJ/1Oy1N6xasQbGSpfTpGvQEMIN9lx2Y0uy/vHUv3ulD6XlWc/SIh25LGGpEh+Oy
         ew10aBqMaKVMFJogiVwMKNbMCsOkrYWopafNWFFVMEVCNV/aX/Evd+DWuHcsbIcksF
         IhRDdVwpps2xb1Q+jdYScKCG0qQ25yA/ViDlsl12owk7rUT2+R/H1CBDgzuQDNJAO3
         fZES2o7rOw0Xg==
Date:   Thu, 14 Jan 2021 05:50:13 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Rolf Eike Beer <eb@emlix.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Message-ID: <X/+/dewAopgwFTeN@kernel.org>
References: <20538915.Wj2CyUsUYa@devpool35>
 <2278760.8Yd83Mgoko@devpool35>
 <3394639.6NgGvCfkNl@devpool47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3394639.6NgGvCfkNl@devpool47>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 13, 2021 at 01:49:12PM +0100, Rolf Eike Beer wrote:
> Otherwise build fails if the headers are not in the default location. While at
> it also ask pkg-config for the libs, with fallback to the existing value.
> 
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> Cc: stable@vger.kernel.org # 5.6.x

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
