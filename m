Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F5C269457
	for <lists+keyrings@lfdr.de>; Mon, 14 Sep 2020 20:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgINSF0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Sep 2020 14:05:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:36714 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbgINSFZ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 14 Sep 2020 14:05:25 -0400
IronPort-SDR: DZ85E3HONqaWybxfsFhe1xm5uLWaRWGgcFe2FACthqL9U4glNacopZ5wgml63T9gjnFpb+KqM2
 WMHB6aHFPAtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223315675"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="223315675"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 11:05:20 -0700
IronPort-SDR: ITGKirPXRtC4MiTsUGWfq/qZkKTcPmNColBPFib9Mc/8RuAbTEjc0Mu18/Oc+Hz3Z0jxEFZ0Nu
 DRCFBaaZ8tow==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="330842744"
Received: from mgorski-mobl.ger.corp.intel.com (HELO localhost) ([10.249.43.120])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 11:05:15 -0700
Date:   Mon, 14 Sep 2020 21:05:10 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Denis Efremov <efremov@linux.com>,
        David Howells <dhowells@redhat.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] security: keys: Use kvfree_sensitive in a few places
Message-ID: <20200914180510.GC9369@linux.intel.com>
References: <20200911114400.82207-1-alex.dewar90@gmail.com>
 <f97076d2-de8a-4600-ee81-4cf4fcdc3ec1@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f97076d2-de8a-4600-ee81-4cf4fcdc3ec1@linux.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Sep 11, 2020 at 07:05:16PM +0300, Denis Efremov wrote:
> Hi,
> 
> same patch
> 
> https://lkml.org/lkml/2020/8/27/168
> 
> Thanks,
> Denis

David, can you pick this up?

/Jarkko
