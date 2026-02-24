Return-Path: <keyrings+bounces-4074-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL8jGJobnWmPMwQAu9opvQ
	(envelope-from <keyrings+bounces-4074-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 24 Feb 2026 04:31:38 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF8181633
	for <lists+keyrings@lfdr.de>; Tue, 24 Feb 2026 04:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BC58300981F
	for <lists+keyrings@lfdr.de>; Tue, 24 Feb 2026 03:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816421E8823;
	Tue, 24 Feb 2026 03:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW+fI8PF"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0516A395
	for <keyrings@vger.kernel.org>; Tue, 24 Feb 2026 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771903891; cv=pass; b=Ps2sclCUc2Jcze2EZxcc89v7930oiXE16T7a9r6Ba4SktbqyAcKYhWZTjWP/rtt+uMh+IrEH1s0yKljVf6xw78s1a5rpEIqjb/CQWS9dHB8hNAZ9S1n0l7oX3eCvOBLQIaPw0fumfiY7xL1K5x947R79bKFD8gFQUj2Z//dme5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771903891; c=relaxed/simple;
	bh=0veLAPKnNtqrllFgu4YwWXDXJZfIIcfAA8eZ3piGHCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoTxikIqWRbZ/AgcMevDNpdAhcMz7MoMXz9LVebihJprG1Q9jQ+8Ecehzg23I9NuoMe4svJGLjjeMR59fuj21z3cXoZhiLBDCv/jxPTkN2UUdYS8zgH+ICMMUkk7U6CfU+HmJpo69mL2YWdMArWiVfX6LohQYZiYa3Cco2s326c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW+fI8PF; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c5a7785b4so7697921a12.1
        for <keyrings@vger.kernel.org>; Mon, 23 Feb 2026 19:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771903887; cv=none;
        d=google.com; s=arc-20240605;
        b=hqiOUloAX6S8fVoGHopnQsN6y/969teQz0BIA3T3q0V3OVcecW1+AI5Km5Dqocpp3h
         MH5JatqTzym7SvDRBtFw1TC8xmGdwMXpwCr812LMby25chWRpB5vWkRP85vUcHlxohBB
         IxAxMAAhQDR63p3M4QqK/66LeUKbqMJa+B/u34UP7DBHJrQBIIitmjBMe8QiAuCjrWWv
         oTnvlznx7Oe9NwOnwS561+WitiViY66mRZgWs0jyUrywWizkAkw9rv3VVzQyR9wq+/wj
         oAugS4XbeB4q1mRC87KUnsAIzVX9SwU15c8IQpdTXAI858t+S03KQRBITx9WO6hvZ1Dj
         2naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0veLAPKnNtqrllFgu4YwWXDXJZfIIcfAA8eZ3piGHCo=;
        fh=2aKy3/mR1oR9qRUOjjVqUaUqqu0/hOfQ7J6n3xaYoPQ=;
        b=EuWvZmUsei3XAo1lU2a2nnJKnUpKw0jjkGWBfEmTPjFICImRZSBqr4Yjae4qDCUPTa
         tEQ3LKgd3tO1F9rjYpQpiH040zIANxAeiHDiB5CRV9HR1jAmfTD41qxHeHHjkeYpvvMr
         s5fAi5B5V1y0bzX78lxRCVelAlsv8XZoZWBSo6VCSq41k66R7jFL00Iyptcn4X781d3n
         CX5ffyfx0ITmTmTR/7yM6UcJiq2ANz7b7rXDBqy/o+PzTUjVJbJlNZcEYAaHdYueo0gx
         JuoPvEYGc1Z+AltLKnPDRzPG0vKrW1P43109Cie5kOyOD/+TMI6lyxzt6vsJ9TG/o0W2
         SXwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771903887; x=1772508687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0veLAPKnNtqrllFgu4YwWXDXJZfIIcfAA8eZ3piGHCo=;
        b=LW+fI8PFY89pqrElgzFwJqMnsTm/UpDQIht7hFc2pXBeg//TE8uJXxteoG4If5INom
         5+s2VWcVghcYv5h4lgyclCrmqX10dS2dOOTvd9RdCBFhs75rclL+y8zzCSFLMpLL+Bol
         sVLAEKl5HY+L6sdJGtm8t8BhNCJhUF5qjQMu27ZjLzvaGb9QWotS27SyuaA2aygMgfJF
         J4ZfFt2vHxGUNwlYAD4OxZymmybP7sYxAKLaqu/aG6+jtbfPHgkDa0KIEjAQSJp/RPmy
         9moM3uGcT6BntswnG30fp7JNFBLkugnkoJV6XS4vT4tP6x4R0CaZyU5aRsg5cG9rTLaX
         OmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903887; x=1772508687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0veLAPKnNtqrllFgu4YwWXDXJZfIIcfAA8eZ3piGHCo=;
        b=udxUA7erkTWKE3DFn8P0QUeFeGvssansAkUEdtXr5S4aHdBaTqvcUNmM+GzGcKwa0f
         KQY9Dicn0jk5FC8gH2TzTfmRBekNXMGqGNoRUVQcsUKXBQDUGq39F6xJ/ujojqnchl0t
         Ql0gnjUfQrhsP75bJNNfGCbjId+dvn/9oP5j75eEAgz4hQKqieQ4hK7d865OhNmtUSat
         MoE/TE+j5OtkI2ygzRTiw8CIs/W1vubSGljJTIS8n8JxxfR7etRJea1/gRvnzCDQ+lQO
         61VQYfLbBHtXrtiRJqNO8oEp5c3ze3BKlwBVTAcJVDtEkchYiI8yzvsfI6Zqq41GOre7
         j1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVDvfjkJZzf5ZcX0pciToWI9WESOe5/Z7jvJe88vTC5BsJ0oMenieUTMkuKSzhWiE+k6eVSJ37TNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9sw1qXKKH+gjWyvshTSAiN5E6Gffq+xStGAAJh6njTZQ/oLUh
	6r8p9h7sVDAgMOt3tMBSwdxowvdAWyZiq694Gws9ANYjOBbdRR/DmOmyw1JPpQSEB4UWGt06GMt
	01qwB+RowFzkyyaRIl6VTnOUFIMGddSEcSTIU7lg=
X-Gm-Gg: ATEYQzz8rj8e8kuyqQj3nyHGcakP78oy/v98ArAuLJQXC+Y/ArlNxnmjYBhz9tLm58v
	NasXmOCCiMgYKOLuP1Js28D0GjK7P3HmMTO7ir9rB39Ghygh9QnWqwHXi8UFvlCSylTw3EUTYjt
	vs97jWdCVSOaZCaE38a/AvdQg3gsiDCS3HBZGg0XA2Fx9Fk+Zc7DVKGzv8NqAqt5pxf6fsVjePW
	nDWtAdqp54WdGz6WqQciqVs7PSluaKJMMIwEugVa76eWXjO2E0KtMC/55XEdsirtV/JuKzUBg1i
	erlRHA==
X-Received: by 2002:a05:6402:3496:b0:659:4099:877 with SMTP id
 4fb4d7f45d1cf-65ea4b5bb64mr6789273a12.0.1771903887278; Mon, 23 Feb 2026
 19:31:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANT5p=rDxeYKXoCJoWRwGGXv4tPCM2OuX+US_G3hm_tL3UyqtA@mail.gmail.com>
 <7570f43c-8f6c-4419-a8b8-141efdb1363a@app.fastmail.com> <CANT5p=rpJDx0xXfeS3G01VEWGS4SzTeFqm2vO6tEnq9kS=+iOw@mail.gmail.com>
 <510c1f0a-4f42-4ce5-ab85-20d491019c53@app.fastmail.com> <785793ea21fb65c3e721b51f24897b3000e4aec3.camel@kernel.org>
In-Reply-To: <785793ea21fb65c3e721b51f24897b3000e4aec3.camel@kernel.org>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Tue, 24 Feb 2026 09:01:12 +0530
X-Gm-Features: AaiRm53-xi1CQSq700hQjQkka5CX1DHq2zZa9svc3qYxT3AcYdWXHPXYne2Dd1c
Message-ID: <CANT5p=qmNsBEDuMFjNUUV15hgnZ8_pQjjJo0HD0Aj-ezL9vM+Q@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Namespace-aware upcalls from kernel filesystems
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, lsf-pc@lists.linux-foundation.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, keyrings@vger.kernel.org, 
	CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-4074-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nspmangalore@gmail.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: 5ABF8181633
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 8:48=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Tue, 2026-02-17 at 09:21 -0500, Chuck Lever wrote:
> >
> > On Mon, Feb 16, 2026, at 11:14 PM, Shyam Prasad N wrote:
> > > On Sat, Feb 14, 2026 at 9:10=E2=80=AFPM Chuck Lever <cel@kernel.org> =
wrote:
> > > >
> > > >
> > > > On Sat, Feb 14, 2026, at 5:06 AM, Shyam Prasad N wrote:
> > > > > Kernel filesystems sometimes need to upcall to userspace to get s=
ome
> > > > > work done, which cannot be achieved in kernel code (or rather it =
is
> > > > > better to be done in userspace). Some examples are DNS resolution=
s,
> > > > > user authentication, ID mapping etc.
> > > > >
> > > > > Filesystems like SMB and NFS clients use the kernel keys subsyste=
m for
> > > > > some of these, which has an upcall facility that can exec a binar=
y in
> > > > > userspace. However, this upcall mechanism is not namespace aware =
and
> > > > > upcalls to the host namespaces (namespaces of the init process).
> > > >
> > > > Hello Shyam, we've been introducing netlink control interfaces, whi=
ch
> > > > are namespace-aware. The kernel TLS handshake mechanism now uses
> > > > this approach, as does the new NFSD netlink protocol.
> > > >
> > > >
> > > > --
> > > > Chuck Lever
> > >
> > > Hi Chuck,
> > >
> > > Interesting. Let me explore this a bit more.
> > > I'm assuming that this is the file that I should be looking into:
> > > fs/nfsd/nfsctl.c
> >
> > Yes, clustered towards the end of the file. NFSD's use of netlink
> > is as a downcall-style administrative control plane.
> >
> > net/handshake/netlink.c uses netlink as an upcall for driving
> > kernel-initiated TLS handshake requests up to a user daemon. This
> > mechanism has been adopted by NFSD, the NFS client, and the NVMe
> > over TCP drivers. An in-kernel QUIC implementation is planned and
> > will also be using this.
> >
> >
> > > And that there would be a corresponding handler in nfs-utils?
> >
> > For NFSD, nfs-utils has a new tool called nfsdctl.
> >
> > The TLS handshake user space components are in ktls-utils. See:
> > https://github.com/oracle/ktls-utils
>
>
> I think the consensus at this point is to move away from usermodehelper
> as an upcall mechanism. The Linux kernel lacks a container object that
> allows you to associate namespaces with one another, so you need an
> already-running userspace process to do that association in userland.
>
> netlink upcalls are bound to a network namespace. That works in the
> above examples because they are also bound to a network namespace.
> netlink upcalls require a running daemon in that namespace, which is
> what ties that network namespace to other sorts of namespaces.

As long as the "connection" is initiated from the userspace, I think
it should be aware of all namespaces (not just net namespace).
As you said, this will also mean that there's a need for a daemon to
watch this fd.

>
> So, a related discussion we should have is whether and how we should
> deprecate the old usermodehelper upcalls, given that they are
> problematic in this way.

I see a few other users of UMH: coredump, initrd, kmod and kobject.
https://elixir.bootlin.com/linux/v6.19.3/C/ident/call_usermodehelper_setup
Based on the descriptions, most of these are used in early boot or are
done in subsystems that don't need namespace awareness.
To me, request_key is the odd one out here. I think we should have
upcall handlers in the different namespaces to watch for upcalls.

> --
> Jeff Layton <jlayton@kernel.org>



--=20
Regards,
Shyam

