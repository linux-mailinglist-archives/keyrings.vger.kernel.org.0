Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12965ADEEC
	for <lists+keyrings@lfdr.de>; Tue,  6 Sep 2022 07:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiIFFY2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Sep 2022 01:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiIFFY1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 6 Sep 2022 01:24:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C09CF8;
        Mon,  5 Sep 2022 22:24:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BC2561269;
        Tue,  6 Sep 2022 05:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893EDC433D6;
        Tue,  6 Sep 2022 05:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662441861;
        bh=pu6UwA1zKegZBObnfGu8JbxpkNyorXaVTvS4jHKCA6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=btiAjJZIowVDkfdrtdmPKV8bOtk4yqX2r0ddGTdeB2u8DC1bOOootxUHBkL37ZgOG
         Dqr5nScpFMOgYOV67kWAGqRlPGbJD6RrOIQIBnY0xAhKfzOGiOFTNAY2r5NemBqNVK
         1W87Ih1X4mgtf1WQMtK7mc2KRXPOsojh65PNg3mgAPVyYfa3+lTbOBdtiTDbcYKWNF
         seyfNS3wQYt1ngXLlnSd52iB1WZVCTOXCED5ULt4fZjcdk2pUBsH0wiufMOqBGK5wm
         mKBasM5iL40QdvyBdax3Q6+ji51KZR+nSHLeItKuSpbJjSYvIbIvBRhtmtHfHmbzL4
         an5er7BV96IsQ==
Date:   Tue, 6 Sep 2022 08:24:18 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        Paul Moore <paul@paul-moore.com>,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/1] keys/request_key_auth.c: Use strscpy instead of
 strlcpy
Message-ID: <YxbZgiHufxAAA+l1@kernel.org>
References: <20220905160703.30364-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905160703.30364-1-pvorel@suse.cz>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Sep 05, 2022 at 06:07:03PM +0200, Petr Vorel wrote:
> strlcpy is deprecated, use its safer replacement.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  security/keys/request_key_auth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
> index 41e9735006d0..8f33cd170e42 100644
> --- a/security/keys/request_key_auth.c
> +++ b/security/keys/request_key_auth.c
> @@ -178,7 +178,7 @@ struct key *request_key_auth_new(struct key *target, const char *op,
>  	if (!rka->callout_info)
>  		goto error_free_rka;
>  	rka->callout_len = callout_len;
> -	strlcpy(rka->op, op, sizeof(rka->op));
> +	strscpy(rka->op, op, sizeof(rka->op));
>  
>  	/* see if the calling process is already servicing the key request of
>  	 * another process */
> -- 
> 2.35.3
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
