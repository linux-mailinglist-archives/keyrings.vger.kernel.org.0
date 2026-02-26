Return-Path: <keyrings+bounces-4083-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILI8D/JroGk3jgQAu9opvQ
	(envelope-from <keyrings+bounces-4083-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 16:51:14 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 935111A91C9
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 16:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72B563034B3D
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C813E95A9;
	Thu, 26 Feb 2026 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="du1O4iV2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WX2LLoxW"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CA031329B
	for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119670; cv=none; b=DCLw68qv1IBRh/iQ417+TVIxCuEO2o48/blPmGQAWJ6BzamKntx/bfTBBekZThEzHGB+6Lg3a6RVNclINr7NHmMqnleSdyifs0yTTcTP/A9TO2vDg+yHVN7KT/yDR4U7htJxFk0w2DXKS//Nig0rddl+41RdCKKfty79Fp4dloQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119670; c=relaxed/simple;
	bh=WdeCGCTL6JPLNjQboPf6jlsCpxs5JFZtnDaqVpFIDdc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iK8K+YZo/GaBYAvPkGIzYcnFzUqHm6npuzz+CAMaLjGwqYJ5ynEgC2ma7k5sT0Cv+QFGuvLVq9Frg1mrUg7dWvYUw0EQ9LTCwaFKnEjyBBIv8u3vNjuMvmfSlnNeIBE9l0yrRhqpSTniyDWEWTS7C1lR8jbCxElZBFYRLaub1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=du1O4iV2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WX2LLoxW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772119668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAyu0qMgQFztjvGBxM+KVZ6vBWyzEz+Ckm03PfSHbXI=;
	b=du1O4iV2ULwOlitVJIlsCf8uhLyDFXxnbuSiUA1S+rBhfxZUoiKtzoYh7Ttr7VCWnphznY
	YesbGivl/3vt5ov0X8tqRHr97G5SJcMHFujUprKOymoepj/ig58UaI8pAYqbpQaRh++NvF
	3sglz5xXtSEY6idjoh5xSE94qecPbyw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-qLtoxGbsOrSCKuDBEChQHQ-1; Thu, 26 Feb 2026 10:27:47 -0500
X-MC-Unique: qLtoxGbsOrSCKuDBEChQHQ-1
X-Mimecast-MFC-AGG-ID: qLtoxGbsOrSCKuDBEChQHQ_1772119666
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so1092175185a.0
        for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 07:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772119666; x=1772724466; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAyu0qMgQFztjvGBxM+KVZ6vBWyzEz+Ckm03PfSHbXI=;
        b=WX2LLoxWt6hvLP3jV0Og6ZzYw9aYiPL+n5Mnja/lU2r30Q3d5LDZauYt2p/i4wYnyB
         b8fZEBzsCEiUVzeJ1c6F/FneoNVZCNuaDdJy+Si3xE54E6et0IFAFB8HKK0TxBPtdCwj
         5WdaVp/fb0HPdi1y7G3Q1zgZa3G6uXpgsXz2b71yORhhksnSYT+FMkYD4Wyu/fgtNF2y
         o1R/1ZyrSFactKQ3SQ5LrK9kgv09l9MV7EiQo3EqDIU8kqK1s9kWCR3o/Yv0OrMQi+ul
         gseZJl3BJaPOG0Y9e0hfnyq3vINyMqusFA2IDHC9FlZe6r4J7QWHtqLc42yx0oUxjLp/
         2dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119666; x=1772724466;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAyu0qMgQFztjvGBxM+KVZ6vBWyzEz+Ckm03PfSHbXI=;
        b=akRxpfDnsWngE18qUOWN9lvKYtoDFhgZzH3kpqg2AXwzt8yFXZvha13HmNhVrxpsCa
         VjKO36lFMxREoMElpbMUjwLHEow2v8JqpLLRuq+cwU/P9huYZVIEy3g6Yu72wkVkGeI6
         Fm09526NMg0ECUQHN2yONhIvv/DkrYRCV1hMsmLYj2QHdGinBzSk4gkEYnDT+NTmf6QV
         wCS7t44+L58qT+C5wZ6wzXY6OI4LYTgamhzaFsPIp+2HBkF8k808wdIzxB8H0BJ8WBvm
         RhEL4S21pbuIofbne/xFghtZt/3KqRdcm8R79YUVECxJUEAGZhWvyX9LdLSuU/LwjtVg
         rtOw==
X-Forwarded-Encrypted: i=1; AJvYcCWxDh93s5qAc4dLaNTtpMgU12O1rykXX14XugGJjvYBpqUYzy+HroRzTb3PCwKy3BiqpqtjQn6xTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKo5B7tnr8UR5MFOoL6RT+Bn5FEBqDsD0T9BTa+GmE4qY+1jGC
	DWznyTTmM4xVVs0xGRCXN0D9GTtqAs7BleuEGICuHCHROjn8oSWWekzCvRpvME5Q7umzt1HQBfz
	EocHqMeaTJUFQZAAZjXbiOEPdPsH5kyiVgqsPdPu68i/bmFqb2LDG+6t/jv2E
X-Gm-Gg: ATEYQzzdYZSp19WOD6kv0+tbqzvMVrvwdRNQaFztZwkvWo3GeFMQcWTIbInuHg+CtcP
	uFc+50IcJNH8nIyVNkfPWvNdKVXSZh/Dk32BoWeMRMXo/D0/cbsjP/bBQSB1ztBPG/Dsha6VlZ3
	B9A3FzO1dKUrW+ZKP987nAIsWaRo0cE/VWok1ejQSVnEGY9WWamKO9J0ViMDaJrIa9pp1/h84aL
	o0E7t76FPkGQsU/7ROvKfiILxDrE5WQ6i6/6RxbPwZoBhtghpNtvockxU2lRw+b2TfZFvcmgoiY
	TYl20DORpMuy+5OLyUGt583qW8xt/r1Jzam+MWRPyw74ZXgMghz9z4xm8nY9oJ+oqiD0fYfjOa4
	MxRLuTnPOukEU5AYU
X-Received: by 2002:a05:620a:d8a:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8cbbcf7e84amr649027685a.29.1772119666329;
        Thu, 26 Feb 2026 07:27:46 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8cbbcf7e84amr649021385a.29.1772119665670;
        Thu, 26 Feb 2026 07:27:45 -0800 (PST)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::7a7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6730afsm262894585a.13.2026.02.26.07.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:27:44 -0800 (PST)
Message-ID: <da190dbbc692b9da8464bbbfffdde7bab26b3f1c.camel@redhat.com>
Subject: Re: IMA and PQC
From: Simo Sorce <simo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>, Eric Biggers <ebiggers@kernel.org>
Cc: Coiby Xu <coxu@redhat.com>, Johannes =?ISO-8859-1?Q?Wiesb=F6ck?=	
 <johannes.wiesboeck@aisec.fraunhofer.de>, dhowells@redhat.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
 keyrings@vger.kernel.org, 	linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, 	roberto.sassu@huawei.com,
 zohar@linux.ibm.com, michael.weiss@aisec.fraunhofer.de
Date: Thu, 26 Feb 2026 10:27:43 -0500
In-Reply-To: <dc09be79-5efe-4756-a295-5b0428985525@linux.ibm.com>
References: <aXrKaTem9nnWNuGV@Rk>
	 <20260130203126.662082-1-johannes.wiesboeck@aisec.fraunhofer.de>
	 <aYHznG6vbptVOjHQ@Rk> <ee36981d-d658-4296-9acb-874c72606b3e@linux.ibm.com>
	 <20260226001049.GA3135@quark>
	 <cba10ac6-3557-4fc1-9b86-55361d14156d@linux.ibm.com>
	 <dc09be79-5efe-4756-a295-5b0428985525@linux.ibm.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[redhat.com,aisec.fraunhofer.de,gmail.com,oracle.com,vger.kernel.org,huawei.com,linux.ibm.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4083-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simo@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,keymaterial.net:url]
X-Rspamd-Queue-Id: 935111A91C9
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 09:16 -0500, Stefan Berger wrote:
>=20
> On 2/26/26 7:42 AM, Stefan Berger wrote:
> >=20
> >=20
> > On 2/25/26 7:10 PM, Eric Biggers wrote:
> > > On Wed, Feb 25, 2026 at 09:25:43AM -0500, Stefan Berger wrote:
> > > > To avoid duplicate work: Is either one of you planning on writing=
=20
> > > > patches
> > > > for IMA to use ML-DSA and convert the current ML-DSA to also suppor=
t=20
> > > > HashML?
> > > > I had done the work on this before and could dig out the patches=
=20
> > > > again...
> > >=20
> > > IMA already had to add its own digest prefixing support, since it was
> > > needed to disambiguate between full-file digests and fsverity digests=
.
> > > See 'struct ima_file_id'.=C2=A0 Thus the message signed is at most 66=
 bytes.
> >=20
> > The hash there is still only a hash over a file and that hash is signed=
,=20
> > isn't it?
> >=20
> > >=20
> > > With that being the case, HashML-DSA isn't necessary.=C2=A0 It's not =
even
> > > possible to use here, since there are no OIDs assigned for the fsveri=
ty
> > > digests, so it cannot replace the ima_file_id.
> >=20
> > For non-fsverify IMA signatures it is 'possible' to use HashML-DSA and=
=20
> > it's 'working' (recycled old patches yesterday):
> >=20
> > Linux: https://github.com/stefanberger/linux/commits/=20
> > dhmlsa%2Bima.202602025/
> >=20
> > ima-evm-utils: https://github.com/linux-integrity/ima-evm-utils/pull/19=
/=20
> > commits
> >=20
> > >=20
> > > I'll also note that HashML-DSA is controversial (e.g. see
> > > https://keymaterial.net/2024/11/05/hashml-dsa-considered-harmful/),
> >=20
> > The problem with this is that NIST would have to react to these=20
> > controversies as we race to support PQC. If something is wrong with the=
=20
> > standard then it would be best for NIST to withdraw/modify HashML-DSA=
=20
> > asap. Otherwise it's the best to follow the standard IMO because if you=
=20
> > don't you get criticism otherwise.
>=20
> What I am not clear about from FIPS-204 is whether availability of=20
> HashML-DSA is a "must-use" or  a "may-use". What speaks against it for=
=20
> our use case is performance. The lookup of a hash's ID (last digit of=20
> OID) and the creation of the 11 byte encoding to prepend before every=20
> digest for every signature takes cycles.

It is a recommendation, but there are plenty of protocols (TLS,
OpenPGP, etc...) where the decision has been made to use "pure" ML-DSA
only, even if what you are signing is not the full data, but something
containing a hash.

Ideally you do not sign *just* a hash, but some structured data, like a
context label that identifies the hash and some other related metadata
for example. In order to make forgeries much harder should the hashing
algorithm used to hash the data weaken over time. But it is not
strictly necessary (NIST mentioned in some forum, sorry I do not have
the message handy for quoting, that a structured packet is perfectly
fine for use with pure ML-DSA, because it does enough to address the
same issues that a separate internal context does with HashML-DSA).

If pure-ML-DSA works better for IMA, just use pure ML-DSA.

> Maybe it should explicitly state in FIPS-204 something along the lines=
=20
> of "with a given hash either ML-DSA or HashML-DSA can be used (for as=20
> long as you use it in the same way from then on)." At least this way=20
> nobody can point out that HashML-DSA should have been used when you didn'=
t.

NIST will not change the standard documents any time soon, but for FIPS
certification there are Implementation Guidelines.

In any case a FIPS module cannot distinguish between data that happens
to be 32 bytes long and a hash of larger data, so the point is kind of
moot. From the FIPS perspective HashML-DSA is just an available
algorithm that protocol implementations can use, or not.

There are additional guidelines on what this may be useful for, but so
far NIST has not objected to the use of pure ML-DSA even where
theoretically HashML-DSA could be used.

> >=20
> > > since it was added to the ML-DSA specification at a late stage withou=
t
> > > sufficient review, and what it does can be achieved in better ways.
> >=20
> > In case of doubt I would use the standard, though. It's probably not a=
=20
> > good idea for everyone to implement their own (bad) solution.
> >=20
> > > Which is exactly what we are seeing here, since again, IMA needs to d=
o
> > > the digest calculation and prefixing itself anyway.
> >=20
> > Use the standard...
> >=20
> >  =C2=A0=C2=A0 Stefan
> >=20
> > >=20
> > > - Eric
> >=20
> >=20
>=20

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc


