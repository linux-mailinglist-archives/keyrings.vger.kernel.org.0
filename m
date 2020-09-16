Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F4F26C6E7
	for <lists+keyrings@lfdr.de>; Wed, 16 Sep 2020 20:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgIPSJs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 16 Sep 2020 14:09:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:12675 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727789AbgIPSJ1 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 16 Sep 2020 14:09:27 -0400
IronPort-SDR: RK2LhpBUQ4k9/QnPeyOfkvhKPoTzvUvn47D+OXMWlEd24lVwmsueadaMCzgJ2GudD/1XKFsQdx
 qX0GoOBd0gRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="156944438"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="156944438"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 11:09:18 -0700
IronPort-SDR: c2YZaBfwpgZg0IVWD0z4A32XdPWZkRYKKQ+iJXz1rQh07lGfQ3w0KAyYXU00i8ZDUN/ekyqVN7
 +73tVOwYNbhQ==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="483411840"
Received: from scusackx-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.45.87])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 11:09:11 -0700
Date:   Wed, 16 Sep 2020 21:09:08 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        zohar@linux.ibm.com, erichte@linux.ibm.com, mpe@ellerman.id.au,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
Message-ID: <20200916180908.GG21026@linux.intel.com>
References: <20200916004927.64276-1-eric.snowberg@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916004927.64276-1-eric.snowberg@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Sep 15, 2020 at 08:49:27PM -0400, Eric Snowberg wrote:
> The Secure Boot Forbidden Signature Database, dbx, contains a list of now
> revoked signatures and keys previously approved to boot with UEFI Secure
> Boot enabled.  The dbx is capable of containing any number of
> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
> entries.
> 
> Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
> skipped.
> 
> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> is found, it is added as an asymmetrical key to the .blacklist keyring.
> Anytime the .platform keyring is used, the keys in the .blacklist keyring
> are referenced, if a matching key is found, the key will be rejected.
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>

Looks good to me.

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
