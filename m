Return-Path: <keyrings+bounces-2988-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFEBB45C02
	for <lists+keyrings@lfdr.de>; Fri,  5 Sep 2025 17:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D52A17BC5E
	for <lists+keyrings@lfdr.de>; Fri,  5 Sep 2025 15:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C9215D3;
	Fri,  5 Sep 2025 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I8/t02kD"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F231B81D
	for <keyrings@vger.kernel.org>; Fri,  5 Sep 2025 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084982; cv=none; b=hR9LZNKPpymsRO808Ny5oQWNvtRlV26+e0hJ18gzT7ugoMlHRsyVSDr+5FIpPMJ1WmoitR8Vv5RCt9In1L+E2m+VddKXGglPDkDvV7B+9B207GP4/1Xb5Fa0ndBBsQDM+fBIONAFjkv380xkGbzV3zPw9MC233t4xNMnXfjoSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084982; c=relaxed/simple;
	bh=dFdVomeaxD4LPhyoEmMyXlkg6qCcKVW87KQws4WwyuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkIpkGuXCzyIjE31c4bSDgWL0ZQoftY4VK1nbg4z5knDqxs5MQ8HFQ0B7CRjkTru/Ggo84LZRHqLMt5wlGmqso3ZFpW4F05l7PuNd2znFQaRQU85Q4TyNEuhteG6sD+/JksSglXRmdgkgHIn4tlc79pVBQ2ImZFujSjqajPZyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I8/t02kD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24cca557085so169005ad.1
        for <keyrings@vger.kernel.org>; Fri, 05 Sep 2025 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757084980; x=1757689780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFdVomeaxD4LPhyoEmMyXlkg6qCcKVW87KQws4WwyuE=;
        b=I8/t02kDYls1rrpwAmxAWi8JdyOA4wccts+YEjFZuyf0FJ/84NJzq1V5B+h3agBL9f
         R5Xjpw9MNrNYzFmdYjQwQfoHm9F13dfHursuLcEOkazXJkOsDNdOutrTFpfsHAJaD7dg
         N1C4cpKAVeuP079/xWoZuAOXagGIKuAk/V6sGZ1Qy98X1X3hpNMUoB6EDHc//YkS4U1S
         yr4qx6RdNWouDWSTwtrUpU5E7/8S1aZ+2JLYUqLAt56BPbhyHOkaQhCFbZuQT7tx7eBn
         QQ2vtqFUxwoD07rCA+a8/3oe/s+p6/bpep3L5M51vsQ0KAlZ9Y3/VaWlhiCI79YSCPZT
         uLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084980; x=1757689780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFdVomeaxD4LPhyoEmMyXlkg6qCcKVW87KQws4WwyuE=;
        b=mO7bLRQq19SAABt2OL5oZK5GQMjwiZwJkrWKbHxC26xkM6ig6S6mdBJ6PdrD+QOdVr
         qgn5N/Lsup9Ty2S79naIXXhwH+RC1hQuTVI/x4XIaFjYiiao74YUL/7YAqtYeJaYcGqa
         YUUacJiwTUSX83B7ZMOuq6uSo6DarB3iuF6FfP9eP804BS2KIFb31sjtraDXpHxMynKA
         3LAtfsM3/ZnIlSth/wXM4uCpbsOF6XfEwtPTPMMfiZdvJG15U/I414FH9oSSdhZ6nsm0
         3v+7Xxt4JzvaCr7kgitVB68L+0RzVHb8sd0t8ZS2g6XUk2EdM2Ts6SJgpRqyQf3Z25TH
         QdqA==
X-Forwarded-Encrypted: i=1; AJvYcCWfOHUdFZaHocW+n+ciZZumkpB3zaYlRvW4efsOmfv6wATWTpQE9MEH/4XhzuvdekDvtZBdvY0FRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNo93UTR93yTywnu0yF0pcZu0b0+Fipre6+gij6Mx39ww5W/wE
	UE0B0AP/AkROvO39SLiZ1PUb58bKwSTcHxokesPIrE4RzUkc8DSVtr3rslLol58vosc0idk7KeR
	eSBXytb4wrEHE3PuCdGiNiq3EQ68P7YKHhSIlMqxg
X-Gm-Gg: ASbGncswHE6QM+eZ3zw21PmHIrMuoGkSDKOlGyF75ZGrPpc7mBJ5YrEU5SKE6uB57Bd
	V+2Cz4d1viYxOeqmvYAm7BeGXH+ckst+IhOPoYWzM3y53ZxboHDcUwYydeCu/ZVX1E4cjvx8hdd
	bws6MNot6xuiow1/geW8Nuis1Wjdjak6Twt3k0FtEiSx7VNHozT+VxpW3nfJ1jPWGekmV1WV0mk
	ljMtGYrJbaNEulqRbpHBTIPFU5Jw6mp
X-Google-Smtp-Source: AGHT+IFigRlugHFu64XYH5E1HhI8NlSyNuAc3Xp90gTVTmK4u8CmaCMLRItGgVFLK1yt7YLP9pFW/NA0U37fFcFhCUQ=
X-Received: by 2002:a17:903:2f85:b0:231:f6bc:5c84 with SMTP id
 d9443c01a7336-24cf5c29233mr4503325ad.8.1757084979941; Fri, 05 Sep 2025
 08:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a40e660e-5a45-420a-8d37-51324242ab9b@kzalloc.com>
In-Reply-To: <a40e660e-5a45-420a-8d37-51324242ab9b@kzalloc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 5 Sep 2025 08:09:02 -0700
X-Gm-Features: Ac12FXwsBG___TZgBCnwrUiXvtQzs6bTFvY2gqQx0WiC1kXwGKAPta7iWLhYPhc
Message-ID: <CABCJKufSRmYnbjcwvhuGgC=xkyPgJyi7FMrAdDm3N0fun1cLAg@mail.gmail.com>
Subject: Re: [Question] Non-usage of PKEY_ID_PGP and PKEY_ID_X509 in module signing
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, 
	"Sami Tolvanen <samitolvanen@google.com> David Howells" <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, linux-modules@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 26, 2025 at 11:58=E2=80=AFAM Yunseong Kim <ysk@kzalloc.com> wro=
te:
>
> Given that the module signature infrastructure seems hardcoded to use
> PKCS#7, could anyone clarify if PKEY_ID_PGP and PKEY_ID_X509 are used
> elsewhere in the kernel? Are they perhaps placeholders for future
> implementations or remnants of past ones?

If you search LKML archives, you'll find some past efforts to add PGP
signing support at least. The patches never ended up being merged
though. See the discussion here, for example:

https://lore.kernel.org/lkml/20220111180318.591029-1-roberto.sassu@huawei.c=
om/

> If they are indeed unused and there are no plans to support them, would
> a patch to clean up these unused enum values be welcome? Or is there
> another reason for keeping them?

Perhaps the folks involved back then can chime in, but I'm fine with
removing these. I'm not sure how likely it is, but if someone at some
point makes a compelling case for supporting other key and signature
types, I'm sure they can add back the constants too.

Sami

