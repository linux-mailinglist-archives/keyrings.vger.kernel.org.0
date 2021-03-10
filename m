Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEAB334802
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 20:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhCJTdV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 14:33:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:49180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233942AbhCJTdU (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 10 Mar 2021 14:33:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDA0564FB2;
        Wed, 10 Mar 2021 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615404800;
        bh=HSKJm/eop7og5BaIReOnqWqOik9WWlx22NnmsHLVihY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oZOTDRKn+Tj787FecJjq3VI/Dei6KMXECNi0da8WYHvBYG7p78WCLP0VTjaN6LHpz
         SIALime9msIZkUsgCN5wRPyvzqQcQT++oebwPji1on3KqmeIAvqkCS3LTUweaB9/MW
         z8K3OY9Zof7NG0da35FMfArutjvvJrdWW7owSRlWjmdEMwCJXT8ExQzYlxGoINxACq
         hAomrQzt/iUUByOUGMYguT+R13Llf1CdB/6P2AZn9q6/ie1kRnvKPD00zz5LHeM9wB
         KP7fthHUwruPtQ/ozi7u5+NP0tSvm8ogv/NvABl0qrbVeEvb8+xFH/NbmIsWAGRTo/
         qNiSbS7biX3+A==
Date:   Wed, 10 Mar 2021 21:32:56 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
        Arnd Bergmann <arnd@kernel.org>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] keys: Add EFI_CERT_X509_GUID support for dbx/mokx
 entries
Message-ID: <YEke6BU5QshCDA2C@kernel.org>
References: <161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 09, 2021 at 01:20:42PM +0000, David Howells wrote:
> 
> Here's my take on v5 of Eric Snowberg's patches[1]:
> 
> This series of patches adds support for EFI_CERT_X509_GUID entries [2].  It has
> been expanded to not only include dbx entries but also entries in the mokx.
> Additionally Eric included his patches to preload these certificate [3].
> 
> The patches can be found on the following branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-cve-2020-26541-branch
> 
> Changes:
> 
> ver #3:
>  - Rolled in changes from Eric to fix conditional building issues[7].
> 
> ver #2:
>  - Rolled in a fix to the second patch to include certs/common.h in
>    certs/common.c[6].
> 
> ver #1:
>  - I've modified the first patch in the series to fix a configuration
>    problem[4][5], to move the added functions to a more logical place
>    within thefile and to add kerneldoc comments.
> 
> Link: https://lore.kernel.org/r/20210122181054.32635-1-eric.snowberg@oracle.com [1]
> Link: https://patchwork.kernel.org/project/linux-security-module/patch/20200916004927.64276-1-eric.snowberg@oracle.com/ [2]
> Link: https://lore.kernel.org/patchwork/cover/1315485/ [3]
> Link: https://lore.kernel.org/r/bc2c24e3-ed68-2521-0bf4-a1f6be4a895d@infradead.org/ [4]
> Link: https://lore.kernel.org/r/20210225125638.1841436-1-arnd@kernel.org/ [5]
> Link: https://lore.kernel.org/r/EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com/ [6]
> Link: https://lore.kernel.org/r/161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk/ # v1 posting
> Link: https://lore.kernel.org/r/161433310139.902181.11787442834918634133.stgit@warthog.procyon.org.uk/ # v2 posting
> Link: https://lore.kernel.org/r/20210304175030.184131-1-eric.snowberg@oracle.com/ [7]
> 
> David
> ---
> Eric Snowberg (4):
>       certs: Add EFI_CERT_X509_GUID support for dbx entries
>       certs: Move load_system_certificate_list to a common function
>       certs: Add ability to preload revocation certs
>       integrity: Load mokx variables into the blacklist keyring
> 
> 
>  certs/Kconfig                                 |  8 +++
>  certs/Makefile                                | 21 ++++++-
>  certs/blacklist.c                             | 21 +++++++
>  certs/common.c                                | 57 +++++++++++++++++++
>  certs/common.h                                |  9 +++
>  certs/revocation_certificates.S               | 21 +++++++
>  certs/system_keyring.c                        | 49 +---------------
>  scripts/Makefile                              |  1 +
>  security/integrity/platform_certs/load_uefi.c | 20 ++++++-
>  9 files changed, 156 insertions(+), 51 deletions(-)
>  create mode 100644 certs/common.c
>  create mode 100644 certs/common.h
>  create mode 100644 certs/revocation_certificates.S
> 
> 
> 

Looks good to me.

/Jarkko
