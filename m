Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5C626C4FF
	for <lists+keyrings@lfdr.de>; Wed, 16 Sep 2020 18:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgIPQS2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 16 Sep 2020 12:18:28 -0400
Received: from mga06.intel.com ([134.134.136.31]:8232 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgIPQRY (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 16 Sep 2020 12:17:24 -0400
IronPort-SDR: lDQtUxIFNjuogwTTrnwCLSMGnQ6wKRi6fPMKYDC/yfEJwO4g7e0b2yfYCm6jNCyI/MXB8L0LEh
 72SDh5bX8mXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="221058448"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="221058448"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 09:12:13 -0700
IronPort-SDR: 2vjGeqnxUxN7atVeLloPGSsd1S4TArm4bw6REZOyt7KtQJYUyTucIlnIWqoeBQxkOksVlh6aBQ
 kGb9t07g4M8A==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="451916049"
Received: from scusackx-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.45.87])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 09:12:10 -0700
Date:   Wed, 16 Sep 2020 19:12:08 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, jmorris@namei.org,
        serge@hallyn.com, nayna@linux.ibm.com, erichte@linux.ibm.com,
        mpe@ellerman.id.au, zohar@linux.ibm.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH v3] certs: Add EFI_CERT_X509_GUID support for dbx entries
Message-ID: <20200916161208.GE21026@linux.intel.com>
References: <20200911182230.62266-1-eric.snowberg@oracle.com>
 <20200914181227.GF9369@linux.intel.com>
 <F25F6F0E-7E13-4C9D-A7BA-33CDEF7074F2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F25F6F0E-7E13-4C9D-A7BA-33CDEF7074F2@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Sep 15, 2020 at 09:42:27AM -0600, Eric Snowberg wrote:
> 
> > On Sep 14, 2020, at 12:12 PM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> > 
> > On Fri, Sep 11, 2020 at 02:22:30PM -0400, Eric Snowberg wrote:
> >> The Secure Boot Forbidden Signature Database, dbx, contains a list of now
> >> revoked signatures and keys previously approved to boot with UEFI Secure
> >> Boot enabled.  The dbx is capable of containing any number of
> >> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
> >> entries.
> >> 
> >> Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
> >> skipped.
> >> 
> >> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> >> is found, it is added as an asymmetrical key to the .blacklist keyring.
> >> Anytime the .platform keyring is used, the keys in the .blacklist keyring
> >> are referenced, if a matching key is found, the key will be rejected.
> >> 
> >> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> >> ---
> >> v3:
> >> Fixed an issue when CONFIG_PKCS7_MESSAGE_PARSER is not builtin and defined
> >> as a module instead, pointed out by Randy Dunlap
> >> 
> >> v2: 
> >> Fixed build issue reported by kernel test robot <lkp@intel.com>
> >> Commit message update (suggested by Jarkko Sakkinen)
> >> ---
> >> certs/blacklist.c                             | 33 +++++++++++++++++++
> >> certs/blacklist.h                             | 12 +++++++
> >> certs/system_keyring.c                        |  6 ++++
> >> include/keys/system_keyring.h                 | 11 +++++++
> >> .../platform_certs/keyring_handler.c          | 11 +++++++
> >> 5 files changed, 73 insertions(+)
> >> 
> >> diff --git a/certs/blacklist.c b/certs/blacklist.c
> >> index 6514f9ebc943..3d1514ba5d47 100644
> >> --- a/certs/blacklist.c
> >> +++ b/certs/blacklist.c
> >> @@ -100,6 +100,39 @@ int mark_hash_blacklisted(const char *hash)
> >> 	return 0;
> >> }
> >> 
> >> +int mark_key_revocationlisted(const char *data, size_t size)
> >> +{
> >> +	key_ref_t key;
> >> +
> >> +	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
> >> +				   "asymmetric",
> >> +				   NULL,
> >> +				   data,
> >> +				   size,
> >> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
> >> +				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
> >> +
> >> +	if (IS_ERR(key)) {
> >> +		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
> >> +		return PTR_ERR(key);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +int is_key_revocationlisted(struct pkcs7_message *pkcs7)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = validate_trust(pkcs7, blacklist_keyring);
> >> +
> >> +	if (ret == 0)
> >> +		return -EKEYREJECTED;
> >> +
> >> +	return -ENOKEY;
> >> +}
> >> +EXPORT_SYMBOL_GPL(is_key_revocationlisted);
> > 
> > Hmm... ignore my previous comment about this. Export symbol is called
> > only by system keyring code.
> > 
> > Would be best if the commit message would explicitly reason new exports.
> 
> I don’t see a good reason to keep the export now, I’ll remove it from the
> next version.  Thanks.

OK, great, thanks.

Was somewhat puzzled with this for a while :-)

/Jarkko
