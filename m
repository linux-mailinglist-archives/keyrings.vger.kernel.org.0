Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D3969B466
	for <lists+keyrings@lfdr.de>; Fri, 17 Feb 2023 22:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjBQVLQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Feb 2023 16:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBQVLQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Feb 2023 16:11:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AC55DE35
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 13:11:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2CEB9B82DAD
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 21:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1880AC433EF;
        Fri, 17 Feb 2023 21:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676668272;
        bh=M89NsS7YL8O/JdOW3Xa33cOkhkNkUMhH+6zfZ1uQJCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPpZ/Xlvi3BZUBbHp6K4JpjNT/ixS6xgIEhlwk91lZZqBW2dKcWFMZNlsRF9ItnXd
         LWK7v82mbdV7ptIJjQJCaGUM4e0GRP7OanIP/gtP4/BmE4An2IgxyzDwzemvb6Uykk
         JsKvvcm+/4A3Q9ysVAqC7/zxjP6y/JOPwbTwI12ARKnUt0r/UBiSe3K3S2odLqWJ0y
         xMtuihSEfhIKec3H34oOl1vc2ahkavJJr+7nABO5JiNmy4hqlmFRsoBwF9Kgz2UrV3
         9/Sn70HSBQfdFh3FSzef4J4XC0Gue3ddC4T+9KYWlWqvCOTfVElpve5xLyEdn23eGm
         tt8d3o6kNRSWA==
Date:   Fri, 17 Feb 2023 23:11:07 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Robbie Harwood <rharwood@redhat.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v1 1/2] verify_pefile: relax wrapper length check
Message-ID: <Y+/taw1DJV+sGQuj@kernel.org>
References: <20230217201435.39784-1-rharwood@redhat.com>
 <20230217201435.39784-2-rharwood@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217201435.39784-2-rharwood@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Feb 17, 2023 at 03:14:34PM -0500, Robbie Harwood wrote:
> The PE Format Specification (section "The Attribute Certificate Table
> (Image Only)") states that `dwLength` is to be rounded up to 8-byte
> alignment when used for traversal.  Therefore, the field is not required
> to be an 8-byte multiple in the first place.
> 
> Accordingly, pesign has not performed this alignment since version
> 0.110.  This causes kexec failure on pesign'd binaries with "PEFILE:
> Signature wrapper len wrong".  Update the comment and relax the check.
> 
> See-also: https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#the-attribute-certificate-table-image-only
> See-also: https://github.com/rhboot/pesign
> Signed-off-by: Robbie Harwood <rharwood@redhat.com>

OK, makes sense but what does relaxing this bring up to the table?

I.e. I do get the argument but do not see the motivation.

> ---
>  crypto/asymmetric_keys/verify_pefile.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
> index 7553ab18db89..fe1bb374239d 100644
> --- a/crypto/asymmetric_keys/verify_pefile.c
> +++ b/crypto/asymmetric_keys/verify_pefile.c
> @@ -135,11 +135,15 @@ static int pefile_strip_sig_wrapper(const void *pebuf,
>  	pr_debug("sig wrapper = { %x, %x, %x }\n",
>  		 wrapper.length, wrapper.revision, wrapper.cert_type);
>  
> -	/* Both pesign and sbsign round up the length of certificate table
> -	 * (in optional header data directories) to 8 byte alignment.
> +	/* sbsign rounds up the length of certificate table (in optional
> +	 * header data directories) to 8 byte alignment.  However, the PE
> +	 * specification states that while entries are 8-byte aligned, this is
> +	 * not included in their length, and as a result, pesign has not
> +	 * rounded up since 0.110.
>  	 */
> -	if (round_up(wrapper.length, 8) != ctx->sig_len) {
> -		pr_debug("Signature wrapper len wrong\n");
> +	if (wrapper.length > ctx->sig_len) {
> +		pr_debug("Signature wrapper bigger than sig len (%x > %x)\n",
> +			 ctx->sig_len, wrapper.length);
>  		return -ELIBBAD;
>  	}
>  	if (wrapper.revision != WIN_CERT_REVISION_2_0) {
> -- 
> 2.39.1
> 

BR, Jarkko
