Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDFF2856EA
	for <lists+keyrings@lfdr.de>; Wed,  7 Oct 2020 05:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJGDPT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Oct 2020 23:15:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:12958 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbgJGDPT (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 6 Oct 2020 23:15:19 -0400
IronPort-SDR: qBcwhjKMg6pINyONftLkqkG9hWmVeBx1q9P1yTQBWA94NSTqaPxRYN2cV7BLBJW1Bj32MqCmAT
 iPfji4H9Ys8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="228942113"
X-IronPort-AV: E=Sophos;i="5.77,345,1596524400"; 
   d="scan'208";a="228942113"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 20:15:18 -0700
IronPort-SDR: z5WnzjaFn+K5ZOz8lGPBd/Wyp1GjDD06ljFykR1yiEuxeNWIK4pGjhlCrBDPQw7HMyVpNBc3Vd
 N0L0+citczMQ==
X-IronPort-AV: E=Sophos;i="5.77,345,1596524400"; 
   d="scan'208";a="527744838"
Received: from thijsmet-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.36])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 20:15:17 -0700
Date:   Wed, 7 Oct 2020 06:15:08 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     Anatol Pomozov <anatol.pomozov@gmail.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
Message-ID: <20201007031508.GB143690@linux.intel.com>
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
 <20201006155624.GC111447@linux.intel.com>
 <20201006155656.GD111447@linux.intel.com>
 <CAOMFOmWbxPZ4=XKPkX89DaGhGez94NZopexYUj7hA7rDXb9x0g@mail.gmail.com>
 <20201006233900.GA122646@linux.intel.com>
 <ca5aee11d71d825408a4bda71b5d5cfa879e8c18.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca5aee11d71d825408a4bda71b5d5cfa879e8c18.camel@linux.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 06, 2020 at 08:33:24PM -0400, Mimi Zohar wrote:
> On Wed, 2020-10-07 at 02:39 +0300, Jarkko Sakkinen wrote:
> > On Tue, Oct 06, 2020 at 10:18:43AM -0700, Anatol Pomozov wrote:
> > > Hi
> > > 
> > > On Tue, Oct 6, 2020 at 8:59 AM Jarkko Sakkinen
> > > <jarkko.sakkinen@linux.intel.com> wrote:
> > > >
> > > > On Tue, Oct 06, 2020 at 06:56:28PM +0300, Jarkko Sakkinen wrote:
> > > > > On Mon, Oct 05, 2020 at 03:52:58PM -0700, Anatol Pomozov wrote:
> > > > > > It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> > > > > > Adding algo name makes it easier to understand what cipher has failed.
> > > > > >
> > > > > > Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
> > > > >
> > > > > NAK, because you are missing David Howells from the CC list.
> > > >
> > > > Oh and also me. You are essentially missing all the keyring maintainers.
> > > 
> > > The MAINTAINERS file states following:
> > > 
> > > KEYS-ENCRYPTED
> > > M:      Mimi Zohar <zohar@linux.ibm.com>
> > > L:      linux-integrity@vger.kernel.org
> > > L:      keyrings@vger.kernel.org
> > > S:      Supported
> > > F:      Documentation/security/keys/trusted-encrypted.rst
> > > F:      include/keys/encrypted-type.h
> > > F:      security/keys/encrypted-keys/
> > > 
> > > Everything seems fine as I included the official maintainer and the
> > > project maillist.
> > > 
> > > If David is not subscribed to the project maillist I'll be glad to CC
> > > him as well.
> > 
> > Ugh, you are right then. Those two lists still confuse me thought
> > but that is not your fault.
> 
> Please refer to Documentation/security/keys/trusted-encrypted.rst for
> an explanation.

Yeah, I was not sure about the organization and just spotted keyrings
in the CC list :-)

> 
> > 
> > Based on that I can give my ack because the change looks right
> > still.
> > 
> > Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > 
> > Thanks for explaining the situation.
> 
> Thanks, Jarrko.  I'm on vacation, returning next week.

Have a good one!

> Mimi

/Jarkko
