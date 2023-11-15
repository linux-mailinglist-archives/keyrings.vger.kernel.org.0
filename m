Return-Path: <keyrings+bounces-76-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE87ED54B
	for <lists+keyrings@lfdr.de>; Wed, 15 Nov 2023 22:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C296280E1B
	for <lists+keyrings@lfdr.de>; Wed, 15 Nov 2023 21:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3110381BF;
	Wed, 15 Nov 2023 21:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk4rDKxA"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DA2E40E;
	Wed, 15 Nov 2023 21:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC40AC433C8;
	Wed, 15 Nov 2023 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700082199;
	bh=6iFkJ9CgOv8m2X+1Em1JMHhqIxyCZ6Qr3KSR13K3huM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dk4rDKxA0ItonubvGbIA6kOO4BQ/BxPKjEvuouQ3hBwft2YkQ1nM8EsubAujp6Rll
	 VQaazriqth98JZ5XQk4K445Cepsy/FFEEQtYHDk8BHOyYDld+Td8jFeNHEVz/4ivWG
	 G10fsUCTYPwf1EdKr2k8W3OJA0M2HQ3RcH0cK1eRdmk64soo+BxuEGzvc+y3rqtfc4
	 hvOfAiGuGJp1BLqlUGtvB3lx3ayVs0StPc2jMLgduP9fgOPWv4pIZdjPnoat+PBRaa
	 5x9z1UMoJaM3aG6Uz3G8Ne3GiYZWuMktXisQ00FWOK1UdPTvlb6+4swpdwJyRr6KSq
	 GE5BnVtzL+Qpg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Nov 2023 23:03:13 +0200
Message-Id: <CWZOU9WPLL2Y.30QYCUBCE0UQA@kernel.org>
Cc: <linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, "James
 Bottomley" <James.Bottomley@hansenpartnership.com>, "William Roberts"
 <bill.c.roberts@gmail.com>, "Stefan Berger" <stefanb@linux.ibm.com>, "David
 Howells" <dhowells@redhat.com>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Mimi
 Zohar" <zohar@linux.ibm.com>, "Peter Huewe" <peterhuewe@gmx.de>, "James
 Bottomley" <jejb@linux.ibm.com>, "Paul Moore" <paul@paul-moore.com>, "James
 Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, "Julien
 Gomes" <julien@arista.com>, "Mario Limonciello"
 <mario.limonciello@amd.com>, "open list" <linux-kernel@vger.kernel.org>,
 "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] tpm: Detach tpm_buf_reset() from tpm_buf_init()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jerry Snitselaar" <jsnitsel@redhat.com>
X-Mailer: aerc 0.15.2
References: <20231024011531.442587-1-jarkko@kernel.org>
 <20231024011531.442587-4-jarkko@kernel.org>
 <xp2tdlw2qjg3pbazb3oye7poeh4r5neeqbsvamgiazdl2bouwa@qnxhvt7vzkpb>
In-Reply-To: <xp2tdlw2qjg3pbazb3oye7poeh4r5neeqbsvamgiazdl2bouwa@qnxhvt7vzkpb>

On Mon Nov 6, 2023 at 9:31 PM EET, Jerry Snitselaar wrote:
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

Thanks.

BR, Jarkko

