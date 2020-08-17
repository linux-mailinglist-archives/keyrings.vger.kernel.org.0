Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F222478A3
	for <lists+keyrings@lfdr.de>; Mon, 17 Aug 2020 23:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgHQVRk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 Aug 2020 17:17:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:19025 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727011AbgHQVRk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 17 Aug 2020 17:17:40 -0400
IronPort-SDR: +RavuZfZ8I/Rj6bayzO2MA9H9kxu23B4TaQ5NnYU8NMJOXAPJV4pN/1PGonKBGSx9XVO5qYOBE
 daY2pVCOMcDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239617353"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="239617353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 14:17:38 -0700
IronPort-SDR: vJT94DXIrSv5OKdEKRSqXjXi0pKEBwSVi7pexhPXoJSU6YWbpbQocecQA/FSquhDsv4Vm2wGss
 TKDV5JXgrXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="328752835"
Received: from bbartede-mobl.ger.corp.intel.com (HELO localhost) ([10.249.32.24])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2020 14:17:37 -0700
Date:   Tue, 18 Aug 2020 00:17:37 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Marcus =?iso-8859-1?Q?H=FCwe?= <suse-tux@gmx.de>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH] keys: Do not check the retval of commit_creds in
 join_session_keyring
Message-ID: <20200817211737.GC44714@linux.intel.com>
References: <c8ccba0bbcb9147fb220fd18b3b5e1e951b6d5fd.1591960478.git.suse-tux@gmx.de>
 <20200617014613.GA7215@linux.intel.com>
 <20200728110635.rlvzizbsrcddhzj2@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200728110635.rlvzizbsrcddhzj2@linux>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 28, 2020 at 01:06:35PM +0200, Marcus Hüwe wrote:
> On 2020-06-17 04:46:24 +0300, Jarkko Sakkinen wrote:
> > On Fri, Jun 12, 2020 at 01:25:33PM +0200, Marcus Huewe wrote:
> > > Do not check the return value of the commit_creds call in
> > > join_session_keyring in order to make the code more concise.
> > > Since commit_creds always returns 0, the if-statement is not needed
> > > and the session keyring's serial can be directly assigned to the
> > > "ret" variable.
> > >
> > > Signed-off-by: Marcus Huewe <suse-tux@gmx.de>
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >
> > David, can you pick this up to your tree (give that a generic
> > keyring change)?
> >
> Just a gentle ping - any news on this?:)
> 
> (I'm perfectly fine if you don't want to take it... (since it is
> just a minor cleanup and no bugfix))
> 
> 
> Marcus

I just came from two weeks of vacation and one week of network
connectivity issues (could not connect to the company VPN).

I still think that David should at least ack this.

/Jarkko
