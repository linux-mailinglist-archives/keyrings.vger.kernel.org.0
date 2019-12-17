Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DA8125283
	for <lists+keyrings@lfdr.de>; Wed, 18 Dec 2019 21:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfLRUAi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Dec 2019 15:00:38 -0500
Received: from mga02.intel.com ([134.134.136.20]:47580 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbfLRUAi (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Dec 2019 15:00:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 12:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="248005702"
Received: from jtreacy-mobl1.ger.corp.intel.com ([10.251.82.127])
  by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2019 12:00:30 -0800
Message-ID: <10be346c204016547fee0323cbf2ab4688dd2859.camel@linux.intel.com>
Subject: Re: [PATCH] KEYS: trusted: fix type warnings in ntohl/nthos
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20191217110939.2067979-1-ben.dooks@codethink.co.uk>
References: <20191217110939.2067979-1-ben.dooks@codethink.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160
 Espoo
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Tue, 17 Dec 2019 16:35:58 +0200
User-Agent: Evolution 3.34.1-2 
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2019-12-17 at 11:09 +0000, Ben Dooks (Codethink) wrote:
> The ntohl takes a __be32 and ntohs takes __be16, so cast to
> those types before passing it to the byte swapping functions.

Thanks!

> Note, would be32_to_cpu and be16_to_cpu be better here?

Yes, I think that should work too.

/Jarkko

