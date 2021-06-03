Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6174339A494
	for <lists+keyrings@lfdr.de>; Thu,  3 Jun 2021 17:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFCPcE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 3 Jun 2021 11:32:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42778 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhFCPcE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 3 Jun 2021 11:32:04 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <dimitri.ledkov@canonical.com>)
        id 1lopIY-0002C6-9a
        for keyrings@vger.kernel.org; Thu, 03 Jun 2021 15:30:18 +0000
Received: by mail-io1-f71.google.com with SMTP id i13-20020a5e9e0d0000b029042f7925649eso4057225ioq.5
        for <keyrings@vger.kernel.org>; Thu, 03 Jun 2021 08:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boxzPNf6kICAudraEiy9pprXyKhNrnzmnyq1YE5b8oU=;
        b=RjDXms4cu2lsO9qiFlHGGNxcqlVhsMEiAAGgl5kAefsmvHs128FPH8RNQb1DAHqWyS
         FBeKifZwafYk5q2A20zNk1M1jmVQzBhOEM4vo+HX5/GzjaxEU8HkDDugTiUF1Xn3lsp1
         eq55Q02DLE/VgNOMR+2Azsa3nlgZgfpLBPngAIWlJ0gcugXppIlKRvY8tigflMEM8r39
         fZ/nkVxravfXWqbA4pZfVWFlB2js3gMY4ZxXH5Na/kaQmGTM8J6fnFvqhnwiCtABRIMU
         /n4BtF88Zu1v7D9DXOjOkGUytimlpsQBBF9A2CSdzxl3R3l8aZDAvOCRqqCoghIayp/x
         SJ+g==
X-Gm-Message-State: AOAM533Mw/gUs73JiN1tkLhmHzJjWQERJDKIt2PFSjjQ8N3fArNn7Jjf
        5B18E4dHMiKcKUo4mG16bGbXsqv5OWQtDgip/s85rCd7WUY2vIbqyp9Wzi2OaAHG7joEsF3akrP
        ZfQhU0r7WorfIReI+/gewRWFYSGg4tBDF/raVmjHyrf3SwK2Mlke/
X-Received: by 2002:a05:6638:13cc:: with SMTP id i12mr325499jaj.20.1622734217368;
        Thu, 03 Jun 2021 08:30:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpAMTnnJtY/I/Aykd9ILXYyI1vh7/bSgcxZHw3VISAuOkiJqm3U/Hhu7xPndOU3lwZNAlC+wPMAgdD7cuaHKI=
X-Received: by 2002:a05:6638:13cc:: with SMTP id i12mr325477jaj.20.1622734217051;
 Thu, 03 Jun 2021 08:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210512153100.285169-1-dimitri.ledkov@canonical.com> <20210518141942.GA1269@mail.hallyn.com>
In-Reply-To: <20210518141942.GA1269@mail.hallyn.com>
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date:   Thu, 3 Jun 2021 16:29:40 +0100
Message-ID: <CADWks+bU2=n8dxuLyBq8kCHCKV6GOa_x42ydGwCzxZcKsHQ+LA@mail.gmail.com>
Subject: Re: [PATCH] integrity: Load mokx certs from the EFI MOK config table
To:     "Serge E. Hallyn" <serge@hallyn.com>
Cc:     linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        David Howells <dhowells@redhat.com>,
        Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On Tue, May 18, 2021 at 3:19 PM Serge E. Hallyn <serge@hallyn.com> wrote:
>
> On Wed, May 12, 2021 at 04:31:00PM +0100, Dimitri John Ledkov wrote:
> > Refactor load_moklist_certs() to load either MokListRT into db, or
> > MokListXRT into dbx. Call load_moklist_certs() twice - first to load
> > mokx certs into dbx, then mok certs into db.
> >
> > This thus now attempts to load mokx certs via the EFI MOKvar config
> > table first, and if that fails, via the EFI variable. Previously mokx
> > certs were only loaded via the EFI variable. Which fails when
> > MokListXRT is large. Instead of large MokListXRT variable, only
> > MokListXRT{1,2,3} are available which are not loaded. This is the case
> > with Ubuntu's 15.4 based shim. This patch is required to address
> > CVE-2020-26541 when certificates are revoked via MokListXRT.
>
> Hi Dimitri,
>
> I don't see any problems with this technically, and based on
> https://bugs.launchpad.net/bugs/1928679 it looks like it is in fact needed.
>

Yes it is.

Also it has been pointed out to me now that debian is already applying
a variation of this bugfix at

https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/patches/features/all/db-mok-keyring/0002-MODSIGN-load-blacklist-from-MOKx.patch

The path there is similar to mine, but passes the various static
values as args without a struct. Which looks clean enough.

I can do a variation of a rebased patch similar to what Ben is already
applying in Debian. I reached out to them, and they are not interested
in upstreaming this themselves right now.


> I suggest a change below, but I'm not sure you should make the change
> without confirmation from one of the maintainers that it matches what
> they would want.
>
> > Fixes: ebd9c2ae369a ("integrity: Load mokx variables into the blacklist keyring")
> >
> > Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> > cc: keyrings@vger.kernel.org
> > cc: Eric Snowberg <eric.snowberg@oracle.com>
> > cc: Jarkko Sakkinen <jarkko@kernel.org>
> > cc: David Woodhouse <dwmw2@infradead.org>
> > cc: David Howells <dhowells@redhat.com>
>
> Acked-by: Serge Hallyn <serge@hallyn.com>
>
> > ---
> >  security/integrity/platform_certs/load_uefi.c | 74 ++++++++++---------
> >  1 file changed, 40 insertions(+), 34 deletions(-)
> >
> > diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
> > index f290f78c3f30..f4b913ec76e4 100644
> > --- a/security/integrity/platform_certs/load_uefi.c
> > +++ b/security/integrity/platform_certs/load_uefi.c
> > @@ -66,17 +66,18 @@ static __init void *get_cert_list(efi_char16_t *name, efi_guid_t *guid,
> >  }
> >
> >  /*
> > - * load_moklist_certs() - Load MokList certs
> > + * load_moklist_certs() - Load Mok(X)List certs
> > + * @load_db: Load MokListRT into db when true; MokListXRT into dbx when false
> >   *
> > - * Load the certs contained in the UEFI MokListRT database into the
> > - * platform trusted keyring.
> > + * Load the certs contained in the UEFI MokList(X)RT database into the
> > + * platform trusted/denied keyring.
> >   *
> >   * This routine checks the EFI MOK config table first. If and only if
> > - * that fails, this routine uses the MokListRT ordinary UEFI variable.
> > + * that fails, this routine uses the MokList(X)RT ordinary UEFI variable.
> >   *
> >   * Return:   Status
> >   */
> > -static int __init load_moklist_certs(void)
> > +static int __init load_moklist_certs(const bool load_db)
>
> Rather than passing in a bool here, I would suggest, above this function,
> doing something like:
>
> struct moklist_desc {
>         const char *mokvar_name;
>         efi_char16_t *efivar_name;
>         const char *parse_mokvar_name;
>         const char *parse_efivar_name;
>         efi_element_handler_t (*get_handler_for_guid)(const efi_guid_t *);
> };
>
> struct moklist_desc moklist_descriptor = {
>         .mokvar_name = "MokListRT",
>         .efivar_name = L"MokListRT",
>         .parse_mokvar_name =  "UEFI:MokListRT (MOKvar table)",
>         .parse_efivar_name = "UEFI:MokListRT",
>         .get_handler_for_guid = get_handler_for_db,
> };
>
> struct moklist_desc moxklist_descriptor = {
>         .mokvar_name = "MokListXRT",
>         .efivar_name = L"MokListXRT",
>         .parse_mokvar_name =  "UEFI:MokListXRT (MOKvar table)",
>         .parse_efivar_name = "UEFI:MokListXRT",
>         .get_handler_for_guid = get_handler_for_dbx,
> };
>
> And pass each of those into load_moklist_certs() once.
>
> >  {
> >       struct efi_mokvar_table_entry *mokvar_entry;
> >       efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
> > @@ -84,41 +85,55 @@ static int __init load_moklist_certs(void)
> >       unsigned long moksize;
> >       efi_status_t status;
> >       int rc;
> > +     const char *mokvar_name = "MokListRT";
> > +     /* Should be const, but get_cert_list() doesn't have it as const yet */
> > +     efi_char16_t *efivar_name = L"MokListRT";
> > +     const char *parse_mokvar_name = "UEFI:MokListRT (MOKvar table)";
> > +     const char *parse_efivar_name = "UEFI:MokListRT";
> > +     efi_element_handler_t (*get_handler_for_guid)(const efi_guid_t *) = get_handler_for_db;
> > +
> > +     if (!load_db) {
> > +             mokvar_name = "MokListXRT";
> > +             efivar_name = L"MokListXRT";
> > +             parse_mokvar_name = "UEFI:MokListXRT (MOKvar table)";
> > +             parse_efivar_name = "UEFI:MokListXRT";
> > +             get_handler_for_guid = get_handler_for_dbx;
> > +     }
> >
> >       /* First try to load certs from the EFI MOKvar config table.
> >        * It's not an error if the MOKvar config table doesn't exist
> >        * or the MokListRT entry is not found in it.
> >        */
> > -     mokvar_entry = efi_mokvar_entry_find("MokListRT");
> > +     mokvar_entry = efi_mokvar_entry_find(mokvar_name);
> >       if (mokvar_entry) {
> > -             rc = parse_efi_signature_list("UEFI:MokListRT (MOKvar table)",
> > +             rc = parse_efi_signature_list(parse_mokvar_name,
> >                                             mokvar_entry->data,
> >                                             mokvar_entry->data_size,
> > -                                           get_handler_for_db);
> > +                                           get_handler_for_guid);
> >               /* All done if that worked. */
> >               if (!rc)
> >                       return rc;
> >
> > -             pr_err("Couldn't parse MokListRT signatures from EFI MOKvar config table: %d\n",
> > -                    rc);
> > +             pr_err("Couldn't parse %s signatures from EFI MOKvar config table: %d\n",
> > +                    mokvar_name, rc);
> >       }
> >
> >       /* Get MokListRT. It might not exist, so it isn't an error
> >        * if we can't get it.
> >        */
> > -     mok = get_cert_list(L"MokListRT", &mok_var, &moksize, &status);
> > +     mok = get_cert_list(efivar_name, &mok_var, &moksize, &status);
> >       if (mok) {
> > -             rc = parse_efi_signature_list("UEFI:MokListRT",
> > -                                           mok, moksize, get_handler_for_db);
> > +             rc = parse_efi_signature_list(parse_efivar_name,
> > +                                           mok, moksize, get_handler_for_guid);
> >               kfree(mok);
> >               if (rc)
> > -                     pr_err("Couldn't parse MokListRT signatures: %d\n", rc);
> > +                     pr_err("Couldn't parse %s signatures: %d\n", mokvar_name, rc);
> >               return rc;
> >       }
> >       if (status == EFI_NOT_FOUND)
> > -             pr_debug("MokListRT variable wasn't found\n");
> > +             pr_debug("%s variable wasn't found\n", mokvar_name);
> >       else
> > -             pr_info("Couldn't get UEFI MokListRT\n");
> > +             pr_info("Couldn't get UEFI %s\n", mokvar_name);
> >       return 0;
> >  }
> >
> > @@ -132,9 +147,8 @@ static int __init load_moklist_certs(void)
> >  static int __init load_uefi_certs(void)
> >  {
> >       efi_guid_t secure_var = EFI_IMAGE_SECURITY_DATABASE_GUID;
> > -     efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
> > -     void *db = NULL, *dbx = NULL, *mokx = NULL;
> > -     unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
> > +     void *db = NULL, *dbx = NULL;
> > +     unsigned long dbsize = 0, dbxsize = 0;
> >       efi_status_t status;
> >       int rc = 0;
> >
> > @@ -176,23 +190,15 @@ static int __init load_uefi_certs(void)
> >               kfree(dbx);
> >       }
> >
> > -     mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
> > -     if (!mokx) {
> > -             if (status == EFI_NOT_FOUND)
> > -                     pr_debug("mokx variable wasn't found\n");
> > -             else
> > -                     pr_info("Couldn't get mokx list\n");
> > -     } else {
> > -             rc = parse_efi_signature_list("UEFI:MokListXRT",
> > -                                           mokx, mokxsize,
> > -                                           get_handler_for_dbx);
> > -             if (rc)
> > -                     pr_err("Couldn't parse mokx signatures %d\n", rc);
> > -             kfree(mokx);
> > -     }
> > +     /* Load the MokListXRT certs */
> > +     rc = load_moklist_certs(false);
> > +     if (rc)
> > +             pr_err("Couldn't parse mokx signatures: %d\n", rc);
> >
> >       /* Load the MokListRT certs */
> > -     rc = load_moklist_certs();
> > +     rc = load_moklist_certs(true);
> > +     if (rc)
> > +             pr_err("Couldn't parse mok signatures: %d\n", rc);
> >
> >       return rc;
> >  }
> > --
> > 2.27.0
> >



-- 
Regards,

Dimitri.
