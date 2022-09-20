Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A719C5BDBC6
	for <lists+keyrings@lfdr.de>; Tue, 20 Sep 2022 06:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiITEtM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Sep 2022 00:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiITEtK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Sep 2022 00:49:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D52018B2E;
        Mon, 19 Sep 2022 21:49:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 260206209B;
        Tue, 20 Sep 2022 04:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0112C433C1;
        Tue, 20 Sep 2022 04:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663649348;
        bh=Q1Tosbt3DwUqSNELfPNSjCC17XnqpU33VctSbmh/zGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m7FS5qm6Cz5w8lVDnqE98rfrO/3tFM97R6EZalVRGqmdKJlUtRRuTCnvvv1HYB69U
         xW0McPfeWuQ1zUyBEr6WkNiSftZjsInwAjmWZV+N+ACUVhilbhhO4TvUlFh8xqLPYc
         JAsyvQGGo5YLpDjOFLKGc72Xc/RIzwVNDHUquX570pGyWjstC94JJZ5Cv3b4jMtgc2
         739EYJE6ry22CuLLHgo+vDz74N9HNyhYrzOLDee7B3ct7UFGiOpMNltWFRoR489/M1
         Iz14mOCqpXaUgtmhh4wWbuaMGllKBRQoWzDZGkRFxiGslFmB7tfuAmqRcI/lxeVCvb
         TpUNkvtcDmDBA==
Date:   Tue, 20 Sep 2022 07:49:04 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, akpm@linux-foundation.org, alan@redhat.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2] KEYS: Remove orphan declarations from
 security/keys/internal.h
Message-ID: <YylGQAOtxolniRS0@kernel.org>
References: <20220913014613.524253-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913014613.524253-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Sep 13, 2022 at 09:46:13AM +0800, Gaosheng Cui wrote:
> Remove the following orphan declarations from security/keys/internal.h:
> 1. request_key_conswq has been removed since
> commit 76181c134f87 ("KEYS: Make request_key() and co fundamentally
> asynchronous").
> 
> 2. keyring_search_instkey() has been removed since
> commit b5f545c880a2 ("[PATCH] keys: Permit running process to
> instantiate keys").
> 
> Fixes: 76181c134f87 ("KEYS: Make request_key() and co fundamentally asynchronous").
> Fixes: b5f545c880a2 ("[PATCH] keys: Permit running process to instantiate keys").
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v2:
> - Format the commit messages for the patchk, thanks!
>  security/keys/internal.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 9b9cf3b6fcbb..6a2fb45c22f8 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -86,7 +86,6 @@ extern struct kmem_cache *key_jar;
>  extern struct rb_root key_serial_tree;
>  extern spinlock_t key_serial_lock;
>  extern struct mutex key_construction_mutex;
> -extern wait_queue_head_t request_key_conswq;
>  
>  extern void key_set_index_key(struct keyring_index_key *index_key);
>  extern struct key_type *key_type_lookup(const char *type);
> @@ -109,9 +108,6 @@ extern void __key_link_end(struct key *keyring,
>  extern key_ref_t find_key_to_update(key_ref_t keyring_ref,
>  				    const struct keyring_index_key *index_key);
>  
> -extern struct key *keyring_search_instkey(struct key *keyring,
> -					  key_serial_t target_id);
> -
>  extern int iterate_over_keyring(const struct key *keyring,
>  				int (*func)(const struct key *key, void *data),
>  				void *data);
> -- 
> 2.25.1
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
