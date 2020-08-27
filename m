Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA632545E4
	for <lists+keyrings@lfdr.de>; Thu, 27 Aug 2020 15:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgH0N2t (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Aug 2020 09:28:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:25468 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727950AbgH0N1e (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 27 Aug 2020 09:27:34 -0400
IronPort-SDR: EC8OmkCIwfxNKfw9D0RHo60DHh1GPwvg05GhC14E/KPgnzxqb7DrtkmP5u6yf51Kdq2VPbGzR9
 O2M97k6wxHqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="157502881"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; 
   d="scan'208";a="157502881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2020 06:26:37 -0700
IronPort-SDR: WhNojoZRv8BDAJxuDmNLU0S7hnXhFGcA+TWKJCg3tQUQ8QuNIkOiuByoTG2QBFlrvxPdcMctXf
 yuseHTrVRqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; 
   d="scan'208";a="282103688"
Received: from tbeaumon-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.55.254])
  by fmsmga008.fm.intel.com with ESMTP; 27 Aug 2020 06:26:35 -0700
Date:   Thu, 27 Aug 2020 16:26:34 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Denis Efremov <efremov@linux.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] security/keys: use kvfree_sensitive()
Message-ID: <20200827132634.GB4674@linux.intel.com>
References: <20200827072923.14718-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827072923.14718-1-efremov@linux.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Aug 27, 2020 at 10:29:23AM +0300, Denis Efremov wrote:
> Use kvfree_sensitive() instead of open-coding it.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
