Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0084C45732
	for <lists+keyrings@lfdr.de>; Fri, 14 Jun 2019 10:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfFNIQ1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jun 2019 04:16:27 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:37112 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbfFNIQ1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jun 2019 04:16:27 -0400
Received: by mail-lf1-f46.google.com with SMTP id d11so1106225lfb.4
        for <keyrings@vger.kernel.org>; Fri, 14 Jun 2019 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sz21dcEmUnt78YNFfm6F9rMky982RcdT6miE7Kwy+xQ=;
        b=cgNaSFKwKYmVfImDO2DRLbyekomRK9qHKelIPfrEQAtqGlD1M55ojIBI7PTJXK6ig0
         VlSjky6WaPqSI113zdWaJbUUGusnixgE68yKeX0SUfDFX1Td0a8SkmoodjzeNEkMYBTe
         /iBHx4Smi1pAPuNhZiBPk2XbdRhx/Pp8pYRVXPdOv2IxSK1Xy2yIvxP1ZrJHm5CFjw4q
         ePBGvlF5iluLyr+9Jyu9BuoJDyoyVMZlKvYs/45e1ppUV5/2FZJO/uvy2N4J009is8qu
         BjaIGtSadmPLLgk2zxF/2WNL9qP65CHoWbydut0H7Nrt7w9gWhrmTAUWbaqfRnsQKfk3
         WiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sz21dcEmUnt78YNFfm6F9rMky982RcdT6miE7Kwy+xQ=;
        b=V0UVnbrRvXIWUgqChEucxevp8X39yTrQqQA5a+g4eHDRXg3hmBt3SY/GMNnOlTzeRb
         z+iTaFHfP77ubZenpaePuA7QlFLOnH6UrPsW+A7tuOtPGffNeOVQKPxnZO/4c/LmY4/0
         X3weHnVqdyT8Xds1xiGVqXX//OoITJdVubDrLInj4OCvkcZSK0Oma88bZftXIhWTV3g+
         lYR6/5aUoxXkaPoaIk+jb3EmS6TJvexb7I99zRuiVO+njkK6DOX5elZXAbKTGd4jFaa7
         5VUPX48i8e/NKDIqqR+pXTuvQC9rsKwcDw8VQU2vYd2RFiesPOMAkY1CyVhsQi5Sq4vP
         gzEA==
X-Gm-Message-State: APjAAAUUPg6GB2AXJr6xgG8paZOeXzKyspRN8xKpX6VJYGHPgBXQXrfK
        PdNGrSgpeAJH4OiXajIqi0RyLw==
X-Google-Smtp-Source: APXvYqz2SFwlCts58NJ9uhwjuLDS0BZ40ErMRTVyj9BXE6UW3BuzWyga/5vhM3jc6xoSbw4tyw5ZYA==
X-Received: by 2002:ac2:418f:: with SMTP id z15mr18332522lfh.177.1560500184883;
        Fri, 14 Jun 2019 01:16:24 -0700 (PDT)
Received: from jax.lan (81-236-179-152-no272.tbcn.telia.com. [81.236.179.152])
        by smtp.gmail.com with ESMTPSA id q13sm357761lfk.65.2019.06.14.01.16.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 01:16:24 -0700 (PDT)
Date:   Fri, 14 Jun 2019 10:16:20 +0200
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com,
        jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com, ard.biesheuvel@linaro.org,
        daniel.thompson@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tee-dev@lists.linaro.org
Subject: Re: [RFC 2/7] tee: enable support to register kernel memory
Message-ID: <20190614081619.GB9347@jax.lan>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560421833-27414-3-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jun 13, 2019 at 04:00:28PM +0530, Sumit Garg wrote:
> Enable support to register kernel memory reference with TEE. This change
> will allow TEE bus drivers to register memory references.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>


Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks,
Jens
