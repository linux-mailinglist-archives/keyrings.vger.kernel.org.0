Return-Path: <keyrings+bounces-1478-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9068D0950
	for <lists+keyrings@lfdr.de>; Mon, 27 May 2024 19:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53D571F21E9F
	for <lists+keyrings@lfdr.de>; Mon, 27 May 2024 17:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9D861FCC;
	Mon, 27 May 2024 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNJZ81+p"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BD17E8FB;
	Mon, 27 May 2024 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716830730; cv=none; b=gFenTF6xVtPsBkYZ0k1ubKq4PX6x/IazZqO7bbNGEcbMFARzLN87VxQslThVOGu1cXcdMScTvsXmulcaTEKFrZqYbPsgUkugJnXGEMNal0518YAbdbgHncVbch+c0HLByuUYykTF1OCETu9wz0/HRXQn5/nsQKX4It3gJ2oP6Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716830730; c=relaxed/simple;
	bh=ERR9Le/pQHexiiiES5HRTHcvLkzMQOo6UQZIuxyf3CU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc; b=J93adhIRqt/D6Qfi1tN1Ft/ALYQFQrSU3PxpcNF6XXsgD3KFZyg6me9GrUGcKBSC8hsfq3YglViqH06tTIStdXmvOWJ0EiRvmqaiIRCv4WXNbXy2RbzZU8mr71n8zLwdGPsWMRjTQoIL5Z7ur205VtCiYah5Kgf9jXontR89bUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNJZ81+p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FF5C2BBFC;
	Mon, 27 May 2024 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716830729;
	bh=ERR9Le/pQHexiiiES5HRTHcvLkzMQOo6UQZIuxyf3CU=;
	h=Date:Subject:From:To:Cc:From;
	b=MNJZ81+pugD/+W0VYBziO0dK4lRzmtOrLPlCjl0CuNrHWgWWjD1ujPKrlsfrm5qvM
	 rjUDk3eeo+qI6xKfD+XFU3TmK3TRnuwqFb6sZ5bv2eZMEdYHdFzYXn1DzgwEw7DjRq
	 F/V853ZAzzpE1ZwupQBuRVB6Wm6oceqY6ToQcGjP8iQc79ctSJ6aXx5SuvIuUEJ6YF
	 okZluAXAymTN6SOenYoMI9lae4ataJDym7zpkgMCMN3vTfCQE978cRJBiV9QM70+QT
	 18Gnz5xVDUvDYoZp94kPuculG0keiApwGULyScEvWguoaiN1uW3H0ekxzMcuJcL2vc
	 0L5O7ZSXXNU+A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 May 2024 20:25:26 +0300
Message-Id: <D1KLP7ML9T1B.1LHPTTWEANRJ3@kernel.org>
Subject: ecdsa_set_pub_key
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <linux-crypto@vger.kernel.org>, "Stefan Berger" <stefanb@linux.ibm.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David Howells"
 <dhowells@redhat.com>, <keyrings@vger.kernel.org>
X-Mailer: aerc 0.17.0

Hi,

The documentation of ecdsa_set_pub_key() is the following:

/*
 * Set the public key given the raw uncompressed key data from an X509
 * certificate. The key data contain the concatenated X and Y coordinates o=
f
 * the public key.
 */

If you interpret this literally it would mean 64 bytes buffer for p256
with two 32 byte blobs for x and y.

With such buffer the function fails with -EINVAL, which is obvious from
the code that does checks on the contents.

Instead of responding to this, can you please fix the documentation bug?

There was also badly documented stuff in akcipher that has been
unreacted so far so putting also that one here:

https://lore.kernel.org/keyrings/D1HCVOZ1IN7S.1SUZ75QRE8QUZ@kernel.org/

BR, Jarkko

