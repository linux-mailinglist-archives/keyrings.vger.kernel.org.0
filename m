Return-Path: <keyrings+bounces-697-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 114FF8591B4
	for <lists+keyrings@lfdr.de>; Sat, 17 Feb 2024 19:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A691C20A02
	for <lists+keyrings@lfdr.de>; Sat, 17 Feb 2024 18:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37747C6E9;
	Sat, 17 Feb 2024 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schreibt.jetzt header.i=@schreibt.jetzt header.b="I64Sv6zz"
X-Original-To: keyrings@vger.kernel.org
Received: from sosiego.soundray.org (sosiego.soundray.org [116.203.207.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379217C6E7
	for <keyrings@vger.kernel.org>; Sat, 17 Feb 2024 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.207.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708194573; cv=none; b=bq6A4FlXYZbWO7K7t8fjwMo54xsSFwLE+vMaWJmCLAJnUYtuBe1r+C0DyxizYDMl2OVv89m8JgVmU4mJfjt2jtpzk0lZuzDIR4HZR778Bx47/uh6KmNS1Lv4ts64joXteKoHwGteaA5MIivgXKmIYFPrD0f4B6SQsGMu0rrY/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708194573; c=relaxed/simple;
	bh=Ig4xBJirp4c827i8zYOk7KTvievAyzfhxJHyDGZb1Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OLxKffkpJkZtxxs+yVSNlpjD7+GOhQGA4TZHukfMDl+WUVsT8vT8BuvVKJ39v3QoWCQSVP3x5w0bLQKjxEXoJ+NNJ/TW9wIDAiry6GdjaFFxc1ESnyGZefjmbF/7B0aYmY+JQYiDvlj+1Eg9fiChwm7BX1PvcmnplTlTOWGmvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schreibt.jetzt; spf=pass smtp.mailfrom=schreibt.jetzt; dkim=pass (1024-bit key) header.d=schreibt.jetzt header.i=@schreibt.jetzt header.b=I64Sv6zz; arc=none smtp.client-ip=116.203.207.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schreibt.jetzt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schreibt.jetzt
From: Linus Heckemann <linus@schreibt.jetzt>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schreibt.jetzt;
	s=sosiego; t=1708194013;
	bh=Ig4xBJirp4c827i8zYOk7KTvievAyzfhxJHyDGZb1Qs=;
	h=From:To:Cc:Subject:Date;
	b=I64Sv6zzWveCVO9VBJokK9DXT1xwaQnO2OdV96aW9REedx6/SIlPGHdYRAF4ooAFX
	 rmumEW3BbEMC591rC2mJRaaElJmujSqJDzabWtXlAWvF+mPV0Pw3h4pLw0yurBln4r
	 XiN+SyblaHFsskygs47eAD8sfKe5Nk4zM/YI9dOs=
To: keyrings@vger.kernel.org
Cc: maximilian@mbosch.me
Subject: Allowing empty keys? or: setting attributes on keys safely
Date: Sat, 17 Feb 2024 19:20:10 +0100
Message-ID: <ygar0hbrm05.fsf@localhost>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi all,

We've been fiddling with the keyring functionality; I want to set up a
key with an expiry time safely -- i.e. the key data should never be
loaded without the expiry time being set.

I'd expect that I could create a user key with an empty payload, e.g.

add_key("user", "some-key", NULL, 0, KEY_SPEC_SESSION_KEYRING);

or

add_key("user", "some-key", "", 0, KEY_SPEC_SESSION_KEYRING);

in order to use keyctl_set_timeout to apply a timeout _before_ the
payload is populated using keyctl_update. However, both of these add_key
calls return -EINVAL.

I found [1] which removed documentation that suggested that this would
be allowed, but the reason for not allowing an empty payload is unclear
to me; I think it would make sense for my exact use case, and placing a
dummy nonempty payload in the keyring first seems like it would be more
semantically weird and painful to deal with when reading from the keyring.

Is there any reason why this restriction is in place, and is there a
more sensible way to apply the timeout before a payload is loaded?

Cheers
Linus

[1]: https://lore.kernel.org/all/alpine.LNX.2.00.1603281843250.15978@sisyphus/

