Return-Path: <keyrings+bounces-2083-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FAC97ACBD
	for <lists+keyrings@lfdr.de>; Tue, 17 Sep 2024 10:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AE1E1F2250E
	for <lists+keyrings@lfdr.de>; Tue, 17 Sep 2024 08:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D07145FE5;
	Tue, 17 Sep 2024 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bL/niYfi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="rR9CngKH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bL/niYfi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="rR9CngKH"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F63BE4F
	for <keyrings@vger.kernel.org>; Tue, 17 Sep 2024 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726561195; cv=none; b=kj1N6W5s1poMGUiX4pAzRgcOlf6QFbQw3PAYKxU/xWEEHaL4n0/FA87BILT8t+VCCP65b0WP2+1Q/ng9NuHtGJJ4vQRPv0IEYNZI4A/+9Jm4e8vrbGkieXjWeiVUHHXNQZeOX8QYIJcMe0rPls/BS8c+SEuNuloqrYT1ZowHzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726561195; c=relaxed/simple;
	bh=u7sTORogatsWkbTHxzWvRqPvu6Ugz2yj/5IDpwYGGXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyWl/bZ1tDBhUJDpYJadwv6buNBFDJqAYSzK76e/+wF+IaP7hZF9PiziC45jp3ReL+wByJKUcaNru4vAzjl/Vu5SZAdrf1KGlTEa7fC2InnXvUjvEpPF65RLdG3AwLcavzkqtRadv32BpAjk8ekdd/NAQZqLbPZzJLGOnQ2OwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bL/niYfi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=rR9CngKH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bL/niYfi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=rR9CngKH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77DE21FB69;
	Tue, 17 Sep 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1726561189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xuDFv0gWLy/ZiI+ix4hN6AL3Ol/WWNAH0kpV6kzgLHU=;
	b=bL/niYfiBPnnT6VXi/FeX0M/Q6pwt2PoA+7oZlqtLKae4vKiWePjQYObOsNvksDN6gmN5S
	PvRkMISUnaEeKDFME4KE+07I9BMumPc9H8VT4SivWxv5/M5TvyV0bcxjOAyZZbkdNGA/3O
	zJjdq0ljoUKob7nJFFSgbqd0zl86ENg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1726561189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xuDFv0gWLy/ZiI+ix4hN6AL3Ol/WWNAH0kpV6kzgLHU=;
	b=rR9CngKHF9zk1VbxzFlrt3QW0jEhZsMHJFHm5SjF8kWUwitU/pLBsyLxfxrxx+6p9tmD5D
	dgqeg/YZYhV2Z/BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1726561189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xuDFv0gWLy/ZiI+ix4hN6AL3Ol/WWNAH0kpV6kzgLHU=;
	b=bL/niYfiBPnnT6VXi/FeX0M/Q6pwt2PoA+7oZlqtLKae4vKiWePjQYObOsNvksDN6gmN5S
	PvRkMISUnaEeKDFME4KE+07I9BMumPc9H8VT4SivWxv5/M5TvyV0bcxjOAyZZbkdNGA/3O
	zJjdq0ljoUKob7nJFFSgbqd0zl86ENg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1726561189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xuDFv0gWLy/ZiI+ix4hN6AL3Ol/WWNAH0kpV6kzgLHU=;
	b=rR9CngKHF9zk1VbxzFlrt3QW0jEhZsMHJFHm5SjF8kWUwitU/pLBsyLxfxrxx+6p9tmD5D
	dgqeg/YZYhV2Z/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EB2513AB6;
	Tue, 17 Sep 2024 08:19:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HeDSFqU76Wb6TQAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Tue, 17 Sep 2024 08:19:49 +0000
Date: Tue, 17 Sep 2024 10:18:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Cc: Ma Xinjian <maxj.fnst@fujitsu.com>, keyrings@vger.kernel.org,
	ltp@lists.linux.it, Eric Biggers <ebiggers@google.com>
Subject: Re: [LTP] [PATCH] request_key: Add negative tests for request_key
Message-ID: <Zuk7Wn1CWSLaicut@yuki.lan>
References: <20240521081552.2162-1-maxj.fnst@fujitsu.com>
 <20240730103431.GA1371143@pevik>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730103431.GA1371143@pevik>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,yuki.lan:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi!
> LGTM, thanks!
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> We also somehow test EACCES (request_key04.c). Looking into man page, there are
> other interesting errno to test I suppose (EDQUOT, EKEYEXPIRED, EKEYREJECTED,
> ...)
> 
> @Eric, other devs, would you have time to have a quick look on the test?

I've pushed the patch, we can add more tests later on.

-- 
Cyril Hrubis
chrubis@suse.cz

