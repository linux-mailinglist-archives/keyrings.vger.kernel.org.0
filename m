Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693621D2DBA
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 13:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgENLAS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 07:00:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:3191 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgENLAS (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 14 May 2020 07:00:18 -0400
IronPort-SDR: 7zE17mieHWjU8HMaKv7DYZAAdsh6wqKN+NG98zu2j1IhG2vws4dyfrlUlfEuSc3ZR1Lnba+BOj
 avoLbm4G1yGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 04:00:18 -0700
IronPort-SDR: +hjyVdlN/1wv/Xi+U2sxAq4ZTMYwlT0QzVkU+LLuYg4r5MEGzhAP7TfGAceLDIWol6y92b3p5S
 XyNV5Afk68Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="280819242"
Received: from apogrebi-mobl2.ger.corp.intel.com ([10.249.39.119])
  by orsmga002.jf.intel.com with ESMTP; 14 May 2020 04:00:14 -0700
Message-ID: <3efc41d3ba70d253e30187485459a724a36bb5a9.camel@linux.intel.com>
Subject: Re: [PATCH] keys: Make the KEY_NEED_* perms an enum rather than a
 mask
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     David Howells <dhowells@redhat.com>, stephen.smalley.work@gmail.com
Cc:     Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 14 May 2020 14:00:14 +0300
In-Reply-To: <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
         <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2020-05-12 at 23:33 +0100, David Howells wrote:
> Since the meaning of combining the KEY_NEED_* constants is undefined, make
> it so that you can't do that by turning them into an enum.
> 
> The enum is also given some extra values to represent special
> circumstances, such as:
> 
>  (1) The '0' value is reserved and causes a warning to trap the parameter
>      being unset.
> 
>  (2) The key is to be unlinked and we require no permissions on it, only
>      the keyring, (this replaces the KEY_LOOKUP_FOR_UNLINK flag).
> 
>  (3) An override due to CAP_SYS_ADMIN.
> 
>  (4) An override due to an instantiation token being present.
> 
>  (5) The permissions check is being deferred to later key_permission()
>      calls.
> 
> The extra values give the opportunity for LSMs to audit these situations.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> cc: Paul Moore <paul@paul-moore.com>
> cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> cc: Casey Schaufler <casey@schaufler-ca.com>
> cc: keyrings@vger.kernel.org
> cc: selinux@vger.kernel.org

So extensive comments already from Stephen and Paul that I'll just
wait for the next version (agree with the idea though).

/Jarkko

