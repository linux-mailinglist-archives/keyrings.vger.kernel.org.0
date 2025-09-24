Return-Path: <keyrings+bounces-3088-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0CDB98018
	for <lists+keyrings@lfdr.de>; Wed, 24 Sep 2025 03:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A75734A220D
	for <lists+keyrings@lfdr.de>; Wed, 24 Sep 2025 01:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4981C54A9;
	Wed, 24 Sep 2025 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVIi7csu"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBBD3AC39;
	Wed, 24 Sep 2025 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758677508; cv=none; b=lLI0RvhrXaqyjf9UpLV2vtcOR9uF0HCs9JOYYaUVpQjBla9reDWRw8UxB0DDkbBpBmU3q6YRPF8jbyjDI0htaF7WZLRr+PEkxe5CMDthxA740bh99Kx5zsSUCkF+ylhuxDrvs4w9879FQd/7FXtuBal+lA/4EUyeyAwlSzQr428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758677508; c=relaxed/simple;
	bh=d9BnPU15MNooq08UYp6of1KWg2GipcqvKmqY9lW29cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq6Eyi8Z5J6IaE1D5TCR2HFOJq2iQ1yZgmHIv2yBPqddPJHLKdDT+QmXA0DFxXfCF/p1XbXRXGHJ7VhQTRqZ61uDBpqwKQt5Rnpa3D5nfogDgFQ8yLaz0CIkMitWUPQf14LnAEs7dO2F/l9E5synm7iTaSvrNcObbtrcHX9anRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVIi7csu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0394EC4CEF5;
	Wed, 24 Sep 2025 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758677508;
	bh=d9BnPU15MNooq08UYp6of1KWg2GipcqvKmqY9lW29cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVIi7csuBHZ5EcHb77jvee0u37aOkKxODA48qXrAflXjEPqL8i+NpKrpyyM93aCjw
	 csoKesejjoZJeAc/sVE5uq0Z+V1gha4zJcmF5pJQN0BIpGN2u2TPVJ1SDaXibX687h
	 E0y5+AIHuyquzmPZq1xeOrpHZfBSBwPlpp8MMpgHLGcEGvsqz0dsPz2MzEbmznjv27
	 Lrz5fJUroRTlv83f47503LHKg9TCm75wg0PLUUS91Sn+C/yLuCoWod1aLS1IQ6v5W1
	 5z8DVlYkMnza3tyVFRQ6ImUx9V5G40Szdy/KS83BGy2r30Y3McVjJ6feHA04Q9kCht
	 B6KfvoUBnc94g==
Date: Wed, 24 Sep 2025 04:31:44 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-integrity@vger.kernel.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"open list:KEYS/KEYRINGS" <keyrings@vger.kernel.org>,
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 0/3] tpm: robust stack allocations
Message-ID: <aNNKAIbzki-a121p@kernel.org>
References: <20250923170744.1749132-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923170744.1749132-1-jarkko@kernel.org>

On Tue, Sep 23, 2025 at 08:07:41PM +0300, Jarkko Sakkinen wrote:
> 1. These are previous changes to tpm_buf, which make stack allocations
>    much more feasible than previously.
> 2. Migrate low-hanging fruit to use stack allocations.
> 3. Re-orchestrate tpm_get_random().
> 
> Jarkko Sakkinen (3):
>   tpm: Make TPM buffer allocations more robust
>   tpm: Use TPM_MIN_BUF_SIZE in driver commands
>   tpm orchestrate tpm_get_random() in the function

I'm quite soon sending v12 because I randomly noticed a resource
over-cosumption bug. which could be theoretically triggered e.g.
via interposing a bus or a faulty device: tpm2_get_pcr_allocation()
does not have a hard limit for the number of PCR banks.

The fix:

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?h=tpm-buf&id=3d92f14c204d09babadaa0b7c7a82c40d11696d0

It does a bit of extra (out of scope) grouping those related
constants but I'd like to keep it that way (should not cause
much harm in the context of merge conflicts).

BR, Jarkko

