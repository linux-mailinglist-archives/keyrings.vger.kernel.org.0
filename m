Return-Path: <keyrings+bounces-3033-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D233EB89C0B
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 15:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF73A00CC9
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05681313271;
	Fri, 19 Sep 2025 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSCkpXKQ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63090313263
	for <keyrings@vger.kernel.org>; Fri, 19 Sep 2025 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290367; cv=none; b=EMocY3Yg2wNcrfUTurHH4t+NbBJFD4PH+/2EHFe18GAi6SBhAv36JCynhnBAVAORE4CxuqhjE12qu5E/iO7/eRiTS3x1PXlu/L0jtvz2on1BWkblQOsSHrQeXz039DjszH9pVKD9Jb65/pXU3DSPOFPXq5nYw1TSupdQfuGaYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290367; c=relaxed/simple;
	bh=E0aKd79dQRldmcXYoHZeP6fkSHuLvXaXqPGKYoA27iA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ze58fk3/Y9l65iOmEVHDe28t8UV335czBY/m6XxssOf3nhmtOVJ+5XRJgGCrPoP6+k9DrU9Ob9qFPdznR9tITC/Gb4xnvifRei0j13aOK5+bxH3X8okyEg18eHizOvS6UUp1wcq4TGdT+7VK3rdj1gN/S2SurGTMQatR3F0ZvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XSCkpXKQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758290365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0aKd79dQRldmcXYoHZeP6fkSHuLvXaXqPGKYoA27iA=;
	b=XSCkpXKQIJFNtZ6cW1gqtHJ/nEwrE0YL5pdNYFpTrLG7ND8xma9fEccC3K9OWN0yShACxp
	j8kGK0NlqcsGqgawzzETsIzRdcHuyqbt0YxtYkX3DZlZRTNTi8ALtSV/ZeNbCct0UGkjhJ
	SxalOObMpaZ4j2KnNR6V9BWp/r/O/ls=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-FeCooC00PK-WJc4LBkR5Wg-1; Fri, 19 Sep 2025 09:59:23 -0400
X-MC-Unique: FeCooC00PK-WJc4LBkR5Wg-1
X-Mimecast-MFC-AGG-ID: FeCooC00PK-WJc4LBkR5Wg_1758290363
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b633847b94so49589611cf.3
        for <keyrings@vger.kernel.org>; Fri, 19 Sep 2025 06:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290363; x=1758895163;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0aKd79dQRldmcXYoHZeP6fkSHuLvXaXqPGKYoA27iA=;
        b=JrbQkvRKBN00UDNeygKHhUhgdXyyjgih9nbKYxXABwt8GF3Hls6+36uPJ8iNCcKRH8
         y4r6Tm5kPCntAtAPn7xrBugUt/Q4eXo7TiRO3AfFtL1INfKxDFhSeYIIDTOiDt7G6CxK
         nk/nL3bojLzjsQ0Iyowju2mdQA2axim1PQ/M910RvpNeSMZNEkXXWt7mZn9D+i/WO9Ip
         W+5O5xJLVOLziZPoFTcqIY1Prhw0rtpwXb3rmJ83cJyOOtBoEtPriOOt7CV2O6Glkvg5
         VTMs/H6Hkh+BpxAMsphF7Y+c/SpJHMM9leeglvmqOoZfadx1eRQFLg0LqkVUB/Kf+S+3
         lUGg==
X-Forwarded-Encrypted: i=1; AJvYcCUoxEFLP3W4nH7eW62DZneRYgXiOR3wC1H4jiWSajF+4j82+YjzTx4kmcpmo/nj/yNUFMuci2hZ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7EV80IixsaDX2s8jvHDHVwv9TraOVlLNp9xRrnWsTWLto9jE4
	hktzdGIGTR4FGxs54PFHBOteW8XJxy3LIso+4sFXbP/0OiVuC4Yn5r6uWDUAchrAAvKMlfYxiJZ
	LYU5bS706ufcjRygyo15rhalF+hZAC3YAQxCB1s792Z1TTQs2bnQInW8DGHcr
X-Gm-Gg: ASbGncuPcsLoO4nPooSzcN8x6RNS4l3wnDg/tpwiYiW2I0DmVSByMkZZTmRFZnQHA4o
	x8RzZcg4Z+8BIPv1/4fbToRodHXQNMxOm000CS3SG4/iTbxTc+AivZmqIM4OUEl8FjncBdSvn+2
	W2kDVOYI/P2v0AyaPKq0E8da20ucL0pbB6TirolxP3bgJtxSDE9fr8WDu5zj9Wg4/x/o/rnVzB0
	gxhkndwXaSzObqMhMLsDVV1pfEaGPzodryyJ8QmHFlS+aPR1KuLrEJnmVJ1ZqnttAFgnm7V6++d
	b0TWkqoVHDS6qu4N0tCurtXlUJ+oBOCpRA==
X-Received: by 2002:ac8:5dce:0:b0:4b5:f59b:2e7 with SMTP id d75a77b69052e-4c06cdd8d53mr40676441cf.9.1758290363038;
        Fri, 19 Sep 2025 06:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZORXfI+7Pv8Nbr9EEpWupK3RCB0YdG+gi72RSlWrDN1wMdtZXcENcez+iU5vJ3qPlyNBw7g==
X-Received: by 2002:ac8:5dce:0:b0:4b5:f59b:2e7 with SMTP id d75a77b69052e-4c06cdd8d53mr40676021cf.9.1758290362591;
        Fri, 19 Sep 2025 06:59:22 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::318])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bdaa0c5156sm29082401cf.45.2025.09.19.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:22 -0700 (PDT)
Message-ID: <2df4e63a5c34354ebeb6603f81a662380517fbc4.camel@redhat.com>
Subject: Re: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512,
 SHAKE128, SHAKE256
From: Simo Sorce <simo@redhat.com>
To: David Howells <dhowells@redhat.com>, Stephan =?ISO-8859-1?Q?M=FCller?=
	 <smueller@chronox.de>
Cc: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>,  Ard Biesheuvel	 <ardb@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, 	linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Sep 2025 09:59:21 -0400
In-Reply-To: <3788819.1758262666@warthog.procyon.org.uk>
References: <2952535.lGaqSPkdTl@graviton.chronox.de>
	 <3605112.1758233248@warthog.procyon.org.uk>
	 <3788819.1758262666@warthog.procyon.org.uk>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-09-19 at 07:17 +0100, David Howells wrote:
> Stephan M=C3=BCller <smueller@chronox.de> wrote:
>=20
> > For a multi-stage squeeze, it is perhaps not helpful to zeroize the con=
text=20
> > here.
>=20
> Yeah - I've seen this now that I'm starting to trawl through your dilithi=
um
> code, so it will need adjusting.


I strongly suggest creating a test vector where multiple absorb and
squeeze operations are done in intermixed order, and then use that test
vector in your Kunit tests to ensure changes to the code do not break
this fundamental property of the keccak sponge algorithm.

Simo.

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc


