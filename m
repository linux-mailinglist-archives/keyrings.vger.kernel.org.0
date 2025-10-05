Return-Path: <keyrings+bounces-3167-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA5BB9AAA
	for <lists+keyrings@lfdr.de>; Sun, 05 Oct 2025 20:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB3E3A8BE0
	for <lists+keyrings@lfdr.de>; Sun,  5 Oct 2025 18:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA42C1CDFAC;
	Sun,  5 Oct 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XgT6lb7n"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723961C8629
	for <keyrings@vger.kernel.org>; Sun,  5 Oct 2025 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759687770; cv=none; b=Fi258eXegqQgzMnznD56PomhHr0Z6uzlF57SNnRvHquJ+ObQv+IaT/9U8ufXvsJa1JA4lOgv+XAvwbvotntQvemZhEoOFBNCB9ZZPxtDlox7/zaYCLVMe9vy02XVBZ2hQ31bQ1CJGTR+0p/HwczDyhLXAzAagcQmXEwQZUXlgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759687770; c=relaxed/simple;
	bh=camg0iKThq865GJUn9nyBstkvg6jbOfG+xY6ZZ721ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqHerkRXV26HYSLa4TK1OWAGkIuchAIifjzzvDsmv0D6P9a1L3tmv5D1sN4DofOIh6LIiQRvkW37K1zXfPtrIxLDA8e0mzq5MeLb5GqQNB1nG4OzXKDbJOexVbIOP/ghxiFXJip7IW7F+rS71onMMINwICGUG0TH5WAxpWiluYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XgT6lb7n; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b4c89df6145so149163166b.3
        for <keyrings@vger.kernel.org>; Sun, 05 Oct 2025 11:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759687766; x=1760292566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HywiWrZnA2plSPoOMy05VizUC7aDffpgiwOCnh4rnRA=;
        b=XgT6lb7nYX2FWcz9eNC493CnAFAzxPUNhWRBpzE6Wc0wS87ZcNi8lHMAIsLuHFGbi1
         6KrvObLdbzZQFvzQRV8UkXutuNzPCgJv+n2QM/U6oWjPekNuBNt5GjoUz+/d8gylWohr
         D6bocXrCxqOsllXkieMc4ZvSQUiR7kE67ut3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759687766; x=1760292566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HywiWrZnA2plSPoOMy05VizUC7aDffpgiwOCnh4rnRA=;
        b=OGY+AsV35so4o5mMtrG5ad4CoHS+08gyC/8LdeLyFf3cRLwzQW+UGmwut4PSivYsih
         9ufs5SGfpq9zB3CM8UqqbOEIUc/Els6/CNaJFedjR/ylI8To/ExsybXqjdxiunfdb3Ku
         ClScNyxKFVdhBdQvU84ivjbCTTM0syqHO6YcbsTZaMRGSA3QZAwrzvOzONzRusI56rn6
         /r2WHMsNxN4s9GxwKr3BrMdfCRGhRUStzFSfPcPPXM0EIf+3vDPRvr1p6PicPzVThBb+
         BN05GyuHVG3t3Dj390slw0iL8lLw1+nFpkxzjVgSzBVO2AkgvzJOk45DSLG2U6O3y8f9
         h4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV1kXvkD3zyXVmg38iNj6wILaiqrkCqNfM5JVgWgGmhZVCYNkC7ZnBepni4M/faZ48UsUC6Yby0Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzonOZR/M8mLRbM+5yLqNxzU+VgXUblPK5mdQGpR6+USSp7pyrs
	h77rdLYjXDKYdYnHOecXLEFX0FypTSTX90zuvNmHzk7jqSMeHLV0qYR7dMKsUeqmRXg2+Wg97nQ
	1ZNL/CRY=
X-Gm-Gg: ASbGnctBhCMyV7LKJAH6L1LkYjMhXyItUcd5KkOY9mCsuDEDYGE8DyxBN/UVgFQ0wB3
	xwOkghd3ATY4ULt0zZQDbrviKq7x2d5Rb9sd30fmVK5WjplEXzIPbfSjkc1fmPWCY2VQDWUgL9m
	vCFRCsm2P78ovC+w/IXvaw5vAPJSQvLWG3zM7WizZY9X4IUYqvDsUFJKhin9jt7jcVfX4re6PRw
	rQGRQ/dkAIWB21xWAgteqArezerLnWRmLc/i6GE6BEf6PGqmslADWVnG1O4BW+5B5KYCycsd01Y
	Pv0ziu0oxGXa8WjW4TMkDqO29e670cHyqKq6iyVStRbKZZLC5RrvA5EiepW1CsaTcZ4lZvtP248
	W8Z+DEplYyOKPiK/YEv629B5fAxlu+L3j49gNIGOyqHtWtdqWLVlK+szR46Bq52q/7Mbmxbklwi
	Jcrl1AF0Pu2tiQwnwo+Ed3qmO4h52WLIjfZMEOHc3eGw==
X-Google-Smtp-Source: AGHT+IHrZoTaBHgAEJbG2+AJy60frcqAX3cGTc4zWsnk5yt8u23C2rR7UXg5ce40+z5TzEKwrCuOeA==
X-Received: by 2002:a17:907:6ea8:b0:b41:a3db:a53a with SMTP id a640c23a62f3a-b49bedbe579mr1210748766b.0.1759687766459;
        Sun, 05 Oct 2025 11:09:26 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9bfcsm961653166b.17.2025.10.05.11.09.24
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 11:09:25 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b27b50090so740169666b.0
        for <keyrings@vger.kernel.org>; Sun, 05 Oct 2025 11:09:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU26Gs3r63kiU3nv48VZexc8yo2gx2urkT0gB5q5L5tOq4HVPmMKVng5UfpQ3s/jbROx688nb3t0g==@vger.kernel.org
X-Received: by 2002:a17:906:d542:b0:b48:44bc:44d5 with SMTP id
 a640c23a62f3a-b49c407909cmr1225542266b.43.1759687764580; Sun, 05 Oct 2025
 11:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aOKTFv1vh1cvvcLk@kernel.org>
In-Reply-To: <aOKTFv1vh1cvvcLk@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Oct 2025 11:09:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiCWiDcLEE3YqQo78piVHpwY2iXFW--6FbmFAURtor2+w@mail.gmail.com>
X-Gm-Features: AS18NWBEWs0_aNhsaDpKimWKOjw3bWPdM4hwd_m5NImN1ornADwAqfSmAg4O0Zc
Message-ID: <CAHk-=wiCWiDcLEE3YqQo78piVHpwY2iXFW--6FbmFAURtor2+w@mail.gmail.com>
Subject: Re: [GIT PULL] TPM DEVICE DRIVER: tpmdd-next-v6.18
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, 
	keyrings@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Oct 2025 at 08:47, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
>      This pull request disables
> TCG_TPM2_HMAC from the default configuration as it does not perform well
> enough [1].
>
> [1] https://lore.kernel.org/linux-integrity/20250825203223.629515-1-jarkko@kernel.org/

This link is entirely useless, and doesn't explain what the problem
was and *why* TPM2_TCG_HMAC shouldn't be on by default.

I think a much better link is

   https://lore.kernel.org/linux-integrity/20250814162252.3504279-1-cfenn@google.com/

which talks about the problems that TPM2_TCG_HMAC causes.

Which weren't just about "not performing well enough", but actually
about how it breaks TPM entirely for some cases.

              Linus

