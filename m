Return-Path: <keyrings+bounces-2244-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 912459A4CEC
	for <lists+keyrings@lfdr.de>; Sat, 19 Oct 2024 13:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B69E41C21242
	for <lists+keyrings@lfdr.de>; Sat, 19 Oct 2024 11:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D3C7E101;
	Sat, 19 Oct 2024 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rl8m1Aid"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A203C24;
	Sat, 19 Oct 2024 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729335942; cv=none; b=EMoPc/ilZhhwiXO0V1UBHix46BtNfWd/rQEte5LFsQQrlOkEjzBPrmkjIcb+i4z6dzjK7pMKXCMKOTZDizEDq1cd0j2nsnN7VLZjmQUgxPOOOFzrzNtQcRgxBx3xKIVTAERNRVMtaOV+5FmgvgQ1V5t+5Zv480P0tGf0lABw2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729335942; c=relaxed/simple;
	bh=Cj5+uaoHmtPcyWshBNnd7LulA0+Fu3kBIMPfVtiCJvQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a1ScZigZhkBAuflPZHejzrvSu2r7ogrNaWiFgH8WZOnSquwedc9ra/unASVFkgBoQTbktVIzazMaLkEJ6SOgw0QLEr98sL1XlcHedz7aOG80PX2zjvSZVr+bRj1r40oYG88p0SYpbKBVQLsmPaKoafJRQBuSJmkQqaHew2MRsTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rl8m1Aid; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso31513101fa.0;
        Sat, 19 Oct 2024 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729335938; x=1729940738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n4n5r0LyLlOyMlw+3WC3gnLFscPyNXGSjKBBFINYcMg=;
        b=Rl8m1AidgvxTxpmAuaZdb0jRv7+vl/5OeFqj/WC169JUs1SquN4Nut9SmWmWrF9dJK
         6gVR3FBzNucwc/Z4GuK3dYhcpgHbk+4q4DekngYk06CoGFK1HbRXwFdr+7Du0b9EsZCV
         PJdUkWNRm715K6Tt/FSFNRXwFhuiNNYekwvx17hy5ycOsf0MekQwAEbMoNIPbPpJXGgX
         SDEahEQBYZ3WT5u/v9xlEak6MxaiN+YKSdB1HTRHZegpWuV2QTlwsOWPKtnrkrpnXKXU
         vX8lkFK7mXrt+/pPnSKG3CORA3gjrCkYh326Rt8Lr8oDKJd4iAf/WdKPjfiUDHqCIi5O
         CCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729335938; x=1729940738;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4n5r0LyLlOyMlw+3WC3gnLFscPyNXGSjKBBFINYcMg=;
        b=LDfABzaI98tyU4HKb/6c8w/XgX9A3aB8DJdBGEiXoZQhvPXPxajYxlAaaQxB6s6jt3
         LagfuEhwRmQb2TBUXXkaddiclq4IJuWqW8u+opHhIL1OQvWZtETZjPoVYlSvgYP1SxWV
         Vrv59a7tGcNtkWfMgHw/185KkIhNuynuBkpG+YSHPaXjX6J2HYfwTf2w8nPdQ1E/0N/4
         n2VDtnIT9Clmp/toPLdlupftHc3vhgkTaJjai1CU+A6EXlio/2IC8RZwbXPernBYpz9H
         oBI6Ajd/cePYK39tUqKdixycZx7Fi9pIMB+jddFQpidwLbYO7xOUaSseh9zzjUk+/hoZ
         KH2g==
X-Forwarded-Encrypted: i=1; AJvYcCVRiobVxqEr9RW/LBUFALZi/LJDp8m5ExRzsCaM8fuTi9/fqo2Z1CatOB9qLc98Tm7ASUe6PXQufArv@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGrVTOGcSLgKnFKXVFMMfIO7fdZK+kPx3EnucoeLpaMTxU1sL
	HeKNl8NiNSY3w7+A5zDHsXkEndgpyO5Xde6Reo9vaGBX8y0UkcOWhxVhXD0pUIYt4NAGtRpcxh4
	sK14/mIY5GWEEZR9+DyzHPCTwyeM=
X-Google-Smtp-Source: AGHT+IFYMrRl9zSNJF7JhS0i9XBRuobDzfM5qdN/j6xW6aOA8m7+3JUwtMJmQJQ3yWKSUULKmSoF80VSk38sFFPdlAY=
X-Received: by 2002:a05:6512:1290:b0:539:918c:5124 with SMTP id
 2adb3069b0e04-53a154b123amr3250752e87.31.1729335938067; Sat, 19 Oct 2024
 04:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Sat, 19 Oct 2024 16:35:26 +0530
Message-ID: <CANT5p=qXE3JeX-iaye1UeFvXGkvJwEoSw_pzz5Crq=uTFdVniA@mail.gmail.com>
Subject: Keyrings and namespaces
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>, brauner@kernel.org
Cc: keyrings@vger.kernel.org, CIFS <linux-cifs@vger.kernel.org>, 
	Ritvik Budhiraja <budhirajaritviksmb@gmail.com>, Bharath SM <bharathsm.hsk@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On the Linux SMB client, we've recently been dealing with some issues
relating to namespaces for containers that access the cifs mounts. For
several upcalls that we use, we allocate a seperate thread keyring,
prepare_kernel_cred to create a new cred, and temporarily override the
cred for the current process before we call request_key (which
eventually can upcall into userspace).

However, with the current design, we always upcall into the host
namespace. We then have to perform any namespace switch in the
userspace (which we do today for some type of upcalls). However, this
does not seem ideal.

From the man page references, it sounds like each user namespace has
it's own set of keyrings. So it only sounds logical that we use the
keyring belonging to the correct user namespace.

We ran some experiments by using the right cred->user_ns for our
upcalls, and it seems like we still always upcall to the host user
namespace. After reading the request_key code in more detail, it looks
like we use the cred->user_ns field only if the dest keyring is a user
or user-session keyring. I wanted to understand more why all keyring
types cannot make use of user_ns too?

Also, why do creds only contain the user_ns as a field? What about the
rest of the namespace types?

-- 
Regards,
Shyam

