Return-Path: <keyrings+bounces-4061-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJpMH7/rk2ls9wEAu9opvQ
	(envelope-from <keyrings+bounces-4061-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 05:17:03 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB5148B11
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 05:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E3E7301842F
	for <lists+keyrings@lfdr.de>; Tue, 17 Feb 2026 04:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD2921D5B0;
	Tue, 17 Feb 2026 04:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+HXpIHG"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67EC17ADE0
	for <keyrings@vger.kernel.org>; Tue, 17 Feb 2026 04:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771301816; cv=pass; b=mwY1DeT047bf2UkTnIXfCUTp2VMNK+2QIryed+32a2yo/9Em311skicd3H61FG+w4kqzpCabQejNdccShrVZ8TTpytbusn0t1EYh0Nyg/Z0AB0dXbuZxNZCUQ924J6QHN9/w8Xs04QRwRZvBPz4lQ12rKSJtyoIXYe5+knHlPNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771301816; c=relaxed/simple;
	bh=qe+7XX/L5syn+cLvVHmf9Bl620oz//ebyw08Uel5J18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KG39l69hfxcbMI/OQ/jnbnW3YIF9RoLTI+vLcrB8qcshOP2jTTrKx1p7UhvlMIotg2AE242dUU7ZFAHvJLEmBhXt6fKJCCLsRvfNO2irbjY4vr0kfktTIbvl4ZTiPgAd+aZyCbS/MlwDkJS9t2XYbbMMKMoqGf5Q+c9EQp9UkKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+HXpIHG; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so628892766b.2
        for <keyrings@vger.kernel.org>; Mon, 16 Feb 2026 20:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771301813; cv=none;
        d=google.com; s=arc-20240605;
        b=WJ197aF4gtkQeGOwP6MZC74L7rRI/jO7VmXR/73UIBovAdNKUyYX9yf3vhS0MiWvPn
         FmeUZ0ASK10TFSF1SnUTAbqZo97yo/ga4ZhaDj0WhTvzunjzbTGLeSCgY1unWXmmiHXZ
         ON3DJKlG7qE5wLhhvWhCa9QtJGbxt7Am/g2jp3ekWxmSXKg75+azu0LAmyoAFu3piAXJ
         /XguVBnSEjRX8vNeIZhIAuXOzCw/r4EKeI1HClBFkGHghkb1+HdSq4fNtDNhPUC/BVtf
         eYo7zdGBGz/QODqL2VJ0xGg8TFEaMLVpUw7lwKV40ev4dlz1RGd/sINFUjJFC3KzrZHv
         sAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qe+7XX/L5syn+cLvVHmf9Bl620oz//ebyw08Uel5J18=;
        fh=Bnx4IGXyEjm6dGm/edzIgC0z4hSKspMDN49XbSGfy0c=;
        b=gUEjweXhtllhNHqiK9H7Y2XA7K35wmRt329rTDhw0J30+FfsqZBNUb64MTdAfl7pOC
         BZjR4aXsRi6H/ux73AqmyQpBSMbJn4epVOySjLu+H1Tb6dzEq+6Yn8Ftm8IPTYHY9Xpz
         eDOe51dWDL2zOxW0O89MX4K+IEyJoybIXf3eC6KathkJ6QaE84xf2U7EjTsAshJY488a
         agyP4YlOVD2wdOgL8BNnkkJ1drX/JNbcgNljxUYqAyguw+eSo9BdEG5zkryLeL3YADXy
         zPv1HIB9o8F/ifDojUoY3fDGUVzsEmn+3qheWuafo29KlCGbbtGo9V+ao2RQx9Zt8K42
         psog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771301813; x=1771906613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe+7XX/L5syn+cLvVHmf9Bl620oz//ebyw08Uel5J18=;
        b=B+HXpIHG0tSTxiI9EhZ0HTLNVrd3JB4Xvv9hlsXrPnUq9zZhsBfOYL7wVgqO8iCBF5
         SWKUfVzoc4N1pQmQ1IQKOUlIsVnZj+lfAjxA7H4GHZyI3kpkMzeRiX3YobR2jN2wqRz8
         WQTQcHTJBcgBnEvVz5XSNNPrZqz1f6/m2R5rlNI/0PZiYY+MGywlsDPuYgzXF3FLKGgJ
         kzo1KOc5b7GMMQTnuV75QA6P9bj8PLhz2JzuIeMuak0GyoHUiteY8AlgXuYF7Vqrc1wl
         cjTs4XuGF3YfbzY6i4QuSuaGGVPokJYkg9lnYv84pHCSpu8bT7DRa0zHVScqPqV4E9wm
         NGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771301813; x=1771906613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qe+7XX/L5syn+cLvVHmf9Bl620oz//ebyw08Uel5J18=;
        b=pi5nLHVSUJzbn5dJk9LcUj1uMYzbI0NE2JLnR/SBHXZClV89WeDOIMFn6P8vV30dCd
         wzEJNrtlpP+fEGgyeEy6PjLhe8tks/CThjqkpX6CHrquRTnlDjQN40bhyTnvMT7EjtsR
         3hqUp+KC3T0zUVjd01EiV6gIaRia9XPB6CoXSjWeekLimSvAv41Qsi7zsLOHE5RWx3tp
         mEmZrl1K7BPnLi0F36DXrNHY893ooEEE01ENq4ypekHYJfNViDsU0Xr2yhmeZ/Af59Ws
         I664FqGzzBtgPO/4473QP+7xDazMrQJAxHboAs3XE/Lcf8uXnyj6bPNtJoG9Ecc+N3uq
         eORw==
X-Forwarded-Encrypted: i=1; AJvYcCXD4MmwL5z6B4bFmJrv3OI4Gk+pj/9qQ0PcyrzAODNn8Qggk0A7PwY5Odt6qwcy+TvRCPLbxVTfww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNjqJCgsiRPMcqVwbZSGci9ZjiubhEuSkHqx8ndnoiQsIh3TP
	Fxd+y4JhK0ojnfvaYdX/EcB1EV/FFLjHaHRMhFgjcp05LUklRK/AfYzWquVI72P/4VI5LFC6bf6
	+uX3XUygkwIQCIJdsD37djaXdyeni9LI=
X-Gm-Gg: AZuq6aI8cZfyEzagyqsx7UrciTVENNxXyl5dFLnJAMavVblXLfJ4Bx5kvZdZcABXndV
	CVLK+JKR39Mt8IwtvlXKxtHnG/O7lQ5oABVe47dXvRxQl2nQRRqpxejx6pe/qnIEuh5D1Tmyppn
	ZtqTOPnl924EtqZXdccX0ce8oGdThgfdoufG/NFlq8sJ+DLHzP175t1V41QwfWv1abE9/QzrMZn
	NWwo/e4d8I+iF79Hk2GiQ/8Z/1cxr0Me2++9mo8O6fu/58EHhczcTERMOK9TbJGKSH1GrXLZ+iD
	qI099w==
X-Received: by 2002:a17:907:3da2:b0:b87:d186:19e3 with SMTP id
 a640c23a62f3a-b8fb44a3778mr761877266b.43.1771301812795; Mon, 16 Feb 2026
 20:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANT5p=rDxeYKXoCJoWRwGGXv4tPCM2OuX+US_G3hm_tL3UyqtA@mail.gmail.com>
 <aZJmthYtk33KYDud@melos.hm.i.d.cx>
In-Reply-To: <aZJmthYtk33KYDud@melos.hm.i.d.cx>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Tue, 17 Feb 2026 09:46:41 +0530
X-Gm-Features: AaiRm51QHtefjwH_4aVN8UbkRPTl2or_N2X9XdmE9IAJs0YnwmTtQVL_DTyVRpY
Message-ID: <CANT5p=p6yw3eYJVXZc2CA2fBgBYpZ4W0uKivt2tCmtgos3GVdw@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Namespace-aware upcalls from kernel filesystems
To: David Leadbeater <dgl@dgl.cx>
Cc: lsf-pc@lists.linux-foundation.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, keyrings@vger.kernel.org, 
	CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org, brauner@kernel.org, 
	David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4061-lists,keyrings=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 40DB5148B11
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 6:25=E2=80=AFAM David Leadbeater <dgl@dgl.cx> wrote=
:
>
> On Sat, Feb 14, 2026 at 03:36:22PM +0530, Shyam Prasad N wrote:
> > I tried to prototype a namespace aware upcall mechanism for kernel keys=
 here:
> > https://www.spinics.net/lists/keyrings/msg17581.html
> > But it has not been successful so far. I'm seeking reviews on this
> > approach from security point of view.
>
> I have more context from the containers side, but to me this doesn't
> appear safe. Entering the right namespaces isn't enough to safely run
> code within a container. The container runtime may have set up seccomp
> or other limits which this upcall won't respect.

Hi David,
Thanks for these comments.
Let me look into seccomp to see if kernel will have any visibility into it.

>
> I would like to see a solution to this though, we currently have custom
> callback code to make this work. I'm not familiar enough with the
> interfaces but an approach where something registers also seems
> desirable because it is able to preserve backwards compatibility, which
> changing the namespace the upcall runs in doesn't.

Ack. Will explore the options and get back to this thread.

>
> David
>


--=20
Regards,
Shyam

