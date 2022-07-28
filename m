Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA0B5839A8
	for <lists+keyrings@lfdr.de>; Thu, 28 Jul 2022 09:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbiG1HnF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jul 2022 03:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbiG1HnF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jul 2022 03:43:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B52606A7;
        Thu, 28 Jul 2022 00:43:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E51C761B56;
        Thu, 28 Jul 2022 07:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CE2C433C1;
        Thu, 28 Jul 2022 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658994183;
        bh=m0HESBKbynkNYYBve6dme8G5ASks6lkE+n50neeL6jU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e8ztnv1o7tks0f1TboIv17UnRg8VLTa6h4UAtPYjdOkAgiyMg8jH6Q8w+KyXTfoK3
         R8+78rhcHIvIw+e5uhIjxardDQnA1y4hoLFfFmj7ZU9ZrtzqOhjReB0p3NjSeJ7NGw
         /8azQD5k6cB/huS2tSIcZV2OF6jB9uswq1Xb52OQ+3GjFT5qK7VDJ5GGbBDsVfVTzk
         qu982jQUjuK1XfEINjdFYWAZmlBnqbd/edjeYy1TP9y9Mhb96F2r2Co4axYpxZ47GK
         CBAgm8fICqcXRYT8ltFI5lkMeMhvLrq33coQl7/3V2F7jNSp+hwJjqEcv3qKRBBjPk
         RXYGcH2tF7rpw==
Date:   Thu, 28 Jul 2022 10:43:00 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, greg@gilhooley.com, gjoyce@ibm.com
Subject: Re: [PATCH 0/4] sed-opal: keyrings, discovery, revert and key store
Message-ID: <YuI+BKAlSfMTR8lB@kernel.org>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jul 18, 2022 at 04:01:52PM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> The current TCG SED Opal implementation in the block
> driver requires that authentication keys be provided
> in an ioctl so that they can be presented to the
> underlying SED Opal capable drive. Currently, the key
> is typically entered by a user with an application
> like sedutil or sedcli. While this process works, it
> does not lend itself to automation like unlock by a udev
> rule.


Please explain also what SED Opal is.

> 
> Extend the SED block driver so it can alternatively
> obtain a key from a sed-opal kernel keyring. The SED
> ioctls will indicate the source of the key, either
> directly in the ioctl data or from the keyring.
> 
> Two new SED ioctls have also been added. These are:
>   1) IOC_OPAL_REVERT_LSP to revert LSP state
>   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> 
> Also, for platforms that have a permanent key store, the
> platform may provide unique platform dependent functions
> to read/write variables. The SED block driver has been
> modified to attempt to read a key from the platform key
> store. If successful, the key value is saved in the kernel
> sed-opal keyring. If the platform does not support a
> permanent key store, the read will fail and a key will
> not be added to the keyring. This patchset does not include
> any providers of the variable read/write functions.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
> 
> Greg Joyce (4):
>   block: sed-opal: Implement IOC_OPAL_DISCOVERY
>   block: sed-opal: Implement IOC_OPAL_REVERT_LSP
>   block: sed-opal: keyring support for SED Opal keys
>   arch_vars: create arch specific permanent store
> 
>  block/Kconfig                 |   1 +
>  block/opal_proto.h            |   4 +
>  block/sed-opal.c              | 274 +++++++++++++++++++++++++++++++++-
>  include/linux/arch_vars.h     |  23 +++
>  include/linux/sed-opal.h      |   5 +
>  include/uapi/linux/sed-opal.h |  24 ++-
>  lib/Makefile                  |   2 +-
>  lib/arch_vars.c               |  25 ++++
>  8 files changed, 351 insertions(+), 7 deletions(-)
>  create mode 100644 include/linux/arch_vars.h
>  create mode 100644 lib/arch_vars.c
> 
> 
> -- 
> 2.27.0
> 

BR, Jarkko
