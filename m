Return-Path: <keyrings+bounces-3168-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703CCBB9AC3
	for <lists+keyrings@lfdr.de>; Sun, 05 Oct 2025 20:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E5F3B54EA
	for <lists+keyrings@lfdr.de>; Sun,  5 Oct 2025 18:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC311D47B4;
	Sun,  5 Oct 2025 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="giKTBQge"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362419C553
	for <keyrings@vger.kernel.org>; Sun,  5 Oct 2025 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759688670; cv=none; b=KjmbQgb7g/Jgq0RwnEYMNC49Rlja6R+7arzS7kd4PPjCmmq/KA3BvNCKXS+4dZ7sMs8IbiPJG1DBABrzxYqnbdDtQYM2qCfey0jp7imHQ097mdTuLSp/e/4mNMf3wv9akrtKkyDM58E7Y2v9XzkrrBsnvTEXEgCavpR7lwg/IVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759688670; c=relaxed/simple;
	bh=9WjzuHBdxag7kq4Nilmq5RRZAta4IJxqsLveY2PxQo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1EFu2ddbCkGx7EacY4r4h98hEjm1iM6vbz2dXC4Qx2QvLNNdz9SpaVAOfifbzc74XFtczYMcm+q4vt7P5pYlEmw5wJs+u4a0/pLFbS+tWm/OLYbMECP8gmNuDSn4mPOVbBcbbV4t1fVySEebw924NVkZ1Im4EpnMH0WcZkVbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=giKTBQge; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3b27b50090so741598266b.0
        for <keyrings@vger.kernel.org>; Sun, 05 Oct 2025 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759688666; x=1760293466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wpo9TLVZT45BbNVhzNvMd0DcfN1QJDQZVUcsc3h68LA=;
        b=giKTBQgelJMv8HlzSf8xwLbFS65/lNgWtn9YRMEJNc9oTdvd6vnjl7OgWwpguQTiRc
         wOUy+vNsdL+yiw9k8TYte88zYuC4NG1Q/PxLePT9UU5XAep1uhtCgPAMTbYEJbFdCRH5
         BQWO6FAd93kmuQ+pgXDDr3+R4dClbuK7CjtQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759688666; x=1760293466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wpo9TLVZT45BbNVhzNvMd0DcfN1QJDQZVUcsc3h68LA=;
        b=Uwktowdl5EF+/SL8YPxch0WSxIrUbA5eTd7v8fhO+WxPttajpjMMrrmSyL7JAygmtI
         rwk7ySEC9JPOIhhL9vLfh6HkutpT+RprSD/ixLVaG16nv05gbwuW8TT3eSN7Zqlm6kT+
         KF0s5+v1N8pNn7DFQeBjV00sDfSP8ZE5rq43otxGGs+4P+oVHi7dZb2QBqzPodN7P6kv
         l3v547d+3CzNITHlBYSP4r3QU9+PV+yL7ANpngXEH1namUyhHXEGKIKIOPIqlN3xEz+e
         JCpnGoPH9C2ty/2MFJcG0F399lQn3SYM6/W+klAfbYAW5QkBQUINdrq6rMAFsmkbSGVa
         ukgA==
X-Forwarded-Encrypted: i=1; AJvYcCVYuSocs7kBeBUEqeokM3ibwH7G6gxTopz5TdoRX/qjgNnN2DiihrN/Yq8ZoK6YVc8S7ee7yoGHzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKxkuGEXM+uCYgHQzu2fGeOv3wwCW/s3fZqbtiQQ/YKeIk8rz
	3G6hjY/0sScj8CShxzit41oTa+MQpDQC03pVuWeu5UhrZMhHDmzQLrLVJCzhy2Osk+UcXw+6IA3
	/IcVAf40=
X-Gm-Gg: ASbGncuk+Y1zVWGz/ihEn8vjvQy/mTBEKbK7V2ritYUr+C3ypIb79omhUZP9h8MSokh
	k0Xu1LsJ1mkZY60YOdaFXIoEg6IEy759LUAh+7Svp36Yc/LZgXnZvp5oVkoJiDG+uF3PwUB2EWB
	YsjJQJkDjxdlhl6Vijm9eI3f+HVlxImfGPfSCt2z4Y4RBrM7x56bd5gM9cLPHpeJIG7LqRL1RW1
	LfLTV+e1TcaJDdDiNGFsSaMA1oK9F6GS++QAVZx+h9JpPtZX+AGu7gjT/ZLIkSP0dNmKRvg3Swz
	XWc3++n4VK5KS19OvnXpR77elviVpYH8OLVnsgz8CvXg8tL5cupra6wt3NwFpEVJF0fz7ZO1/C9
	MVLW0p6+r30qK0gKOGWtwk0uewYuJsvX2hKuYq3DdsrLhmF6aY0hkt5epLuJPje0VWl2bIfGK6C
	EsXP2RVwObSmCsXcGw4Ma/dRpGvtHmt6w=
X-Google-Smtp-Source: AGHT+IGsnLrdN22IRofHME7Hh6F6UK8eaN4v76kaOU2952EnUQ/E0TqPQ3Rz98O9vs1MYs4sK9suiA==
X-Received: by 2002:a17:906:c14c:b0:afe:764d:6b22 with SMTP id a640c23a62f3a-b49c1a76659mr1203829166b.9.1759688666435;
        Sun, 05 Oct 2025 11:24:26 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e78242sm960603066b.35.2025.10.05.11.24.25
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 11:24:25 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6395172532fso4548990a12.0
        for <keyrings@vger.kernel.org>; Sun, 05 Oct 2025 11:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP72CF9t+Mli3a82Zj1/oeg5r/I8eR1ff41TQI6ci+WMsgKshetXFLD+ZEKWlWFua/jMYWf/EhJw==@vger.kernel.org
X-Received: by 2002:a17:907:2da6:b0:b3e:ac8a:b1e1 with SMTP id
 a640c23a62f3a-b49c27518demr1450075066b.27.1759688665152; Sun, 05 Oct 2025
 11:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aOKTFv1vh1cvvcLk@kernel.org>
In-Reply-To: <aOKTFv1vh1cvvcLk@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Oct 2025 11:24:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whSe9AGigVydkwo=ewE6_GFTJ_rU=XzO=v1N1sWyfVmAw@mail.gmail.com>
X-Gm-Features: AS18NWBWjtRNMqiFhMnbqxI4QyLpCSEY68UKMaGvljy0AnFZ4D7Y6Tta1dBrPrw
Message-ID: <CAHk-=whSe9AGigVydkwo=ewE6_GFTJ_rU=XzO=v1N1sWyfVmAw@mail.gmail.com>
Subject: Re: [GIT PULL] TPM DEVICE DRIVER: tpmdd-next-v6.18
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, 
	keyrings@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Oct 2025 at 08:47, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> and apologies for this late pull request. This pull request disables
> TCG_TPM2_HMAC from the default configuration as it does not perform well
> enough

So having looked more at this, not only does it disable that
TCG_TPM2_HMAC, it does a lot of other things too.

I really am going to require a better pull request, and I have thrown
this one away.

The exclusive access looks debatable to me too. I think you should
also require that the open was done not only with O_EXCL, but as a
write too.

Exclusive reads do not make sense.

Now, I certainly *hope* that nobody has /dev/tmp being world-readable,
so it probably doesn't matter, but that new exclusive access thing is
very different than what the code used to do, and if I read it
correctly it will also disable the kernel doing certain operations. So
it needs to be as limited as possible.

And damn it, it needs to be *explained*. Not have a pull request where
one single line is explained badly.

             Linus

