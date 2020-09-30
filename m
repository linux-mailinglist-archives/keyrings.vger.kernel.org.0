Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26D127F3DA
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 23:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbgI3VDH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 17:03:07 -0400
Received: from mga05.intel.com ([192.55.52.43]:26967 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgI3VDG (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 30 Sep 2020 17:03:06 -0400
IronPort-SDR: gpZfa7Li0yszQ6Dp3jWziuUDFdtPfN/IvVCB9USYhzxQZ8+GyrHODOVCAky21MHm2g+liCoYFD
 4jEXv2KLmUDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="247272683"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="247272683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 14:03:00 -0700
IronPort-SDR: 0tZi68ijnfAiPNlW9SBRoXE1KpvZuFTA5JcfImH9wAyTYuLs4dsdY3w3mNz/f13cyCQe/T3KFU
 ApvFIwuXZOIg==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="499461510"
Received: from petrescv-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.36.73])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 14:02:57 -0700
Date:   Thu, 1 Oct 2020 00:02:54 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] certs: Move load_system_certificate_list to a common
 function
Message-ID: <20200930210254.GB65339@linux.intel.com>
References: <20200930201508.35113-1-eric.snowberg@oracle.com>
 <20200930201508.35113-2-eric.snowberg@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201508.35113-2-eric.snowberg@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 30, 2020 at 04:15:07PM -0400, Eric Snowberg wrote:
> Move functionality within load_system_certificate_list to a common
> function, so it can be reused in the future.
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>

I rather think now rather than the future. I think this should be part
of a patch set where the re-use actually happens.

Without that context, I rather not say anything about this patch.
Neither an issue for me if it gets applied. This is just a guideline
that I follow (in order to manage this chaos).

Looking at the code change, I do not see anything strikingly wrong in
it.

/Jarkko
