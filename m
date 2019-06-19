Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5BED4BC9B
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 17:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfFSPPx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 11:15:53 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:38719 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFSPPw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 19 Jun 2019 11:15:52 -0400
Received: by mail-qt1-f178.google.com with SMTP id n11so20304298qtl.5
        for <keyrings@vger.kernel.org>; Wed, 19 Jun 2019 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZKslD7Ltl+zI4WNvCRpRx4z5gZ11hHuVCJPpIcLONXA=;
        b=FK1fZWr7DFZeP4wmn2iNwiwZ1/x9Ock//61LCYS8gmw1bqvOjqupvgPqig0PvElMJh
         4LwyTK4pUgTuwrFCn49ZTh8PP5V6xSPpYW56njZx+YS68L4o4nKAxdc10JTjXVPGaDpz
         Nn8jEdBLh5DWk1UW2dDWBmU5pRR2fkkt0xpt4UPnChKgV2pLgyaDD0BEI4bntMtZdDZa
         n5xb2OWna4SYeEnAuDxg0RAxz8cxVvC5S8PBak8REQFRDuZdzLNzwpxBBEgS2FgIJ3Oc
         LTPHo9IqyjnZjZchgyrh1IuPdtL5uAUiF5OotHdK9CLUo2/ydApWJkdMWoJ65gHmtpvC
         dgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZKslD7Ltl+zI4WNvCRpRx4z5gZ11hHuVCJPpIcLONXA=;
        b=XZykgpWDBlgr4Cc9DguV7l7WVdiddvYHHN/7yAgP9E7IH9aUtIvn+GoG6FRclQ0H/f
         TsQpwelTiRX5yGPGzvOquBS67dUpuQdLUeJi+7+0t04Yw4BXp6a/jPZIM3frxB3lJH+6
         wxM3Yi8aacXaxRIDm8r01gsVq24pF0CcttaTq3GNLEbQKG7o4lnQDDyzBv9Y5geaqWy/
         4pwgkbvFCsqxdWNIAQc113MvK7F/TIW95Tw/s1I6BHdww1fbLZeIld8pO88f596NuKew
         togGnkLQzcsmSumFmwrrihQZPW6UY3oj7JvhOz16Q4jmEO3KnSaWKBaH/EJ1esZA+OiK
         /OKg==
X-Gm-Message-State: APjAAAXhlyQ2b/HrfVq+nUrEVQh3A/LAsrDzSiJQq2Wkrr5kCIjMeWT/
        DgtxfZLgYqJbrRsKdQk4cPg=
X-Google-Smtp-Source: APXvYqwffpQ57VGTMOGJUSZGgiB0+KXLWv/+k9vdISkoHLAAMVNXnCfgUTEC8LKyJBaNN9x5AeVpSw==
X-Received: by 2002:a0c:9274:: with SMTP id 49mr18519193qvz.119.1560957351864;
        Wed, 19 Jun 2019 08:15:51 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id u1sm14260771qth.21.2019.06.19.08.15.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 08:15:51 -0700 (PDT)
Date:   Wed, 19 Jun 2019 11:15:24 -0400
From:   Ben Boeckel <mathstuf@gmail.com>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org
Subject: Re: keyctl_capabilities and buflen
Message-ID: <20190619151524.GA29993@rotor.kitware.com>
Reply-To: mathstuf@gmail.com
References: <20190619133033.GA11027@rotor.kitware.com>
 <20190605130247.GA21275@rotor.kitware.com>
 <17691.1560956175@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17691.1560956175@warthog.procyon.org.uk>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jun 19, 2019 at 15:56:15 +0100, David Howells wrote:
> If you're okay with the patch, could you reply to it with a Reviewed-by?

I'm not confident enough in the kernel side to give such a tag, sorry.
I'm more interested in the libkeyutils patches which tend to just show
up in the repo rather than for review on the list (where I'd happily
give such tags where I can).

--Ben
