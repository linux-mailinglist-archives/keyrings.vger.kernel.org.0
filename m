Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0703F49CC09
	for <lists+keyrings@lfdr.de>; Wed, 26 Jan 2022 15:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbiAZOPO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 26 Jan 2022 09:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235423AbiAZOPO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 26 Jan 2022 09:15:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02636C06161C;
        Wed, 26 Jan 2022 06:15:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96CF161756;
        Wed, 26 Jan 2022 14:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCD9C340E8;
        Wed, 26 Jan 2022 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643206513;
        bh=Jjh0y22CIXmSqFDqIX33F/T8i4+BSXzZz1wdVLhIhFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGQfWcFssMnU00eSXwErqLx32sJeDivHwijUCr2zMeDSAC+A6z1Z1U3YPJJSrhcq1
         qL2ls+y/cuPKEhi6cHYEfb0U+t8CUxpe/Y4rl+vnMgcxQAHv9FDK0YIwbGRSZRsnlS
         TlH/yPtNhcT7woMany11qpvOfHq1QtFcFUZohVUyzVyIcJA/qDcq0U/aDufF/OS4YB
         t+T52wxo3JnzrSL6ZSWg3Ea8bv7xiK9BCDpwKQxFaxXboJ1d2t+PXpW7QfVxiurqrd
         Mdayx7n2uWXh4KPRuW2PCedOuu39u0AZh74rjJdIAbXLxcQuAczTmv0pr+3dSa4pUw
         x1yTxW6TLlR2w==
Date:   Wed, 26 Jan 2022 16:14:52 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 2/4] KEYS: x509: remove unused fields
Message-ID: <YfFXXGDPdTMXDthn@iki.fi>
References: <20220119005436.119072-1-ebiggers@kernel.org>
 <20220119005436.119072-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119005436.119072-3-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 18, 2022 at 04:54:34PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Remove unused fields from struct x509_parse_context.
> 
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index aec2396a7f7e1..2899ed80bb18e 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -19,7 +19,6 @@
>  struct x509_parse_context {
>  	struct x509_certificate	*cert;		/* Certificate being constructed */
>  	unsigned long	data;			/* Start of data */
> -	const void	*cert_start;		/* Start of cert content */
>  	const void	*key;			/* Key data */
>  	size_t		key_size;		/* Size of key data */
>  	const void	*params;		/* Key parameters */
> @@ -27,7 +26,6 @@ struct x509_parse_context {
>  	enum OID	key_algo;		/* Algorithm used by the cert's key */
>  	enum OID	last_oid;		/* Last OID encountered */
>  	enum OID	sig_algo;		/* Algorithm used to sign the cert */
> -	unsigned char	nr_mpi;			/* Number of MPIs stored */
>  	u8		o_size;			/* Size of organizationName (O) */
>  	u8		cn_size;		/* Size of commonName (CN) */
>  	u8		email_size;		/* Size of emailAddress */
> -- 
> 2.34.1
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
