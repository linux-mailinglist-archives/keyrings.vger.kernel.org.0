Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7944E1E7805
	for <lists+keyrings@lfdr.de>; Fri, 29 May 2020 10:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgE2IPc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 29 May 2020 04:15:32 -0400
Received: from mga04.intel.com ([192.55.52.120]:42130 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725681AbgE2IPc (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 29 May 2020 04:15:32 -0400
IronPort-SDR: 4Mzc8ns37+KNgMqxQqTNKy7GmYu35r5I9sOKD9OLV3oVt5bIgqfKEyW/XbIs9o2KjuAoz/c05u
 ldpDepyRkMBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 01:15:31 -0700
IronPort-SDR: p6cfHBspkAo7g9O8EQsFjZiqtgnNsC8Q37Xc0iH7Kz5M92p4RUk48J+JVnMcWEpaDPTEol3XQh
 uToX4ic9lI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="303061164"
Received: from pratuszn-mobl.ger.corp.intel.com (HELO localhost) ([10.252.58.65])
  by orsmga008.jf.intel.com with ESMTP; 29 May 2020 01:15:28 -0700
Date:   Fri, 29 May 2020 11:15:27 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
Message-ID: <20200529081527.GC1376838@linux.intel.com>
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
> During the test I discovered that not all access rights restrictions working
> correct. Examples:
> 
> Remove possessor write right:
> 
> $ KEYID=$(keyctl add user john smith @u)
> $ keyctl describe $KEYID
> 47831201: alswrv-----v------------  1000  1000 user: john
> $ keyctl print $KEYID
> smith
> $ keyctl update $KEYID dohn
> $ keyctl print $KEYID
> dohn
> $ keyctl setperm $KEYID 0x3b000000
> $ keyctl describe $KEYID
> 47831201: als-rv------------------  1000  1000 user: john
> $ keyctl update $KEYID dohn
> keyctl_update: Permission denied
> $ keyctl print $KEYID
> dohn
> 
> That OK. So, next
> Remove possessor set attributes right:
> 
> $ keyctl setperm $KEYID 0x1f000000
> $ keyctl describe $KEYID
> 47831201: -lswrv------------------  1000  1000 user: john
> $ keyctl setperm $KEYID 0x3f000000
> keyctl_update: Permission denied
> 
> That OK. So, next
> Remove possessor read right:
> 
> $ keyctl unlink $KEYID
> 1 links removed
> $ KEYID=$(keyctl add user john smith @u)
> $ keyctl describe $KEYID
> 5927639: alswrv-----v------------  1000  1000 user: john
> $ keyctl setperm $KEYID 0x3d000000
> $ keyctl describe $KEYID
> 5927639: alsw-v-----v------------  1000  1000 user: john
> $ keyctl print $KEYID
> smith
> 
> How's that? I removed the right to read, but the possessor continues
> to read it!
> 
> I opened the read function code and saw the following:
> 
> ```
>   /* see if we can read it directly */
>   ret = key_permission(key_ref, KEY_NEED_READ); /* OK, we returned error */
>                                                 /* read access */
>   if (ret == 0) /* skip that */
>     goto can_read_key;
>   if (ret != -EACCES) /* skip that */
>     goto key_put_out;
> 
>   /* we can't; see if it's searchable from this process's keyrings
>    * - we automatically take account of the fact that it may be
>    *   dangling off an instantiation key
>    */
>   if (!is_key_possessed(key_ref)) { /* If we possessor == can read */
>     ret = -EACCES;
>     goto key_put_out;
>   }
> 
>   /* the key is probably readable - now try to read it */
> can_read_key:
> ```
> Why can we read the key, if we don't have rights for doing this?
> 
> Alexey Krasikov (1):
>   security/keys: remove possessor verify after key permission check
> 
>  security/keys/keyctl.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> -- 
> 2.17.1
> 

Thank you for the legit examples and effort in general. Looking into
this with time on Monday. Today I have to get unfortunately SGX patch
set out.

/Jarkko
