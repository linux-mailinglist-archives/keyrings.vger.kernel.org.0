Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E0A1EA86E
	for <lists+keyrings@lfdr.de>; Mon,  1 Jun 2020 19:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgFARek (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 1 Jun 2020 13:34:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:40073 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgFARek (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 1 Jun 2020 13:34:40 -0400
IronPort-SDR: OvX1UYMQULGf4Pl7jjKItCWGZt2dPnEOjjsdLJvqA2eni8E0ErcwT61kUzEIyw/ARjjVahYqNU
 c7VvnO8n02Uw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 10:34:29 -0700
IronPort-SDR: TYk/35/PRWwA4Skt/HzFdCABaiT0jTttD1sMkKTNjT6l6Eyd8GHec3iR34HgevZJ25G0tsRnQ3
 rreY33eEwueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,461,1583222400"; 
   d="scan'208";a="470360695"
Received: from pkruczkx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.59.227])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2020 10:34:28 -0700
Date:   Mon, 1 Jun 2020 20:34:27 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
Message-ID: <20200601173427.GA26455@linux.intel.com>
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
> $ KEYID=$(keyctl add user john smith @u)
> $ keyctl describe $KEYID
> 5927639: alswrv-----v------------  1000  1000 user: john
> $ keyctl setperm $KEYID 0x3d000000
> $ keyctl describe $KEYID
> 5927639: alsw-v-----v------------  1000  1000 user: john
> $ keyctl print $KEYID
> smith

A keyring default permissions are 0x3f3f0000.
A key default permissions are 0x3f010000.

Because of this:

$ KEYID=$(keyctl add user john smith @u)
$ keyctl setperm $KEYID 0x3d000000
keyctl_setperm: Permission denied

Are you sure that your example is correct?

/Jarkko
