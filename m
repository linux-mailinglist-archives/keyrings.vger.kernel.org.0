Return-Path: <keyrings+bounces-600-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72338851C7D
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 19:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C757281D4E
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 18:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F0A3FB03;
	Mon, 12 Feb 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFIawtyR"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB33A3F9FC;
	Mon, 12 Feb 2024 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707761417; cv=none; b=Bl9Bbf8yxm2bfNrutHZgTc1foIAf8qwpyLHcuVi9xqKAAyv70bpwgslDgH/J94OeB30ldt2zjRf0w9KiLQbOVvprBS+TO93zgaJAueOqbkche4qzVZl50ymhrIG5GfZ3rI6M0bn2aU7zZincriavaiqvrSfR4l1WbsZYpNjPWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707761417; c=relaxed/simple;
	bh=psuq9G62OgxIDSLiGci5UEeAxIL4X5IB+bm5lXCKv8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HWTvhtYDsI+6YZ3nklYj2oXfR5GSZfa/83UBT53t54XO68QImZEdVOKRaDjGEzbZ7JzTNFF8yFdvMEeTf8skAwO1ozZ+BcXg1pLj3lTAFu3CzOfi7rZ5QQwSISFbMw3Pe9n3but+WTzu0sWYxJsLHPjeRZPU+dfcAVatv/6foGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFIawtyR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A846DC433C7;
	Mon, 12 Feb 2024 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707761417;
	bh=psuq9G62OgxIDSLiGci5UEeAxIL4X5IB+bm5lXCKv8g=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=vFIawtyRi8KSPg3CLx+yYmehX3VE58Gg3FAgXNqYf/1tCs2jWpr/wipPtEG61zIKr
	 z/3J6TAJ3LmKCgRe0uou6EiUo6kk3frvKmV+VOrmpAe5RawpMHSJsgUAMmzUTKZU7w
	 AJXcXkijSZ4s7BMdyR/ORh4ibmsVs88YceDV1qYmoaODRcovZqaS7obKr91gTsQIQ2
	 mclFKFy8xXYL+ia1TQvugSXcRr6cR9PGGrI8S/+x+q/3YedVY9INyih8j9JcZ4DAmS
	 gl0fDolVaaUmh/3thGiCAJi60xm4JuFMI+6U4YnMWYvdcq3oUMmCVOrG/gAkIP73pj
	 z7DwvsYCqHefg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Feb 2024 20:10:12 +0200
Message-Id: <CZ3AWA73R7UO.3OAQ0O5SMIFIE@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Dan Williams" <dan.j.williams@intel.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: [PATCH v2] X.509: Introduce scope-based x509_certificate
 allocation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "David Howells" <dhowells@redhat.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
X-Mailer: aerc 0.16.0
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
In-Reply-To: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>

On Mon Feb 12, 2024 at 1:24 PM EET, Lukas Wunner wrote:
> Jonathan suggests adding cleanup.h support for x509_certificate structs.

Please remove as this is just repeating suggested-by tag.

> cleanup.h is a newly introduced way to automatically free allocations at
> end of scope:  https://lwn.net/Articles/934679/

cleanup.h is not a feature, it is a header file.

Use link tag for LWN and I guess the feature is called scoped based
resource maangement.

BR, Jarkko

