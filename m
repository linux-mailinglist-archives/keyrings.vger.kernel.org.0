Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB65727F466
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 23:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730998AbgI3Vtz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 17:49:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:62005 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729912AbgI3Vtz (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 30 Sep 2020 17:49:55 -0400
IronPort-SDR: n303Xxdnm4Vry6qFno62hJzzyuO/XNMwGBTKxnb/xXkk44pbNmmJJ2EdI4onZi+EPBPp8wYr46
 2MiOC97q+gNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="150207784"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="150207784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 14:49:50 -0700
IronPort-SDR: cHbLJX7YNzrydKgEumUKRaDaCeTl3zHYQ/hKgkrwsVqNdfRUbKPDK/e17LRwfxPtWKmwWmq25p
 yBI/q2qig/4w==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="499650551"
Received: from mmarder-mobl.ger.corp.intel.com (HELO localhost) ([10.252.50.231])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 14:49:47 -0700
Date:   Thu, 1 Oct 2020 00:49:44 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] certs: Move load_system_certificate_list to a common
 function
Message-ID: <20200930214944.GA67803@linux.intel.com>
References: <20200930201508.35113-1-eric.snowberg@oracle.com>
 <20200930201508.35113-2-eric.snowberg@oracle.com>
 <20200930210254.GB65339@linux.intel.com>
 <9E194595-5A19-42F8-9657-7FB36DE59F16@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9E194595-5A19-42F8-9657-7FB36DE59F16@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 30, 2020 at 03:15:10PM -0600, Eric Snowberg wrote:
> 
> > On Sep 30, 2020, at 3:02 PM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> > 
> > On Wed, Sep 30, 2020 at 04:15:07PM -0400, Eric Snowberg wrote:
> >> Move functionality within load_system_certificate_list to a common
> >> function, so it can be reused in the future.
> >> 
> >> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> > 
> > I rather think now rather than the future. I think this should be part
> > of a patch set where the re-use actually happens.
> 
> load_certificate_list is being used in the second patch in the series [1].
> It uses the now common code, to load the revocation certificates, just like
> the system certificates are being loaded in this patch.

Ugh, better to get some sleep. Double checked 2/2 and ack still holds.
Sorry about this.

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
