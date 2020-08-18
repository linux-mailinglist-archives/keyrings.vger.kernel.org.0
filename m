Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02A5247E23
	for <lists+keyrings@lfdr.de>; Tue, 18 Aug 2020 07:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgHRF5D (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Aug 2020 01:57:03 -0400
Received: from mga14.intel.com ([192.55.52.115]:44279 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgHRF5D (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 18 Aug 2020 01:57:03 -0400
IronPort-SDR: P+kOeseBJm61yzIFCQCLGhIts+1Gjy3dipJvllUtpP+CowesAB2AE+G5DRbr5OguagZ6+cBTwY
 0FqJE9ngVZ7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154105173"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="154105173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 22:57:02 -0700
IronPort-SDR: Obq0ZTdNAJkDF1PADiyS10oiG8O4ynqq8CB1dWOBRg7xZcIPJxTqVUiZ8O8hViOzLK7APXDnus
 o/zBFvLQEWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="400403245"
Received: from camposfi-mobl2.ger.corp.intel.com (HELO localhost) ([10.249.46.220])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2020 22:57:01 -0700
Date:   Tue, 18 Aug 2020 08:57:00 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        keyrings@vger.kernel.org, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] security: keys: delete repeated words in comments
Message-ID: <20200818055700.GB120477@linux.intel.com>
References: <20200807165123.3863-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807165123.3863-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Aug 07, 2020 at 09:51:23AM -0700, Randy Dunlap wrote:
> Drop repeated words in comments.
> {to, will, the}
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Cc: keyrings@vger.kernel.org
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-security-module@vger.kernel.org

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
