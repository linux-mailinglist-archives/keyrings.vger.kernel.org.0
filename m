Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3034B9F6
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfFSNbC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:31:02 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:33163 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfFSNbC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 19 Jun 2019 09:31:02 -0400
Received: by mail-qk1-f169.google.com with SMTP id r6so10917053qkc.0
        for <keyrings@vger.kernel.org>; Wed, 19 Jun 2019 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IfY7UkOJk1enmesrlZc0EoblOYuCkWRJG90oJ5EHAaM=;
        b=sMiLVXLZ+S12l+sbkJ2SP4xVbxZ+rIRIM/XpqmFvhoeVX4CfwBfvkCUTSd91sqXB3a
         CBEzOPSamoZYB7S9j2fXp6t6v5jZ0guYjEX6cuLfYyhvdOIWdUoZIdtlQuebRSZkKRZO
         Pf16YHzLcGjoVzBwMWy56ejyeMeCXEQxoNnxA3Tt7NHtcANIin//UROVg8DtfMSzpmDX
         L/LwVUXIuNYiqH3voGdf/KA4XqA39DFaq0JvQrPbNekaVBvYKtRgLyVbzoP5IAVlz81Y
         bV/QyJQ0vQbWtnWHZ+Kr2fQMhD22Cy5+8a/XCd9uGMAkfdylEX01xGhCHZkehEYP0x9f
         nU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IfY7UkOJk1enmesrlZc0EoblOYuCkWRJG90oJ5EHAaM=;
        b=oPX/6G2P9WANRhsD1w3XhdM0o4W2LbmqUe3EFBOYbC53IbKO9WBVbNeaJk1NvP8qSA
         xz05IZsP4aPC4R3VNmoYZMQeR6eRyhW7FE3E4JAch3qYhZLHGtGuPUqwTgZnraI2Gpao
         OwziSGXzNPxUXjoOrMid0TNkPF2ssb3+Fia+vOCAOyM9R4C9QAzFQctKEb5FxmPbEzpC
         3RB6zXBeOwNHzAQT4NE84yPHY1CGIq6ZEIvTMZzThGjfpQ/ML/ch3N4Xl6HspA7Kj2T7
         xvjXif1dSeivHcsY9QDOBd7bEeMMZELjq3aTV5nJV9miod273O0a14lzmnmIOG0ZnY9R
         +gfA==
X-Gm-Message-State: APjAAAU7Whwr9Xy5ITsA0U8gD5ryvDlxsV8GwwL9HToR0MuY5lF+5vq6
        o6rNWeP4EcSI6HfxUnlrzxfEhxvM
X-Google-Smtp-Source: APXvYqzXEKVAOXlVRGevoFAzSWukntGuM1W5Y/9Hmp7JPCfa+m/TxH5wfs+eafrAei7sSGjrGssPnA==
X-Received: by 2002:a37:6b07:: with SMTP id g7mr99281672qkc.217.1560951061165;
        Wed, 19 Jun 2019 06:31:01 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id s44sm13136650qtc.8.2019.06.19.06.31.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 06:31:00 -0700 (PDT)
Date:   Wed, 19 Jun 2019 09:30:33 -0400
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: Re: keyctl_capabilities and buflen
Message-ID: <20190619133033.GA11027@rotor.kitware.com>
Reply-To: mathstuf@gmail.com
References: <20190605130247.GA21275@rotor.kitware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190605130247.GA21275@rotor.kitware.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jun 05, 2019 at 09:02:47 -0400, Ben Boeckel wrote:
> I'm looking at the implementation of `keyctl_capabilities` in the `next`
> branch and it's not clear if `buflen` is the size of the memory pointed
> to by `buffer` in array size or in byte size by its documentation. It
> seems to be the size in bytes by the code (the &3) could probably
> warrant a comment to make it clearer that it is related to
> sizeof(unsigned int) here). This seems very odd to me, or is it just a
> common kernel pattern I haven't seen before?

I see that this is now `unsigned char*` instead of `unsigned int` on
`next` now and in the kernel by the newest patch submission.

Thanks,

--Ben
