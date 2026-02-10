Return-Path: <keyrings+bounces-4051-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO/vA8h0i2nZUQAAu9opvQ
	(envelope-from <keyrings+bounces-4051-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 10 Feb 2026 19:11:20 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423011E3DF
	for <lists+keyrings@lfdr.de>; Tue, 10 Feb 2026 19:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28DB5306BD35
	for <lists+keyrings@lfdr.de>; Tue, 10 Feb 2026 18:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD6038B7BC;
	Tue, 10 Feb 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H90fYves"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51538A9DE;
	Tue, 10 Feb 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770747015; cv=none; b=MlFDvrfsUtD6YLWyYn4tZw9Is97qTbexCAqDUJOySM2P6CSne8snOOJUP9NlgXTrWn7o15yTI5rWwl+9NDB68JeQYSTNr/Ox5zAYFa0JlGgoM9A+UkVPfiRy4usjg4ChI5MhngDA708hz+dUOsyLcWmHTvSWVeTeyH6SGp5X97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770747015; c=relaxed/simple;
	bh=Vj00ZWt40r2381Bc+++pKPaCpKyQ3M9YGq6mfCBkyUA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Rg5El7my0jL+a/UrJyGekikrQu8kXYbCc6tChjBXU2q5GFm1YFdgHoknQVVv9f38X6AIc7+CUbRAVn5ts9G8ND94Q074BfxsRYaqm50l8s+blOBxBlkWZw2w/XEaa+5al73JntDC4HXxU2Dkt77cN5JJIZSfAGAF1On/5qUm/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H90fYves; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D54C19421;
	Tue, 10 Feb 2026 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770747015;
	bh=Vj00ZWt40r2381Bc+++pKPaCpKyQ3M9YGq6mfCBkyUA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H90fYveswdzO1NV/v8AP6QnHNor9u+IXtv6Fpe81kNDarS7z+IRfGGFIsGINOh4Ed
	 LtxhPSAP/W3zcKPEw5sJ37CSYiIHJ7YlqujH9zgFvQ0eZJg5oX8FkRirMmjCCN1E4G
	 6yP1F3MGeEnHcgJNDiN1uvD+N5Hj7UZqgf+dRoMPl3BNWno6SmatDZLfYCgIBu4hl1
	 p72bHuqj7lfUXImJo1N0C/A46KyVfUSstPGOf5dDiReuq4D2hMK50fevmFKaF/eJVt
	 wr0jv9FaG1gNtAId/l1e+1ffG1/ihFjIEzyIGfewwsL0VEghnmu48Orp1zO5zS0WUc
	 /7TyQu1rb+PRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4F13B39E3B79;
	Tue, 10 Feb 2026 18:10:12 +0000 (UTC)
Subject: Re: [GIT PULL] x509, pkcs7: Add support for ML-DSA signatures
From: pr-tracker-bot@kernel.org
In-Reply-To: <2977832.1770384806@warthog.procyon.org.uk>
References: <2977832.1770384806@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-crypto.vger.kernel.org>
X-PR-Tracked-Message-Id: <2977832.1770384806@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-next-20260206
X-PR-Tracked-Commit-Id: 965e9a2cf23b066d8bdeb690dff9cd7089c5f667
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b63c90720348578631cda74285958c3ad3169ce9
Message-Id: <177074701121.3619225.2073274537339647731.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 18:10:11 +0000
To: David Howells <dhowells@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, Jarkko Sakkinen <jarkko@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4051-lists,keyrings=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6423011E3DF
X-Rspamd-Action: no action

The pull request you sent on Fri, 06 Feb 2026 13:33:26 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-next-20260206

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b63c90720348578631cda74285958c3ad3169ce9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

