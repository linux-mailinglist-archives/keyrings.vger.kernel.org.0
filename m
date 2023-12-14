Return-Path: <keyrings+bounces-273-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6DE81336F
	for <lists+keyrings@lfdr.de>; Thu, 14 Dec 2023 15:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD3E6B2174F
	for <lists+keyrings@lfdr.de>; Thu, 14 Dec 2023 14:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3281A5ABAE;
	Thu, 14 Dec 2023 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G8Mle9Gd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6v19oXnJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G8Mle9Gd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6v19oXnJ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907E6115;
	Thu, 14 Dec 2023 06:44:31 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31145221F2;
	Thu, 14 Dec 2023 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702565070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsmrNQCMF0LaolhCZphfif1VFSP9rpU97GQ9x/JHWt4=;
	b=G8Mle9Gd3DbKrF2if092q2td8tfT+LX9FRC+16c0knZpByDNgYyJGYWocoiGo/E3JAXJam
	nwo5FfNwNnVoygeaJvUhc4avXdNI5H7dB9P6ldgzrtoI5G0bqIa9/jXtKgYtARWghpazhc
	EzNuBtMODqQlkG8MH1+hsLufl4ePOP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702565070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsmrNQCMF0LaolhCZphfif1VFSP9rpU97GQ9x/JHWt4=;
	b=6v19oXnJqzViNUzIQTc0kVQOxs1jtdBtrfo+Vn0jL/hOn+G0wP4Eu1+0yd8RZfCmkYNjpG
	eXO/TGC9hS5nIeAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702565070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsmrNQCMF0LaolhCZphfif1VFSP9rpU97GQ9x/JHWt4=;
	b=G8Mle9Gd3DbKrF2if092q2td8tfT+LX9FRC+16c0knZpByDNgYyJGYWocoiGo/E3JAXJam
	nwo5FfNwNnVoygeaJvUhc4avXdNI5H7dB9P6ldgzrtoI5G0bqIa9/jXtKgYtARWghpazhc
	EzNuBtMODqQlkG8MH1+hsLufl4ePOP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702565070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsmrNQCMF0LaolhCZphfif1VFSP9rpU97GQ9x/JHWt4=;
	b=6v19oXnJqzViNUzIQTc0kVQOxs1jtdBtrfo+Vn0jL/hOn+G0wP4Eu1+0yd8RZfCmkYNjpG
	eXO/TGC9hS5nIeAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8E8D137E8;
	Thu, 14 Dec 2023 14:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eEJ2Kc0Ue2V3KQAAD6G6ig
	(envelope-from <lhenriques@suse.de>); Thu, 14 Dec 2023 14:44:29 +0000
Received: from localhost (brahms.olymp [local])
	by brahms.olymp (OpenSMTPD) with ESMTPA id feb62ca6;
	Thu, 14 Dec 2023 14:44:28 +0000 (UTC)
Date: Thu, 14 Dec 2023 14:44:28 +0000
From: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
To: David Howells <dhowells@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] keys: flush work when accessing /proc/key-users
Message-ID: <ZXsUzBRR2uc81FK0@suse.de>
References: <20231207024323.GA1994@sol.localdomain>
 <20231206145744.17277-1-lhenriques@suse.de>
 <498294.1701878642@warthog.procyon.org.uk>
 <87bkb3z047.fsf@suse.de>
 <2744563.1702303367@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2744563.1702303367@warthog.procyon.org.uk>
X-Spam-Score: -1.30
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[4];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.981];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.00)[16.82%]
X-Spam-Flag: NO

Hi David,

On Mon, Dec 11, 2023 at 02:02:47PM +0000, David Howells wrote:
<snip>
> > However, that would only fix the flakiness of the key quota for fs/crypto/,
> > not for other users of the keyrings service.  Maybe this suggests that
> > key_put() should release the key's quota right away if the key's refcount
> > drops to 0?
> 
> That I would be okay with as the key should be removed in short order.
> 
> Note that you'd have to change the spinlocks on key->user->lock to irq-locking
> types.  Or maybe we can do without them, at least for key gc, and use atomic
> counters.  key_invalidate() should probably drop the quota also.

I was trying to help with this but, first, I don't think atomic counters
would actually be a solution.  For example, we have the following in
key_alloc():

	spin_lock(&user->lock);
	if (!(flags & KEY_ALLOC_QUOTA_OVERRUN)) {
		if (user->qnkeys + 1 > maxkeys ||
		    user->qnbytes + quotalen > maxbytes ||
		    user->qnbytes + quotalen < user->qnbytes)
			goto no_quota;
	}
	user->qnkeys++;
	user->qnbytes += quotalen;
	spin_unlock(&user->lock);

Thus, I don't think it's really possible to simply stop using a lock
without making these checks+changes non-atomic.

As for using spin_lock_irq() or spin_lock_irqsave(), my understanding is
that the only places where this could be necessary is in key_put() and,
possibly, key_payload_reserve().  key_alloc() shouldn't need that.

Finally, why would key_invalidate() require handling quotas?  I'm probably
just missing some subtlety, but I don't see the user->usage refcount being
decremented anywhere in that path (or anywhere else, really).

Cheers,
--
Luís

