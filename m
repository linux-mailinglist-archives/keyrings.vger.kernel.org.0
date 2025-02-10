Return-Path: <keyrings+bounces-2394-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A735A2EC0B
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 12:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 111F77A042E
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C751F666B;
	Mon, 10 Feb 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="hF9/qC3q"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB81F63D9
	for <keyrings@vger.kernel.org>; Mon, 10 Feb 2025 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188690; cv=none; b=UefRNbpPcWeBS/4Yx/fuqKOKUDB4/kLYYGgBRl/Op6+jq/Cx757xWW8fS97WmTWlbTE2/qXMBCJjx+KU+OT1H37IaAvwho+caCqyFTN5FWABg3g21UUjk5Hv0zOLwfj4ZgwgbEAwm4TyBzHjZPnLyJpHVEqV1YR1wT4a//UzGDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188690; c=relaxed/simple;
	bh=as4SUiBKDJu7f/KIbNhAFDg767Lu1xis1B9Fm+JHYDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r4bOry6lMLZ+nQd31DZZwMWmXI+GXxRzyqm3LlJl9eiS5yjjjtm6q949f2JMddiq8kum1SA1QUe7/9PO3NEPxd7k8aFbwp/wSrT63LtL7mUjLsE6HGK7jVW0x7Pkk1R/N2aoZwvOLDl/2Z7d1987HW3amuAqkQLQYGFWh6UkHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=hF9/qC3q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394829ef0fso2868645e9.0
        for <keyrings@vger.kernel.org>; Mon, 10 Feb 2025 03:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1739188687; x=1739793487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=as4SUiBKDJu7f/KIbNhAFDg767Lu1xis1B9Fm+JHYDM=;
        b=hF9/qC3qvEkqii5v99lO+25HlASbdJiZ7L6PoI0wqTQP//BzHFo5utI/Oc/Zul/Rq3
         1Y23yhO94yahrt0YarbuS6KA57b41MSq2JME6u7V6AX+P1RrbmgJ7Er/Gw0wzjb9fi0w
         15e+iOaPku8YBDmpPMHKaLSUspkLdFmy8qaja+KnU5EGIEXFEScihNfN1gkDQSFwRMSP
         stfd4NrbWvzctso5rO/eBMoBugLAnlAXx9DF1679nl99G1qfyd/znFsazyD6spd9m7B/
         y2HOUmDmqaEZuPiJQEA2/jRHrh/RQLeMM08D39zPL9QfbT2N0iOZsU6Hd2NAvm12fYQ3
         SWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188687; x=1739793487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=as4SUiBKDJu7f/KIbNhAFDg767Lu1xis1B9Fm+JHYDM=;
        b=XuzBd9bujQIKd0R+f8kk3bCK8Qw5+yIOuwoaKax5QEK8ochuRrb01McMiyjkP/YbC8
         cbAYPddfeecEZOfTc3nsjVELSLq6rbl8mGCLJFvMYrl5MWHpYkRvZM/9Zum67Cb7cAji
         Z1Mmt2uwFjzJp7UEt10frVfj2GDi9NBWHJ7JVXh39Zrl+FiQFkTERagUpkhMK0oOkQ2o
         IGNpoySV128sfDUsVNMoqWUZRVLhAED9FEtEyiCgh92uLt6ui09iXx3rIF9994tjKSeG
         e661Nr9jDmeXZme1Hn4YAadHVbRXhb33hw4zj/O0kCmnIic4QUO23+YlmM6uDyAUC7pK
         8J/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYXnCEOnOXm5a5Rq+SZhaVqsvhiVinb6HGfQhPm3mh9xYCrTZ70CJUWJJ5Dt5KQvItmTBVg3oQVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVPzEMGVESfYcdzIN4OCBLaoY0YipCZp1GizQ1e8Fxn1drm7J
	nrLZy9vOP9OtFaUUuPpVYLRhKfayUrePFtxD+rz7bUqczWlVpg3GMuYWmFEziYY=
X-Gm-Gg: ASbGnctzkayu+pFpvKasMJKvxOEAoj6lr83ZjZBT8G9fL4QdL5JC9L4S3Y0NLVSNwY6
	GAHuoUni/XWxkMKRrppHkxQEOpx7YFTa2nEiUUfvTcQqRAytGJzwm5xxyU+DbkphLd3gY8a57LI
	TvbSDx2yO/SXOecQd8A/UYKT2i3teQkW/J40eBelhor2fw5nZFjBT4Dj71dOcxAkhYdIc1aTrQX
	zvKnNR4D3hRZ7+BwlHeIsZR4SGELxLJyk+i07i5dpBAG54NiPxc8nHD20M4FuxwPY1OYCc2nEsB
	CcyH82R0VBJRvvGG
X-Google-Smtp-Source: AGHT+IFEd0xQXpxBXbxhVrVFY+Z1GeZScw7oor+XBNGkufWYSsyj+e3PrFPwPqOelxgNNUVPM0WgUw==
X-Received: by 2002:a5d:6da9:0:b0:38d:dffc:c14f with SMTP id ffacd0b85a97d-38ddffcc5ffmr2071887f8f.1.1739188686752;
        Mon, 10 Feb 2025 03:58:06 -0800 (PST)
Received: from somecomputer ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm8905203f8f.9.2025.02.10.03.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:58:06 -0800 (PST)
From: Richard Weinberger <richard@sigma-star.at>
To: David Gstir <david@sigma-star.at>,
 sigma star Kernel Team <upstream+dcp@sigma-star.at>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>,
 SCE_Linux_Security_team@msteams.nxp.com, upstream@sigma-star.at
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kshitiz Varshney <kshitiz.varshney@nxp.com>,
 Kshitiz Varshney <kshitiz.varshney@nxp.com>
Subject:
 Re: [PATCH v1] trusted_dcp.c: Do not return in case of non-secure mode
Date: Mon, 10 Feb 2025 12:58:05 +0100
Message-ID: <2171670.G923GbCHz0@anvil>
In-Reply-To: <20250210114606.1593650-1-kshitiz.varshney@nxp.com>
References: <20250210114606.1593650-1-kshitiz.varshney@nxp.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Montag, 10. Februar 2025 12:46 Kshitiz Varshney wrote:
> There are multiple type of keys in different worlds, like
> test key in case of non-secure world and OTP, unique key
> in case of secure world.
> So, instead of returning with an error, in case of test key, we
> should display warning to the user and allow the user to run the
> trusted key functionality with test key.

We have the dcp_skip_zk_test module parameter to allow such cases.
Why can't you use it?

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y



