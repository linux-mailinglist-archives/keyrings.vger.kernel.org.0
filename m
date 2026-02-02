Return-Path: <keyrings+bounces-4003-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGPgHozYgGnMBwMAu9opvQ
	(envelope-from <keyrings+bounces-4003-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:02:04 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E5CF4E0
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0D7730065C5
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 17:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB1D3815CD;
	Mon,  2 Feb 2026 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1y6/Kpkp"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A83816E9
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051720; cv=pass; b=jpj8aBUdbMQvch+0gNTldBtgYF6stj4+f0BuYAEULT6fskX7kzFz2QJJaWmYsoU/hnf+YAxp3tdrZt8lmxJC5eun8OHHHGlaAOX1Upzv+7gBR3Nn628cPmVw9nAhoEdamh0caCYm+Q0kO/AoqcqKzHsIJ4Fzf9K2H9Ugq79bq78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051720; c=relaxed/simple;
	bh=tby2xKJCy/JDIMLTe6tfBEEsBUYRq9IGLzGth6ow2XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atCb5bhlRxQ/fG8BFxyI3stBtM2y/CkqybcAQKbUUiKshTsFQ9S8iFzJLrTPDEfZBV/11Q/P68sS4tnRHjBiYkIOB9zcg5IgG+WowR6astqFI/tSOMU37F3qyBrILptTf35tcw7EFvEfQd1w5kF3aH1sHr5m8zSdk32YYJ+ZJf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1y6/Kpkp; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso13441a12.1
        for <keyrings@vger.kernel.org>; Mon, 02 Feb 2026 09:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770051716; cv=none;
        d=google.com; s=arc-20240605;
        b=KBRL2/6yOUkTg0C6RPF7W3bfQh2cSn1/0MAUgpw2fYoGR1anBU590pRgQAlWp+8Uzl
         p5HbJMdF2/9v9OLqS+R+w6kbbppRHEu+/SakzGzOHwnV3pwHK/iBNukfN+AiNT4eU0x1
         H2Y2F4MMCF0ayYG9DkIIgDFgP/mohw5NQr0dqT7ADcNIDqM2WF38GlN3uZOgK7ZNOArr
         Y7snkn+IK541tX3CY91FsJrJNoU81bZZQ2UPYsAtiGBJl19ytoWmikfQZJyeW0zwXsn7
         Z4QEyWayKurTPkPmyuCuzn3fukOKW2XfgeGx/xaihHjUIMwowJjM32uvd1g3nUfUv2sx
         npxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tby2xKJCy/JDIMLTe6tfBEEsBUYRq9IGLzGth6ow2XU=;
        fh=OPWkNYAT6jONDzqK7zEFk3+esvof8eQ8ggUWlF4ROUE=;
        b=cwOMKooTpzfx57/y1hvLhHtSxG8+IJe2V5qfFzxYWdQ4ZOuiupCa7Q9Bdm++EqE9Qo
         RfTQG+OGvhzAPP3ixnuISzBLhmFRAKLunzLR29EYURynmWQnW1hf3UD6g6jwrkXCJIjR
         o6Uf67JxAIoNwl2/vSqXZWuoBTUt1VgLffFxBe8sqHUb4LBCeUEIW7fea3ksZf58Sau5
         0LZN+SN8urO4cm7FGIGS3U7mdnj+A2J7xJn+AiCTLYhp1DdsGjIEHQXfvrHNmh/pFy82
         VRKQiy3h/Iw5jm3qz2YU3s1p4hdjR/qlcmTw3SGnQBwKj1XU7HEq8dRBdr9pRCxOVjHy
         ccIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770051716; x=1770656516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tby2xKJCy/JDIMLTe6tfBEEsBUYRq9IGLzGth6ow2XU=;
        b=1y6/KpkpG5A7XEpRF4GcU3wT7akPBNjUFM3tvKqhJWA0DnZzwrBXl2XeS8CBXHWQwA
         Q+DbYAZdu0TQlQ6adm6abwnlc9eUJEyqZgTg6dd3XGhelnaHll+sx876fWUiSCvn+8JX
         ng5ZDvK+pLR8Icbxxb61U6uDJzLqBi0jx69Uy40rb4ubURVLv4E674ii3YMFKNZEO1dS
         olO9Q4uHpI0rBIDIfqsM37nkOe4LHV+fBwLV90tg/rAjdX0atLQIkQnjsUDHM8trLjsZ
         i53pPVOJNSd3RztQGhg4PbqSuA9L/lUiMCxLHdCR9rJIz+3aBtrq9Kqn0MXLSbNfwSzD
         Tegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051716; x=1770656516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tby2xKJCy/JDIMLTe6tfBEEsBUYRq9IGLzGth6ow2XU=;
        b=DX+emG+F1x/PoKPhISbJt5AX0+OaJ368fQfQC20oFsQdttR0NNXuln6TJ1+m7X2UxN
         3YX5rC4jF0BZZQpZ7fvCj/tYacoB+2ZuYrQCj9TtF/xpuZ0PNoIQ2W3kLE3VywUlqc4s
         jGXIaF0UDDNb0VEvHjslUvUQzBu6qB6ueWqXWTAExWeS0yVnNMfWfjkwPhte3CU2BcIZ
         aVZecnJiv6HWFyAie3a3lPH9BogKPN0wI9e7D3CLWjUocVo1HJC+VoDzAWJlTzYG6++b
         RS4cYI73ozSJGVm0/fzxDKUcSCRi3kOjh8EXNDAMPOJtFw5N/uoIU5pUIbnwfOVgBbuR
         kGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0/4Nu0lPmH5n6jyJM8waWUPpnwp8jTzUO/kQJSbkgE8fg8JWL12OyxsoIsr5VGsmpOaCGsPgsDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjU4sJ7hJB1kPFQJiO8A4bPhHHApfGkgD0DAvQhcZRa8uTGAEC
	pDM5XJRJQBQjwDnvyhId4KAja3rmdB73Ev/2iAdwqovAOj3dB4ZnV860JczUKWQGEAeoD9Z2For
	JCxUd2Q9Kda/M70fXWFzTwn69S4GY5Zl+us+v/i9A
X-Gm-Gg: AZuq6aK4cFavv3bfTewIkP7oQztqr4qU3X7VfWzlrmQ3Waf+NkgNl3jvO1xdCzpha08
	q1FEJxRvhf3Y0XEzTL21L4x73SS7MCRap2MdAiJl/R74RSMuGNyULwr5mqEwa5JklUNTx2GP9wF
	ao2zlTL2sJhBL+wCcc1NH64g9yjevZMlluwITu479mWdsuee/Kfubho2Ia1+3BNfscGQlCCEPaY
	aGwgwEYA3bfJTlcD/fm4RY/gqDrbbbgF1EdMuhcAuu5rGoVkE8JAMwUnKPo3vjxUPWP
X-Received: by 2002:a05:6402:b85:b0:658:1157:5bae with SMTP id
 4fb4d7f45d1cf-658f6c760b4mr59648a12.2.1770051715652; Mon, 02 Feb 2026
 09:01:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111154923.978181-3-petr.pavlu@suse.com> <20251111154923.978181-1-petr.pavlu@suse.com>
 <2403737.1770031462@warthog.procyon.org.uk> <640c124e-0f03-4869-80fe-20c8be7aa525@suse.com>
In-Reply-To: <640c124e-0f03-4869-80fe-20c8be7aa525@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 2 Feb 2026 09:01:19 -0800
X-Gm-Features: AZwV_Qhag7Iyy171KP5DZhq3YPTSczr6SONF8PacTdVUJwV4s37Jpcog0jCPTCQ
Message-ID: <CABCJKucAkZa10TYRQ+NxPPw3KaTq4QVk5+XZWyCPpSrpMR_GEg@mail.gmail.com>
Subject: Re: [PATCH] sign-file, pkcs7: Honour the hash parameter to sign-file
To: Petr Pavlu <petr.pavlu@suse.com>, David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4003-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C95E5CF4E0
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 4:25=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 2/2/26 12:24 PM, David Howells wrote:
> > Here's an alternative patch that will allow PKCS#7 with the hash specif=
ied on
> > the command line, removing the SHA1 restriction.
> >
> > David
> > ---
> > sign-file, pkcs7: Honour the hash parameter to sign-file
> >
> > Currently, the sign-file program rejects anything other than "sha1" as =
the
> > hash parameter if it is going to produce a PKCS#7 message-based signatu=
re
> > rather than a CMS message-based signature (though it then ignores this
> > argument and uses whatever is selected as the default which might not b=
e
> > SHA1 and may actually reflect whatever is used to sign the X.509
> > certificate).
> >
> > Fix sign-file to actually use the specified hash when producing a PKCS#=
7
> > message rather than just accepting the default.
>
> Is it worth keeping this sign-file code that uses the OpenSSL PKCS7 API
> instead of having only one variant that uses the newer CMS API?

I agree that keeping only the CMS variant makes more sense. However,
David, please let me know if you'd prefer that I drop the patch
removing PKCS7 support from sign-file for now. I assumed you had no
further objections since the discussion in the other sub-thread
tapered off, but perhaps I misread that.

Sami

