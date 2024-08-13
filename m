Return-Path: <keyrings+bounces-1869-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7129501F3
	for <lists+keyrings@lfdr.de>; Tue, 13 Aug 2024 12:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 076282828E2
	for <lists+keyrings@lfdr.de>; Tue, 13 Aug 2024 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F38C19047C;
	Tue, 13 Aug 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtCSn0xJ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8418A6C0;
	Tue, 13 Aug 2024 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723543481; cv=none; b=HFo3i7UHV1aRCnQMGtGiA3tYzmhPMPB+mxfG6pjTP0YTayWhbv0u0q227xMxGqLnTwzad7UjAChO1FQ6W6fdU8FACJob2Un5hlJrk1Ioh7W/vfIvP/NbFoS5MG+U36xX7WWaSg5KxcbPtQB/mNV27H8U8Z1ZY/jWy2h3tJX3G2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723543481; c=relaxed/simple;
	bh=WHZjitFiy5be2ug0OuChbi+OBJnUVgHlIS/MrdF2x7c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g81J1vM69d+vj2ZWwMXECH8VrJKXm/5KJlcP8HtSfDtOmYVL2jcUzTaGBMDdn/0Z0/hzT+hElvEBKP863iZ94B5tAIY/tygNm/Ivcujc7AK8VKLRpQzrxyj4hggZwkTZHNAe3kFiqPLaAaCNVNK1p01O2fnoHt4xSyDPjsDLhR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtCSn0xJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5765EC4AF0B;
	Tue, 13 Aug 2024 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723543480;
	bh=WHZjitFiy5be2ug0OuChbi+OBJnUVgHlIS/MrdF2x7c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZtCSn0xJaF64rv/TWTHgqiCUzASlncRwn1T/TEinAbBWNH+0/iS4d4znjoHOH5Ohv
	 hv8nXAWvV9d5bUj2ZH44mP6gmHu162MXait7i+OA8/LzFU28aSPDdeeMg9ydOM+k6s
	 l5CP970SyHd0zngbMzH8PHISmcYx2/attMs1O9cLlzTI34/Y4Ixahv2w4i7tWkGVY1
	 OVKXqVd7l3XfyL1LBe41aW6D9XCmbv1igdPVxKuhq/L6I0O+o0O5EE0dbGRYRo2ZLY
	 msmZPPfpurbe5PYo7C5a5NJsrGuWZpPU0DcRP0aFGoZPR6GnlDwKhQ/mQh4kQubut6
	 VoCWuyoXHM8Yg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Aug 2024 13:04:36 +0300
Message-Id: <D3EP66JVXS7Y.1TBVSRL0HUMA3@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] sign-file,extract-cert: move common SSL helper
 functions to a header
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jan Stancek" <jstancek@redhat.com>, <dhowells@redhat.com>,
 <dwmw2@infradead.org>, <zxu@redhat.com>, <keyrings@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1720728319.git.jstancek@redhat.com>
 <ca929c72f815643f58d348f1023d4cd185bfc905.1720728319.git.jstancek@redhat.com>
In-Reply-To: <ca929c72f815643f58d348f1023d4cd185bfc905.1720728319.git.jstancek@redhat.com>

On Fri Jul 12, 2024 at 10:11 AM EEST, Jan Stancek wrote:
> Couple error handling helpers are repeated in both tools, so
> move them to a common header.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko


