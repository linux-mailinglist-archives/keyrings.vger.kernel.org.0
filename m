Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478C71FC3D9
	for <lists+keyrings@lfdr.de>; Wed, 17 Jun 2020 03:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFQBq1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 16 Jun 2020 21:46:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:23008 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgFQBq1 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 16 Jun 2020 21:46:27 -0400
IronPort-SDR: 0fmuk/f5xjGasS0marsZ7dMw3GWB3WdIDPbZaQ3AGAGLazc4gtJ4ZLf3aUXFYDwe7eZwb0QTCC
 0+UsouvJBo8Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 18:46:27 -0700
IronPort-SDR: GDrJj4KkVPJaRt8ISXC9aY2mmRD09Eq9pPPSkj+MTZ06OkQZUPkmvEmIdqjCtrhTRKefrniaQh
 XAZafP0k2ZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; 
   d="scan'208";a="308642927"
Received: from vchernon-mobl1.ccr.corp.intel.com (HELO localhost) ([10.252.50.149])
  by orsmga008.jf.intel.com with ESMTP; 16 Jun 2020 18:46:25 -0700
Date:   Wed, 17 Jun 2020 04:46:24 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Marcus Huewe <suse-tux@gmx.de>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH] keys: Do not check the retval of commit_creds in
 join_session_keyring
Message-ID: <20200617014613.GA7215@linux.intel.com>
References: <c8ccba0bbcb9147fb220fd18b3b5e1e951b6d5fd.1591960478.git.suse-tux@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ccba0bbcb9147fb220fd18b3b5e1e951b6d5fd.1591960478.git.suse-tux@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jun 12, 2020 at 01:25:33PM +0200, Marcus Huewe wrote:
> Do not check the return value of the commit_creds call in
> join_session_keyring in order to make the code more concise.
> Since commit_creds always returns 0, the if-statement is not needed
> and the session keyring's serial can be directly assigned to the
> "ret" variable.
> 
> Signed-off-by: Marcus Huewe <suse-tux@gmx.de>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

David, can you pick this up to your tree (give that a generic
keyring change)?

/Jarkko
