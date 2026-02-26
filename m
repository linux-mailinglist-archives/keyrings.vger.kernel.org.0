Return-Path: <keyrings+bounces-4088-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDAIC/KXoGnhkwQAu9opvQ
	(envelope-from <keyrings+bounces-4088-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 19:58:58 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2211AE17C
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 19:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 679E9322C6CA
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 18:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB8A3ACA7C;
	Thu, 26 Feb 2026 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GC1t/cRy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pqSOhJi/"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06863D905B
	for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131343; cv=none; b=WH9X+IYLlhFre5/S8VIiUH4FpyFPZOi+G3A8XLyQzzdCXjUhKzryo5jQMW1cwicTuHQNXItr6bKphVlYf/MsneBkX7thQ5rRNDnJqawwrJEzJKPqJNsBYX7s5xDHmZg7Wjk1Lvztau77CvUM5yVUlBNDMdurtRRH00UOujnMBQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131343; c=relaxed/simple;
	bh=fp53dHPMtS9Vv7Y49DE4SFhmmymxuGQm7sX0WDJndqY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JKzhJtPg/hK3j0mc1Uq2j8y63+/emnCuXFdIJfp9y01mHUMwMupD5WfcsnnFdobHNbRua8FHDO4JAnZBgYYGIqqSTFxIUK1zEPP7Hwkt1Kk6ZweFtkaH2F7C9wYvcSj/vhuwn7VVi9NN2Fg7Ohhf7BfNuEmU+sUJNXAhUerh5H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GC1t/cRy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pqSOhJi/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772131341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmNWMkp+rxDVZAXirUGvlit21mg3IlMEfr5LPpAaf2s=;
	b=GC1t/cRynroiH1YSgrIJd/ZdYknlsFbGyv2hEJaj/Zc8F37Bp3JYHChE3qDCJHvoB2wYEG
	+A/0xf1nadqo7TR6bY3KR4qcln/2wxyQfdCxFvTZ/lifvEOkml9DVYlyWlal/aOxei2y7L
	/lv14QBhb0n0piCnwH3odgWilNBMxCs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-kZZtq26nNDy1i9T7oB-5gA-1; Thu, 26 Feb 2026 13:42:19 -0500
X-MC-Unique: kZZtq26nNDy1i9T7oB-5gA-1
X-Mimecast-MFC-AGG-ID: kZZtq26nNDy1i9T7oB-5gA_1772131339
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899c5fd4878so111675516d6.3
        for <keyrings@vger.kernel.org>; Thu, 26 Feb 2026 10:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772131339; x=1772736139; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmNWMkp+rxDVZAXirUGvlit21mg3IlMEfr5LPpAaf2s=;
        b=pqSOhJi/h8VixRQ7mgUeK8Rq66BaMT8uFNnpo+0cHMW/dM/Xj+8s8hwHMiwJSRctyb
         YFVcsVr+JglTbgTCLaKB1G6x9RSyGMf15WBhDzlEPrgDjU1rdT36Y0MJzMOTyUbgD2ua
         CRS+rMjHCsjAJL/EF4eZg/Lhpb5FdN0Fn/PwzJ+Rq6k3cP9I9lkyP47DLG7031USARTw
         RbNVFWRmGBK/ZZcDWg0KZXWjl9nGAKsjDOLaADy2cUbAljAUvCXaDrvb69d1sD2Oi/Cd
         eJXHH4jlCATWhRyuqN6ga6r8K3sVbw4idO3K8HH48z0J9UOC5cQ3n4OpEW9jpZrvMYfP
         hLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772131339; x=1772736139;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmNWMkp+rxDVZAXirUGvlit21mg3IlMEfr5LPpAaf2s=;
        b=J6FR89JnbwNcU1M+oJtvdpxilYQ6QMooPpxQ1c1AYPLoWFpGBcogiDmLX5wB1NYKpM
         EVsXvAfAng3wRNKUcNnktKJ5a5O7H9yajaoiHiJ1JCdfewktK0eYim7ca5iPtMWrTHxQ
         EVHmWX6Zz+9xtGz8s9x1hjfxjkXI1mk4K/JKFTp/ASdltY1unk6v/VziKYGP0tw4SvRG
         RZaQDqmFU+f0fR8RIJrHRDPKVRU5sBZAEmLLqRIhGesUPamMpY1xM0eQywDtSWx2B8eM
         tdaRePt7i7gnF8xipVB9hmsEPUXYnvL3AzbCKvuqEz5OCQfu19gKm7UTm+dGKitVO+nz
         c/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkTquqSRqDIEpadWmUjPPBVwU+0qGq+RirPLBjeJjIqsmdK090mofJYGyO8/jDkKrwr0F2u5zgbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwII1YSSQRG+X6nIi/HB8CmSS+XJqG6lvUDXbfdZRvY3CWvO0
	dX9emQggqlitRnlfdpyntkw+53H1dRuvckc8Z+gmFc+0JhC7cuRuIVGasy0KXiecu5ExnAnmdZa
	sEFKHpH78Sz37qeLvvUbXlVnH137qdnRFyduUkLr0IiofhWAfanlIcVgownTv
X-Gm-Gg: ATEYQzyNFtqwG5mz9FBArsXNqQ4JyZJacDRawXxSD69MlW1s2LJO46gFQKP/ruaSMwS
	liDt3b6SDxLZ7K0paO4OQoidusRZ/ytKOxuezV/PMIZ13yYsVYWNopYyPBg/hfvUKBPZ5Qwfr3a
	9GPDKCkF88mPR3mmeVGVfLw+CYfRNQQwTrVcTyi+XH32G4f36/moTOPGTa/KgRp2soqRdnt5XWh
	yQHaD8F9haFbATbl7Z5qsB1sn71FQ8hp8ohaKWcScBXySzZ4rX7z+5qRB3nkEZ9Gl8+7N4t/0lQ
	Qg2rQo+GFYBvTgDzGZM3S6wXPKRfZT306taHn713MDsTVqPJBEbCWtaN/1g+Dga1nQt7G0w+hSP
	LVeFugYjNTXQlKbji
X-Received: by 2002:a05:6214:c46:b0:894:6202:4dc with SMTP id 6a1803df08f44-899d1ddb553mr1667946d6.21.1772131339252;
        Thu, 26 Feb 2026 10:42:19 -0800 (PST)
X-Received: by 2002:a05:6214:c46:b0:894:6202:4dc with SMTP id 6a1803df08f44-899d1ddb553mr1667456d6.21.1772131338716;
        Thu, 26 Feb 2026 10:42:18 -0800 (PST)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::7a7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7376847sm24184676d6.28.2026.02.26.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:42:18 -0800 (PST)
Message-ID: <2230669ce43024a2b7b27ca98b7539133d320730.camel@redhat.com>
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
Date: Thu, 26 Feb 2026 13:42:16 -0500
In-Reply-To: <969c74f3-81ed-442c-87dd-381274a642a7@linux.ibm.com>
References: <aXrKaTem9nnWNuGV@Rk>
	 <20260130203126.662082-1-johannes.wiesboeck@aisec.fraunhofer.de>
	 <aYHznG6vbptVOjHQ@Rk> <ee36981d-d658-4296-9acb-874c72606b3e@linux.ibm.com>
	 <20260226001049.GA3135@quark>
	 <cba10ac6-3557-4fc1-9b86-55361d14156d@linux.ibm.com>
	 <dc09be79-5efe-4756-a295-5b0428985525@linux.ibm.com>
	 <da190dbbc692b9da8464bbbfffdde7bab26b3f1c.camel@redhat.com>
	 <20260226165819.GA2251@sol>
	 <969c74f3-81ed-442c-87dd-381274a642a7@linux.ibm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[redhat.com,aisec.fraunhofer.de,gmail.com,oracle.com,vger.kernel.org,huawei.com,linux.ibm.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4088-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simo@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,keymaterial.net:url]
X-Rspamd-Queue-Id: 8B2211AE17C
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 12:22 -0500, Stefan Berger wrote:
>=20
> On 2/26/26 11:58 AM, Eric Biggers wrote:
> > On Thu, Feb 26, 2026 at 10:27:43AM -0500, Simo Sorce wrote:
> > > On Thu, 2026-02-26 at 09:16 -0500, Stefan Berger wrote:
> > > > On 2/26/26 7:42 AM, Stefan Berger wrote:
> > > > > On 2/25/26 7:10 PM, Eric Biggers wrote:
> > > > > > On Wed, Feb 25, 2026 at 09:25:43AM -0500, Stefan Berger wrote:
> > > > > > > To avoid duplicate work: Is either one of you planning on wri=
ting
> > > > > > > patches
> > > > > > > for IMA to use ML-DSA and convert the current ML-DSA to also =
support
> > > > > > > HashML?
> > > > > > > I had done the work on this before and could dig out the patc=
hes
> > > > > > > again...
> > > > > >=20
> > > > > > IMA already had to add its own digest prefixing support, since =
it was
> > > > > > needed to disambiguate between full-file digests and fsverity d=
igests.
> > > > > > See 'struct ima_file_id'.=C2=A0 Thus the message signed is at m=
ost 66 bytes.
> > > > >=20
> > > > > The hash there is still only a hash over a file and that hash is =
signed,
> > > > > isn't it?
> > > > >=20
> > > > > >=20
> > > > > > With that being the case, HashML-DSA isn't necessary.=C2=A0 It'=
s not even
> > > > > > possible to use here, since there are no OIDs assigned for the =
fsverity
> > > > > > digests, so it cannot replace the ima_file_id.
> > > > >=20
> > > > > For non-fsverify IMA signatures it is 'possible' to use HashML-DS=
A and
> > > > > it's 'working' (recycled old patches yesterday):
> > > > >=20
> > > > > Linux: https://github.com/stefanberger/linux/commits/
> > > > > dhmlsa%2Bima.202602025/
> > > > >=20
> > > > > ima-evm-utils: https://github.com/linux-integrity/ima-evm-utils/p=
ull/19/
> > > > > commits
> > > > >=20
> > > > > >=20
> > > > > > I'll also note that HashML-DSA is controversial (e.g. see
> > > > > > https://keymaterial.net/2024/11/05/hashml-dsa-considered-harmfu=
l/),
> > > > >=20
> > > > > The problem with this is that NIST would have to react to these
> > > > > controversies as we race to support PQC. If something is wrong wi=
th the
> > > > > standard then it would be best for NIST to withdraw/modify HashML=
-DSA
> > > > > asap. Otherwise it's the best to follow the standard IMO because =
if you
> > > > > don't you get criticism otherwise.
> > > >=20
> > > > What I am not clear about from FIPS-204 is whether availability of
> > > > HashML-DSA is a "must-use" or  a "may-use". What speaks against it =
for
> > > > our use case is performance. The lookup of a hash's ID (last digit =
of
> > > > OID) and the creation of the 11 byte encoding to prepend before eve=
ry
> > > > digest for every signature takes cycles.
> > >=20
> > > It is a recommendation, but there are plenty of protocols (TLS,
> > > OpenPGP, etc...) where the decision has been made to use "pure" ML-DS=
A
> > > only, even if what you are signing is not the full data, but somethin=
g
> > > containing a hash.
> > >=20
> > > Ideally you do not sign *just* a hash, but some structured data, like=
 a
> > > context label that identifies the hash and some other related metadat=
a
> > > for example. In order to make forgeries much harder should the hashin=
g
> > > algorithm used to hash the data weaken over time. But it is not
> > > strictly necessary (NIST mentioned in some forum, sorry I do not have
> > > the message handy for quoting, that a structured packet is perfectly
> > > fine for use with pure ML-DSA, because it does enough to address the
> > > same issues that a separate internal context does with HashML-DSA).
> > >=20
> > > If pure-ML-DSA works better for IMA, just use pure ML-DSA.
> > >=20
> > > > Maybe it should explicitly state in FIPS-204 something along the li=
nes
> > > > of "with a given hash either ML-DSA or HashML-DSA can be used (for =
as
> > > > long as you use it in the same way from then on)." At least this wa=
y
> > > > nobody can point out that HashML-DSA should have been used when you=
 didn't.
> > >=20
> > > NIST will not change the standard documents any time soon, but for FI=
PS
> > > certification there are Implementation Guidelines.
> > >=20
> > > In any case a FIPS module cannot distinguish between data that happen=
s
> > > to be 32 bytes long and a hash of larger data, so the point is kind o=
f
> > > moot. From the FIPS perspective HashML-DSA is just an available
> > > algorithm that protocol implementations can use, or not.
> > >=20
> > > There are additional guidelines on what this may be useful for, but s=
o
> > > far NIST has not objected to the use of pure ML-DSA even where
> > > theoretically HashML-DSA could be used.
> >=20
> > I see that IMA indeed never upgraded full file hashes to use
> > 'struct ima_file_id'.  Building a new feature that relies on this seems
>  > like a bad idea though, given that it's a security bug that makes=20
> the> IMA protocol cryptographically ambiguous.  I.e., it means that in IM=
A,
> > when the contents of some file are signed, that signature is sometimes
> > also valid for some other file contents which the signer didn't intend.
>=20
> You mean IMA should not sign the digest in the ima_file_id structure but=
=20
> hash the ima_file_id structure in which this file digest is written into=
=20
> (that we currently sign) and sign/verify this digest?

You should not (need to) hash it, just format it and the use ML-DSA to
sign it.

> And we would do=20
> this to avoid two different files (with presumably different content)=20
> from having the same hashes leading to the same signature? Which hashes=
=20
> (besides the non-recommended ones) are so weak now that you must not=20
> merely sign a file's hash?
>=20
> The problem with this is that older kernels (without patching) won't be=
=20
> able to handle newer signatures.

Ad a kernel option to use the new format? Old kernels won't be able to
deal with ML-DSA IMA either.

> >=20
> > Just fix that bug first, which has to be done anyway.  Then just use
> > pure ML-DSA to sign and verify the 'struct ima_file_id'.
>  > > As Simo mentioned, FIPS 204 doesn't require HashML-DSA when signing =
a
> > hash.  It's there as an *option* to solve a perceived problem, which is
> > actually solvable in better ways.
> >=20
> > NIST doesn't plan to update FIPS 204 until 2029, and most likely the
> > updates will just be errata in the text (such as the ones I reported to
> > them), not changes or withdrawals in the algorithms themselves.  But
> > it's irrelevant: just because HashML-DSA is an option doesn't mean it
> > has to be used.  Pure ML-DSA supports arbitrary data, which includes
>=20
> And I was sure whether it was merely an 'option'. Who would use it then=
=20
> if it takes more cycles to hash the prepended 11 byte oid in HashML-DSA?

Nobody is using HashML-DSA at the moment.

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc


