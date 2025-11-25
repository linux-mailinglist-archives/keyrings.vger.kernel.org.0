Return-Path: <keyrings+bounces-3437-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE3DC83FCA
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 09:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28F3A3A503B
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C050027F732;
	Tue, 25 Nov 2025 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="BsJrdqxZ";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="7cJVcxtk"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FE1E1C02;
	Tue, 25 Nov 2025 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059548; cv=pass; b=YhnSrv+deriznV1zCEHuqe+Kc6xH4jseGf4keK1QAH6WMp7rR5ck4HYW+6vFTbkeJMCvgq5ZyJFXgnJB+E49rfz4amsQ2PXdtkNYO/C0/WzsU80i7+nQ6LDt9vfHF1ERFLNsNsXPgxF7yVzf1EIBC/+WUgksUdEHSD5wRB18tFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059548; c=relaxed/simple;
	bh=QiPZ4Qwxc31OYBgTjEy8NY1HVbx0cvc8OA958Xo6/6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsJiLZAiCttOpJ9jM26sOIAodN4KH6y7L2j6fTfaZ7HHy5CqlpuTaDa3Bz9q3xTyRO5rCIZNt7aZLqQ/v8Jbpc0aq1JzMzCIVOFyMFQDEBLb0rxd92H7IWl2T6zWAPlJTaxw6xErrS8AnbcfjfbKs9U0+CaFbXKOAQTSdVe85Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=BsJrdqxZ; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=7cJVcxtk; arc=pass smtp.client-ip=81.169.146.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1764059535; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=H5DQwzV82hP0IyDcBz+3yog/waD5Cx7taHYRG+IHo2QwHumV8VmUcGbEod9+sL0BhQ
    Me53++uqsSBfmabwySeHBYmhPYcTmm9nrBZFvcDFy8FlxOm6ha1WRvfKFJzFiVDsI+tb
    0ufisvkT7k6cJKwSk9uA3p5mjR7L/7H36qNBBxIRR+YIv8k8rToBFMGzogVQGNpvSQlv
    cO1o3OCZJ+wvIg6yv3BZMP+sUx3PpszigQfd5UeLfZfbcyd7Uu3MyIzTK8b2pY4XhzqU
    5SeouIBKt3Q/JSm1Pps+5KdcaTt0sAnky4ibraxzNRRR/thFxXOAuL+sRgCo0LhLWr8V
    JhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1764059535;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QiPZ4Qwxc31OYBgTjEy8NY1HVbx0cvc8OA958Xo6/6I=;
    b=UJmEeEks/5lDSlzx2l65udfJcnbGftncJSM9ehRfInhSSJc3B+L6CKLqZ33D1BXBTW
    yCfyT/CvJf1y5QFviDCxqhL0LgU7/TNstbV9bAnLtY3XEpYdxGICptGCjZELwZOpSmPV
    rCIehvZc9a2004AAICZBNtpGlZTa5KZN29QK43Olofqpepl5cnULSnQ2BRLw8hsV7Vqv
    noer6EK9/00a8EHLyG7c3W2+N/NCAQ7jCFPnbHi7RkaK0UTAufVwMCQS3JefIc4ABOuX
    SRqehnMLdlVez4DWguEoKavvyNFzJZ0R9wWIAb+EAPuZux/UBUrcz4zlCVsjgAuweK6/
    pQ9w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1764059535;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QiPZ4Qwxc31OYBgTjEy8NY1HVbx0cvc8OA958Xo6/6I=;
    b=BsJrdqxZ38w4GBlDlxEgN0mddaJhV6KIVvSGravsufY8UfwHZ5W3iAzWH0d3nIfxBC
    aILHY0M4tcVZODFEVfFx0bLgh18NYVPlLT2TsIw7bkXrS2qy19ef+3TS4X+kruaiQr33
    LaQ+FwYH2BOeuvvgPBS/rCcYeBR6mAB8kpTc1ahCXrrXlPIFygmEMMu2eSZte+a4MWw5
    PgFPg3rgnOCWi92dkRpPayityaBRm9P4HaAXkU4fKofBIDELavi6Krj9iNbaiGFlGqso
    fFYPuZGB9WL3ORDgfCz0KzYAnK7uSqC7UGGm5blNGIZcMkW6HJqVwys9mcOu0YNyb7qU
    z+/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1764059535;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QiPZ4Qwxc31OYBgTjEy8NY1HVbx0cvc8OA958Xo6/6I=;
    b=7cJVcxtkV0oaIiLdny9kwrE/BGyWmcZBg4hbHZzQReJPf1Abx1cLBBvhxKOpCdr/Mj
    I74vJBAgyXDnMt67Z+Dw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYIvSfwaAV"
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id fd5b701AP8WA2cr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 25 Nov 2025 09:32:10 +0100 (CET)
From: Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/9] crypto: Add ML-DSA/Dilithium verify support
Date: Tue, 25 Nov 2025 09:32:07 +0100
Message-ID: <4924215.vXUDI8C0e8@positron.chronox.de>
In-Reply-To: <20251125041050.GA1608@sol>
References:
 <20251117145606.2155773-1-dhowells@redhat.com>
 <20251121013716.GE3532564@google.com> <20251125041050.GA1608@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=smueller@chronox.de;
 keydata=
 mFIEZZK4/xMIKoZIzj0DAQcCAwTDaDnchhDYEXH6dbfhyHMkiZ0HPYDF5xwHuMB8Z24SuXYdMfh
 pnovdsgwpi6LNAvnI/lGPrvDc/Mv0GQvHDxN0tCVTdGVwaGFuIE3DvGxsZXIgPHNtdWVsbGVyQG
 Nocm9ub3guZGU+iJYEExMIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQQ0LE46O
 epfGZCb44quXQ2j/QkjUwUCZZK6YwIZAQAKCRCuXQ2j/QkjU/bVAP9CVqPG0Pu6L0GxryzpRkvj
 uifi4IzEoACd5oUIGmUX7AD8DxesdicM2ugqAxHgEZKl9xhi36Eq7usa/A6c6kFmyHK0HVN0ZXB
 oYW4gTcO8bGxlciA8c21AZXBlcm0uZGU+iJMEExMIADsWIQQ0LE46OepfGZCb44quXQ2j/QkjUw
 UCZZK6QgIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRCuXQ2j/QkjU8HNAQDdTmzs+
 Cls6FMoFrzoWdYtOGCW5im7x1G5M/L0L3VOvgEA6m9edpqCc0irbdNXVjoZwTXkSsLOxs2t7aDX
 2vFX54m0KVN0ZXBoYW4gTcO8bGxlciA8c211ZWxsZXJAbGVhbmNyeXB0by5vcmc+iJMEExMIADs
 WIQQ0LE46OepfGZCb44quXQ2j/QkjUwUCZb+zewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBw
 IXgAAKCRCuXQ2j/QkjU1pIAQDemuxTaZdMGsJp/7ghbB7gHwV5Rh5d1wghKypI0z/iYgEAxdR7t
 6KrazO07Ia9urxEAQWqi0nf6yKluD0+gmOCmsW4UgRlkrj/EwgqhkjOPQMBBwIDBBo6QjEMU/1V
 DD+tVj9qJ39qtZe5SZKFetDzXtyqRpwL+u8IbdIjv0Pvz/StziFMeomh8chRB7V/Hjz19jajK3C
 IeAQYEwgAIBYhBDQsTjo56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsgAAoJEK5dDaP9CSNTLQwA/1
 WxGz4NvAj/icSJu144cMWOhyeIvHfgAkG9sg9HZXGdAPsGzKo4SezAYCwqgFKnyUIAjKYl1EW79
 pSCOFS36heQvbhWBGWSuP8SCCqGSM49AwEHAgMEiEhJatNBgxidg8XJFTy8Ir7EsTCeoVY2vJAN
 rysZeAAmSaUWFD4pvXE5RYQFeCYTWTG419H7ocNGUz5u1dgKhAMBCAeIeAQYEwgAIBYhBDQsTjo
 56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsMAAoJEK5dDaP9CSNTGCAA/A2i1CxhQJmYh2MwfeM5Hy
 Wk6EeWruSA1OgSWmaJaoGaAP4mARD2CviJgz8s3Gw07ZTk8SYHOTnv70hUbaziZ3/tjA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 25. November 2025, 05:10:50 Mitteleurop=C3=A4ische Normalzeit =
schrieb=20
Eric Biggers:

Hi Eric,

> No reply from Stephan yet, so to make sure this doesn't get missed I
> also opened an issue at
> https://github.com/smuellerDD/leancrypto/issues/42

Thanks for the report, fixed.

Ciao
Stephan



