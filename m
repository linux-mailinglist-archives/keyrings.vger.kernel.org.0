Return-Path: <keyrings+bounces-4060-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Mj53Ay7rk2lX9wEAu9opvQ
	(envelope-from <keyrings+bounces-4060-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 05:14:38 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FAF148AE1
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 05:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBFB33014C2B
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 04:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FBE2594B9;
	Tue, 17 Feb 2026 04:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frU9r1aQ"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F013B293
	for <keyrings@vger.kernel.org>; Tue, 17 Feb 2026 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771301674; cv=pass; b=tclCKHbh4sQoAd4BDKsP0rcgsL2Y0ToRfQh/9UYrMnGSlSQnPT4elCGcfQ3zZIq4/1UvJye6rmw09BdYQ+nyODILiW0htGgtSMkwYEYtdtKfi+1/a80BUo9GpJLTHu2B9wORe7G++IuF+lXWSdFUj6qiaIzojY7XU/WE7i80Ywk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771301674; c=relaxed/simple;
	bh=vl73Wg7pS+Ahm5P0YPj+Pe00Z8nc8FXlY1ga54JpjGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RloOgjXu5n9xMYsalaM0y4q8ap373OgXz69BD1T8y+2IFoQoV+XA9TMAjm0Cf/6/iVYpcfYjSLJ2GI8YRAPgDFyuQHDkbVieMn7ivgkQ2zSnYKk+AzIIHV4imXK9+Cnf5iFMa0KVX3eblYbzeOWMeLN1lA06/5pxC97hAoxaTtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frU9r1aQ; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65bebcbffe8so3140943a12.1
        for <keyrings@vger.kernel.org>; Mon, 16 Feb 2026 20:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771301671; cv=none;
        d=google.com; s=arc-20240605;
        b=MDe85giTI8J9tqevgkfUS7Ra4wcmxrvwJ46WBmCxJ4hGpDSsp4kakAzrvv8/lZ5NkO
         hRsF2GiwwaSf8yqj7nw1AhTjdesQSRSXg4S5/VR7J683YtWBi1pPbF75KhytdX7mc8xF
         Z0CN4q8w49HhT3eq1852vXhwePYGCxpPNKJWoEwmB494Mpxw8KyxG14/FNr9m0Z/g/Sz
         gFvu7mtiuUkrLa9hdsEkh9LhKgPKA7Vudw93njJ9Sov8kzy/+QyWhwrtoLH+MMKdD8OI
         wmoTqhvge9O21NDHYmEED9SZXWRTUUFfD2qIQ099SmsUTYnoRsrhFY0yTfQjsBzLazWZ
         +XHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vl73Wg7pS+Ahm5P0YPj+Pe00Z8nc8FXlY1ga54JpjGA=;
        fh=338nFTKEp4d7KG8kBCQJlvYsz2HtchkLfFNOWdYtCt4=;
        b=FoJqdxx14w4Il9M7AuZLjXg2vM1IcVZFIP6jiiTlbmYtzAMmgCJZFiO7stsw/lLEy5
         /spLZjefUl2Zvx1q2iVA/HBRTJOjnHNhldzr/XvIGNeLWwlON5V3zthwsg5jcgpC9w6T
         U7uBlx/uNjakhUswC2x2QlYv4lAs4lt7ofjJempi9tSgTJ/iw4B0i12OartDCz4OQIwO
         EhYRYF8NbUNetw3pUP5zQfBJ7GMFgn/Ggs1KdtW7/bJg+7w73TtZunVLrA/IF8imEXZA
         2Fn9TLioS1Hpg3WBgVqXrDPSYI/gIxDi1fg4hwZn8VaejcqKB4n42cO06FiNwTjVD3g7
         fxsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771301671; x=1771906471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl73Wg7pS+Ahm5P0YPj+Pe00Z8nc8FXlY1ga54JpjGA=;
        b=frU9r1aQzw4+qVjkdlz0wFF4WcsZnuG+7GoE6RmXGgXbKH5XyIT7YRYi9o9kywK680
         MpfuggRA0eNfMF06O8JKzkVMLPJOTPX6TOrjP7n2dos/DC3PfBCyWuuy+Wz+3nSf/KSC
         SXY17n5EqmA1q77NyOBul2ZYU3Sl3jz0wmtro3G+8KT0cXL/bWB1pdvfahwXdLmil/F8
         TsrENVvZnaQdWGghHJebwx1gx1uaRS/fNqOycVBM7LuMPAKcyj66FZHuHiebHgmLkojB
         6KO/FCE/O/yFVjILTpjMcHbEHNVPPgTJLXEtNn9k/KAy9y1mAOwQDjCkmTv7kx4vLLZt
         qBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771301671; x=1771906471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vl73Wg7pS+Ahm5P0YPj+Pe00Z8nc8FXlY1ga54JpjGA=;
        b=k+HSPqV3/nIQtt0Th6YSsagGpYXeMFcs53ZqM9gO/cqYGd1/n2w1IoTEKkd0vTQHTA
         wU5Ywnfy2aCnCioQZL/+JvKVxiuBh3UGjeDQLPhPX5epNUT88YcdQM867nlw3B8WYrLO
         4J6cK2mmhEzg/HrK4QSYF+U9xOHcd+nEK6gRprxX62cqrVuiRozeIaqsCirGBN1C5GCC
         rJASH2N/6gbKLdB/ifvAgiAOGFkHCBtj+d9WZ13fY7wCHzvhpUY+inJz2u2NJ7NYHaQW
         VQsxsS4mr5exfkxWUWq9SaxWMFy5z3axuIomOAz4dk+cHEe6QElbXQCz1DeoeGMK7HIZ
         WLBA==
X-Forwarded-Encrypted: i=1; AJvYcCXLWM8klNRU3trQjVMzz9zUikOcHbKKXV9iaDHmxH8hvE+8WDqRlq7z7iTiHuGxjlJSSUxKCFi0qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ef7A9b6yy+v5AeLSgyPgigSjMyT6Co/ZyIF6rP4VUcLiUbN3
	8cTUQ3PEaAxHBSeAlPXRMalwJ8+S+bGGt7hZBnGwlsSxfM8LGMk0uEYw3FsXN8RKPFwvoLkTax7
	yAdH6ovuU7tQieoqoBq7CtxG30uXxTQo=
X-Gm-Gg: AZuq6aLaRBySP42B1hBDMAnFVyD35VaVyY1ROhcR0eWDfhRWk9t7MKIhhAKlptJ0dQx
	REE2r3+O2Ni1LHTOzFHTEn/vw/ituLdM0rxF5BWUF1a7O+o/jqKgqTibr8CzepTrPdPTmRc/vWi
	TYDR3Gj+B0yQD5ZGaJE1So8MN6dHuQL1dwO5+JtsHegcnXuVLzlp9zENY/G5MU+VDA4qJjvfrMu
	zFg4VhTiqhx3o66YXA6GcdLcxeXhINe9k6g6cgNg69NteLmMaOOuWjE85j5ST1X+siy1Q8jjUyw
	yO4R5g==
X-Received: by 2002:a05:6402:278b:b0:65a:409c:6fe6 with SMTP id
 4fb4d7f45d1cf-65bb1161199mr6549992a12.15.1771301671063; Mon, 16 Feb 2026
 20:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANT5p=rDxeYKXoCJoWRwGGXv4tPCM2OuX+US_G3hm_tL3UyqtA@mail.gmail.com>
 <7570f43c-8f6c-4419-a8b8-141efdb1363a@app.fastmail.com>
In-Reply-To: <7570f43c-8f6c-4419-a8b8-141efdb1363a@app.fastmail.com>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Tue, 17 Feb 2026 09:44:19 +0530
X-Gm-Features: AaiRm52qcDduH0WOoiy86XQ-uP4UAzjzDBGWAMpuxDVbnPDCNM8VzO-fhxMilbY
Message-ID: <CANT5p=rpJDx0xXfeS3G01VEWGS4SzTeFqm2vO6tEnq9kS=+iOw@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Namespace-aware upcalls from kernel filesystems
To: Chuck Lever <cel@kernel.org>
Cc: lsf-pc@lists.linux-foundation.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, keyrings@vger.kernel.org, 
	CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4060-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nspmangalore@gmail.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 54FAF148AE1
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 9:10=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
> On Sat, Feb 14, 2026, at 5:06 AM, Shyam Prasad N wrote:
> > Kernel filesystems sometimes need to upcall to userspace to get some
> > work done, which cannot be achieved in kernel code (or rather it is
> > better to be done in userspace). Some examples are DNS resolutions,
> > user authentication, ID mapping etc.
> >
> > Filesystems like SMB and NFS clients use the kernel keys subsystem for
> > some of these, which has an upcall facility that can exec a binary in
> > userspace. However, this upcall mechanism is not namespace aware and
> > upcalls to the host namespaces (namespaces of the init process).
>
> Hello Shyam, we've been introducing netlink control interfaces, which
> are namespace-aware. The kernel TLS handshake mechanism now uses
> this approach, as does the new NFSD netlink protocol.
>
>
> --
> Chuck Lever

Hi Chuck,

Interesting. Let me explore this a bit more.
I'm assuming that this is the file that I should be looking into:
fs/nfsd/nfsctl.c
And that there would be a corresponding handler in nfs-utils?

--=20
Regards,
Shyam

