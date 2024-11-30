Return-Path: <keyrings+bounces-2311-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D468D9DEE98
	for <lists+keyrings@lfdr.de>; Sat, 30 Nov 2024 03:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99D202817F3
	for <lists+keyrings@lfdr.de>; Sat, 30 Nov 2024 02:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205482AD00;
	Sat, 30 Nov 2024 02:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmbOpj5T"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7227447;
	Sat, 30 Nov 2024 02:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732933891; cv=none; b=u8WEes3zH6h7/lqwwfLMqmikewziRYwH8sHPH9FlwDASKarTuAUpolNhsUP6+a+D7HfE+o1c/+O5phURWaaCwEiGK76B6YTIFa4bq48wjmj9ptpyXKSKiROf4UwzIWBQBQYympybmw2DCtxeDJ1raqrKwjuwWfqDXXICi2iE2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732933891; c=relaxed/simple;
	bh=RSJENjqJosmq3Y9HmvX0RY4Poam/2+UR9oDounQg3OQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UWQtKBI4IbTwY1dQZXjkyA25js6q8zmcjrtJSphmqdnH51CNTmp2ka6oVF3jqvdjAglj0y4xCxgw9zX6Gc43ocujvVxTkSYdButzsL98V9eE6hc2tFNbUKMTIp0Y6dYhprT0Reh8a4L4LNTNvTJYMY78m38FnNHgBW24NQqnWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmbOpj5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B75C4CECF;
	Sat, 30 Nov 2024 02:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732933890;
	bh=RSJENjqJosmq3Y9HmvX0RY4Poam/2+UR9oDounQg3OQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=kmbOpj5TriQHbG65RX2jCfYz0Iyy4Te91bI/jP2mdD0g5G0kruSX5+SOqoY0K9Ny7
	 zUSd1IzbCuM21EcggN1NDm16GanCPaZj+Y/OgLKAml4+cCzyZoGdVndGXfyowpT9+d
	 rthdiR7kPfewr5/6qEJiqmGT3OQEvkOqKNqj0NBsQE66d4ig8OY2hvOfOXPLTjisZd
	 pg6bmHf9KKiqL8jWD3hBApZbAulRHv+qTV2OgoVtlp9IVpvVEJ/odk9FyMtv4J4P6y
	 VasrLEEntTTjTQcPPuk7soH/9Dc8RnGArEvK8JXxiIS4EF/cmHrY/xGFFHQfFXyZfi
	 x6UXJC1mlmpHQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 Nov 2024 04:31:25 +0200
Message-Id: <D5Z5SKSAX8UT.2NXLQ5HZNP617@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Eric Snowberg" <eric.snowberg@oracle.com>, <keyrings@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] keys: drop shadowing dead prototype
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <cgzones@googlemail.com>
X-Mailer: aerc 0.18.2
References: <20241125110342.49015-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241125110342.49015-1-cgoettsche@seltendoof.de>

On Mon Nov 25, 2024 at 1:03 PM EET, Christian G=C3=B6ttsche wrote:
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> The global variable pkcs7 does not exist.
> Drop the variable declaration, but keep the struct prototype needed for
> is_key_on_revocation_list().
>
> Reported by clang:
>
>     ./include/keys/system_keyring.h:104:67: warning: declaration shadows =
a variable in the global scope [-Wshadow]
>       104 | static inline int is_key_on_revocation_list(struct pkcs7_mess=
age *pkcs7)
>           |                                                              =
     ^
>     ./include/keys/system_keyring.h:76:30: note: previous declaration is =
here
>        76 | extern struct pkcs7_message *pkcs7;
>           |                              ^
>
> Fixes: 56c5812623f9 ("certs: Add EFI_CERT_X509_GUID support for dbx entri=
es")
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  include/keys/system_keyring.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.=
h
> index 8365adf842ef..a6c2897bcc63 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -73,7 +73,6 @@ static inline void __init set_machine_trusted_keys(stru=
ct key *keyring)
>  }
>  #endif
> =20
> -extern struct pkcs7_message *pkcs7;
>  #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
>  extern int mark_hash_blacklisted(const u8 *hash, size_t hash_len,
>  			       enum blacklist_hash_type hash_type);
> @@ -93,6 +92,7 @@ static inline int is_binary_blacklisted(const u8 *hash,=
 size_t hash_len)
>  }
>  #endif
> =20
> +struct pkcs7_message;
>  #ifdef CONFIG_SYSTEM_REVOCATION_LIST
>  extern int add_key_to_revocation_list(const char *data, size_t size);
>  extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

