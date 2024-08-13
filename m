Return-Path: <keyrings+bounces-1870-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C92950222
	for <lists+keyrings@lfdr.de>; Tue, 13 Aug 2024 12:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DF91C203E3
	for <lists+keyrings@lfdr.de>; Tue, 13 Aug 2024 10:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C880917E44F;
	Tue, 13 Aug 2024 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSpGmmYJ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B817C21C;
	Tue, 13 Aug 2024 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723543934; cv=none; b=p039aSyzfgEXJ8qCPeUz/5TYjAT5GS/0tLcmHtelKKABT8MF+5vsk1N54XLp4P2cPMyyvSeZDM7GwSPaYl53h8XiekHA/DbCCo9U4M+YZxBjjSuZP7x/eeuLXfgpooJuDxjuGj43etL1wxWLg6CekXlQfSDBNcdk6f04jtOka0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723543934; c=relaxed/simple;
	bh=YMNNW9k4e3EqFXo3XwG4zoOa/XJLXLrP2YgZr9lkA5Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=BkISCrjVHQuPIUVjPBGR2mkg7T2iOoeD8xr++3djKOgBAfF1j3kK86t2dQUxSWOwWFTsBjVTcscOev2jeeR8bZ1AA992piBFeP/LcWwqHci8tovLu8W2a48+Mt5XSLz3NPTI9I51OYv0QOZiM3Ff2elrGbZh0q0JO5FkqqUhn6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSpGmmYJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE52AC4AF0B;
	Tue, 13 Aug 2024 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723543934;
	bh=YMNNW9k4e3EqFXo3XwG4zoOa/XJLXLrP2YgZr9lkA5Q=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=rSpGmmYJvn+u+U2+ahyh1CTwkK4/uy5YOAD6TVopPR+NVLSMm+wtEHiYJSw4/FAmg
	 44iU2mAr82FlMa/TXpvWkd9UxByKTO49nYjqLCqacfvinxgDqYuNh/ixdXxbrP0JOz
	 6PWZKJK+EKeVTwxX8ov/UnJAyYMxZPVFvVXP2UlfzliHmbf7PC9cT6nrzij9eN6kKg
	 SZAiKLLTOC1s9axzNt5okGZ5TLA3EIVf5x7fdX7QWYB7YNG/9J3LdOoaISuhh3G25z
	 X3NWbI4NitDeWN6JqpxJdMQQb407mLQZheHwvehdlY5XJQF5kiT9o4scVc0yDh8fGN
	 J6rd67shhqMjw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Aug 2024 13:12:10 +0300
Message-Id: <D3EPBYVJ9NZ2.2OI3EQVYKRRZI@kernel.org>
To: "Jan Stancek" <jstancek@redhat.com>, <dhowells@redhat.com>,
 <dwmw2@infradead.org>, <zxu@redhat.com>, <keyrings@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] sign-file,extract-cert: avoid using deprecated
 ERR_get_error_line()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1720728319.git.jstancek@redhat.com>
 <6b7f84efe01b89a8a6cd35108a721224c22de8e1.1720728319.git.jstancek@redhat.com>
In-Reply-To: <6b7f84efe01b89a8a6cd35108a721224c22de8e1.1720728319.git.jstancek@redhat.com>

On Fri Jul 12, 2024 at 10:11 AM EEST, Jan Stancek wrote:
> ERR_get_error_line() is deprecated since OpenSSL 3.0.
>
> Use ERR_peek_error_line() instead, and combine display_openssl_errors()
> and drain_openssl_errors() to a single function where parameter decides
> if it should consume errors silently.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  certs/extract-cert.c |  4 ++--
>  scripts/sign-file.c  |  6 +++---
>  scripts/ssl-common.h | 23 ++++++++---------------
>  3 files changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/certs/extract-cert.c b/certs/extract-cert.c
> index 8e7ba9974a1f..61bbe0085671 100644
> --- a/certs/extract-cert.c
> +++ b/certs/extract-cert.c
> @@ -99,11 +99,11 @@ int main(int argc, char **argv)
>  		parms.cert =3D NULL;
> =20
>  		ENGINE_load_builtin_engines();
> -		drain_openssl_errors();
> +		drain_openssl_errors(__LINE__, 1);
>  		e =3D ENGINE_by_id("pkcs11");
>  		ERR(!e, "Load PKCS#11 ENGINE");
>  		if (ENGINE_init(e))
> -			drain_openssl_errors();
> +			drain_openssl_errors(__LINE__, 1);
>  		else
>  			ERR(1, "ENGINE_init");
>  		if (key_pass)
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 39ba58db5d4e..bb3fdf1a617c 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -114,11 +114,11 @@ static EVP_PKEY *read_private_key(const char *priva=
te_key_name)
>  		ENGINE *e;
> =20
>  		ENGINE_load_builtin_engines();
> -		drain_openssl_errors();
> +		drain_openssl_errors(__LINE__, 1);
>  		e =3D ENGINE_by_id("pkcs11");
>  		ERR(!e, "Load PKCS#11 ENGINE");
>  		if (ENGINE_init(e))
> -			drain_openssl_errors();
> +			drain_openssl_errors(__LINE__, 1);
>  		else
>  			ERR(1, "ENGINE_init");
>  		if (key_pass)
> @@ -273,7 +273,7 @@ int main(int argc, char **argv)
> =20
>  		/* Digest the module data. */
>  		OpenSSL_add_all_digests();
> -		display_openssl_errors(__LINE__);
> +		drain_openssl_errors(__LINE__, 0);
>  		digest_algo =3D EVP_get_digestbyname(hash_algo);
>  		ERR(!digest_algo, "EVP_get_digestbyname");
> =20
> diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
> index e6711c75ed91..2db0e181143c 100644
> --- a/scripts/ssl-common.h
> +++ b/scripts/ssl-common.h
> @@ -3,7 +3,7 @@
>   * SSL helper functions shared by sign-file and extract-cert.
>   */
> =20
> -static void display_openssl_errors(int l)
> +static void drain_openssl_errors(int l, int silent)
>  {
>  	const char *file;
>  	char buf[120];
> @@ -11,28 +11,21 @@ static void display_openssl_errors(int l)
> =20
>  	if (ERR_peek_error() =3D=3D 0)
>  		return;
> -	fprintf(stderr, "At main.c:%d:\n", l);
> +	if (!silent)
> +		fprintf(stderr, "At main.c:%d:\n", l);
> =20
> -	while ((e =3D ERR_get_error_line(&file, &line))) {
> +	while ((e =3D ERR_peek_error_line(&file, &line))) {
>  		ERR_error_string(e, buf);
> -		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> +		if (!silent)
> +			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> +		ERR_get_error();
>  	}
>  }
> =20
> -static void drain_openssl_errors(void)
> -{
> -	const char *file;
> -	int line;
> -
> -	if (ERR_peek_error() =3D=3D 0)
> -		return;
> -	while (ERR_get_error_line(&file, &line)) {}
> -}
> -
>  #define ERR(cond, fmt, ...)				\
>  	do {						\
>  		bool __cond =3D (cond);			\
> -		display_openssl_errors(__LINE__);	\
> +		drain_openssl_errors(__LINE__, 0);	\
>  		if (__cond) {				\
>  			errx(1, fmt, ## __VA_ARGS__);	\
>  		}					\


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

