Return-Path: <keyrings+bounces-3694-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3138CD710E
	for <lists+keyrings@lfdr.de>; Mon, 22 Dec 2025 21:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 859103019E08
	for <lists+keyrings@lfdr.de>; Mon, 22 Dec 2025 20:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC78339877;
	Mon, 22 Dec 2025 20:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ltgP8WmQ"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415F30C363
	for <keyrings@vger.kernel.org>; Mon, 22 Dec 2025 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766435101; cv=none; b=czEl2dJb05wyy41bPcCQ2mMQ1vbCdxU2P4k2DeB0X/Wm24pM+9LwsuvHEZ/Cz5e1iiNL0n4HPp4sDrl78B8UZnrG2t2ZsFT9D3Vl7cTikdZiNHsROqX9Om1PhOY1QVkoOJ3Muw5XV4jD3tNS/SClhc4T5NG7GjYquEpr+DUDLGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766435101; c=relaxed/simple;
	bh=goZsKDviOicgqCgIbb3f4eed4rNpDg8XLM1zahV4cHU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fIQjDbNOGnSvIgaIzaAGRw3k8eAAP/k6p0FnOyXTqZRfJtM3zWL3K97sDlS2qkLkMmnG7F0BZiEYvh4ejaE2pWGuZGSNN9m/vtHegsGWabVJMGkb48AxKYa4R2YNqmW8yqrvnwg/ExmPGv9HEDD/t21r70bzh/YhcY9Rd61AnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ltgP8WmQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34abec8855aso9293942a91.0
        for <keyrings@vger.kernel.org>; Mon, 22 Dec 2025 12:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766435099; x=1767039899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mz9ND7dbzjMcTMqsYF60nWhpj6LKAszoMm8f2guS36A=;
        b=ltgP8WmQyFg7BRATyz2SI6BeZn8DNoLknHsvjqYwuT/TrlUskp1UxGYAQOWiTDUPG2
         xE+VEIKRyWIttqHgkYT/QqvcxyVmFqfFXZY8P5+/Q1YtzMpEbBymqwsdevFIVuK20d4H
         po2irNQX7idmRk5HgqD5MPqcyfJHBU3IqM/ryVk+r5Gk9avAVyhWRbBRcvhNF0AsRz/w
         N089CZaOpeLdQtdljgrDLAiAiAon6TfP/ogITUDi+sOomjD+OaXkDckbJSJi3CabBT45
         WODxuNlUSm2iTmhrCapjJHPjlxeo9M3mwHc+SfJwqhR1Dk6q0r48WrS0fyCRhYu2bgeD
         U1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435099; x=1767039899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz9ND7dbzjMcTMqsYF60nWhpj6LKAszoMm8f2guS36A=;
        b=NkGQe7oGRb9WlgIaK7Tr2OjEp1+gXd0kqkqvJKjjOf/sk/M1OMRN+/ECixpiC9fw67
         OiLoVxNY2TTszQCqvJS5lnfvlTOCDOPW40tkSt6IZJETV8KAtde2NZHj/Po5/Ihc+87Y
         J1doQaPRCpazln7LPN/xjq7twHJ+1+xibtkdr6/PAHoec+x9S3mQ5O/bOc03TVHcOz2I
         IQ/vy/EwWpdk0rFGXpfZe8kCsBYgSLwVxs+oyZDPC7miFy6En3Ga9eQNgSyWKYLZwIGP
         o271LPUx/toBm00PhP3DLo50bLSvpX4JgcyUPxP91pTa4PAROuIcFtbXuNlwSIh8IkAH
         UxjA==
X-Forwarded-Encrypted: i=1; AJvYcCU6lNlF5Z+YuH9ZzL/ujIiWHfDWd0dJwxrbxoMiZvSW4l8YJnUEE8dcjDUtiK7OaHnJ2oxwo+kXxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bjZT3y+DBXOBMF7cL+HkIROyhRH9Eefw8nhRtwC3TZkYmGCN
	YKpcd1QZUrEhMv4uhORwcc2ArfwK7BBG1eD8Urp4Tu+sn9DiJhEPW7/3FH8/Gco3YsucZph36/h
	JB60TclLzm1+gO6cBVJQr/76ErlxKhQ==
X-Google-Smtp-Source: AGHT+IFPl3USfOoE99npQMzjvmceXBxzORxqId4TnbV5ICbecLrp1nb9g4AjvoeAvwTlcw3TrHIEFv+0bTAqBH5ZbFI=
X-Received: from dlbph16.prod.google.com ([2002:a05:7022:3710:b0:11f:45c3:e5f6])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3a0d:b0:119:e569:f25f with SMTP id a92af1059eb24-121721ad018mr12670763c88.8.1766435098832;
 Mon, 22 Dec 2025 12:24:58 -0800 (PST)
Date: Mon, 22 Dec 2025 20:24:17 +0000
In-Reply-To: <20251111154923.978181-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251111154923.978181-1-petr.pavlu@suse.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=goZsKDviOicgqCgIbb3f4eed4rNpDg8XLM1zahV4cHU=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDJmeK77w/JXexxIyZeMUFsO+iM/zJnlnb4x9dH+twNtH7
 Cznj83+1FHKwiDGxSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAmMrWX4X/Y83OfSiUmfbu5
 vPFYXe/SUqWZz7aoTrJvT9s35dgx3Tf7GBlanzBcnfDsg3Hrc47NATU8q9zv2rALiC//WPrc0GW l1RMeAA==
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <176643400578.1902051.9409046385163707144.b4-ty@google.com>
Subject: Re: [PATCH 0/2] module: Remove SHA-1 support for module signing
From: Sami Tolvanen <samitolvanen@google.com>
To: David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, Petr Pavlu <petr.pavlu@suse.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 11 Nov 2025 16:48:30 +0100, Petr Pavlu wrote:
> SHA-1 is considered deprecated and insecure due to vulnerabilities that can
> lead to hash collisions. Most distributions have already been using SHA-2
> for module signing because of this. The default was also changed last year
> from SHA-1 to SHA-512 in f3b93547b91a ("module: sign with sha512 instead of
> sha1 by default"). This was not reported to cause any issues. Therefore, it
> now seems to be a good time to remove SHA-1 support for module signing.
> 
> [...]

Applied to modules-next, thanks!

[1/2] module: Remove SHA-1 support for module signing
      commit: 148519a06304af4e6fbb82f20e1a4480e2c1b126
[2/2] sign-file: Use only the OpenSSL CMS API for signing
      commit: d7afd65b4acc775df872af30948dd7c196587169

Best regards,

	Sami


