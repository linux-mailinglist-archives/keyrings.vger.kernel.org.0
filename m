Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D908C14D7DF
	for <lists+keyrings@lfdr.de>; Thu, 30 Jan 2020 09:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgA3Im0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 Jan 2020 03:42:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:27439 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726865AbgA3Im0 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 Jan 2020 03:42:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jan 2020 00:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,381,1574150400"; 
   d="scan'208";a="232838482"
Received: from kvehmane-mobl.ger.corp.intel.com (HELO jsakkine-mobl1) ([10.237.50.119])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2020 00:42:22 -0800
Message-ID: <0683e4921abc42f94800b3a91490a39bbb7d4cb1.camel@linux.intel.com>
Subject: Re: [PATCH 1/1] proc_keys_next should increase position index
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>,
        Vasily Averin <vvs@virtuozzo.com>
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Date:   Thu, 30 Jan 2020 10:42:21 +0200
In-Reply-To: <1451508.1580125174@warthog.procyon.org.uk>
References: <af9dcaa7-6e4f-281a-2bae-fb605cc55d2d@virtuozzo.com>
         <1451508.1580125174@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-01-27 at 11:39 +0000, David Howells wrote:
> I don't see the effect you're talking about with /proc/keys.  I see the
> following:
> 
> 	[root@andromeda ~]# dd if=/proc/keys bs=40 skip=1
> 	dd: /proc/keys: cannot skip to specified offset
> 
> and then it follows up with the normal content with no obvious duplicates (the
> lines are numbered ascendingly in the first column).
> 
> I think I may be being confused by what you mean by "the last line".
> 
> David


The commit message is completely lacking cause and effect. For
similar TPM commit I gave the following remarks:

https://patchwork.kernel.org/patch/11346943/

/Jarkko

