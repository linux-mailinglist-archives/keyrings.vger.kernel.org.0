Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323F62854FC
	for <lists+keyrings@lfdr.de>; Wed,  7 Oct 2020 01:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgJFXjL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Oct 2020 19:39:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:6754 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgJFXjL (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 6 Oct 2020 19:39:11 -0400
IronPort-SDR: D1JgBTfSD8ExbHrR92sa/DGf1zAs6zjjCUG3MiEkDBP39OUmCaA1juH2ljuD6ezhoc19U4YmON
 XehoDuDHiJPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="144655563"
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; 
   d="scan'208";a="144655563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 16:39:10 -0700
IronPort-SDR: 8x8AHzPnvY5k9hP/POV2oQOfYxeKeAZgczw8GDHx5xUkjFun6xUmGTlGl090ft/VBRTnDBN2s0
 gj16Jv0dDU1g==
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; 
   d="scan'208";a="527666737"
Received: from thijsmet-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.36])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 16:39:09 -0700
Date:   Wed, 7 Oct 2020 02:39:00 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Anatol Pomozov <anatol.pomozov@gmail.com>
Cc:     keyrings@vger.kernel.org, zohar@linux.ibm.com
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
Message-ID: <20201006233900.GA122646@linux.intel.com>
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
 <20201006155624.GC111447@linux.intel.com>
 <20201006155656.GD111447@linux.intel.com>
 <CAOMFOmWbxPZ4=XKPkX89DaGhGez94NZopexYUj7hA7rDXb9x0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMFOmWbxPZ4=XKPkX89DaGhGez94NZopexYUj7hA7rDXb9x0g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 06, 2020 at 10:18:43AM -0700, Anatol Pomozov wrote:
> Hi
> 
> On Tue, Oct 6, 2020 at 8:59 AM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > On Tue, Oct 06, 2020 at 06:56:28PM +0300, Jarkko Sakkinen wrote:
> > > On Mon, Oct 05, 2020 at 03:52:58PM -0700, Anatol Pomozov wrote:
> > > > It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> > > > Adding algo name makes it easier to understand what cipher has failed.
> > > >
> > > > Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
> > >
> > > NAK, because you are missing David Howells from the CC list.
> >
> > Oh and also me. You are essentially missing all the keyring maintainers.
> 
> The MAINTAINERS file states following:
> 
> KEYS-ENCRYPTED
> M:      Mimi Zohar <zohar@linux.ibm.com>
> L:      linux-integrity@vger.kernel.org
> L:      keyrings@vger.kernel.org
> S:      Supported
> F:      Documentation/security/keys/trusted-encrypted.rst
> F:      include/keys/encrypted-type.h
> F:      security/keys/encrypted-keys/
> 
> Everything seems fine as I included the official maintainer and the
> project maillist.
> 
> If David is not subscribed to the project maillist I'll be glad to CC
> him as well.

Ugh, you are right then. Those two lists still confuse me thought
but that is not your fault.

Based on that I can give my ack because the change looks right
still.

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Thanks for explaining the situation.

/Jarkko
