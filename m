Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB72127F3A9
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 22:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgI3U4r (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 16:56:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:23369 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI3U4r (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 30 Sep 2020 16:56:47 -0400
IronPort-SDR: AJl9ciYXw0qOSSmN0V0F308+LwT2qcbP5eZ6nDHJAXd/JlAQ7GBMrjJ/AXPD3ccLRG9SM7K4iL
 KtTGBqKq4XtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="150330719"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="150330719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 13:56:36 -0700
IronPort-SDR: NvHGGDOzZoP91MVYUOUobGsMZj1qT7PVfHbGfh4LD92FMd0LIPFhQFtiomI3NKWS1J8Wzry1r0
 cF157TIG2B2A==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="457805822"
Received: from petrescv-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.36.73])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 13:56:33 -0700
Date:   Wed, 30 Sep 2020 23:56:31 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] certs: Add ability to preload revocation certs
Message-ID: <20200930205631.GA65339@linux.intel.com>
References: <20200930201508.35113-1-eric.snowberg@oracle.com>
 <20200930201508.35113-3-eric.snowberg@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930201508.35113-3-eric.snowberg@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 30, 2020 at 04:15:08PM -0400, Eric Snowberg wrote:
> Add a new Kconfig option called SYSTEM_REVOCATION_KEYS. If set,
> this option should be the filename of a PEM-formated file containing
> X.509 certificates to be included in the default blacklist keyring.
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
