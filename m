Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15AF32B302
	for <lists+keyrings@lfdr.de>; Wed,  3 Mar 2021 04:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhCCB0r (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 2 Mar 2021 20:26:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:38674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1578525AbhCBPYn (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 2 Mar 2021 10:24:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECFEE64F2F;
        Tue,  2 Mar 2021 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614698642;
        bh=IrNN0AID3YGfmGdzydEWNqVZIr3VxKBZ4AD1PLT3A54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s9alLJsicIDJdy9j3gC3rcF92phcwBEE0otKMBxcTzov/+uV+UUdUAUC/rHGWL3el
         BLkYQdW2zLBep7Ck9vg456yF8Epr7GhUUcc4CRPMcJGKdCv2ifTTMbsoTIMXRQ+Flj
         FXmydfQo+FrIWuLrVKHQxIsLTZS4cnqz6kCnasmGh0OcynAZYQq3VAJVK9LQwQ/lTF
         8cxMw2jYEg6RN8dE1VJpo7fIUFHaA7b+KeQwJkCgZofLhR3gtdy9IIzIOBvyPWw/rp
         MrYwrHnMb/YZPhTkTS1RfTY565RjDOgxgo+dhJQCoogHMhxhjDQDw3AlvwKAxehPKy
         eLf08y8HCMDAw==
Date:   Tue, 2 Mar 2021 17:23:43 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] integrity: Load mokx variables into the blacklist
 keyring
Message-ID: <YD5Yf1gqvoKKRL+C@kernel.org>
References: <161433310139.902181.11787442834918634133.stgit@warthog.procyon.org.uk>
 <161433313205.902181.2502803393898221637.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161433313205.902181.2502803393898221637.stgit@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Feb 26, 2021 at 09:52:12AM +0000, David Howells wrote:
> From: Eric Snowberg <eric.snowberg@oracle.com>
> 
> During boot the Secure Boot Forbidden Signature Database, dbx,
> is loaded into the blacklist keyring.  Systems booted with shim
> have an equivalent Forbidden Signature Database called mokx.
> Currently mokx is only used by shim and grub, the contents are
> ignored by the kernel.
> 
> Add the ability to load mokx into the blacklist keyring during boot.
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> Link: https://lore.kernel.org/r/20210122181054.32635-5-eric.snowberg@oracle.com/ # v5
> Link: https://lore.kernel.org/r/c33c8e3839a41e9654f41cc92c7231104931b1d7.camel@HansenPartnership.com/
> Link: ohttps://lore.kernel.org/r/161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk/

For all:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko

> ---
> 
>  security/integrity/platform_certs/load_uefi.c |   20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
> index ee4b4c666854..f290f78c3f30 100644
> --- a/security/integrity/platform_certs/load_uefi.c
> +++ b/security/integrity/platform_certs/load_uefi.c
> @@ -132,8 +132,9 @@ static int __init load_moklist_certs(void)
>  static int __init load_uefi_certs(void)
>  {
>  	efi_guid_t secure_var = EFI_IMAGE_SECURITY_DATABASE_GUID;
> -	void *db = NULL, *dbx = NULL;
> -	unsigned long dbsize = 0, dbxsize = 0;
> +	efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
> +	void *db = NULL, *dbx = NULL, *mokx = NULL;
> +	unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
>  	efi_status_t status;
>  	int rc = 0;
>  
> @@ -175,6 +176,21 @@ static int __init load_uefi_certs(void)
>  		kfree(dbx);
>  	}
>  
> +	mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
> +	if (!mokx) {
> +		if (status == EFI_NOT_FOUND)
> +			pr_debug("mokx variable wasn't found\n");
> +		else
> +			pr_info("Couldn't get mokx list\n");
> +	} else {
> +		rc = parse_efi_signature_list("UEFI:MokListXRT",
> +					      mokx, mokxsize,
> +					      get_handler_for_dbx);
> +		if (rc)
> +			pr_err("Couldn't parse mokx signatures %d\n", rc);
> +		kfree(mokx);
> +	}
> +
>  	/* Load the MokListRT certs */
>  	rc = load_moklist_certs();
>  
> 
> 
