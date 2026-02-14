Return-Path: <keyrings+bounces-4057-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uECrJFBJkGkJYQEAu9opvQ
	(envelope-from <keyrings+bounces-4057-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sat, 14 Feb 2026 11:07:12 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B413B9D5
	for <lists+keyrings@lfdr.de>; Sat, 14 Feb 2026 11:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43743302EE82
	for <lists+keyrings@lfdr.de>; Sat, 14 Feb 2026 10:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62515287516;
	Sat, 14 Feb 2026 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJWG/0TD"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470726560B
	for <keyrings@vger.kernel.org>; Sat, 14 Feb 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771063598; cv=pass; b=LbbxMO5Eh99QEAkgsTH+xAgTLRwWHYr53k/pMgeHtAIblnVSTDuGs8sIcLKhXLkBvpUw4TSSdwVlVzROuhFIOr8xzVwiqjhnMkdN2GlvwteKBe6I1Nc8O32yY4i3DDKOE1ETfxRq+nt0YQfQBIOLgNINO7dTmBQK1tJZ4A8UEZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771063598; c=relaxed/simple;
	bh=jY3VYgfZdwcEWaDFOTWHCBRqnN2ieQGX76J1TWV/hN8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i7V4NQkW/rlfUyToqjp4wnVOD9RN576lJjpLsmXwyI9NSSCHLdd8H1yAQEw2mC9Uw3Lbl7IApiM8ZimvYRwOKMK5FNTZ1Yy1GKdh9NNPIg1PJotdjU4SABrIi20txa0/0b8Hgpq9eWwxe7grUZQHEXGMBdloemGemyZI25DuwS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJWG/0TD; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a1b17a99aso3128201a12.3
        for <keyrings@vger.kernel.org>; Sat, 14 Feb 2026 02:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771063595; cv=none;
        d=google.com; s=arc-20240605;
        b=EGg8GjUExw+fiSypePkpi7BoDk8nW51wAGFV01pwRucnjqcp3K198u2uLiYZ1kLt8x
         n8so0VYc24cHDlVw43I27AtQHlxU8TZjfPkTnX/KafGNAUyvyslk9jwwIZxPdkK/5foo
         X+m0fXyAhHIAXQ2V58HmwvcR9+Ky3HBrqQ8t700tDCHm9RCQOT2WhihlonQzegzHARzY
         x3+MBHan96R3RmA7PUUnHT5S5rSLkGaucDJGmY4pQnGXobZA+ALGrqNLsYvTeSfYwKRb
         cNGq6NBnGlxXcjnn/iuit5uZWxGNcPq7OomwukgpDkA3NbhsnJNvEWXRHJ6KhXLmegqv
         onWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PGGVJbddt208w/rGIVrn/yfhIsOw/8PIkZU+nOzBAdQ=;
        fh=CszTF+SyFY0FSQ2lZb6F6u6Jzjmf8zYTmQ05rI95RrM=;
        b=IQ7BWR3bK5bo7Uyd8EPAguSrm3gLkCG7k50D+AazalWVnS9O8Cw0FdSELQiZG59C3J
         v4VAeEvGYuzgCsWqc2HVBgS2j7hBqePFYtMYaU3ApQgXWCz08u08fcOumxRdtHAaD91w
         8x26LDDalfHoK725wsh4zT+PIfzZWiKxpj9duq7l/e2iQOnR5Nf3nLw4TicxHckDdNFr
         fZvZxYe2RvR3yFtuUsVhVf2N/Cls+jjUO0k/HKG3/0b6EKyhed8X2aMoJ2NbNFzZZBpN
         2PCSgjmgyIXl3yW5NGRf9it9tYgHmQFk7Zqu6jnfK1Hw25kNglTOHoIv+6BP8wcGd3VR
         rHlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771063595; x=1771668395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PGGVJbddt208w/rGIVrn/yfhIsOw/8PIkZU+nOzBAdQ=;
        b=iJWG/0TDNqvsdOWejxmu1z4K6eR6SkFFPeweAMKUuf4LjlqhwlPSq5tZSYCbHIPKm1
         EltXd2Tsle99bwwM3BWsEjIOZ+nolbgkUOW7pdQB3oScmn5W6gdTWWtnF1vbCuKB2nOf
         we0xiWFbptRLuR1m/hb43AuR2tOT69JGivipnH8le1LKrV6Y8EMxSJVeaAF6KkG/75Jg
         Th1xMmTon+pabWXfcBFHEA1Uh3V3RC8EaYDqxLc7yl348ADM3jt9Gzme7RyUZgyvhBqC
         EOi/GKPhKPDijFB3bTJejzBSKCQij/BWO0zam99kZ7rACGVRhnrpWBaJr8uaVKdf4CWu
         Exfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771063595; x=1771668395;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGGVJbddt208w/rGIVrn/yfhIsOw/8PIkZU+nOzBAdQ=;
        b=mBKkCNS/QzaZGlTuVj4+8Awvbx2nPHwWtxJA/WZIcJ28s4dwlhIc3F114LWXWux4dt
         Gbfs+l4o4mBNuV/4Psj65T71J6aUv4HUHgednrBBBQzhU6ekys6+EgBSk4q6sr0EdUDg
         On+OzTJN02QoUjGmgHCiIyWlK/kP+4CoNEhdLZ5tAFCCKH+tLyODddApl8RBzdb5KYMq
         6oOmU7tc/AjAu8c2awN2LyA10ucxS6bYRQCkvGYLOvz4EkSxkPvTcN0FfAaf+yQgPXCP
         0bfR9DGMG+SqTA/mAd3RbjiPOZST5ZMPQD/XaalZ/gToisjlyON4jixa9BBX1kXOGczb
         TKig==
X-Forwarded-Encrypted: i=1; AJvYcCWpFP9D6R6leggFnJQJ2IPm4K6q1HKnUhm/nLBU7j+uxSxv1+d5nB5BfvYpsObz0IHN03VJHLFf1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP32DHwP0C+vOJqmIZIuwKqBw50tVRZr30YoPBGrqESZRlyr1a
	7ua5aI2z+mbtIJrRBWq8uLkmPkY/rp+seYlpoO9GahIB7vsYev2NvRD9zEmYVWfRVP8xSli59CF
	q8l/hony1Tm+h4Z1TP/4YHoy2C9/X0Jw=
X-Gm-Gg: AZuq6aIRJ5lHuByBZkmLOqh1TsZV6hTPidxo8I5TQ5ospyutqqI8p4Y2siuxEv3kQKG
	nyb9ryEOvVKFnFbWHzUjT2A+ACWFwZUm5p7HQKgtA3sPKFEF830yvCSTSJVwlTDijD7yvoU2h7Q
	bhagtQlfK6Cx0Ke+MsCG4fuADGRcS93mEDlKStWfKSEbxY5mKaAkCqxA7o4bjCV157YQfWiou5D
	cLIXJ0EOyBMbAvFqtlJTKJ3EsLhh4jdBezzNXBKJjwTx9pa+ycb19/pkUTjeHTtq/kbVaQ3eSEK
	X72W7A==
X-Received: by 2002:a17:906:c14d:b0:b87:6d6b:1366 with SMTP id
 a640c23a62f3a-b8fb4462ebdmr258928566b.41.1771063594865; Sat, 14 Feb 2026
 02:06:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Sat, 14 Feb 2026 15:36:22 +0530
X-Gm-Features: AaiRm53SFCWgM_DXMfR7wPwL0TsGianlEbiEEbkirbl4xvQ7utf0iFrM8-H5s6I
Message-ID: <CANT5p=rDxeYKXoCJoWRwGGXv4tPCM2OuX+US_G3hm_tL3UyqtA@mail.gmail.com>
Subject: [LSF/MM/BPF TOPIC] Namespace-aware upcalls from kernel filesystems
To: lsf-pc@lists.linux-foundation.org
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, keyrings@vger.kernel.org, 
	CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org, brauner@kernel.org, 
	David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4057-lists,keyrings=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spinics.net:url]
X-Rspamd-Queue-Id: 341B413B9D5
X-Rspamd-Action: no action

Kernel filesystems sometimes need to upcall to userspace to get some
work done, which cannot be achieved in kernel code (or rather it is
better to be done in userspace). Some examples are DNS resolutions,
user authentication, ID mapping etc.

Filesystems like SMB and NFS clients use the kernel keys subsystem for
some of these, which has an upcall facility that can exec a binary in
userspace. However, this upcall mechanism is not namespace aware and
upcalls to the host namespaces (namespaces of the init process).

This can be an inconvenience or a blocker for container services,
which run most code from containers and do not like to host any
binaries in the host namespace. They now need to host an upcall
handler in the host namespace, which can switch to the appropriate
namespaces based on the parameters sent before getting the work done.

I tried to prototype a namespace aware upcall mechanism for kernel keys here:
https://www.spinics.net/lists/keyrings/msg17581.html
But it has not been successful so far. I'm seeking reviews on this
approach from security point of view.

Another option that I could think of is to host a device file in
devfs. The mount could register with keys subsystem by keeping an FD
open from inside a container. The keys subsystem could then upcall on
the "right" FD based on some parameter supplied to it.

Looking forward to hearing if there is a better approach to solving
this problem.

-- 
Regards,
Shyam

