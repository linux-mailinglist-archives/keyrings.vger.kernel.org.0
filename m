Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDB1284F6A
	for <lists+keyrings@lfdr.de>; Tue,  6 Oct 2020 18:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgJFQDo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Oct 2020 12:03:44 -0400
Received: from mga11.intel.com ([192.55.52.93]:56614 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgJFQDo (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 6 Oct 2020 12:03:44 -0400
IronPort-SDR: qzMsK01rPLt1gljEIZEJXOEh2xTWdmZ+gKSrHcFf1qRWaEJR5Ho8I7Mxhseh0iH++SjaWdSZ/x
 PQr7X4vcxuCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161159694"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="161159694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 08:56:32 -0700
IronPort-SDR: 5BREPk5AuB3BlyL1ZxCEOftwzp1xeOW0rEdq/FvZD8qjNHxtfe13ZDAqOr0Q9yFkPQJLzz+ppV
 +Yu0nrqwhQbQ==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="527415083"
Received: from thijsmet-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.36])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 08:56:31 -0700
Date:   Tue, 6 Oct 2020 18:56:24 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Anatol Pomozov <anatol.pomozov@gmail.com>
Cc:     keyrings@vger.kernel.org, zohar@linux.ibm.com
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
Message-ID: <20201006155624.GC111447@linux.intel.com>
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005225258.200181-1-anatol.pomozov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Oct 05, 2020 at 03:52:58PM -0700, Anatol Pomozov wrote:
> It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> Adding algo name makes it easier to understand what cipher has failed.
> 
> Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>

NAK, because you are missing David Howells from the CC list.

/Jarkko
