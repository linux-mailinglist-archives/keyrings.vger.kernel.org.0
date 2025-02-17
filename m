Return-Path: <keyrings+bounces-2405-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED1A38410
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 14:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CE693B8DD8
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 13:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253E023C9;
	Mon, 17 Feb 2025 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="gWPk1lF9"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB59193084
	for <keyrings@vger.kernel.org>; Mon, 17 Feb 2025 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797413; cv=none; b=tb3GjmgJg9XeM5VEKhhQlx5M1q58aEhXRjIJfugWtMdT+N9ajGSZ6d1tVAFrpj7HqE79YkahJ+ovSiA+InSDucQf3H/s5vpw9ZCBr55BIzQ4HoxsEWPqcL2aJm+U+KXeOXldZKW7k2SRfToEwxK8maVRsMfM4WxF6jlThx/XQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797413; c=relaxed/simple;
	bh=RN5diTS1pbX/cOrWorXzs9z9P5RDNjxPvOMWCweM8dE=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p3vI08oZRu7Lk5+xwMzBqR1OAThT+beKPkD85p7rl5JhbmQ1Txa0xXx5ypcp1WkrZtY1c+4YxGYD9CaabosMCzpw1vZB7UiIkMZqtniXE3MjYzXgC9NT5blOuQO3wnNSP9pxI3bReHoKUlgCPtjJs6FmEXRa3vbixhMiGEoyHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=gWPk1lF9; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1739797411; x=1771333411;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=gYrAzF++ajzq8MV5cG88KNERDSxucspShJLidoM1Pkk=;
  b=gWPk1lF9h56DWy8eK47eqHVXxi9tfiKwFcWGXqal+wwontHa3IRYn2gV
   z18pHEJJlhXoHF2IdpwxwFCNwzQlcQ6pMjxnHMI9VDyIF9zoSMCvyjX7G
   /VcFvsNDO8Czz0YMFKSCumEDUPdX7d9Qc+HBFfH9mfY/U2aFRHaWVG6AJ
   w=;
X-IronPort-AV: E=Sophos;i="6.13,292,1732579200"; 
   d="scan'208";a="719442428"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:03:28 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:51141]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.20.127:2525] with esmtp (Farcaster)
 id 1a0e8cb7-4805-4b56-9f4e-3986563551e5; Mon, 17 Feb 2025 13:03:27 +0000 (UTC)
X-Farcaster-Flow-ID: 1a0e8cb7-4805-4b56-9f4e-3986563551e5
Received: from EX19D018EUC003.ant.amazon.com (10.252.51.231) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 17 Feb 2025 13:03:27 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D018EUC003.ant.amazon.com (10.252.51.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 17 Feb 2025 13:03:27 +0000
Received: from email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Mon, 17 Feb 2025 13:03:26 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com (Postfix) with ESMTP id 2745FA020D;
	Mon, 17 Feb 2025 13:03:26 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id B33F0C285; Mon, 17 Feb 2025 13:03:25 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
CC: <dhowells@redhat.com>, <keyrings@vger.kernel.org>, <benh@amazon.com>,
	<ptyadav@amazon.com>
Subject: Re: [PATCH] Pass "err" argument by address to "_nsError" function
In-Reply-To: <20250217005452.4873-1-abuehaze@amazon.com> (Hazem Mohamed
	Abuelfotoh's message of "Mon, 17 Feb 2025 00:54:52 +0000")
References: <20250217005452.4873-1-abuehaze@amazon.com>
Date: Mon, 17 Feb 2025 13:03:25 +0000
Message-ID: <mafs0h64sn2oy.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Hazem,

On Mon, Feb 17 2025, Hazem Mohamed Abuelfotoh wrote:

> Commit 0d71523ab584 (=E2=80=9CDNS: Support AFS SRV records and
> cell db config files=E2=80=9D) has refactored the "nsError" function
> by moving some of error handling to "_nsError" function
> however we are passing the "err" argument to "_nsError"
> by value not by address which is wrong as that basically
> waste any processing we do in the "_nsError" function
> so correcting that by passing "err" by address.
>
> Reported-by: Pratyush Yadav <ptyadav@amazon.com>
> Signed-off-by: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
> ---
>  dns.afsdb.c        |  4 ++--
>  key.dns.h          |  2 +-
>  key.dns_resolver.c | 20 ++++++++++----------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/dns.afsdb.c b/dns.afsdb.c
> index 986c0f3..7bffb60 100644
> --- a/dns.afsdb.c
> +++ b/dns.afsdb.c
> @@ -228,7 +228,7 @@ static int dns_query_AFSDB(const char *cell)
>=20=20
>  	if (response_len < 0) {
>  		/* negative result */
> -		_nsError(h_errno, cell);
> +		_nsError(&h_errno, cell);
>  		return -1;
>  	}
>=20=20
> @@ -267,7 +267,7 @@ static int dns_query_VL_SRV(const char *cell)
>=20=20
>  	if (response_len < 0) {
>  		/* negative result */
> -		_nsError(h_errno, cell);
> +		_nsError(&h_errno, cell);
>  		return -1;
>  	}
>=20=20
> diff --git a/key.dns.h b/key.dns.h
> index 33d0ab3..2fedbc3 100644
> --- a/key.dns.h
> +++ b/key.dns.h
> @@ -59,7 +59,7 @@ extern __attribute__((format(printf, 1, 2)))
>  void info(const char *fmt, ...);
>  extern __attribute__((noreturn))
>  void nsError(int err, const char *domain);
> -extern void _nsError(int err, const char *domain);
> +extern void _nsError(int *err, const char *domain);
>  extern __attribute__((format(printf, 1, 2)))
>  void debug(const char *fmt, ...);
>=20=20
> diff --git a/key.dns_resolver.c b/key.dns_resolver.c
> index 7a7ec42..6b16427 100644
> --- a/key.dns_resolver.c
> +++ b/key.dns_resolver.c
> @@ -157,19 +157,20 @@ static const int ns_errno_map[] =3D {
>  	[NO_DATA]		=3D ENODATA,
>  };
>=20=20
> -void _nsError(int err, const char *domain)
> +void _nsError(int *err, const char *domain)
>  {
>  	if (isatty(2))
> -		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(err));
> +		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(*err));
>  	else
> -		syslog(LOG_INFO, "%s: %s", domain, hstrerror(err));
> +		syslog(LOG_INFO, "%s: %s", domain, hstrerror(*err));
>=20=20
> -	if (err >=3D sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
> -		err =3D ECONNREFUSED;
> -	else
> -		err =3D ns_errno_map[err];
> +	if (*err >=3D sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
> +		*err =3D ECONNREFUSED;
> +	else{
> +		*err =3D ns_errno_map[*err];
> +	}
>=20=20
> -	info("Reject the key with error %d", err);
> +	info("Reject the key with error %d", *err);
>  }
>=20=20
>  void nsError(int err, const char *domain)
> @@ -177,8 +178,7 @@ void nsError(int err, const char *domain)
>  	unsigned timeout;
>  	int ret;
>=20=20
> -	_nsError(err, domain);
> -
> +	_nsError(&err, domain);

Doing this breaks the switch block below since it checks against the
h_errno instead of the errno that err now contains. So it would end up
always using the default case. So we should either update the switch
block below or make _nsError() return the errno instead of modifying
err. IMO the latter is neater way of doing it. In that case, we could do
something like:

So I would suggest doing something like the below patch (only
compile-tested):

--- 8< ---
diff --git a/key.dns.h b/key.dns.h
index 33d0ab3..9c2df89 100644
--- a/key.dns.h
+++ b/key.dns.h
@@ -59,7 +59,7 @@ extern __attribute__((format(printf, 1, 2)))
 void info(const char *fmt, ...);
 extern __attribute__((noreturn))
 void nsError(int err, const char *domain);
-extern void _nsError(int err, const char *domain);
+extern int _nsError(int err, const char *domain);
 extern __attribute__((format(printf, 1, 2)))
 void debug(const char *fmt, ...);
=20
diff --git a/key.dns_resolver.c b/key.dns_resolver.c
index 7a7ec42..3182828 100644
--- a/key.dns_resolver.c
+++ b/key.dns_resolver.c
@@ -157,27 +157,31 @@ static const int ns_errno_map[] =3D {
        [NO_DATA]               =3D ENODATA,
 };
=20
-void _nsError(int err, const char *domain)
+int _nsError(int err, const char *domain)
 {
+       int errno;
+
        if (isatty(2))
                fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(err));
        else
                syslog(LOG_INFO, "%s: %s", domain, hstrerror(err));
=20
        if (err >=3D sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
-               err =3D ECONNREFUSED;
+               errno =3D ECONNREFUSED;
        else
-               err =3D ns_errno_map[err];
+               errno =3D ns_errno_map[err];
=20
-       info("Reject the key with error %d", err);
+       info("Reject the key with error %d", errno);
+
+       return errno;
 }
=20
 void nsError(int err, const char *domain)
 {
        unsigned timeout;
-       int ret;
+       int ret, errno;
=20
-       _nsError(err, domain);
+       errno =3D _nsError(err, domain);
=20
        switch (err) {
        case TRY_AGAIN:
@@ -193,7 +197,7 @@ void nsError(int err, const char *domain)
        }
=20
        if (!debug_mode) {
-               ret =3D keyctl_reject(key, timeout, err, KEY_REQKEY_DEFL_DE=
FAULT);
+               ret =3D keyctl_reject(key, timeout, errno, KEY_REQKEY_DEFL_=
DEFAULT);
                if (ret =3D=3D -1)
                        error("%s: keyctl_reject: %m", __func__);
        }
--- >8 ---

>  	switch (err) {
>  	case TRY_AGAIN:
>  		timeout =3D 1;

--=20
Regards,
Pratyush Yadav

