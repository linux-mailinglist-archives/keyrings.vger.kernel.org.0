Return-Path: <keyrings+bounces-2800-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994AACF120
	for <lists+keyrings@lfdr.de>; Thu,  5 Jun 2025 15:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA77C7A99F1
	for <lists+keyrings@lfdr.de>; Thu,  5 Jun 2025 13:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FAF25EF86;
	Thu,  5 Jun 2025 13:43:30 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D025E823
	for <keyrings@vger.kernel.org>; Thu,  5 Jun 2025 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131010; cv=none; b=IiLAM1f2NkAhGK22A7NRMdsXgCRKxFs+Ur+Gc9M1/EN+iiAMTiNKqFG/uVG4mDhd5oPoahGrLZLFgs2vNzLlLIXGKOLSsqAQ9Jdd6+sUFszXZTbHuHFR04nTNogG32L0u0xICxYlYAaCSNAWftXb/jmxYf/uadviOEGDkZrcU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131010; c=relaxed/simple;
	bh=Ibr9kab54z+bb8Bbxb6yjOzT0aoFx9OQrLydi6uSjbk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g1oTPqr5CKjDOxqWC1ZpqrUP4TduxR3pDoF0Y2gii/wvOiJkDDGB/02rq6ZxGE82/3SI42r9vgKjLoJo7R3AEdkWSGLkXCArJ+1TLwa75xfcP+O3wvps/EG8RjcWeu6k/jCnZR3pWTNzyTGlDqCf9xhTZGBbuBmkrmQ3KLdmFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-jjSwSzZwNQ6Jg0JmeokSIQ-1; Thu, 05 Jun 2025 09:43:26 -0400
X-MC-Unique: jjSwSzZwNQ6Jg0JmeokSIQ-1
X-Mimecast-MFC-AGG-ID: jjSwSzZwNQ6Jg0JmeokSIQ_1749131005
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so433213f8f.1
        for <keyrings@vger.kernel.org>; Thu, 05 Jun 2025 06:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131005; x=1749735805;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyJG+3VB/l9E5cKEG16NYCx4C/OXUyDFX/570MgrW70=;
        b=WCrRRZkEbyk1Laj12izUpv4sFOTz+Gc3xj3+FVdAQEpMME7/mxmy+u8NTlaZwIe07f
         1iMFHT0kxd6tYQsv7CjGAsbWcyqanbdC/p9B42wQRJiaCExkfJr3xp5E579zx15uFPQw
         cAzpznrSM5bbX3PqHKin9e8rPbCKVp99S8IprcUCR3A0xwLe4MvEIedN95GJll8Pzk46
         HNBd9Rrq1V1Xk1qtemmbLjSxEliI9//pC6EflYipWXMRIOfKCSgXZI2K4xKPK8dv6c/W
         Dye9L/+jgUuVXfXh3OLA4MvUWsuxBq10vupGMisDnceDHXuyZJjyCuZULjKDtSTltd3j
         lUZA==
X-Forwarded-Encrypted: i=1; AJvYcCXQKRwAj6Tymn6OskUmYLjaddT8CCNzF4bkPBPcyjJlzOuly8cV+wSOWZf2w1wZ6IojGTUTEPJi4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvjPWwiyaEwmLRzfyzmGavW68wRrJX//7lB1jAZBgsIl32Stxb
	YubSQdgATRsQW1AidZqmi76YxX6LPS6OjjDv+Vfw2WhcfMi+KJ6OW50Ghr5DUMHa6xbqDm4XCuU
	84PThy2ZOnatP+U3twj84zPBpadVqDqGbOebhqT82jb8IIBIGs+Zv1FpZ73JS
X-Gm-Gg: ASbGncsGfvGOAMDwmCdv0eIJI2mwNvSfDBfAy7UR4r7xSPWBEUb3mNVOa9sV9F0soco
	DjC5HmGdC4yhQ8czksCKVHr722y9InCxneTDrOjeuyzM+Lh98+Y6KKegx/dPrH6Y1ak7dzU6xJ/
	0If8E1VS3I8yxQA610hOwWo42f8qiOEf2Q6LJruCQzTbZf9zZVrROpa4IogSeACB5ro0mGLebop
	BP30lzUWvIS1VDqQVHiC2qD9ZgqiECAbY0cvq4WVdCISSXZ1f7nPKSG0yLIIXe1OQMAQ3VyNsA2
	Y5LP3GU=
X-Received: by 2002:a05:6000:144c:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3a51d97408amr5757696f8f.58.1749131005265;
        Thu, 05 Jun 2025 06:43:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH06+3a1Kbk78BFgL3ZwbDTDTsWsomlMTVTUM+GFt6c6uDgEbkD9kGtXYidxIou37MFPIzdSQ==
X-Received: by 2002:a05:6000:144c:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3a51d97408amr5757647f8f.58.1749131004775;
        Thu, 05 Jun 2025 06:43:24 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8f0sm24267394f8f.6.2025.06.05.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:24 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Eric Snowberg
 <eric.snowberg@oracle.com>
Cc: "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "linux-integrity@vger.kernel.org"
 <linux-integrity@vger.kernel.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "keyrings@vger.kernel.org"
 <keyrings@vger.kernel.org>, David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Peter Jones <pjones@redhat.com>, Robert
 Holmes <robeholmes@gmail.com>, Jeremy Cline <jcline@redhat.com>, Coiby Xu
 <coxu@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 0/1] module: Optionally use .platform keyring for
 signatures verification
In-Reply-To: <e4e838d03b3619df5523d429e0cd8160a8aef9f8.camel@HansenPartnership.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <0FD18D05-6114-4A25-BD77-C32C1D706CC3@oracle.com>
 <f0b37bc55ed3c02569c74f0fbdb6afa8efd329e2.camel@HansenPartnership.com>
 <87zfemoc76.fsf@redhat.com>
 <e4e838d03b3619df5523d429e0cd8160a8aef9f8.camel@HansenPartnership.com>
Date: Thu, 05 Jun 2025 15:43:23 +0200
Message-ID: <87tt4unw1w.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Thu, 2025-06-05 at 09:54 +0200, Vitaly Kuznetsov wrote:
>> One additional consideration is the fact that we already trust 'db'
>> for dm-verity (since 6fce1f40e951) and kexec (since 278311e417be) and
>> especially the later gives someone who is able to control 'db' access
>> to CPL0; a 'db'-signed module (IMO) wouldn't change much.
>
> Well, the kexec case is because kexec has to verify the new kernel as
> shim would and shim would use the UEFI keys.  The dm-verity one was
> added for a cloud use case by pressuring the maintainers in spite of
> the objection to using the platform keyring (it went to dm-devel only
> so not many integrity people saw it):
>
> https://lore.kernel.org/all/20240617220037.594792-1-luca.boccassi@gmail.com/
>
> The point here is I do think the cloud use case is legitimate, but it
> can't be supported simply by ignoring the bare metal security domain
> separation concerns of the integrity community.  The argument that
> distros have done it so it must be safe isn't really a winning one
> (especially as there's no clear explanation of why they did it).  So
> either you need a better argument or we need a way to support both sets
> of communities ... which is why I was wondering about a runtime
> differentiator.

So far, I got two 'runtime' ideas:
- Observe MokListTrustedRT and distrust .platform when it is
non-empty. This can, of course, be combine with a Kconfig for those, who
do not want it at all.

and/or
- Sysctl toggle. Keep things as they are by default but make .platform
trusted (either for modules or for everything) when switched 'on'. This
can (optionally) by combined with a previous idea and have e.g. an
'auto' state for the toggle which follows MokListTrustedRT.

-- 
Vitaly


