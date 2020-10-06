Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6369284F80
	for <lists+keyrings@lfdr.de>; Tue,  6 Oct 2020 18:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJFQJB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Oct 2020 12:09:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:42397 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgJFQJB (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 6 Oct 2020 12:09:01 -0400
IronPort-SDR: zQHbrwCH0MAbXAf0rJGR1WwFmIP3tGW3KnyZ3d9arHV+vnEqwUAhwR9ytziebt7I8ww511iIKr
 1D0ePPxQQkNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249258442"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="249258442"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 08:57:04 -0700
IronPort-SDR: iH0qFuhd0uEruyqakysDu7W6lYt25GGodG+49ITKlSVzmIEAfoyP6BGzR/H4TWgeg1jvH01MaR
 wjp2T2XNenxQ==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="297165412"
Received: from thijsmet-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.36])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 08:57:03 -0700
Date:   Tue, 6 Oct 2020 18:56:56 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Anatol Pomozov <anatol.pomozov@gmail.com>
Cc:     keyrings@vger.kernel.org, zohar@linux.ibm.com
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
Message-ID: <20201006155656.GD111447@linux.intel.com>
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
 <20201006155624.GC111447@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006155624.GC111447@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 06, 2020 at 06:56:28PM +0300, Jarkko Sakkinen wrote:
> On Mon, Oct 05, 2020 at 03:52:58PM -0700, Anatol Pomozov wrote:
> > It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> > Adding algo name makes it easier to understand what cipher has failed.
> > 
> > Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
> 
> NAK, because you are missing David Howells from the CC list.

Oh and also me. You are essentially missing all the keyring maintainers.

/Jarkko
