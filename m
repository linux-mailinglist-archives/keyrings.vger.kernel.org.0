Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311551A8B01
	for <lists+keyrings@lfdr.de>; Tue, 14 Apr 2020 21:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504931AbgDNThF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Apr 2020 15:37:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:16021 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504927AbgDNTgd (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 14 Apr 2020 15:36:33 -0400
IronPort-SDR: Xf7AasBR+Cwuoo1RHt2J73WfnccFppoxdF0pbHReZB/PMQ4aHBMyHWChGEysFNYJDoge2TmjtW
 q3z6nTiLWa1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 12:36:32 -0700
IronPort-SDR: RbgOpGKFVsGo3SiHoop5kYgJ/h73AEjE9vehfiM+6jBMBkeExRIuMoSfFVrKsxwCmxkOSJ5Jde
 3lJIdp/ifEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; 
   d="scan'208";a="253292064"
Received: from jclobus-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.42.176])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 12:36:31 -0700
Date:   Tue, 14 Apr 2020 22:36:30 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     vvs@virtuozzo.com, keyrings@vger.kernel.org
Subject: Re: [PATCH] keys: Fix proc_keys_next to increase position index
Message-ID: <20200414193630.GC13000@linux.intel.com>
References: <3881684.1586876468@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3881684.1586876468@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 14, 2020 at 04:01:08PM +0100, David Howells wrote:
> Hi Jarkko,
> 
> I'm planning on passing this on to Linus if you're okay with it.  Note that
> I've altered the subject and the body slightly.

Absolutely fine.

/Jarkko
