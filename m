Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B627B57B214
	for <lists+keyrings@lfdr.de>; Wed, 20 Jul 2022 09:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236626AbiGTHtK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jul 2022 03:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240318AbiGTHtG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jul 2022 03:49:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60C568DC8;
        Wed, 20 Jul 2022 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=V7koHf5sngbDSLahsEmX69sglpsjtThb2n3TJeagao0=; b=MAK2HmgFOQdxtXVc3IWT4Xn2pA
        SKr+PnUkSekbZAHHN5yCRR8dyg3cxHCOksyqRjgZ2gBvpJUD2qEeJqrCXQOJ3jiS195FIb44Gwn7y
        TOxlmIYJkAVE9GQ+2alg8YFeTE+mz8G+C/P6aVh6gDA6ZDBx+pkkxnu0du1JAdhnegCzUlvcWol6z
        UIY2ND/0BstEnazhF5rLvcYquZggTIrudOkMS6SmQjpGETooTu/usWGtDciK2XN2kAtJ5TKYpbeGf
        jgrp1ajpyGHHP7O9U0NtSe/8E+3BUYwekHVppQUoU/OiITKxncWLOjq+7h1otrHhPQ/9npIG9lWNw
        UWCRXmKw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oE4S9-002Aqj-Ee; Wed, 20 Jul 2022 07:49:05 +0000
Date:   Wed, 20 Jul 2022 00:49:05 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, greg@gilhooley.com, gjoyce@ibm.com
Subject: Re: [PATCH 3/4] block: sed-opal: keyring support for SED Opal keys
Message-ID: <YtezcSA4c4cccQZQ@infradead.org>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
 <20220718210156.1535955-4-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718210156.1535955-4-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I don't know the keyring code at all, so just some nitpicks here:

> +	kref = keyring_search(make_key_ref(sed_opal_keyring, true),
> +			      &key_type_user,
> +			      key_name,
> +			      true);
> +
> +	if (IS_ERR(kref)) {
> +		ret = PTR_ERR(kref);

Just return directly here instead of indenting the main path.  Also the
parameter list and empty line here look odd.  Why not:

	kref = keyring_search(make_key_ref(sed_opal_keyring, true),
			      &key_type_user, key_name, true);
	if (IS_ERR(kref))
		return PTR_ERR(kref);

?

>  	ret = execute_steps(dev, pw_steps, ARRAY_SIZE(pw_steps));
>  	mutex_unlock(&dev->dev_lock);
>  
> +	if (ret == 0) {

	if (ret)
		return ret;

and avoid the indentation below.

> +	ret = update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);
> +
> +	return ret;

	return update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);

>  
> +enum opal_key_type {
> +	OPAL_INCLUDED = 0,	/* key[] is the key */
> +	OPAL_KEYRING,		/* key is in keyring */
> +};
> +
>  struct opal_key {
>  	__u8 lr;
>  	__u8 key_len;
> -	__u8 __align[6];
> +	__u8 key_type;
> +	__u8 __align[5];

Can we assume this was always zero initialized before?
