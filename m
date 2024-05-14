Return-Path: <keyrings+bounces-1200-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EAB8C4F11
	for <lists+keyrings@lfdr.de>; Tue, 14 May 2024 12:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6688E281497
	for <lists+keyrings@lfdr.de>; Tue, 14 May 2024 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E026139578;
	Tue, 14 May 2024 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="V7BUJjIj"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5153E13956F
	for <keyrings@vger.kernel.org>; Tue, 14 May 2024 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680265; cv=none; b=N3NE03+TFJRbs1yphVBMu9g2qgPqLo68bhu/mu0nDQx51PMXkXF/pFMFqAA8sTD/oe6PiLZ6stDsZv5areYSQQyikrIkAn1Bc4cIyGUwK37BISTUAZUvpZnIUprGqBzd94QaINrtL75EfUyU9h7TYhYEtQYisSrXyTAAO8v5ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680265; c=relaxed/simple;
	bh=aS77YYdZ78IuRzScLcwXvYvXKe8QSm/hM61mNFiZW4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzjaZ2BupSzyy+U6CfrTmw7Y01SxlqF0oNOGgjUZMGYTxcwy3lWD3KiYll/iRFBswM2Cfm7sqUfqaQnIMXnpJLYovFIs5zr3dBMvS4JdBysl9o0/qBltIYXUq4JdomXt2PjijCWzd/O1GRbCi2p8sjFvYwXcHN+LPNzqaNwoDNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=V7BUJjIj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f45f1179c3so5040967b3a.3
        for <keyrings@vger.kernel.org>; Tue, 14 May 2024 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1715680262; x=1716285062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY/CWj5etN+XzqJRunvNp4aqTo4ZuVzUw0zQCCYpDIs=;
        b=V7BUJjIj4iXJ5HPnoVEDy/e2deSAnv5k6VUl7jawcKvxz6/gKknRg44KShtj2YoFVA
         O/se7uxsF4K3z4Rdn+6FUEv8CfaP13TM4LmqPYhb0Dp/eUWOlb4as8MxWqBqHPvX8DZi
         K2JMk1MtS1Ewui0ugJ8ROUyDUC1nGvu9cx78vG+JcK/YU69zZ7qalvSlwtGOf9ZpMSEt
         umKXMrtDrVsiVqEaFS1GnK1pCRJSZY0FEhrEBd3rnRY10SAenYcbk1IddGDgFuj25Gto
         qzxXN9U6fno4pDAgMa/RccDJqPVch6tYgww4xMC8gX4o2QR9y1u6fPnROzGkTP+yR3bH
         qPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715680262; x=1716285062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LY/CWj5etN+XzqJRunvNp4aqTo4ZuVzUw0zQCCYpDIs=;
        b=uzF3jAjPmMQUqlMABqci2sQXuslDrVE3BuLsTgjun3WB91rj/iN+Av7lu2JIa8YVkl
         dFkBECmW3BNFT17Qor49tAL2XONB0aRFtHEVcwI7Z4lcsOdKHd0aO5kfR88Baimz1Xfh
         h9jT/ufyBGwpVixb4rpPOJZyFFjtvKF0/FRDkTb4xmE4RmxFPzxbO1OGpajT32tPQz5C
         QettBj6zo9HbsK8l/fPxoeECNifYW6M1dyfVfZADRf61+MBIvXOGtA1Q7BXf+/ELVfvk
         bQhlc7kf/kbmJ0cq8ON8oiAlpHIumyaN1xW6fO7OWNUZllDHwAm0Qh5SfcT6n4Xkrm8i
         SpYA==
X-Forwarded-Encrypted: i=1; AJvYcCVn0zPuQic8NNjEzmxCatm2p4rr8R8Mo30f2Y8jHh1lx6ugy+1gwDWBv60M82I09lUcsNtKe02zt7yVvPMbNAv0okJ6gFgjd0c=
X-Gm-Message-State: AOJu0Yw/7mENItRq2HH1rm8GTTED3VUFDRkDWH4XD0tHteNUZEFkvVyu
	4xBRnYucachD3aOCv3wVhCRFt+BIcve7ryG+K8/JX4Cri4nTq0SDDLo6rHDyXUEZG1a1XRFXbYV
	vk0POTpLkWBLKlVLXEIqfMOtjC4QgqCsBeg6Fmg==
X-Google-Smtp-Source: AGHT+IGL1sjB1cH8Sy6ERRP/a2fuJSYBfObXE9OlMwyWHDtfcQhVPOPqI1HqkSUA2r3Vq+m4HQT81NXxMObwWY6bXq0=
X-Received: by 2002:a05:6a21:c91:b0:1af:9728:de86 with SMTP id
 adf61e73a8af0-1afde10456emr11538144637.32.1715680262309; Tue, 14 May 2024
 02:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503221634.44274-1-ignat@cloudflare.com> <D10FIGJ84Q71.2VT5MH1VUDP0R@kernel.org>
 <ZjY-UU8pROnwlTuH@farprobe> <D10Y0V64JXG8.1F6S3OZDACCGF@kernel.org>
 <D10YYQKT9P1S.25CE053K7MQKI@kernel.org> <CALrw=nFLa5=bPbYKijNsEo0Kk77_TEpdPmPe3CJ3VJqGNMmBeg@mail.gmail.com>
 <44cd50b60a0a4e376d01544d25187556b8badf94.camel@HansenPartnership.com>
In-Reply-To: <44cd50b60a0a4e376d01544d25187556b8badf94.camel@HansenPartnership.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 14 May 2024 10:50:51 +0100
Message-ID: <CALrw=nFOh0=TXGx-z_oTkLWshVU_AfGRQzcC3zxVTzcRbuRqQQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] TPM derived keys
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Ben Boeckel <me@benboeckel.net>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, serge@hallyn.com, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 11:33=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2024-05-13 at 18:09 +0100, Ignat Korchagin wrote:
> [...]
> > TPM derived keys attempt to address the above use cases by allowing
> > applications to deterministically derive unique cryptographic keys
> > for their own purposes directly from the TPM seed in the owner
> > hierarchy. The idea is that when an application requests a new key,
> > instead of generating a random key and wrapping it with the TPM, the
> > implementation generates a key via KDF(hierarchy seed, application
> > specific info). Therefore, the resulting keys will always be
> > cryptographically bound to the application itself and the device they
> > were generated on.
>
> So I think what confuses me is what the expected cryptographic secrecy
> properties of the derived keys are.  I get they're a KDF of seed and
> deterministic properties, but if those mixing values are well known (as
> the path or binary checksum cases) then anyone with access to the TPM
> can derive the key from user space because they can easily obtain the
> mixing parameters and there's no protection to the TPM keyed hash
> operation.
>
> Consider the use case where two users are using derived keys on the
> same system (so same TPM).  Assuming they use them to protect sensitive
> information, what prevents user1 from simply deriving user2's key and
> getting the information, or am I missing the point of this?

You are correct: it is possible, but in practice it would be limited
only to privileged users/applications. I remember there was a push to
set a 666 mask for the TPM device file, but it is not how it is done
today by default. Also I think the same applies to trusted keys as
well, at least without any additional authorizations or PCR
restrictions on the blob (I remember I could manually unwrap a trusted
key blob in userspace as root).

It would be fixed if we could limit access to some TPM ops only from
the kernel, but I remember from one of your presentations that it is
generally a hard problem and that some solution was in the works (was
it based on limiting access to a resettable PCR?). I'm happy to
consider adopting it here as well somehow.

> James
>

