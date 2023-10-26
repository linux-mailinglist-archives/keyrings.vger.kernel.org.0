Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7DB7D8752
	for <lists+keyrings@lfdr.de>; Thu, 26 Oct 2023 19:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbjJZRLY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 26 Oct 2023 13:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbjJZRLW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 26 Oct 2023 13:11:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D6F10A
        for <keyrings@vger.kernel.org>; Thu, 26 Oct 2023 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698340232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/CIQaN2hYmBCGrEr5wSwlpK+Nw1/R/cDnWMd/K0WyEc=;
        b=e1+DOlpGjnBLGAh79lixXcH7TjWR/Trntm8ZwSKCmoQxhmFFo7z7XH0rZHucp6qJb4yGJG
        Q+PmOngLmQviG4gVXRWM9zoXyI3j/kIxsXcOThjfefbUqMQ3Sb/rc5SNQ+IFMwW6nAMsEg
        bTztXT+ts1NLVbN5GuoXQrnt2WY2Zn4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-TpOV_BrlPNKE0OCUJRxnhw-1; Thu, 26 Oct 2023 13:10:30 -0400
X-MC-Unique: TpOV_BrlPNKE0OCUJRxnhw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b51e0bd5c0so1506759b6e.2
        for <keyrings@vger.kernel.org>; Thu, 26 Oct 2023 10:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698340229; x=1698945029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CIQaN2hYmBCGrEr5wSwlpK+Nw1/R/cDnWMd/K0WyEc=;
        b=Rk8UmK2MRWLVD9xjifExwSuIA0Gih9zeGxUyz4Gst7uqUUZVz60FjuTThzoLHy9v2b
         e+xzckyVNi2dPlGBqHjdi2n6dUw2l1PK7x3i/G95TVO0Ajwf3GvlE0WODtPrJAz3vbkG
         SHqaGikhuBYlp4SfO7AOFyI3poQS40dYHrvD+O8U/9OKCULfErw1AJB1JJ89a6TnEZ8x
         /L1vjjeSvLY3RXkiIMOkqgqwRvwXN5dgDkue8f37Cr8NKIXkv6EfIlh0CgfanyT9/kK1
         mKb3HuKh0AvZyy1lwWzZb9WE7ADuUi9eRi/lST9vmMCKhMVAIsa3DsKaVNaTXAXttwHK
         Il2w==
X-Gm-Message-State: AOJu0YwoCaxeRBY7+Y/iw535rotX92t+T0dOw8EK/o38DZJcYvfFOseQ
        yqRzqepgs8Ku4H+CBd7AG5DtMkhSfdzpLH4nrKqFyZfrcI9nJRZ8E1PJXxNmssSDTjXMify/N3E
        UIQPlUum0AfcVvh8FmNiMaBUwQWw=
X-Received: by 2002:a05:6870:700e:b0:1e9:9469:a858 with SMTP id u14-20020a056870700e00b001e99469a858mr177896oae.39.1698340228765;
        Thu, 26 Oct 2023 10:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMcG7bFJI3uZvagRkgLSPwdpNdpoULYCl6UniOWGqMYyzyTbNJBhELZeGRoTmo2AKqS168Kw==
X-Received: by 2002:a05:6870:700e:b0:1e9:9469:a858 with SMTP id u14-20020a056870700e00b001e99469a858mr177884oae.39.1698340228525;
        Thu, 26 Oct 2023 10:10:28 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id b23-20020ac86bd7000000b0041969bc2e4csm5160636qtt.32.2023.10.26.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 10:10:28 -0700 (PDT)
Date:   Thu, 26 Oct 2023 10:10:26 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        William Roberts <bill.c.roberts@gmail.com>,
        Stefan Berger <stefanb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Julien Gomes <julien@arista.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] tpm: Move buffer handling from static inlines to
 real functions
Message-ID: <g6grxamrilogiy4vjrvwwn6iz2xm26oeq2y7redbskvcreil6w@seavf5djd4ph>
References: <20231024011531.442587-1-jarkko@kernel.org>
 <20231024011531.442587-2-jarkko@kernel.org>
 <qktrbbbqrz3z4jh4h7pz42leikmyg2mdevzl2brapn32kst55e@s5thpstdtlxp>
 <CWHPA3T3YIJT.148L3L98EXBXD@suppilovahvero>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CWHPA3T3YIJT.148L3L98EXBXD@suppilovahvero>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Oct 25, 2023 at 08:35:55PM +0300, Jarkko Sakkinen wrote:
> On Wed Oct 25, 2023 at 12:03 PM EEST, Jerry Snitselaar wrote:
> > Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> 
> On Wed, 2023-10-25 at 02:03 -0700, Jerry Snitselaar wrote:
> > Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> >
> 
> Thanks I'll add it to the next round.
> 
> For the tpm_buf_read(), I was thinking along the lines of:
> 
> /**
>  * tpm_buf_read() - Read from a TPM buffer
>  * @buf:	&tpm_buf instance
>  * @pos:	position within the buffer
>  * @count:	the number of bytes to read
>  * @output:	the output buffer
>  *
>  * Read bytes from a TPM buffer, and update the position. Returns false when the
>  * amount of bytes requested would overflow the buffer, which is expected to
>  * only happen in the case of hardware failure.
>  */
> static bool tpm_buf_read(const struct tpm_buf *buf, off_t *pos, size_t count, void *output)
> {
> 	off_t next = *pos + count;
> 
> 	if (next >= buf->length) {
> 		pr_warn("%s: %lu >= %lu\n", __func__, next, *offset);
> 		return false;
> 	}
> 
> 	memcpy(output, &buf->data[*pos], count);
> 	*offset = next;
> 	return true;
> }
> 
> BR, Jarkko
> 

Then the callers will check, and return -EIO?

