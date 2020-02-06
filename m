Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA68154CA2
	for <lists+keyrings@lfdr.de>; Thu,  6 Feb 2020 21:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBFUJM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 6 Feb 2020 15:09:12 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:35345 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgBFUJM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 6 Feb 2020 15:09:12 -0500
Received: by mail-qv1-f65.google.com with SMTP id u10so3475359qvi.2;
        Thu, 06 Feb 2020 12:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wSUcqZOKcJBDGAqugVgii/8pMY4U4spSnTw3NVFJU/g=;
        b=kuUiSonA/JF14yPtB328dGv2ZFketNfYeNQToJMcG/Htw4vUokh3dj+dIHt0d0Yon+
         0CR60f+DsLaokT9YM/jfr35pIDhiKmrLdd2uADpC1Fwxb88MptMZ7Zk/RKqvtWLJcNSJ
         8ojHpwusmYv0qotY1UWZQ46vFY8CyK6DFdkrBktAL8JY/PV4RaEYlGMdjaq1Xskq4Sab
         H72yOwkrQogyoU2oz1cLvPIS3nQ5TkLlJ8JcK+xyM2zEK71oyaQ44X6l2c4Xykt6BI0m
         fsG9HJaBVgMORnnnvf6q7QhkppKUGfm5T7jSSO4bKxDu1urzK5BQgO/pYX46oyapK8Qk
         v46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=wSUcqZOKcJBDGAqugVgii/8pMY4U4spSnTw3NVFJU/g=;
        b=hP5jGO79NWR3UhIx6lL+i1wvXRdMFVNg7xjdobRBhOWuAPNAnjyZSEoPkjtRbckMR1
         VCab6ppak8exVBL6RKBDJtLxKu4g4A7LdBAFRn4bAOT8mTkSv09u5eZt/xcfLDTOx6NY
         LkfqpULuLK5EmUytScHekrtmktdqHGCxjKMlz4/hFPftGAaZ+zD3f0bOX3Jx1oHOIPHB
         VVQOB9lk7hv6YZUuAfRkGUfGQ0F3DXEwHsVVsyaWCojNQelQSDkahFmb5m+r5mtgbGYH
         4M9L1NVO7nSLQsKr4SvrEduuTC9hIr2q2SdpxSuC1VI/sO7yoiHLWy3fRcbTDpemEIxL
         tNyw==
X-Gm-Message-State: APjAAAVt2CBLjSIBL2E1+0whSa25+D0HgQoEvkrBev9Ubf2hBjf7EK9R
        kXs1jTkq4xvaIVgcLzId61Y=
X-Google-Smtp-Source: APXvYqwtAGA5HmBkm4221OA1Xq3lblCEh7YX9e2NpzpIrAsVtjFxlWi2C30mv7+gD9ez+uzWx96O/A==
X-Received: by 2002:a0c:9c86:: with SMTP id i6mr3903089qvf.214.1581019751108;
        Thu, 06 Feb 2020 12:09:11 -0800 (PST)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id h8sm180826qtm.51.2020.02.06.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:09:10 -0800 (PST)
From:   Ben Boeckel <mathstuf@gmail.com>
X-Google-Original-From: Ben Boeckel <list.lkml.keyrings@me.benboeckel.net>
Date:   Thu, 6 Feb 2020 15:09:11 -0500
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
        keyrings@vger.kernel.org
Subject: Re: [PATCH 02/11] docs: crypto: convert asymmetric-keys.txt to ReST
Message-ID: <20200206200911.GA2830394@erythro.kitware.com>
Reply-To: list.lkml.keyrings@me.benboeckel.net
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
 <1b6cd1da02dda27a725a6c4214019a1e306a7927.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b6cd1da02dda27a725a6c4214019a1e306a7927.1581001737.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.13.3 (2020-01-12)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Feb 06, 2020 at 16:11:21 +0100, Mauro Carvalho Chehab wrote:
> - (1) If the criterion string is of the form "id:<hexdigits>" then the match
> +  1) If the criterion string is of the form "id:<hexdigits>" then the match

This update was followed in all the enumeration changes except…

> - (2) If the criterion string is of the form "<subtype>:<hexdigits>" then the
> + 2) If the criterion string is of the form "<subtype>:<hexdigits>" then the

The whitespace here doesn't match up. Which is preferred?

> - (1) Signature verification.
> +1) Signature verification.

Here, the indentation was lost too. Is this intentional?

--Ben
