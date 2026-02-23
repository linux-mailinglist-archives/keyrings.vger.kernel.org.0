Return-Path: <keyrings+bounces-4072-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMGpJbCMnGmdJQQAu9opvQ
	(envelope-from <keyrings+bounces-4072-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 23 Feb 2026 18:21:52 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE817AB1E
	for <lists+keyrings@lfdr.de>; Mon, 23 Feb 2026 18:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BBCA3038FF4
	for <lists+keyrings@lfdr.de>; Mon, 23 Feb 2026 17:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18092F12CF;
	Mon, 23 Feb 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCvt8HMT"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616D315D39
	for <keyrings@vger.kernel.org>; Mon, 23 Feb 2026 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867270; cv=pass; b=nwQRwIczIJ5ODSFPUjYsbo6jIbiK5z80k1rFOBC3i6t8eqQ7OERBD/7sjRxGFmK10EJoL7DNvHCRX7MiuSOvTIN0BBFg9peDEIzIB4nZqJkjTyi+GeBUl8SY5w9mC+yfSBORZMOA78a9gdrWHPdB13/3re2V0BjBTy3bii8/StE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867270; c=relaxed/simple;
	bh=YzRtlmox6M/Y5jdSRw3mdhnSOIfhhzrBMk+dRxj+wFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtZ0hZghQu/eyEzUsMMuQCWQYJm5bvkiPfIR4iK03vj8xshxcYHV/Qi9kdOHUjfPTgZzsaXnxYPquzdLqeAqqIJBQVrMxijFquP1X1PR5lKG3YY02FsSwz2/uhTq1S1r1siXAtDV6tnHb6KRf81NqQYo8Ea7OzAvsNrZ2Xa7g7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCvt8HMT; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-387097ae2e3so38366071fa.2
        for <keyrings@vger.kernel.org>; Mon, 23 Feb 2026 09:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771867268; cv=none;
        d=google.com; s=arc-20240605;
        b=BYElUIfw+wuYTV95/w3QEAS2/yPfi0sd2P/4xdLP1sHErBHXnGHNbS3IrTV3+T6YXJ
         vNKtvzlUO/qxH/oSpx8M7UYEXkoWAYSVq8R/JCmo70kYmbQpPfxQcnIIpzgC5lhuzlsx
         2y0Rfn0irnJT3Q180UmwR8fu05i4EjeaUzoek+OCSTUB0Iv3k+qTp6DCrXfFV4/4YdjR
         hZYZGOM00fslQHmYWX7noSYOZmxUbSHPZ1TZSbIWWNBPrqxrTQpEhriQhFI7zUuj/8Y3
         J8ugc5yJSLTNyzprTYruis/ylv3PY1JoipNRwOm2uJfe9UDZGDcvYf1Qhi4q/Y1gV1YZ
         tqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rjSD8XnQ/58Py1bQ62mgZvjnOs2KRtLmWHHyw7GS9A=;
        fh=MQFBiV7kI83g/cTFl6iSSI0kK7vavH6seYJF3Z6XRqw=;
        b=Em+/ZMDhAMCubC1FKjWTG7uJOx+c8LfKGrihTALe3KHTU7bQpvkbRjHfg6jtv+1+tD
         B/I4RFfNb3hd0meeeWe+/+IITwmG9fP6VKlxiK3lqEr86c7QvHKbYox5sE3xO6d9IUAP
         li1z8kW8t7PCJkyeZ4JnbKjJzn/6TkDtltVL4CM6nzlElE1CpSMFmYSiw3aSZJ/RhXfJ
         CXBq1Uldr5Plgl2ln3l7/Qr/qmKrC77zHDG6caaM6JtWi5SL7CQtFLTbNtT23ksFBm+U
         +FpX4geNwx3Z4ttd9w4iGzYzH7+YBgHBGC9AIWPsP7NKP2benYdKYSUEQ88ack5d6qzj
         HkMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867268; x=1772472068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rjSD8XnQ/58Py1bQ62mgZvjnOs2KRtLmWHHyw7GS9A=;
        b=CCvt8HMTOR78SN5Y8GPFfht3A9rEthozG1XQtvfVH4GdluwrW5OVhfThx5RMsAioHo
         V9X1m9V5iwzL9KOXre5SuC0u7Z7r5ozDp7mrN44k7qUuzn7i6fRU0P2bYLBj5GOqumnH
         3paZotTfooyyGFjkDva5CYzgY/s01bRky5hRoCgUD4PL61wbOJiz6KVn9N3C0hjV21Jm
         UqbbfTuuRQvwbavFld+GUtoGEzkcjbSB7rUuzWIN46zogXWbXs3yn1gWdK1AzAWTgpCF
         CjI5Uf2An1uF4iIIGTP4ovX+492XDJZfxLDm8ETkeQO7M3F8TzcBLd60NQvm3XMkke7F
         VtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867268; x=1772472068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rjSD8XnQ/58Py1bQ62mgZvjnOs2KRtLmWHHyw7GS9A=;
        b=b+7d3ScmlW5fd9Lt/ZH/Y0De3AM85VEHC1uAUR7ryx/IjzwhOzzIbybfjh3EZtHLPH
         68syHPc6S0XTQlNlszhvH9usNFrQLoJNZONoE+Ak299R/n6c6mxbwKopU/TYWwx8/VhJ
         fwbmgtbGkjE8IJqENiHtd31nyxzq7QeZ5u5mKRfkwpBbNvhrmr43fO6VnLt+PoTdzJZ5
         e0TbXmxH91o8Mld+XyaeIenxBV5Ww0DnKMlm/0BVcF48o/4LXqYCX6bi+Fg9H5fSNB6G
         SNuunH/sjhKkth2Sm5mqTFnb+TI0QPV4KfdvQylnnS3w08s0tTsWwtHMU2xJnhWPzY3O
         Twwg==
X-Gm-Message-State: AOJu0Yw2nMrbstaFZ4w2qGggeK5LHWCxqMhheAgkJDfK5awJxe+PLTwJ
	jbDGi9BJ3mpcTn+5PjkjuXXPEQQK29/hhWcdhl7RJ35Mr4Hk8SDyFVCNp8AvAsmvgBDy48ToLaj
	WlNhqXO9U/6r8/awIpVw7ejm3eVHZXb4jsw==
X-Gm-Gg: ATEYQzxDweJP0W6ZJrVkMA46IOC43XDkDzble+2GAwcTM6wGpXF71ZfgzBBFEmJdnED
	ldI1XiDyiooSOLRRxndovp5buPjhWFH15wPGqaYemdNkI5HP4kM5Y397UYTTzLY3Jzl4d7q+fhg
	MRsYOlBIwkaYCCdgXgqqZLHzr+ceMxJANt6wlHMVNfc9ugJ19469fsVzKC1nYW50UvjsHOvJgK9
	a46cxNuZLczYnBme2zXsoS/zvTG6Sb0FJTfonrs6Y/XqGROhX3zosOsUVeL+7/DWR4ZCETP70Vv
	KB0ZJoUSFgg5S0Gn92xKQ3tdLiakjTCpedJGf5/27Q==
X-Received: by 2002:a2e:9a13:0:b0:386:fe97:a554 with SMTP id
 38308e7fff4ca-389a5cacdcemr28231231fa.6.1771867267272; Mon, 23 Feb 2026
 09:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810224041.3025756-1-mattst88@gmail.com>
In-Reply-To: <20250810224041.3025756-1-mattst88@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 23 Feb 2026 12:20:55 -0500
X-Gm-Features: AaiRm53N0KzK0ct92YVDbN05YjJutjWFvb3k1YSXIImHYRTGxLYaMfs0OKDhvKA
Message-ID: <CAEdQ38HwdbwRAg3KoBm2XU-fjQdxtzjb37Ao4GOrWHFbpDT31Q@mail.gmail.com>
Subject: Re: [PATCH] test: Handle EDQUOT in act_keyctl_test_limits
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4072-lists,keyrings=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattst88@gmail.com,keyrings@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[keyrings];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1ACE817AB1E
X-Rspamd-Action: no action

On Sun, Aug 10, 2025 at 6:41=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> This matches the behavior in `act_keyctl_test_limits2` and avoids a test
> failure [1] on some platforms:
>
> ```
> TEST SIZE 192._._._._._._
> 197 desc wrong error: Disk quota exceeded
> ._
> 198 desc wrong error: Disk quota exceeded
> ._
> 199 desc wrong error: Disk quota exceeded
> ._
> 200 desc wrong error: Disk quota exceeded
> ```
>
> [1] https://bugs.gentoo.org/789837#c9
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  keyctl_testing.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git ./keyctl_testing.c ./keyctl_testing.c
> index 3161467..588fa83 100644
> --- ./keyctl_testing.c
> +++ ./keyctl_testing.c
> @@ -126,6 +126,10 @@ static void act_keyctl_test_limits(int argc, char *a=
rgv[])
>                                         fprintf(stderr, "%d desc failed: =
%m\n", i);
>                                         nr_fail++;
>                                 }
> +                       } else if (errno =3D=3D EDQUOT) {
> +                               /* This might happen due to us creating k=
eys
> +                                * really fast.
> +                                */
>                         } else {
>                                 putchar('\n');
>                                 fprintf(stderr, "%d desc wrong error: %m\=
n", i);
> --
> 2.49.1
>

Six month ping.

