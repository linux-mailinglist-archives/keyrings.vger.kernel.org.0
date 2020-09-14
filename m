Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DBE26944C
	for <lists+keyrings@lfdr.de>; Mon, 14 Sep 2020 20:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgINSDK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Sep 2020 14:03:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:18033 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgINSCx (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 14 Sep 2020 14:02:53 -0400
IronPort-SDR: wCt4aihyJyDXkIu0yXviar0sZEmDJHSsMWxM5F5H8WCZT7/22t2PP9uQ1mk2Xn+3TbGl41wif4
 m+g/PrqJ0RiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146871632"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="146871632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 11:02:49 -0700
IronPort-SDR: weGdycT837iMKjq92vbU6fhtgMdmxLyQhGZDZU4y2sMklAB0Ljdccsw20TsI3ClC6pR+IT5dLL
 9etEcGO1bwSA==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="450979687"
Received: from mgorski-mobl.ger.corp.intel.com (HELO localhost) ([10.249.43.120])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 11:02:44 -0700
Date:   Mon, 14 Sep 2020 21:02:38 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        zohar@linux.ibm.com, erichte@linux.ibm.com, mpe@ellerman.id.au,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2] certs: Add EFI_CERT_X509_GUID support for dbx entries
Message-ID: <20200914180238.GB9369@linux.intel.com>
References: <20200909172736.73003-1-eric.snowberg@oracle.com>
 <20200914180127.GA9369@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914180127.GA9369@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Sep 14, 2020 at 09:01:34PM +0300, Jarkko Sakkinen wrote:
> On Wed, Sep 09, 2020 at 01:27:36PM -0400, Eric Snowberg wrote:
> > The Secure Boot Forbidden Signature Database, dbx, contains a list of now
> > revoked signatures and keys previously approved to boot with UEFI Secure
> > Boot enabled.  The dbx is capable of containing any number of
> > EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
> > entries.
> > 
> > Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
> > skipped.
> > 
> > Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> > is found, it is added as an asymmetrical key to the .blacklist keyring.
> > Anytime the .platform keyring is used, the keys in the .blacklist keyring
> > are referenced, if a matching key is found, the key will be rejected.
> > 
> > Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> > ---
> > 
> > v2: 
> >  Fixed build issue reported by kernel test robot <lkp@intel.com>
> >  Commit message update (suggested by Jarkko Sakkinen)
> > 
> > ---
> >  certs/blacklist.c                             | 36 +++++++++++++++++++
> >  certs/system_keyring.c                        |  6 ++++
> >  include/crypto/pkcs7.h                        |  8 +++++
> >  include/keys/system_keyring.h                 | 11 ++++++
> >  .../platform_certs/keyring_handler.c          | 11 ++++++
> >  5 files changed, 72 insertions(+)
> > 
> > diff --git a/certs/blacklist.c b/certs/blacklist.c
> > index 6514f9ebc943..17ebf50cf0ae 100644
> > --- a/certs/blacklist.c
> > +++ b/certs/blacklist.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/err.h>
> >  #include <linux/seq_file.h>
> >  #include <keys/system_keyring.h>
> > +#include <crypto/pkcs7.h>
> >  #include "blacklist.h"
> >  
> >  static struct key *blacklist_keyring;
> > @@ -100,6 +101,41 @@ int mark_hash_blacklisted(const char *hash)
> >  	return 0;
> >  }
> >  
> > +int mark_key_revocationlisted(const char *data, size_t size)
> > +{
> > +	key_ref_t key;
> > +
> > +	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
> > +				   "asymmetric",
> > +				   NULL,
> > +				   data,
> > +				   size,
> > +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
> > +				    KEY_USR_VIEW),
> > +				   KEY_ALLOC_NOT_IN_QUOTA |
> > +				   KEY_ALLOC_BUILT_IN);
> > +
> > +	if (IS_ERR(key)) {
> > +		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
> > +		return PTR_ERR(key);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int is_key_revocationlisted(struct pkcs7_message *pkcs7)
> > +{
> > +	int ret;
> > +
> > +	ret = pkcs7_validate_trust(pkcs7, blacklist_keyring);
> > +
> > +	if (ret == 0)
> > +		return -EKEYREJECTED;
> > +
> > +	return -ENOKEY;
> > +}
> > +EXPORT_SYMBOL_GPL(is_key_revocationlisted);
> 
> What required this callable from a module?

Right, nees to be exported for pkcs7.


/Jarkko
