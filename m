Return-Path: <keyrings+bounces-4073-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGgOGwoYnWlTMwQAu9opvQ
	(envelope-from <keyrings+bounces-4073-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 24 Feb 2026 04:16:26 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB44181569
	for <lists+keyrings@lfdr.de>; Tue, 24 Feb 2026 04:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B08530528BC
	for <lists+keyrings@lfdr.de>; Tue, 24 Feb 2026 03:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AE7296BDC;
	Tue, 24 Feb 2026 03:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJtA40K9"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B373189B84
	for <keyrings@vger.kernel.org>; Tue, 24 Feb 2026 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902977; cv=pass; b=F+wHod04Q0RLUDSQkjdvAOoGZYDYTFd1XNMwnHWDHcXRw9GgUUdCuLN0q4dttAbQvSphtSWWnCeGV/tu99YyTGcNRWLipOynBn2N0nkulrqAJFphxE7g0QnPpJfmvYi3WUq5Hz501a1Ct4znq61hkU3P/8nUuggUL9IJyXASYxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902977; c=relaxed/simple;
	bh=/DZt0xtYa5lr6976gZvjB7WdGufQG5+fQI8ZuixrTvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Avt+oU8kNyAvDHtXwvAna4W/xPl4nDwbSc20J4mQNF5RmGWfoP86D3ReNF+ghE6h+G6uLdLMgYR4x63gfJuNurbJovVl1R+gnCPqBt3EgjtPAbLTe5TitF9ZOqSEz7Voc6VvU6BoeZFmxNKweuQWCbhHUpPtkPxMHmt8w8OlrYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJtA40K9; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so9616625a12.1
        for <keyrings@vger.kernel.org>; Mon, 23 Feb 2026 19:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771902974; cv=none;
        d=google.com; s=arc-20240605;
        b=lE2yyilPqcU3wf0SS8pVqlgvf81GqeVqwB0ndip/r+UfCC19n+GiRfjwK4G9oOWL2h
         uXFksgd9OsNtfvco6kkYTkTWtAWtTqvf6yhttKIZfwTAL5gIVQcGlKphwPflpQcavoFs
         GHxhX+HYqtB+u3ewNcgRlkeAeC7vqjQDyn672pZroJa9LOz1bdxqPo2SaZnuN0Rm7kGx
         XsoC5FqIFgDV7ipnH581Yp5eCJoITJVDzeS+WBFZyIr7B/DJYqBq5Mns9gvNWydXVtGy
         PzXLjvm9dopOFATmRc6Yh9gUlz6bWHvx0BKGYeIjCfvz6oOunaA3+PfF/Atts8ZNwafv
         YDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/DZt0xtYa5lr6976gZvjB7WdGufQG5+fQI8ZuixrTvM=;
        fh=hwIZHwDbIzzQPl5NJWzRdGP+itT/m5Sw452U8kgeyik=;
        b=i1wOD5o22knC7dTjnTc+aO0lwkxr/aWWfMEdvWbeJeTrwPI8JfYUFH7uXbh0LpdTMB
         81QJ6Ky0MRZZqoYJz9RA0+IrkXu+elcT+Ob5/yeb+JDF+Th2ECs3TdxeyGgrLIVoY5cZ
         ud7JDb/O3qMQVKKa/oTXmURSE2/8Xzw/l1V+gqcDPpSnAJo54uxkMPIXbuwKNw4Z2Ehu
         qoB5aSS8CJI1cBwimzwedYfkvgw5joUOqc26eXWQCi9nv0NTWd+8ZuKKuMicI1hf8VBQ
         A/EuDQ7XdehrxzOptVcz8oKW9Puf6PbRmCk9KWnjNXoc/dp/Pe0yYglWjCvqH7wuT9+/
         QaPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771902974; x=1772507774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DZt0xtYa5lr6976gZvjB7WdGufQG5+fQI8ZuixrTvM=;
        b=EJtA40K9HAoSdu5Nf5Nq2aG9PozmLTjJXiVzaSxUyZRnHGlsmpYrUVq/RE7WvoHJPa
         no/pdzQxnix8+xy8EOWY06jvz1LcZ4pWLu1F6rSQxFy12H/n/olMkaZg/r4zn/yiAj5s
         UKa1/Vfmc0yGnCsnK8aVMhdkc/EUlUgIQPR9ADi/gkvxat9lWFnOLpzRaSdrHUSSWXvP
         FWGJWa0DRFgIe2GFB7xjQjcgICPCoFCsooilZP4uExpbXEdORWr5lJPz5pSJNw/Zk5Lo
         CjK0Gqc4Bz53LuDP46VFJfRsdYjgtXuh23ulzt/IrTDzLwUSQdGtLu47rGMkfxvgda/O
         aiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771902974; x=1772507774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/DZt0xtYa5lr6976gZvjB7WdGufQG5+fQI8ZuixrTvM=;
        b=hLz8d35JuY77dTVmRlkWPWI6AITzGUxw7oJJSbvovqHbZ6SwGkh+pSIdSUDevSo+2T
         rpjMLmWnvXghQ9sfX40pO2O2s/M7u4DNlKo4FlBIkGRrC2EFh/LaNRctbYiKtE7TMafY
         uoOmKSPm/GqN0PsyCtmPT3INph8pa92UeidlosDJo+5XwRq8gNEVa00J+2iEhwm8eU7C
         sY3H0+fI6Sh7ljLnjhl1CWNtcOg4i2VpyT+LZw0HzHCnMR+cs/Xw9R1/5aHQcp90a5qQ
         MNlOP9ZU7fK6O8NLwEiSRQJ8qat3eMfxgddwKUoYy21jPIOIkICLOwDi0kz1qTuFPpin
         pOkA==
X-Forwarded-Encrypted: i=1; AJvYcCVQqrlRsa5xKxd6DO8yjQrgOtlfkBxVTQgBZAHQT4ffPWzbKF25wyGr9/46IfGLVWj1YKPJThXTkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIT00Zy5T5yByQLeAx8EqD+xntiXJDg54OeeT7t+rtkRtKFHV
	N/He6/KO1+50X0OTCzyuF46hLmGr7BBvS/KDfy6xXw8H2eU2tlBkZOMOwY2zBtK5j41oqLsug8Q
	ajaq253tOJCDd4XRfaRJd+/KtHEAGeXE=
X-Gm-Gg: AZuq6aKlO5gkxoofjg3xP1YMU3Ifggv5lBurbtJOWwNMXUREBcix5XMgWbbrWuzLJDN
	FHUEsW6nP5APbWh5MS5ROdpp8fh0anx05dYi/L2NAcpnqTBkNQfvJSpsNKbpSyCjDj2v36Nxj04
	MTIs5YSHpfVbRhdvmwDBDlb46kEU0rSLeVEdcB9CcKgNQZXG5KDpLPt8upMQtkP8ZVbPO+FP3qt
	ijrhX1grnCys/+mFCX7mJMAtHvVtGA3ZFrREwP1q/Uel7beDS52Y7leSs5PBha6E36ZNBYObW5h
	mQ7N+w==
X-Received: by 2002:a17:907:268c:b0:b8e:380:5669 with SMTP id
 a640c23a62f3a-b905448b905mr922119166b.32.1771902973804; Mon, 23 Feb 2026
 19:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANT5p=rDxeYKXoCJoWRwGGXv4tPCM2OuX+US_G3hm_tL3UyqtA@mail.gmail.com>
 <7570f43c-8f6c-4419-a8b8-141efdb1363a@app.fastmail.com> <CANT5p=rpJDx0xXfeS3G01VEWGS4SzTeFqm2vO6tEnq9kS=+iOw@mail.gmail.com>
 <510c1f0a-4f42-4ce5-ab85-20d491019c53@app.fastmail.com>
In-Reply-To: <510c1f0a-4f42-4ce5-ab85-20d491019c53@app.fastmail.com>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Tue, 24 Feb 2026 08:45:57 +0530
X-Gm-Features: AaiRm51Gum82xCPbCea-rxtnj6tTimqhg7EvD-Mp_KEO3nKBntLMk04j3n-RZRE
Message-ID: <CANT5p=q05gni_jd4=KHsmR0LnF5HE9gNfo17q6f8ngsjY5EZdw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-4073-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nspmangalore@gmail.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AB44181569
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 7:51=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Mon, Feb 16, 2026, at 11:14 PM, Shyam Prasad N wrote:
> > On Sat, Feb 14, 2026 at 9:10=E2=80=AFPM Chuck Lever <cel@kernel.org> wr=
ote:
> >>
> >>
> >> On Sat, Feb 14, 2026, at 5:06 AM, Shyam Prasad N wrote:
> >> > Kernel filesystems sometimes need to upcall to userspace to get some
> >> > work done, which cannot be achieved in kernel code (or rather it is
> >> > better to be done in userspace). Some examples are DNS resolutions,
> >> > user authentication, ID mapping etc.
> >> >
> >> > Filesystems like SMB and NFS clients use the kernel keys subsystem f=
or
> >> > some of these, which has an upcall facility that can exec a binary i=
n
> >> > userspace. However, this upcall mechanism is not namespace aware and
> >> > upcalls to the host namespaces (namespaces of the init process).
> >>
> >> Hello Shyam, we've been introducing netlink control interfaces, which
> >> are namespace-aware. The kernel TLS handshake mechanism now uses
> >> this approach, as does the new NFSD netlink protocol.
> >>
> >>
> >> --
> >> Chuck Lever
> >
> > Hi Chuck,
> >
> > Interesting. Let me explore this a bit more.
> > I'm assuming that this is the file that I should be looking into:
> > fs/nfsd/nfsctl.c
>
> Yes, clustered towards the end of the file. NFSD's use of netlink
> is as a downcall-style administrative control plane.
>
> net/handshake/netlink.c uses netlink as an upcall for driving
> kernel-initiated TLS handshake requests up to a user daemon. This
> mechanism has been adopted by NFSD, the NFS client, and the NVMe
> over TCP drivers. An in-kernel QUIC implementation is planned and
> will also be using this.
>
>
> > And that there would be a corresponding handler in nfs-utils?
>
> For NFSD, nfs-utils has a new tool called nfsdctl.
>
> The TLS handshake user space components are in ktls-utils. See:
> https://github.com/oracle/ktls-utils
>
> --
> Chuck Lever

Thanks Chuck. Will explore this in more detail.

--=20
Regards,
Shyam

