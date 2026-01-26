Return-Path: <keyrings+bounces-3942-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDkQCA9Yd2lneQEAu9opvQ
	(envelope-from <keyrings+bounces-3942-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 13:03:27 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C087F7B
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 13:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 465BC3017273
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248B933436D;
	Mon, 26 Jan 2026 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXeEP6EY"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66FF405F7;
	Mon, 26 Jan 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428974; cv=none; b=Yo7Emg1jSpC0GiqYFJk3I/SP4G11rp2IVBabOUmdGn2HU9BI1FrMgieu/7TfwrhdVuPK72NBjM5fJ8OGKB15ia1WWoLNECZKjaLSnI8uty7MSKIx5ff+gEdxnbu+VTmK9v1zdVsGXrQtMfEylSSU05HJLj/orlSBYS27tE4sg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428974; c=relaxed/simple;
	bh=hKZBVrGWZQQ5XX93vHRak1lV5D7+TXRN9U640xVoF6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0CWRqks3W7BdJbEBA+++zg3xYhYeWUMrtj5HFiSdcJ2wn9/umxxl9CfH35n3WZhNWRDXuyVVsunciP9VtGUdn7BoDjKpvoHoWGd+U8QVUfxARITLDQAKQosyN2Iyi+DPKVExuvteUlF6lvvGWrf6JEIe3bkOwvL5nyRqpuiGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXeEP6EY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDD9C116C6;
	Mon, 26 Jan 2026 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769428973;
	bh=hKZBVrGWZQQ5XX93vHRak1lV5D7+TXRN9U640xVoF6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WXeEP6EYPjMaIa0o/IQ3x0HuzG1dDs4TNT6q5gz59B4gMkSd44fCyh6IryVdKndAy
	 QIyOzm6o7JCOKfWz/q2Hu8/Y+BnXhKThY+RtKIYzoC4TPPry/COoisBmcHtsgKYqGy
	 cxgSMNM6iW2SyLzDgsrn4lKvB8tyx3YFztazdZsOy9tF2wRE3ImuDV4/ukjljzQ9PR
	 PQQtRe5vykxEUNHLztrMTRgYu8B36TIMfq4sFg5rGP6p/eK3QT/LivlgglVIQ3w4oL
	 7dvgvO476qemdBFodcpfP19zKL1T9knUcEFRZu3m2K5VRecKqeu3OHXRhnWAl5lMOZ
	 pKb08QMwHLiOA==
Message-ID: <b369d129-aa23-420c-8e0a-be4a83ad6951@kernel.org>
Date: Mon, 26 Jan 2026 13:02:36 +0100
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] pkcs7, x509: Add ML-DSA support
To: Jarkko Sakkinen <jarkko@kernel.org>, David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers
 <ebiggers@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260121223609.1650735-1-dhowells@redhat.com>
 <20260121223609.1650735-5-dhowells@redhat.com> <aXYrvMpaQ2rHmFrw@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aXYrvMpaQ2rHmFrw@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3942-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,chronox.de:email,apana.org.au:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,wunner.de:email]
X-Rspamd-Queue-Id: 714C087F7B
X-Rspamd-Action: no action



Le 25/01/2026 à 15:42, Jarkko Sakkinen a écrit :
> On Wed, Jan 21, 2026 at 10:36:06PM +0000, David Howells wrote:
>> Add support for ML-DSA keys and signatures to the CMS/PKCS#7 and X.509
>> implementations.  ML-DSA-44, -65 and -87 are all supported.  For X.509
>> certificates, the TBSCertificate is required to be signed directly; for CMS,
>> direct signing of the data is preferred, though use of SHA512 (and only that)
>> as an intermediate hash of the content is permitted with signedAttrs.
>>
>> Signed-off-by: David Howells <dhowells@redhat.com>
>> cc: Lukas Wunner <lukas@wunner.de>
>> cc: Ignat Korchagin <ignat@cloudflare.com>
>> cc: Stephan Mueller <smueller@chronox.de>
>> cc: Eric Biggers <ebiggers@kernel.org>
>> cc: Herbert Xu <herbert@gondor.apana.org.au>
>> cc: keyrings@vger.kernel.org
>> cc: linux-crypto@vger.kernel.org
>> ---
>>   crypto/asymmetric_keys/pkcs7_parser.c     | 24 +++++++++++++++++++-
>>   crypto/asymmetric_keys/public_key.c       | 10 +++++++++
>>   crypto/asymmetric_keys/x509_cert_parser.c | 27 ++++++++++++++++++++++-
>>   include/linux/oid_registry.h              |  5 +++++
>>   4 files changed, 64 insertions(+), 2 deletions(-)
>>
>> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
>> index 3cdbab3b9f50..594a8f1d9dfb 100644
>> --- a/crypto/asymmetric_keys/pkcs7_parser.c
>> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
>> @@ -95,11 +95,18 @@ static int pkcs7_check_authattrs(struct pkcs7_message *msg)
>>   	if (sinfo->authattrs) {
>>   		want = true;
>>   		msg->have_authattrs = true;
>> +	} else if (sinfo->sig->algo_takes_data) {
>> +		sinfo->sig->hash_algo = "none";
>>   	}
>>   
>> -	for (sinfo = sinfo->next; sinfo; sinfo = sinfo->next)
>> +	for (sinfo = sinfo->next; sinfo; sinfo = sinfo->next) {
>>   		if (!!sinfo->authattrs != want)
>>   			goto inconsistent;
>> +
>> +		if (!sinfo->authattrs &&
>> +		    sinfo->sig->algo_takes_data)
>> +			sinfo->sig->hash_algo = "none";
> 
> Why don't we have a constant for "none"?
> 
> $ git grep "\"none\"" security/
> security/apparmor/audit.c:      "none",
> security/apparmor/lib.c:        { "none", DEBUG_NONE },
> security/security.c:    [LOCKDOWN_NONE] = "none",
> 
> $ git grep "\"none\"" crypto
> crypto/asymmetric_keys/public_key.c:                                    hash_algo = "none";
> crypto/asymmetric_keys/public_key.c:                            hash_algo = "none";
> crypto/testmgr.h: * PKCS#1 RSA test vectors for hash algorithm "none"
> 
> IMHO, this a bad practice.

What is a bad practice ?

$ git grep "\"sha256\"" security
security/apparmor/apparmorfs.c:         dent = 
aafs_create_file("sha256", S_IFREG | 0444, dir,
security/apparmor/apparmorfs.c: return rawdata_get_link_base(dentry, 
inode, done, "sha256");
security/apparmor/apparmorfs.c:         dent = create_profile_file(dir, 
"sha256", profile,
security/integrity/ima/Kconfig: default "sha256" if IMA_DEFAULT_HASH_SHA256
security/ipe/audit.c:#define IPE_AUDIT_HASH_ALG "sha256" /* keep in sync 
with audit_policy() */

$ git grep "\"sha256\"" crypto
crypto/asymmetric_keys/mscode_parser.c:         ctx->digest_algo = "sha256";
crypto/asymmetric_keys/pkcs7_parser.c: 
ctx->sinfo->sig->hash_algo = "sha256";
crypto/asymmetric_keys/public_key.c:                strcmp(hash_algo, 
"sha256") != 0 &&
crypto/asymmetric_keys/x509_cert_parser.c: 
ctx->cert->sig->hash_algo = "sha256";
crypto/asymmetric_keys/x509_cert_parser.c: 
ctx->cert->sig->hash_algo = "sha256";
crypto/drbg.c:          .cra_name = "sha256",
crypto/drbg.c:          .backend_cra_name = "sha256",
crypto/essiv.c: /* Synchronous hash, e.g., "sha256" */
crypto/krb5/rfc8009_aes2.c:     .hash_name      = "sha256",
crypto/sha256.c:                .base.cra_name          = "sha256",
crypto/sha256.c:MODULE_ALIAS_CRYPTO("sha256");
crypto/tcrypt.c:                ret = min(ret, tcrypt_test("sha256"));
crypto/tcrypt.c:                test_hash_speed("sha256", sec, 
generic_hash_speed_template);
crypto/tcrypt.c:                test_ahash_speed("sha256", sec, 
generic_hash_speed_template);
crypto/testmgr.c:               .alg = "sha256",

How is the handling of "none" different from other hash algorithms ?

Christophe

