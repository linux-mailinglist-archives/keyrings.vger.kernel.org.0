Return-Path: <keyrings+bounces-699-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A285AC5C
	for <lists+keyrings@lfdr.de>; Mon, 19 Feb 2024 20:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718651F239F8
	for <lists+keyrings@lfdr.de>; Mon, 19 Feb 2024 19:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD7D54BEC;
	Mon, 19 Feb 2024 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0TCCWWO"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6BF54BEB
	for <keyrings@vger.kernel.org>; Mon, 19 Feb 2024 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708372051; cv=none; b=AtxnipueHxZQTojDDUB4lRDd+an0TT4bLrjNjwE9upBkdAtCLqUx/gvMRFdUhPSwXsxRGy/GCBUTSluok30JebfEiqodYTfDg2gxAGc2lrZiihz+3XOS97CGIZSwDw/XtWzmKYr0Hp5oV/97TpHlGJmxQ00Ot5zP7+IJVZts4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708372051; c=relaxed/simple;
	bh=4QH3e7d/eW4mOC+QNadtlS7PhVUAsgqLSCjG1mRqUo0=;
	h=Mime-Version:Content-Type:Date:Cc:Subject:From:To:Message-Id:
	 References:In-Reply-To; b=DE8P+tRLZ+5U9to/LXyqR8+XAOLzdPq62fX6qB7Ni+uEaF+dqb+A+ZS3rXiTBcstOsmhFReIyeSB4ppDi7ZW/NPhWmoI3TtvJhM5miemiLK7X5TAQbUjypg+uIf4wOgq+fBW9U/++DWk46WY4iJWGzNrVcajFNGn6UYz/hy2Sf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0TCCWWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79DFC433C7;
	Mon, 19 Feb 2024 19:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708372051;
	bh=4QH3e7d/eW4mOC+QNadtlS7PhVUAsgqLSCjG1mRqUo0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=s0TCCWWOa1Z8UjwiurKMHvzWJAf3a7kpqo3um1HLVTvfWZSDdo34+gvOztScWk2RP
	 nacEvA/YFI1gZkGurMY80grWyplzEytePtmg3sZSr1G/oKb3DvZc8t8N4Dbka07L4U
	 LyumlgT2qPYuO2lAvdjjhZjCuR2a2lBB6VumMaMQlkVMuEPsjGBmC1UySFNLsaXYZe
	 TwukXddVmiMhh+jnt/slfEEyv6cM5W1cHgkm5NpdfvNCjDmilTBndID4FCrLydZpuT
	 FnV0INVCplobgfi/IgPJLmZSgr8Da98a4c30B3te2lr5suPd7jw0oEYctwkFk87pzr
	 bpWO2k1Z2HKTQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 19:47:27 +0000
Cc: <maximilian@mbosch.me>
Subject: Re: Allowing empty keys? or: setting attributes on keys safely
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Linus Heckemann" <linus@schreibt.jetzt>, <keyrings@vger.kernel.org>,
 "David Howells" <dhowells@redhat.com>
Message-Id: <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki>
X-Mailer: aerc 0.15.2
References: <ygar0hbrm05.fsf@localhost>
In-Reply-To: <ygar0hbrm05.fsf@localhost>

On Sat Feb 17, 2024 at 6:20 PM UTC, Linus Heckemann wrote:
> Hi all,
>
> We've been fiddling with the keyring functionality; I want to set up a
> key with an expiry time safely -- i.e. the key data should never be
> loaded without the expiry time being set.

Something prevents you setting invalid payload first, and appropriate
one later with keyctl_update?

> I'd expect that I could create a user key with an empty payload, e.g.
>
> add_key("user", "some-key", NULL, 0, KEY_SPEC_SESSION_KEYRING);
>
> or
>
> add_key("user", "some-key", "", 0, KEY_SPEC_SESSION_KEYRING);
>
> in order to use keyctl_set_timeout to apply a timeout _before_ the
> payload is populated using keyctl_update. However, both of these add_key
> calls return -EINVAL.
>
> I found [1] which removed documentation that suggested that this would
> be allowed, but the reason for not allowing an empty payload is unclear
> to me; I think it would make sense for my exact use case, and placing a
> dummy nonempty payload in the keyring first seems like it would be more
> semantically weird and painful to deal with when reading from the keyring=
.
>
> Is there any reason why this restriction is in place, and is there a
> more sensible way to apply the timeout before a payload is loaded?

The function in question is user_preparse() (for reference).

Unless I missed a differing key type all key types seem to have the same
zero check in their implementations of preparse. This change would make
user key type semantics different than for other key types.

[Please correct me if there is actually key type that does allow zero
payload.]
=20
What I do find very confusing in the current call paths is that why this
zero check does not already happen in key_instantiate_and_link() before
preparse is called, i.e. why we don't have along the lines of:

$ git diff
diff --git a/security/keys/key.c b/security/keys/key.c
index 5b10641debd5..7fa425ab5588 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -510,6 +510,12 @@ int key_instantiate_and_link(struct key *key,
        prep.quotalen =3D key->type->def_datalen;
        prep.expiry =3D TIME64_MAX;
        if (key->type->preparse) {
+               /* Disallow zero payload: */
+               if (!data || !datalen) {
+                       ret =3D -EINVAL;
+                       goto error;
+               }
+
                ret =3D key->type->preparse(&prep);
                if (ret < 0)
                        goto error;

> Cheers
> Linus
>
> [1]: https://lore.kernel.org/all/alpine.LNX.2.00.1603281843250.15978@sisy=
phus/

BR, Jarkko

