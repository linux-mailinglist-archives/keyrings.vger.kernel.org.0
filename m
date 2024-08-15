Return-Path: <keyrings+bounces-1872-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6049539AA
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 20:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22C39287E41
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 18:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621C455893;
	Thu, 15 Aug 2024 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVPbWpD+"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301DA4F883;
	Thu, 15 Aug 2024 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723745430; cv=none; b=phOvINeVT9VVpCZvRpIFrneJCQzT8ycUMqJSiPtW7rm8lB+ITmZh+Ka3xruEk7b0xowAYUNmE8ktZEt9mTgx5yr1FnKCgotwqwptt8pbgSvTj1aYtHJVskhSUidqjql8yBP3QuQ6YNEkeX8FnFcCkNBYQAmXn5qTe7kTOVmIO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723745430; c=relaxed/simple;
	bh=om7OX684G/oesIBJayt5HCmIUPcMZl/LAozCLWQuAug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LhspfVF9GRU5NkpX8E/2NfHQFYSaTMe9/1AGkeI99rKmxgtsEK5mbXlcU2UqlWwXsd1pQtB1YEa22fuir+2DEjwka0ZQIaw+rJw5sAiS/+p+A8EeyJVWl4WJ4wwco1j9HQCyQH3VZe6614kgS1+VWOabjyTLSoZh+kGfrsEq0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVPbWpD+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DB3C32786;
	Thu, 15 Aug 2024 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723745429;
	bh=om7OX684G/oesIBJayt5HCmIUPcMZl/LAozCLWQuAug=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=rVPbWpD+Ob0Tpbr7e8WlBrlZHXQaj3yLTXKOUGzMVRG7TneUOx8/eWzbbKY4Qq4cV
	 K/492YyJpPyqYEGSodtimD1wyddKVuqNxA6DUHUT15kgYqwSKHEMp1Ifbuo571UCjw
	 Xk0R0reJYTZhSpnJLJ8Ne+Qgb1cri2Zd+bHEr2EpKraIF/kFNkiZWgNMTKvN7N3FXv
	 JydU8pj41keiWNtHhNfFk+K1fNJeB4iILEwp6tGvFfxDeqxC2KzTVj/MVbk8Fpw7Hm
	 TjYALAU+mvptY+S6h/HIuizujQTKsONWe9IlpdrQjdDGcKNGbB1yMpcODReYvGnjIH
	 0XIqkcfSzxqPQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Aug 2024 21:10:22 +0300
Message-Id: <D3GOR6ZR0MPL.2O29DCFWQ77RA@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <apparmor@lists.ubuntu.com>, <keyrings@vger.kernel.org>,
 <selinux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] KEYS: use synchronous task work for changing
 parent credentials
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Paul Moore" <paul@paul-moore.com>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "John Johansen" <john.johansen@canonical.com>, "David Howells"
 <dhowells@redhat.com>, =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>, "Ondrej Mosnacek"
 <omosnace@redhat.com>, "Casey Schaufler" <casey@schaufler-ca.com>
X-Mailer: aerc 0.17.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>

On Mon Aug 5, 2024 at 2:54 PM EEST, Jann Horn wrote:
> keyctl_session_to_parent() involves posting task work to the parent task,
> with work function key_change_session_keyring.
> Because the task work in the parent runs asynchronously, no errors can be
> returned back to the caller of keyctl_session_to_parent(), and therefore
> the work function key_change_session_keyring() can't be allowed to fail d=
ue
> to things like memory allocation failure or permission checks - all
> allocations and checks have to happen in the child.
>
> This is annoying for two reasons:
>
>  - It is the only reason why cred_alloc_blank() and
>    security_transfer_creds() are necessary.
>  - It means we can't do synchronous permission checks.

I agree with this premise. Also I think the code change is reasonable.

I'd like to see a comment from David tho.

BR, Jarkko

