Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9A94BEBD1
	for <lists+keyrings@lfdr.de>; Mon, 21 Feb 2022 21:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbiBUU1l (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Feb 2022 15:27:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbiBUU1k (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Feb 2022 15:27:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71FB237CC
        for <keyrings@vger.kernel.org>; Mon, 21 Feb 2022 12:27:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 809BBB8179C
        for <keyrings@vger.kernel.org>; Mon, 21 Feb 2022 20:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DF1C340E9;
        Mon, 21 Feb 2022 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645475234;
        bh=bRcLNcCCIP/KzTKLdhNNvbo6RA2L6bu9sb1LdT81BTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QyN+AYKrgg/lgXZJgbJaV6THRS4DSw+LUg7iOyxBb0rf7j7EYkLluanlEfis+aTH2
         1wUe3M/3xEFELZnzX/GHwa/bACp18nTXi2mGNG+ZtBXvZ6RtbjCtR2NAtOFiJ2VOgs
         l+/m6XzyO77b0EQFVChGBniT62su+tlf2TYmOtUZX1sCaNnhzQXallNw/Lpkdb+Di+
         WMM3fWhJeGSkpTzorX29RmsO4Rm8q2CzEY9rzsZmbDaocOumlIrPpaini5UEkqORuo
         mEDTSWzW8kuf8wtq6bZPjqMMuHxw16MjrTyAUF+w5cBEYcYP8Pvew8sT/U39iYsKav
         eYbes7iZZfVdw==
Date:   Mon, 21 Feb 2022 21:27:49 +0100
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Douglas Miller <dougmill@linux.vnet.ibm.com>
Cc:     keyrings@vger.kernel.org, gjoyce@ibm.com, dhowells@redhat.com
Subject: Re: [PATCH RESEND 1/1] keys: Allow access to
 key_type_lookup()/key_type_put() within kernel.
Message-ID: <YhP1xQLJgQAT0r9j@iki.fi>
References: <20220221144424.1339241-1-dougmill@linux.vnet.ibm.com>
 <20220221144424.1339241-2-dougmill@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221144424.1339241-2-dougmill@linux.vnet.ibm.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Feb 21, 2022 at 08:44:24AM -0600, Douglas Miller wrote:
> Signed-off-by: Douglas Miller <dougmill@linux.vnet.ibm.com>
> ---
>  include/linux/key-type.h | 2 ++
>  security/keys/key.c      | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/include/linux/key-type.h b/include/linux/key-type.h
> index 7d985a1dfe4a..868a6fb368f3 100644
> --- a/include/linux/key-type.h
> +++ b/include/linux/key-type.h
> @@ -165,6 +165,8 @@ extern struct key_type key_type_keyring;
>  
>  extern int register_key_type(struct key_type *ktype);
>  extern void unregister_key_type(struct key_type *ktype);
> +extern struct key_type *key_type_lookup(const char *type);
> +extern void key_type_put(struct key_type *ktype);
>  
>  extern int key_payload_reserve(struct key *key, size_t datalen);
>  extern int key_instantiate_and_link(struct key *key,
> diff --git a/security/keys/key.c b/security/keys/key.c
> index c45afdd1dfbb..3091fd6d65a7 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -719,6 +719,7 @@ struct key_type *key_type_lookup(const char *type)
>  found_kernel_type:
>  	return ktype;
>  }
> +EXPORT_SYMBOL(key_type_lookup);
>  
>  void key_set_timeout(struct key *key, unsigned timeout)
>  {
> @@ -744,6 +745,7 @@ void key_type_put(struct key_type *ktype)
>  {
>  	up_read(&key_types_sem);
>  }
> +EXPORT_SYMBOL(key_type_put);
>  
>  /*
>   * Attempt to update an existing key.
> -- 
> 2.27.0
> 

This should be included with the changes that actually require this.

BR, Jarkko
