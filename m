Return-Path: <keyrings+bounces-700-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA485B783
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 10:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3B5928852C
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A045FDB3;
	Tue, 20 Feb 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schreibt.jetzt header.i=@schreibt.jetzt header.b="wqiCY4in"
X-Original-To: keyrings@vger.kernel.org
Received: from sosiego.soundray.org (sosiego.soundray.org [116.203.207.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622360DFF
	for <keyrings@vger.kernel.org>; Tue, 20 Feb 2024 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.207.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421331; cv=none; b=NY8iubvZ3ns+DO0RtSdIDBuh1fxky/vy4mf6dzcxeAGHO9F6fDftImMfgc31znclpEae5UzZGxz448svhQD5n17FaaG4yg0OU8OONkxQUN51TzYjylgiOtFE8oOrwuiMwYrtabjYFRrej0CCfoLVrervF5t2WAAii+AVzcWnZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421331; c=relaxed/simple;
	bh=Rby225dlHB8diYjHam59nK/NB53I4hWNoqW7euIkViI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ciPiR8FnvLWTwQNEEK/2LFFbLgjkdfazMVEX2KiDAC7JRB+swdANCyrDSW5pmQ6zrQYXQtKqpmz1t93RoNVD5jG+vsUc2ju+CJCwI3jCQ3BTGQF6bd9jhs9FSeeCC2EOsM5zrdHFNyXtPuEoSpKZPF0g3ts0DPyz94RGZgyTnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schreibt.jetzt; spf=pass smtp.mailfrom=schreibt.jetzt; dkim=pass (1024-bit key) header.d=schreibt.jetzt header.i=@schreibt.jetzt header.b=wqiCY4in; arc=none smtp.client-ip=116.203.207.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schreibt.jetzt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schreibt.jetzt
From: Linus Heckemann <linus@schreibt.jetzt>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schreibt.jetzt;
	s=sosiego; t=1708421315;
	bh=BE6WoBk/7a9CHGirPTUqxBmrEyVdIT7KKd9d7dc0lGY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=wqiCY4inEJbhm71wEnacaOpYdxSfhsrx6v0PbxeDkrvqnKvWkadOMBsq0wwnrize7
	 4m2WZno06YMdXXLxIAoNflP+8T07FbD+m9fLBmI2M7gaZhnGnpTBL6iQ+5YRZWRAm5
	 rSDwe3v8CUywDiSA7TFX9PTSsDifNJ3BPk2rfBUs=
To: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, David
 Howells <dhowells@redhat.com>
Cc: maximilian@mbosch.me
Subject: Re: Allowing empty keys? or: setting attributes on keys safely
In-Reply-To: <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki>
References: <ygar0hbrm05.fsf@localhost> <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki>
Date: Tue, 20 Feb 2024 10:28:33 +0100
Message-ID: <ygale7fscvy.fsf@localhost>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Jarkko Sakkinen" <jarkko@kernel.org> writes:

> On Sat Feb 17, 2024 at 6:20 PM UTC, Linus Heckemann wrote:
>> Hi all,
>>
>> We've been fiddling with the keyring functionality; I want to set up a
>> key with an expiry time safely -- i.e. the key data should never be
>> loaded without the expiry time being set.
>
> Something prevents you setting invalid payload first, and appropriate
> one later with keyctl_update?

Nothing, and this is the approach we're taking for now, but having a
zero-length payload feels more semantically appropriate than e.g. a
single NUL byte.


>> I'd expect that I could create a user key with an empty payload, e.g.
>>
>> add_key("user", "some-key", NULL, 0, KEY_SPEC_SESSION_KEYRING);
>>
>> or
>>
>> add_key("user", "some-key", "", 0, KEY_SPEC_SESSION_KEYRING);
>>
>> in order to use keyctl_set_timeout to apply a timeout _before_ the
>> payload is populated using keyctl_update. However, both of these add_key
>> calls return -EINVAL.
>>
>> I found [1] which removed documentation that suggested that this would
>> be allowed, but the reason for not allowing an empty payload is unclear
>> to me; I think it would make sense for my exact use case, and placing a
>> dummy nonempty payload in the keyring first seems like it would be more
>> semantically weird and painful to deal with when reading from the keyring.
>>
>> Is there any reason why this restriction is in place, and is there a
>> more sensible way to apply the timeout before a payload is loaded?
>
> The function in question is user_preparse() (for reference).
>
> Unless I missed a differing key type all key types seem to have the same
> zero check in their implementations of preparse. This change would make
> user key type semantics different than for other key types.
>
> [Please correct me if there is actually key type that does allow zero
> payload.]

keyrings are a key type which not only allow but require the data length
to be 0 (see keyring_preparse). The actual data buffer pointer seems not
to be used but the manpage for add_key says it should be NULL.

> What I do find very confusing in the current call paths is that why this
> zero check does not already happen in key_instantiate_and_link() before
> preparse is called, i.e. why we don't have along the lines of:
>
> $ git diff
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 5b10641debd5..7fa425ab5588 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -510,6 +510,12 @@ int key_instantiate_and_link(struct key *key,
>         prep.quotalen = key->type->def_datalen;
>         prep.expiry = TIME64_MAX;
>         if (key->type->preparse) {
> +               /* Disallow zero payload: */
> +               if (!data || !datalen) {
> +                       ret = -EINVAL;
> +                       goto error;
> +               }
> +
>                 ret = key->type->preparse(&prep);
>                 if (ret < 0)
>                         goto error;

Which answers this question I think?


>> Cheers
>> Linus
>>
>> [1]: https://lore.kernel.org/all/alpine.LNX.2.00.1603281843250.15978@sisyphus/
>
> BR, Jarkko

