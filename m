Return-Path: <keyrings+bounces-3425-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CEDC7D4BC
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 18:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2AAF34FDA2
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 17:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34C3238C2A;
	Sat, 22 Nov 2025 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlWVCnM4"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A501C3C11
	for <keyrings@vger.kernel.org>; Sat, 22 Nov 2025 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763831949; cv=none; b=Ndcvrs1oi3eP2m4uNQCj/lbe7qYxt7AcuWwNwEpjAcs9Nk2qYVms/b5iY4dCWIKRDiLOK9o4zaKStsxiNvI3GnjUT+fYfH1LKRL905iRhZHVaFeT7CvsCkkjxwfNUvleQWZITZQ37FsYGpc59HCm7D5uUWwYHwB+hVVjy9+hoO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763831949; c=relaxed/simple;
	bh=YdVcIwGwKDh/6sNNooTobnWdLRFBymQDy/hqcAiUbLg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G4d5biTunj72aCAOFcscclWo5NGlZjyThX/H8IcKjXp3wZ/kV1X4mUWZxdna/ZWm+GVfMpEHzDPpie1txCnsICit6EJJGbkdxUN4cXKB26DO1FbYnxg922TZXbqlec4udTVf45oktLeF68baO2qbIYCjyY5Hxgju1buWsIkhFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlWVCnM4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-298250d7769so22736715ad.0
        for <keyrings@vger.kernel.org>; Sat, 22 Nov 2025 09:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763831946; x=1764436746; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YdVcIwGwKDh/6sNNooTobnWdLRFBymQDy/hqcAiUbLg=;
        b=TlWVCnM4nTfqURfZsmDv7A+sN4t+k5G0hkw315A6YvKGECZcoJIvTGAZIUt6Xx73Br
         91ZBfUFBJlO2ItrUb7yTjcPLErT6a+yUEQ5CPge9iU+5Se7KMyg+pPzwrhaGuyht0R3T
         2WBYZhw+ZktmDRM9aDX+WR7hozY9inlax+gpwojdL79D9IVBiQMgsXDdO8HynVpFwRZA
         g6zCPAFgkBCozbU/3vOaaWDFtU/MBFY2DcAXHvISPe8FxyPQTs2Mui6FOf2eCC/IYZKh
         iQ5QjrpYuMRaHiIyoD5jvHRg3AEXYh3sRQzSYwko5JfTVKG9P8QEwD5Pk7A+7g8IHuN3
         VD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763831946; x=1764436746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdVcIwGwKDh/6sNNooTobnWdLRFBymQDy/hqcAiUbLg=;
        b=VOoutzZFHvomI/sUNH8o2YTL738AcNPQbAVNdHHsYhqR34fJgYrGnW804m4uVww2zQ
         Vbvb04CrON1te8RTW5GIc8HNr3ezYWBqEokRd8wanbwFvhs5SE5mAGGi9i8yClryVyT8
         ZLk0GqwrEt+utcBh+lVkkYbCIZDQUKTonnFZkszh+6lqYd2UtW7CziS1W9crgyxpYtwc
         rABJIPC17mlUDIaVM+Yv46RKG6pCwMddHRjqEbL3X+xKjKY3lIPjvFWRPzn5RvprAEAC
         /iBoy6eFdxu6THXhcb2rm1P5sJULlXdR99lD1SM5TfnywvqQOcTvISwCO9HYJOla7Ug4
         o0Aw==
X-Gm-Message-State: AOJu0Yw4PvINlZMfI2zV728sQbnvE0jfiCo3Riii9ioCa9XKGeRjojlA
	/RxTvS6rKIQnE7mJrEvjoAeRMQk9hGj7fO1r/2+MMtpkIefr5C92mSBJ
X-Gm-Gg: ASbGncvFx6v0NaS0hAZyeHmyhOOWFv6mXk4ajo3MMoIcp19RWDaR8dWzj1dxo/AMSMH
	kwWM0NbR3S/dJm+8689mGJlHBCLPN9O7LqlBXhIwopmAQwKJKAVib4nmt1K2dA7upg23a8KBbzZ
	t3K8+OElzhgSlgwyu+xBfRDTQHj+VIA9TieuQiNSrvFoNE0yUIHbqHOya5oE1kN7beEDRMKhcFv
	dlU6N+JMG5fE5rXG/oBrD4vFTt21aj+dtkc7KE/2w8Yk9ZeUtFEEJfayiobO/9/u9UZAtOha1QI
	v3zdajP5xQ8sQiseXBuhUFoNfNgxCqADYJ1BDbAjeQmJ9Ajamo0A60xSkXhkyHYTYdWiAR/aTtO
	iwxgiSj9LTfY7NMzJdpG4++vq79wtkPrxes9dPBGe/JLvV9SrRzBsbPL9W3YfvopT9kiCHRiMXu
	OUv3Fi9QPN4mtlclY0rkA7WIK5AqdVDD5hu7n4EiHXQ2HN+m6YQLMtOAGuRA==
X-Google-Smtp-Source: AGHT+IHsrLiktElDl4VpBRWD7TSKCwrK/iXEsY4HhXbo8d2kQN4F0sY+95g5j41nDQTVNYF7qGlfkg==
X-Received: by 2002:a17:903:2c06:b0:290:94ed:184c with SMTP id d9443c01a7336-29b6c3e86acmr69614135ad.15.1763831946402;
        Sat, 22 Nov 2025 09:19:06 -0800 (PST)
Received: from ?IPv6:2401:4900:8fcd:4575:1ad3:3d1a:3314:cdd0? ([2401:4900:8fcd:4575:1ad3:3d1a:3314:cdd0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b7c5sm9536723b3a.43.2025.11.22.09.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:19:05 -0800 (PST)
Message-ID: <b296730415a6b4e261d431bc6adf864ed3b2a630.camel@gmail.com>
Subject: Re: [PATCH v2] crypto: asymmetric_keys: fix uninitialized pointers
 with free attribute
From: ally heev <allyheev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, David Howells
 <dhowells@redhat.com>,  Lukas Wunner <lukas@wunner.de>, Ignat Korchagin
 <ignat@cloudflare.com>, Herbert Xu	 <herbert@gondor.apana.org.au>, "David
 S. Miller" <davem@davemloft.net>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Date: Sat, 22 Nov 2025 22:49:00 +0530
In-Reply-To: <531dba90-247e-481a-a26b-2dc9e7927d6d@kernel.org>
References: 
	<20251111-aheev-uninitialized-free-attr-crypto-v2-1-33699a37a3ed@gmail.com>
	 <531dba90-247e-481a-a26b-2dc9e7927d6d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-11-22 at 15:25 +0100, Krzysztof Kozlowski wrote:
> On 11/11/2025 14:36, Ally Heev wrote:
> > Uninitialized pointers with `__free` attribute can cause undefined
> > behavior as the memory assigned randomly to the pointer is freed
> > automatically when the pointer goes out of scope.
> >=20
> > crypto/asymmetric_keys doesn't have any bugs related to this as of now,
> > but, it is better to initialize and assign pointers with `__free`
> > attribute in one statement to ensure proper scope-based cleanup
> >=20
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> > Signed-off-by: Ally Heev <allyheev@gmail.com>
> > ---
> > Changes in v2:
> > - moved declarations to the top and initialized them with NULL
>=20
> Why? This is not the syntax we want for cleanup.h. Either initialize it
> with proper constructor or don't use cleanup.h.
>=20
>=20
> Best regards,
> Krzysztof

This is the only one I missed reverting :(
(after the disc=C2=A0https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949=
c5c4b4da4d4f41d.camel@HansenPartnership.com/)

Regards,
Ally

