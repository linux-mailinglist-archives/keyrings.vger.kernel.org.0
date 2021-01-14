Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC2D2F659F
	for <lists+keyrings@lfdr.de>; Thu, 14 Jan 2021 17:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbhANQTT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 Jan 2021 11:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbhANQTS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 Jan 2021 11:19:18 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5F9C061574
        for <keyrings@vger.kernel.org>; Thu, 14 Jan 2021 08:18:38 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id j26so3858132qtq.8
        for <keyrings@vger.kernel.org>; Thu, 14 Jan 2021 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GZZCax3Sk4ZEK6KwnjsFpLNMUTzSsn7Z4GPXiXPrRRQ=;
        b=HLnNfD/BCHCWkoAlqX/vk6hJB0I/BZlY145ZFWpOCp6ZsjfStliI7phDq74KWKlC/Y
         /5pUjanleAY5AgMITdMMWXtELHVbqfZpkC8pZt4zZ1aIg9DDPxQg8v9E6duRH+PN3aEJ
         4YyAeZpcslcUFTJ4izRGW426scy/bgp45rcE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GZZCax3Sk4ZEK6KwnjsFpLNMUTzSsn7Z4GPXiXPrRRQ=;
        b=JSgtvCbSATgXSu/QVlFThdMDffldAGrZGEJd25v3dagH54F3eQIf/ubvJ11fMAlZUk
         5fLTCgz2Jswev3zLWyJjzvU0Slfp4N0+HW1yEjpHlycdjQ3n7TRy8MwoKJ5IAuGNFlTa
         vkuauKbq46AsMQ7gosXYFV6bqYqpAwV7EvKSWhDdCO+pYU/idskl/xxCjtzBLzrxVFBl
         9yftR3zJXgAkP4YJZLr9VOxvKMK83ENGbG4tZXbKWni5On64Y5e1H/SdpNlSoG5p1RSn
         A5Eybo2rneGnpZJhRHP4KXLecbNGZ1qlQb3gNkLTjL+XmaMUe5xFtRUCAcsk5N17qz1g
         pfTg==
X-Gm-Message-State: AOAM533ShtDUYad1kRKr7Mq6xyrdIeLIIVz8uotQfM3+0hXViAIiqf6U
        UOAevnHFAP8eqotK8foxdq91kA==
X-Google-Smtp-Source: ABdhPJy2OTnnOQ75i/DaSSKHleX/IA/Tv085c7wsjnr4CuIxN9CZ1bNEO/Kyg4RK2NM4zy3GqqbVVw==
X-Received: by 2002:ac8:7b56:: with SMTP id m22mr8023144qtu.380.1610641117493;
        Thu, 14 Jan 2021 08:18:37 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y26sm3206996qth.53.2021.01.14.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:18:36 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:18:34 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Andrew Zaborowski <andrew.zaborowski@intel.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH] keys: X.509 public key issuer lookup without AKID
Message-ID: <20210114161834.aog7ai7zxfs7awuv@chatter.i7.local>
References: <20210113142340.1963770-1-andrew.zaborowski@intel.com>
 <X/+5GkmrxN5WwTjL@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X/+5GkmrxN5WwTjL@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 14, 2021 at 05:23:06AM +0200, Jarkko Sakkinen wrote:
> David, Konstantin, any ideas why the patchwork is jammed, and how
> to get it up and running again.
> 
> https://patchwork.kernel.org/project/keyrings/list/

Ah, sorry about that -- it got messed up during migration last month. The
good news is that it's easy to backfill, so you should have all the missing
patches there now.

> I mainly would like to have it working because of git-pw, which is
> really nice tool for applying patches for testing.

Try b4, too. :)

-K
