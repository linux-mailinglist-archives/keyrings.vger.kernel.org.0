Return-Path: <keyrings+bounces-1835-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F23940FB1
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2024 12:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA366B2C605
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2024 10:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045ED1A01A0;
	Tue, 30 Jul 2024 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Qyd2+mc9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eGbJiPMD";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sLoHLiQo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MMA0KjfT"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D11A00FF
	for <keyrings@vger.kernel.org>; Tue, 30 Jul 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335679; cv=none; b=I77E3xd7bVNNvQt7D9MhrhUPDZtJgWQ1bcRhXHWuvKS9bQLvqSiyyyXNwbjXAUY4WZ6GonwQam4OOwRHY5Tk9A+jxFN8sLZNb8QVv3yZcjKalxDvHcB6VTg8SRmOGBOMkSj1FxEiWyGZjqDlQzJ6xWPmKET693V1zs1CLse7NuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335679; c=relaxed/simple;
	bh=W30apyTxeObTOeWWCBD68GuBVHXxcCUZKOhoNOYoKZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYgyOrTiRW3p2rFHcmPMkov7wtYDvSXQZIp1u6ujPQXkQd4s0ccnPR06o84eISV+b+4aTRUdCG2NQUsyhnuT64axVxW9VD0zPB4o93cZ+wyCvf0P8Bm2bb2YF1rQV2NEsr4g3f4pptg3CZAW3okmCwncTvLJMSpFpJTjovlHMhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Qyd2+mc9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=eGbJiPMD; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sLoHLiQo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MMA0KjfT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E4EC321A9D;
	Tue, 30 Jul 2024 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722335676;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUuL2K40Ym/Bz1YzJxw0jfnm6ipn80ovERkdZcIlYWs=;
	b=Qyd2+mc96X+8VREXXnIb1toJWrF/IS30NAbzuepLAe6HtzztwCdYgr1/e7rBbJwdnECNyc
	HddZq4vuSUOh1tTkyzcBw+WTMy3ir+K33vbGjGW8QnYBZK3F5mzNPFLOad0kP0TpxvCGSe
	gV++m4dV1DzmRQjKrbzbJSLjGDlVyuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722335676;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUuL2K40Ym/Bz1YzJxw0jfnm6ipn80ovERkdZcIlYWs=;
	b=eGbJiPMD6szPVEg724mvFIUXWxOhbeO86kV9IdU7D3w9LpF189r1hgO/r+z2iEDNqSk/yw
	9JSUfmj6Bq0A7UAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=sLoHLiQo;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=MMA0KjfT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722335675;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUuL2K40Ym/Bz1YzJxw0jfnm6ipn80ovERkdZcIlYWs=;
	b=sLoHLiQozfeMx/pj5a8Sju4UDehxhAtGEffitDXE+xTqGVDxYVkXoFpBeobbZ+TleP1dkl
	0HgCgmvMcnbu2x4PvRVHwiNtI8QV3K+Pjh23Uca9PVDlul0Be8IxMyQ71wmgNiRrO2AehW
	tIfAH0je2sTeUs2TvtGxWKtQ5sNPMXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722335675;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUuL2K40Ym/Bz1YzJxw0jfnm6ipn80ovERkdZcIlYWs=;
	b=MMA0KjfTE3/ghfsreUOsFIeWKRR/gYpUGWCCxhhRpyOI8w9t/YzFjB/OlgC0vGNDM5NpF8
	I2MxmPNb21I3CPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBD5613297;
	Tue, 30 Jul 2024 10:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xi6SLLvBqGZeJwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 30 Jul 2024 10:34:35 +0000
Date: Tue, 30 Jul 2024 12:34:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ma Xinjian <maxj.fnst@fujitsu.com>
Cc: ltp@lists.linux.it, Eric Biggers <ebiggers@google.com>,
	keyrings@vger.kernel.org
Subject: Re: [LTP] [PATCH] request_key: Add negative tests for request_key
Message-ID: <20240730103431.GA1371143@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20240521081552.2162-1-maxj.fnst@fujitsu.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521081552.2162-1-maxj.fnst@fujitsu.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E4EC321A9D
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	REPLYTO_EQ_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.cz:replyto];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]

Hi Ma, Eric, all,

> Add negative tests for request_key(), when errno is EFAULT or EPERM

LGTM, thanks!
Reviewed-by: Petr Vorel <pvorel@suse.cz>

We also somehow test EACCES (request_key04.c). Looking into man page, there are
other interesting errno to test I suppose (EDQUOT, EKEYEXPIRED, EKEYREJECTED,
...)

@Eric, other devs, would you have time to have a quick look on the test?

Kind regards,
Petr

> Signed-off-by: Ma Xinjian <maxj.fnst@fujitsu.com>
> ---
>  runtest/syscalls                              |  1 +
>  .../kernel/syscalls/request_key/.gitignore    |  1 +
>  .../syscalls/request_key/request_key06.c      | 52 +++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/request_key/request_key06.c

> diff --git a/runtest/syscalls b/runtest/syscalls
> index 3a28123a5..c04359fcd 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1187,6 +1187,7 @@ request_key02 request_key02
>  request_key03 request_key03
>  request_key04 request_key04
>  request_key05 request_key05
> +request_key06 request_key06

>  rmdir01 rmdir01
>  rmdir02 rmdir02
> diff --git a/testcases/kernel/syscalls/request_key/.gitignore b/testcases/kernel/syscalls/request_key/.gitignore
> index e8dc1c570..6dcf613c7 100644
> --- a/testcases/kernel/syscalls/request_key/.gitignore
> +++ b/testcases/kernel/syscalls/request_key/.gitignore
> @@ -3,3 +3,4 @@
>  /request_key03
>  /request_key04
>  /request_key05
> +/request_key06
> diff --git a/testcases/kernel/syscalls/request_key/request_key06.c b/testcases/kernel/syscalls/request_key/request_key06.c
> new file mode 100644
> index 000000000..bd872867b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/request_key/request_key06.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2024 FUJITSU LIMITED. All Rights Reserved.
> + * Author: Ma Xinjian <maxj.fnst@fujitsu.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Verify that request_key(2) fails with
> + *
> + * - EFAULT when type points outside the process's accessible address space
> + * - EFAULT when description points outside the process's accessible address space
> + * - EFAULT when callout_info points outside the process's accessible address space
> + * - EPERM when type argument started with a period '.'
> + */
> +
> +#include "tst_test.h"
> +#include "lapi/keyctl.h"
> +
> +static struct test_case_t {
> +	char *type;
> +	char *description;
> +	char *callout_info;
> +	key_serial_t dest_keyring;
> +	int expected_errno;
> +	char *desc;
> +} tcases[] = {
> +	{(char *)(-1), "description", NULL, KEY_SPEC_PROCESS_KEYRING, EFAULT,
> +		"type points outside the process's accessible address space"},
> +	{"type", (char *)(-1), NULL, KEY_SPEC_PROCESS_KEYRING, EFAULT,
> +		"description points outside the process's accessible address space"},
> +	{"type", "description", (char *)(-1), KEY_SPEC_PROCESS_KEYRING, EFAULT,
> +		"callout_info points outside the process's accessible address space"},
> +	{".type", "description", NULL, KEY_SPEC_PROCESS_KEYRING, EPERM,
> +		"type argument started with a period '.'"},
> +};
> +
> +static void verify_request_key(unsigned int i)
> +{
> +	struct test_case_t *tc = &tcases[i];
> +
> +	TST_EXP_FAIL2(request_key(tc->type, tc->description, tc->callout_info,
> +		tc->dest_keyring),
> +		tc->expected_errno,
> +		"%s", tc->desc);
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = verify_request_key,
> +};

