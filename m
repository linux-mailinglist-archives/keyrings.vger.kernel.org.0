Return-Path: <keyrings+bounces-3199-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A4CBCDE0D
	for <lists+keyrings@lfdr.de>; Fri, 10 Oct 2025 17:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2327018868D0
	for <lists+keyrings@lfdr.de>; Fri, 10 Oct 2025 15:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2B9265609;
	Fri, 10 Oct 2025 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IUsnIUQf"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C73261B9A
	for <keyrings@vger.kernel.org>; Fri, 10 Oct 2025 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760111494; cv=none; b=eOYBQTalWO9Bf4WfTfuNiK+zYf81e+mVzDcpQAdHjzrEJUbl542WBilax8jscckjhcYPUKLROtj3MCFx214g5R+xiXvJO9ehua0Dwt0SiYE/Ri2iT5KM27qcw4Dvfx0Cp843diAqqYR52ojMXfY3GBvnt0NHVj7T2iop1Pl4olo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760111494; c=relaxed/simple;
	bh=XDEDQFIBQ5A8m0eHH6XygH67a3FLRj7kfzfNZO/Y+ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luhAGutpJLXwDCg/peeaUiYK+PiwuqVdWUKVvN1xdNIQ/VKAMzfZmbLKXXx+vSRJB+GaJTt1o2782YfAJMxRieARm6GfYQrPttEp6xoFjYpWN3GncMP6CjWLxPyYO0q0jkI8gJYGZs81BRAeUwtHnOfwbtdr2VwzucVXJ+8QNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IUsnIUQf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so3243964a12.1
        for <keyrings@vger.kernel.org>; Fri, 10 Oct 2025 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760111489; x=1760716289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMHZynW42pdW0SGBO2CIy8IPA/iqePnhTXX2tj/DjpU=;
        b=IUsnIUQfXPHwcPeMstYA2G+w5JgLMzTu4+4z4ADTXj/VeOWp6pHVNFhgajFOlKp1g5
         wMG9SMjGqPIDFNMkuqHmN1JmlsN431FZtQ3RBJKnyJdawclOioF8WmarpcZrSYHALAUr
         UnQ9chlZHbYaiwMsBnNUqfDyFSApMX+PmADEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760111489; x=1760716289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMHZynW42pdW0SGBO2CIy8IPA/iqePnhTXX2tj/DjpU=;
        b=E13phhMzJbMMgozZaYcO9E3ZdEEQfdLCtlHPOfj/rNH5d8K8vyhoFy/OZI3mzOdktu
         M5dKNG0orZ0JkjB1KKQfDrTl4AB0m8xm+mPxG1w22qj1bmCRWw9YMYSi6QflR/4E4CVC
         ebgU62EbsKVJvxWf1UDf8KSqgcSeRjHcvjGLltjahMxDk6+fC6ebUxwR46WvUlFsI/iC
         onnzgQ/8bzcBBZgqybUvAV9bcwq85rdep9+7oxZrPd9wDf5yKGI1G+suvPwR0hWDaauD
         8YjywyH7YFXSjzeULgcjQtzIV5OyOFu/INddQt5WrRu5ZbVja7tVA0yeE8kiOHZI4lmm
         MSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/xflwvkyeC7YJzp3TrpK287gTtlDp562hD0W0rrwnjLh8KWgRW+qjKONBS46ktCwltdBcrEXv6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1CxVqY9kyj7+lXmdkR6uzS/nuRUNESCidEKiBJr9IsbaEg7L
	8vWDRZUu+NjlTnbev9xeQe+tdSxUL4BF5RjS95pp2No+M1eXOjDJBP7DtQKUIVzFlUQcc/F/MCb
	8qby8eOs=
X-Gm-Gg: ASbGncsYaXy5Uwkz26MGj03BWgyRTHMc89gz0+QVT40kXHCjo+W7w1pCVTawvdR0jmz
	o6q5dgz607IStaJiqmwh37mZLYP/qtAAOV/9vO+MrTN0yglpJZvrrsNNNigCvXmzS6WsuGv2yWM
	WTtrbs8kwD+VO0N5dn/XCQXCFfQgqeAZ1QMUj46PUyGzqyOMAIslbaB8s0I43BWcZSAILMccORi
	gebLZ0MXxsbI1JFmrKt4+TkseG1YknQj3xJTe0ZA6rj+eDcsb/16GxslJtmNbr9Uq7S9BkA+f1Q
	HXw9cjHigtqbqt27GA9O7MkRt2zrIFIH8D/hzST70slj8q3W694yX6z/f0VfJqCAPJJ2H4a5Dt4
	tL+jK5NfcAOhPmA6JB00mDYlxHHpecDk711AWT51UKhVD8+Tj3ZHWMevYppuSrlO58AQBa+jPWW
	0q2pG3gA/YAk9AVpPV3np5PxvQbA==
X-Google-Smtp-Source: AGHT+IE8NeHI5o9eOyOAlO+Dsu8URF3YP/2l2A45+l778MmB/8PaJvvOdan+yKmkG5+DKd5+j81Z5Q==
X-Received: by 2002:a05:6402:50c8:b0:61c:cf8d:e51d with SMTP id 4fb4d7f45d1cf-639d5c2f5a8mr11648378a12.22.1760111489522;
        Fri, 10 Oct 2025 08:51:29 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e7fasm2605029a12.7.2025.10.10.08.51.26
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 08:51:26 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so3243855a12.1
        for <keyrings@vger.kernel.org>; Fri, 10 Oct 2025 08:51:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUim0ewCMkyleVUhPljflJxMoaPCOav0BlvuAacx+5yvOJi3GLm5BdodMDoDoAaln4lcVRB9O5bPw==@vger.kernel.org
X-Received: by 2002:a05:6402:42c3:b0:639:e7f1:92ef with SMTP id
 4fb4d7f45d1cf-639e7f195dbmr9233647a12.19.1760111486075; Fri, 10 Oct 2025
 08:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aOibAOKu_lEsSlC8@kernel.org>
In-Reply-To: <aOibAOKu_lEsSlC8@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Oct 2025 08:51:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whUUZpENHKMrrVQwqfBgP9Lm=SxW+a3WmoxZR3JObdrUA@mail.gmail.com>
X-Gm-Features: AS18NWDVmzykydf7s6nuNWo79bD8III-oyk_dOxNA4c_F8d-omvq9FosXPkL62U
Message-ID: <CAHk-=whUUZpENHKMrrVQwqfBgP9Lm=SxW+a3WmoxZR3JObdrUA@mail.gmail.com>
Subject: Re: [GIT PULL] TPM DEVICE DRIVER: tpmdd-next-v6.18-2
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, 
	keyrings@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 22:35, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags/tpmdd-next-v6.18-2

So I've pulled this, but I'm still unhappy about the explanation.

You tried to explain a one-line single-character change in that pull
request, and even in that explanation you spent most effort on
dismissing other peoples concerns.

That one-liner would have been - and is - sufficiently explained by
"it performs badly and breaks some configurations". There's absolutely
no reason to then go on to describe how *you* don't care about those
configurations.

But lookie here:

 8 files changed, 137 insertions(+), 199 deletions(-)

that's the actual meat of the pull request, and it gets not a peep of
commentary.

I'd also like to point out that Microsoft spent *years* trying to do
the "we require certain typical TPM setups", and people complained
about their idiocy.

For all I know, they still push that crap.

I would certainly are *NOT* that stupid, and we are not going down that path.

So when it comes to TPM, the rule is not "typical cases work".

The rule is "if it causes problems, we acknowledge them and we avoid them".

Thus the whole "disable TCG_TPM2_HMAC" really doesn't merit this kind
of long explanation.

In contrast, the *other* changes are probably much more interesting than that.

             Linus

