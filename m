Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9121FC3FC
	for <lists+keyrings@lfdr.de>; Wed, 17 Jun 2020 04:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgFQCI0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 16 Jun 2020 22:08:26 -0400
Received: from mga11.intel.com ([192.55.52.93]:58926 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgFQCI0 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 16 Jun 2020 22:08:26 -0400
IronPort-SDR: VTz8LHhMwF+aoLaRAW0kVxluKndXL/gXDImjuJJtEMnyl5i+/mXBMDOxJ8oKNOFp3sTve2TyiG
 ZepPPC9K3Egw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 19:08:25 -0700
IronPort-SDR: VcFY5J6iZundJ9mS0cEP2C3HJq6cSvr1bLr79QEKN/SWBoJxBkD83eBjof+rTLFZ2pAzi7D70t
 Rbxc+Nth5f5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; 
   d="scan'208";a="261597074"
Received: from vchernon-mobl1.ccr.corp.intel.com (HELO localhost) ([10.252.50.149])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2020 19:08:21 -0700
Date:   Wed, 17 Jun 2020 05:08:20 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Frank Werner-Krippendorf <mail@hb9fxq.ch>
Cc:     David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dh key: Missing a blank line after declarations
Message-ID: <20200617020820.GB7215@linux.intel.com>
References: <20200612203458.13517-1-mail@hb9fxq.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612203458.13517-1-mail@hb9fxq.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jun 12, 2020 at 10:34:58PM +0200, Frank Werner-Krippendorf wrote:
> This patch fixes a "WARNING: Missing a blank line after declarations" issue found by checkpatch.pl
> 
> Signed-off-by: Frank Werner-Krippendorf <mail@hb9fxq.ch>

Umh for which patch?

/Jarkko
