Return-Path: <keyrings+bounces-2823-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DCDAD611E
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 23:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95841886657
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 21:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5CB2AE66;
	Wed, 11 Jun 2025 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IDheiRYM"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4BC1A8F82
	for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676899; cv=none; b=VPvfix3yOtaqQ0zsxOy/+O5icfml6Cfjt/sfYKwBYo3UNMPZhsETfy3LERpa5NZW4XUE9erKWkWWRTGXrZHTDRxd1y8jdUWXqSbYrDX8NK37kL9Rn134xM/gTcIebCn8pExovl6l9EBZvySCObTInsvD9bna/jJ90BKwcoyB2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676899; c=relaxed/simple;
	bh=M6HxvA49p+fK8bp/m2l/SRceWAjSLs3kZZfYsnrgxUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P39yY9hTxyzKHJ3wQw8K+Cp41cbj4TTqRrylpO7l45V2q4FPUMK3Vb7dUYXhpzweT1ZDlbe9x6xJhx5kshnOxVYpUisuwnUGMZlAouwQwlhJnpRvt39pxCzQejxg9GccBh/DnCL/YvO+1eAIVIAGU1CGFBoKPghq3+L9Tuw8b20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IDheiRYM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso44558566b.2
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749676895; x=1750281695; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OgzdZm4+49mKePkx+kNZ7H8LSMYhd60zWxBKo/56OGU=;
        b=IDheiRYMdvm79GDWo6i147Df4PVx9VCdQIuxa8W8S9SGldnZByjhGn0Gup4I3TEn9Y
         7uz4Ics6k9YO4oFZQKGIDBeGck+F7QogI7LHCB0egXqr4MC9l8U78wFyCAEB6sThLrAj
         BWDcRWPBIXQiHtqeIrLvIzsAsMckQ35K+1G1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749676895; x=1750281695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgzdZm4+49mKePkx+kNZ7H8LSMYhd60zWxBKo/56OGU=;
        b=vizkxzSfHpLFKecTg8GpAF1dUaMq32xznwqPCjj+nT91sqlD1rPqi1GvkR/cNU+SaT
         YmlXXYIysHc5UMVIZraEM2z9UIn8ESRXrkrwp9hhlHIl9VyowXMiyii8bpHgpm3jUxYg
         jc6sD+xVctFrXkVPPZt7k5akv4W6hHsHe/qul+Zu3q7VCjyGdrEsN4a2d/lni7dEDFiA
         N28jpwALyFz5SkLvm8BUE6n6TleIUf4H4DxgVClrOOSKczetgYEgMjL7qRtsRDyO3KUS
         aEwgTuOIKWJxdR0/n58IlQcgRiTQB/9XLqaw49g5ut23rNEH3B915MmZZncDummEXuT9
         zNbw==
X-Forwarded-Encrypted: i=1; AJvYcCWVxP7b0WWLi5uQuh0GffOG3s8T1MvHIFK1QtF0S2ZvZ1oHqwpVmnuSkxCRxq3cdDf14kE5j9NNwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01RxkegT2wIWP9BZFfHEP43zz7CgumOl4z644g8t8KdMRufjY
	EJvmBv3joFNXEb7YLDuoD2k3ry7/974yNdvHwDXljQDuUwfKMWxPM7/VRwKNN/4o+ySSyl1IDCU
	SAu269WI=
X-Gm-Gg: ASbGncuwJu/+1yjzde2xsvfJggAxSmkMGPYCUaQGFHbD1NwKr2qOOduaCJdIq9iZl/i
	S4SGvXtiuzW6Fn/Y4qjxxBwXaRFCOUz7tDu8ItTvk//9adi48d5232M1YsxhumjOWjNpVJynKXU
	8PyYvAM/P2rxfwaTv53BcwvOZqI2A2lRhXi4WbsNob4nygmogkmW8PiEXxYwQ+wkP2XCdnOjRg0
	AghcelnqjdX+zFz3o5XDNfxKNwPJpLA57NtKgbml9K+B2QqNs8udUV2gwUfL++Oq2JTj0/aqpHC
	Y3BtqPpU4sp/ajXFywqk5XlsUvX2qnshdFPi6sz3l9qzoJkhVxSwADUC9+6IhDYw6Le9WDnzAYP
	VvzUkDg12mV2ltoxX4mCPCWvEIfYYk9Hkdrwk
X-Google-Smtp-Source: AGHT+IHHrn6Kf3UYScq/TiE7fWIwYYDaJeQs93AXIGcWiTtI7OxUTLg+qCU7YSLRESw5QTxpBamWZg==
X-Received: by 2002:a17:907:3f8b:b0:add:ed0d:a583 with SMTP id a640c23a62f3a-adea925a312mr65099666b.19.1749676895484;
        Wed, 11 Jun 2025 14:21:35 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb2219bsm12522066b.106.2025.06.11.14.21.34
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 14:21:34 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso618339a12.1
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 14:21:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm42gBHTCKWe3GI96rp8YpA40DpnF5CbFTRO26xliLyDHzVMD4hj5BG7mLzwhUS0+1YxEzqS7MHg==@vger.kernel.org
X-Received: by 2002:a05:6402:34c8:b0:601:6c34:5ed2 with SMTP id
 4fb4d7f45d1cf-6086a8d8175mr280985a12.4.1749676894398; Wed, 11 Jun 2025
 14:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
 <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com>
 <382106.1749667515@warthog.procyon.org.uk> <CAHk-=wgBt2=pnDVvH9qnKjxBgm87Q_th4SLzkv9YkcRAp7Bj2A@mail.gmail.com>
 <20250611203834.GR299672@ZenIV>
In-Reply-To: <20250611203834.GR299672@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Jun 2025 14:21:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgGMd31KshGecZJCupkGJQteupgk1SqswBsbHadMfpVhg@mail.gmail.com>
X-Gm-Features: AX0GCFtJBJ0_GDTJQXbaSb0DbKUaXWaGBcUByl4A2_DrwE75v36idPEAZwBhho8
Message-ID: <CAHk-=wgGMd31KshGecZJCupkGJQteupgk1SqswBsbHadMfpVhg@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jarkko Sakkinen <jarkko@kernel.org>, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 13:38, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Speaking of the stuff fallen through the cracks - could you take another
> look at https://lore.kernel.org/all/20250602041118.GA2675383@ZenIV/?

Also done.

Well, the script part is, it's still doing the test-build and I'll
have to make a commit message etc.

              Linus

