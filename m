Return-Path: <keyrings+bounces-1862-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B77947A9E
	for <lists+keyrings@lfdr.de>; Mon,  5 Aug 2024 13:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E671F21D97
	for <lists+keyrings@lfdr.de>; Mon,  5 Aug 2024 11:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C429156C5F;
	Mon,  5 Aug 2024 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AT14iRrm"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D4155759
	for <keyrings@vger.kernel.org>; Mon,  5 Aug 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722858883; cv=none; b=SN85/9crG4rVFeNrXIWaYFVQ7Rc0c1gDaBZxmTspXS9rKFsSRggU8l7ihCzkuspfR1/onEDtl7x9IpDIDW0hj8/rUx+ejkAKr4H3DuyXXSjC9a2VpS1gevCkmupJVvkc98oALf8VnfGlmb+Ib/NtwdezIv/hMbknwYPdv/8Hq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722858883; c=relaxed/simple;
	bh=xCLopviYo2ZXTYyWMOwauyIB+j+mPVPtuS1184F3o4k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a6H/WDgTIi+gBZDuAzxjvgjqM/LpvKgOhprCZTZQl0Oyz7KFYpDHfhkOwpjIWreLzMgbozvzgubBDCn8NAyuABNOs2mQ2yHBJX1BFL8rrk7g8MdDaSpjBJx2JlIlwfc4iq0VJX3f/UvWEV11VCe++CFGwAxBgWQ1aL8iDqBZVvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AT14iRrm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so11868a12.1
        for <keyrings@vger.kernel.org>; Mon, 05 Aug 2024 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722858879; x=1723463679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkOFFi3fndDmXAZbQGGoKZ5kT7GLEe3o2kwoNptV+Do=;
        b=AT14iRrmKC9hXh7gngFQxc2mwSzf/UuMhBnTlfDjVRQfVsCbuYD2EgFlixahsJjb9S
         10awegSSHI5aQYTRcobSGFtBS1Ual7z/Vr6p4sfMVFRd0wGqHbmv4NJeEyYWH1LgOGPc
         SnNzwVKx1pLrv8jvWxGgeO/foBSlCxE0Hv3EpAvlYeUuql35DmkZAACeY87c8NSIuj51
         PNRKCkDRnCZnz+I11jVrLQPMr+PQJPTzTdl6gsQ/07Wwt9PcCdbVgIl/cBf+NV5NUxzK
         4Z8eQ/TdWBqGFRSuhPyB9tBgXqe4mumP9/HVuvGOxpL3XhrNdAjhZ23lHXnPFi+BGOA8
         EJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722858879; x=1723463679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkOFFi3fndDmXAZbQGGoKZ5kT7GLEe3o2kwoNptV+Do=;
        b=fXF6E1QXRcrH2S0/8zqYR/z+oGzw1XX1Hpn8bsGspVdHCvwbKuj0rp57ILBeEWDAdA
         n4ha2zPeq+MsWOt8KrtoVhxZCxThH8eZhrlPE4krqm/EzdsdDrEYBn6qHYEYj+8pkhok
         erNz3MEvFFsEf3ls6i43QiAkHE7OInVKBqGnOztf2wfJ+FR+Pp1+8JLln8fNCEsWsFc2
         ZoONbG1XJ6WBFQalVZWf5yRM1g9BWFSo7VcLnYDvKm5PTY06/Uot+qJXd4egzmWhUT97
         JrbLwfDH8ryJSopOLSSGRXdsYtm7mqg5d5pPn8pf/ZSmXXAv4wwzQMjekfdfM13g1Vlg
         bpog==
X-Forwarded-Encrypted: i=1; AJvYcCULbvHn5zXYs2qBEUVTAfmMMyqGOGJ/tqiJoELCWuW/kDJL5q6jMdATaUp/qywSHkE1jTZYhyhvfI2SSjiyNilXn4pHDgoVpwE=
X-Gm-Message-State: AOJu0Yzzd7mtciuZW0947UKvwc0NikPCsVnMn/QmtnzGZHZa16ZNzd5L
	Y4X0H/bSSgj3KxIzhGXLTzSI5ZRu7qZJdbgZIqBT3IcP8QzsRebkVpyGwVgvdg==
X-Google-Smtp-Source: AGHT+IFTCqm8BraRgc7Arigoqd1xWwnDt8TRL+WMTE5E5SwinOm4fQ9FXs3JPpX3++/idLohQVMSeg==
X-Received: by 2002:a05:6402:520d:b0:5b8:ccae:a8b8 with SMTP id 4fb4d7f45d1cf-5b9ca81f252mr255490a12.3.1722858878268;
        Mon, 05 Aug 2024 04:54:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:ca74:8a49:a6f6:b872])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd02a451sm9692149f8f.63.2024.08.05.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 04:54:37 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Subject: [PATCH v2 0/2] get rid of cred_transfer
Date: Mon, 05 Aug 2024 13:54:22 +0200
Message-Id: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+9sGYC/4WNQQqDMBBFryKz7hQTRWpXvYe4iOZHA9WUiYQW8
 e5NvUCX78F/f6cI8Yh0L3YSJB99WDPoS0HjbNYJ7G1m0qWuy1upWbCEBB4Fljcxa3QQrtvKVEP
 TNtZoytOXwPn3me36zLOPW5DP+ZLUz/4JJsWKh8rBKThtLB5TCNMT1zEs1B/H8QUqzJ30uQAAA
 A==
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 John Johansen <john.johansen@canonical.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 apparmor@lists.ubuntu.com, keyrings@vger.kernel.org, 
 selinux@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722858874; l=1982;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=xCLopviYo2ZXTYyWMOwauyIB+j+mPVPtuS1184F3o4k=;
 b=X1YK2VuUQ+t/xY7wS6QgxaW1YAPtVGWEsoyQYHdus9WOgQNDyKe+ws3PN8RwStB6L04tlxDBd
 8FXsPZmZOHkCS7IJdSgQL8iclT3gCaPM5MZVPBlypka153iZM8VQVCl
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This is the approach I proposed at
<https://lore.kernel.org/all/CAG48ez2bnvuX8i-D=5DxmfzEOKTWAf-DkgQq6aNC4WzSGoEGHg@mail.gmail.com/>
to get rid of the cred_transfer stuff.

What do you think? Synchronously waiting for task work is a bit ugly,
but at least this condenses the uglyness in the keys subsystem instead
of making the rest of the security subsystem deal with this stuff.

Another approach to simplify things further would be to try to move
the session keyring out of the creds entirely and just let the child
update it directly with appropriate locking, but I don't know enough
about the keys subsystem to know if that would maybe break stuff
that relies on override_creds() also overriding the keyrings, or
something like that.

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- use interruptible wait instead of killable
- split into two patches (Jarkko)
- Link to v1: https://lore.kernel.org/r/20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com

---
Jann Horn (2):
      KEYS: use synchronous task work for changing parent credentials
      security: remove unused cred_alloc_blank/cred_transfer helpers

 include/linux/cred.h          |   1 -
 include/linux/lsm_hook_defs.h |   3 --
 include/linux/security.h      |  12 -----
 kernel/cred.c                 |  23 ---------
 security/apparmor/lsm.c       |  19 --------
 security/keys/internal.h      |   8 ++++
 security/keys/keyctl.c        | 107 +++++++++++++-----------------------------
 security/keys/process_keys.c  |  86 +++++++++++++++++----------------
 security/landlock/cred.c      |  11 +----
 security/security.c           |  35 --------------
 security/selinux/hooks.c      |  12 -----
 security/smack/smack_lsm.c    |  32 -------------
 12 files changed, 89 insertions(+), 260 deletions(-)
---
base-commit: c0ecd6388360d930440cc5554026818895199923
change-id: 20240802-remove-cred-transfer-493a3b696da2
-- 
Jann Horn <jannh@google.com>


