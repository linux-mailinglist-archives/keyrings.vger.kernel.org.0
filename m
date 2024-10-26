Return-Path: <keyrings+bounces-2257-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278F9B1695
	for <lists+keyrings@lfdr.de>; Sat, 26 Oct 2024 11:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E258B28248F
	for <lists+keyrings@lfdr.de>; Sat, 26 Oct 2024 09:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C7E1CC894;
	Sat, 26 Oct 2024 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgDbkwV8"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F51384B3;
	Sat, 26 Oct 2024 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729935626; cv=none; b=hNoUc+6l6br2owAxp4MW9Sek5p5xOu9CuWcxVN1Z7cZMb/X1K+tQSCcABsxivOnhtpTigPRYxkcHZdXDv24pAC2vxbRh1y5yAkYF0s7OagnoiGwxzZ30vn+BswPtcSapnZZGxbhzP1sHaEoq/V348H3j4CT44uYQyqMcNsSFPtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729935626; c=relaxed/simple;
	bh=N3V7Ud+qOTRFbeFfRErpeNSogX5+WK0+DzwhMadKStE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RMAKATwoLrQBb7bi6WJUYL+/9w1wipIB3rhfCNO4tO5LFn+1NFylWsdxAsrd+EQnjhIkoEY4jqf5CW74aqDtTyWPhiuSNLnSm2R/BNH2YZZQx7eEOMYUVkGMjrpH/ddWOmnYpA+rlYhAVqxPRed1IygsAURFZ4FuHcOzGdHud94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgDbkwV8; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so23246121fa.3;
        Sat, 26 Oct 2024 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729935622; x=1730540422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTfZmymdTHEmtAspplU78AmI4cEMam8tPVsffujx4Gc=;
        b=jgDbkwV8FRshNZIO0HZiqfjgNCdUaMcsQ3ATTYJ8nMCz9qvED7wz+34w+psp8mTcjw
         XOKSnebO9LgBoh2z6u0VkkBu+50FNSRHFzjGuOQgZtnO3CxUQMywnwKqYhRMLGp2OdzS
         eDw1XSGnQYXUBHsk3mHJJzGgbno8UBbxzoHWB4DwJ4CP1VxdR0zH6cqPEhHQ+udYC9Bq
         jrJlk3gu/rZB5HO/jfxAMugRNdqCEHdSgbARJl90cJQPOb0vTGgKcw41nOe1OYZ5gt+q
         8S2G7hRNzKDKwERoP4g+LzQiWIeYNQeV/jKNdUzFZGU8auR+aNMt7Yf6S0txsIDN+/ei
         k+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729935622; x=1730540422;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTfZmymdTHEmtAspplU78AmI4cEMam8tPVsffujx4Gc=;
        b=S+Datn+2bOQHIfix1VOf8R31n+k2zmu4jeNUav9CsCEVAs15jdkmO+58C16I2hVPYa
         QY9BE2zl1vh1gb1lSwMwj/BshMtchFZfB7euRsjEw37/VwwQ75PjD+4GbZZskkB41i7v
         GLiugCh1zSBdN3A7/+m6rluDXS+ZU6qyIxhaeDJ98h+N0F4HM2VmZWIkqgj3zMeRsUek
         QnzNe80fsMstqB0pWVicF++T9sujBphdIGBhCSs/qJOPguBMarTXS7QULT872VdAdoHy
         0jecnKw1CA7fh2LpACmYFjhnElFqL9xq6UObh9DMd3gmmFNMv7WexTKOLMPV8Kz533wk
         ilIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrPau8glC3RUlQbqCNuLdN1OIVdfD1zrNs2FIZIAlzR2rMHGEMdQKzVKVxarfowyoWLnjRDglfsw==@vger.kernel.org, AJvYcCVtSR1BmyAdMBGFae1lOrEQtq8Hltu+uzIOor00FbQ17pGPNtgDBNGGOhWvBmMnv/bEloYRfu9F8rzHL/XlmzURE3zUvD6W@vger.kernel.org, AJvYcCW+Lh5UTUC7VIoQTI7FDn1GYvli6JnlpPYv+G40gu99VJXzqmL93k4OJtk9pKxN2EQ5iJbw325yjWp0X2mr@vger.kernel.org
X-Gm-Message-State: AOJu0YyFebdKtiYV9G+Jz3W6skxmZaPz0KH9jlpSINGp9CbljV3pGnhZ
	CnjjgjbKIOlxed87pGDzCbSem4VNyp09GgmRbBMhjbCbqeaI3AT0
X-Google-Smtp-Source: AGHT+IEGL4t4NB0PpY9iFjDTYRZKjYZkwqxt8EPcf2UIaCgTYeJdo5oTwyK3gvBswZfSYlbwkFC/+g==
X-Received: by 2002:a2e:743:0:b0:2fb:6169:c42a with SMTP id 38308e7fff4ca-2fcbe078a85mr7411291fa.30.1729935621509;
        Sat, 26 Oct 2024 02:40:21 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1204:126f:f00a:513f:807b? ([2001:678:a5c:1204:126f:f00a:513f:807b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a2e0sm5167971fa.30.2024.10.26.02.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 02:40:20 -0700 (PDT)
Message-ID: <7490f670-40b6-408f-87a9-5dc7d0c97bc2@gmail.com>
Date: Sat, 26 Oct 2024 11:40:17 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH v2 06/19] crypto: rsassa-pkcs1 - Migrate to sig_alg
 backend
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>,
 Tadeusz Struk <tstruk@gigaio.com>, David Howells <dhowells@redhat.com>,
 Andrew Zaborowski <andrew.zaborowski@intel.com>,
 Saulo Alessandre <saulo.alessandre@tse.jus.br>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>,
 Varad Gautam <varadgautam@google.com>, Stephan Mueller
 <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 linux-security-module@vger.kernel.org, klara@kasm.eu
References: <cover.1725972333.git.lukas@wunner.de>
 <743afd4f298a3fad03e42ab46f913d1f51cb8b7c.1725972335.git.lukas@wunner.de>
 <2ed09a22-86c0-4cf0-8bda-ef804ccb3413@gmail.com> <ZxalYZwH5UiGX5uj@wunner.de>
 <9c33d208-168c-4af7-a155-9571872ede4d@gmail.com> <ZxtF7qVpAuX6YMXa@wunner.de>
Content-Language: en-US, sv-SE
In-Reply-To: <ZxtF7qVpAuX6YMXa@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-25 09:17, Lukas Wunner wrote:
> On Wed, Oct 23, 2024 at 12:19:45PM +0200, Klara Modin wrote:
>> On 2024-10-21 21:02, Lukas Wunner wrote:
>>> On Mon, Oct 21, 2024 at 06:08:03PM +0200, Klara Modin wrote:
>>>> This commit (1e562deacecca1f1bec7d23da526904a1e87525e in next-20241021)
>>>> seems to break connecting to wpa2-enterprise with iwd.
> [...]
>>> There is a *second* issue I discovered last week.  I cooked up
>>> a fix this morning, but haven't written a commit message yet.
>>> The patch is included below and it could indeed solve the
>>> problem because it fixes an issue introduced by the commit you
>>> identified as culprit.
> [...]
>> Tested on top of yesterday's next-20241022.
>>
>> With the first patch only there is no change, same behavior as previously.
>>
>> With the second patch only I get an oops, similar as the one you mentioned
>> in the first fix
>>
>> With both patches everything seems to work as expected. Thanks!
> 
> Thanks a lot for your testing efforts, this helps greatly!
> 
> I've dug into the source code of iwd (Intel Wireless Daemon) and
> the ell library it uses (Embedded Linux Library).
> 
> It turns out that the patch I sent you is sufficient when using
> TLS 1.2 or newer for EAP (which I assume is true in your case).
> But the patch is *not* sufficient for TLS 1.1 or earlier.
> 
> Normally RSA PKCS#1 encoding requires that the hash is prepended
> by a Full Hash Prefix (an ASN.1 sequence which identifies the
> hash algorithm used).  But it turns out there are legacy protocols
> such as TLS 1.1 or earlier as well as IKEv1 which omit the
> Full Hash Prefix.
> 
> The kernel supported this prior to 1e562deacecc.  Although TLS 1.1
> was deprecated in 2021 by RFC 8996, I think we cannot just remove
> support without advance notice.
> 
> So below is a new patch which reinstates support for these legacy
> protocols.  It should also fix the issue you're seeing with TLS 1.2
> or newer (which is caused by invoking KEYCTL_PKEY_QUERY without
> specifying a hash algorithm).
> 
> The patch below replaces the one I sent on Monday.  You'll still
> need the other pending fix:
> 
> https://lore.kernel.org/r/ff7a28cddfc28e7a3fb8292c680510f35ec54391.1728898147.git.lukas@wunner.de/
> 
> Would you mind testing this combination?  It did work in my own
> testing, but if you could test it as well that would raise the
> confidence.
> 
> I've looked at the source code of wpa_supplicant as well as
> various IKEv1 daemons (strongswan, libreswan, isakmpd, raccoon)
> and none of them seems to use the kernel's Key Retention Service,
> so iwd is the only known user space application affected so far.
> 
> Thanks,
> 
> Lukas
> 

Thanks for the explanation. I'll probably be able to test this on Monday.

(by the way, I don't seem to be receiving your emails. It could perhaps 
be something on the gmail side. I'll add klara@kasm.eu to the CC which 
is on my own server, maybe that'll work better)

Regards,
Klara Modin

> -- >8 --
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index c98c158..bbd07a9 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -93,7 +93,7 @@ static void public_key_destroy(void *payload0, void *payload3)
>   					     pkey->pkey_algo);
>   			} else {
>   				if (!hash_algo)
> -					return -EINVAL;
> +					hash_algo = "none";
>   				n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
>   					     "pkcs1(%s,%s)",
>   					     pkey->pkey_algo, hash_algo);
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index 9c28f1c..4d077fc9 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -27,6 +27,8 @@
>    * https://www.rfc-editor.org/rfc/rfc9580#table-24
>    */
>   
> +static const u8 hash_prefix_none[] = { };
> +
>   static const u8 hash_prefix_md5[] = {
>   	0x30, 0x20, 0x30, 0x0c, 0x06, 0x08,	  /* SEQUENCE (SEQUENCE (OID */
>   	0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x02, 0x05,	/*	<algorithm>, */
> @@ -93,6 +95,7 @@
>   	size_t		size;
>   } hash_prefixes[] = {
>   #define _(X) { #X, hash_prefix_##X, sizeof(hash_prefix_##X) }
> +	_(none),
>   	_(md5),
>   	_(sha1),
>   	_(rmd160),
> @@ -119,9 +122,18 @@ static const struct hash_prefix *rsassa_pkcs1_find_hash_prefix(const char *name)
>   	return NULL;
>   }
>   
> -static unsigned int rsassa_pkcs1_hash_len(const struct hash_prefix *p)
> +static bool rsassa_pkcs1_invalid_hash_len(unsigned int len,
> +					  const struct hash_prefix *p)
>   {
>   	/*
> +	 * Legacy protocols such as TLS 1.1 or earlier and IKE version 1
> +	 * do not prepend a Full Hash Prefix to the hash.  In that case,
> +	 * the size of the Full Hash Prefix is zero.
> +	 */
> +	if (p->data == hash_prefix_none)
> +		return false;
> +
> +	/*
>   	 * The final byte of the Full Hash Prefix encodes the hash length.
>   	 *
>   	 * This needs to be revisited should hash algorithms with more than
> @@ -130,7 +142,7 @@ static unsigned int rsassa_pkcs1_hash_len(const struct hash_prefix *p)
>   	 */
>   	static_assert(HASH_MAX_DIGESTSIZE <= 127);
>   
> -	return p->data[p->size - 1];
> +	return len != p->data[p->size - 1];
>   }
>   
>   struct rsassa_pkcs1_ctx {
> @@ -167,7 +179,7 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
>   	if (dlen < ctx->key_size)
>   		return -EOVERFLOW;
>   
> -	if (slen != rsassa_pkcs1_hash_len(hash_prefix))
> +	if (rsassa_pkcs1_invalid_hash_len(slen, hash_prefix))
>   		return -EINVAL;
>   
>   	if (slen + hash_prefix->size > ctx->key_size - 11)
> @@ -237,7 +249,7 @@ static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
>   	/* RFC 8017 sec 8.2.2 step 1 - length checking */
>   	if (!ctx->key_size ||
>   	    slen != ctx->key_size ||
> -	    dlen != rsassa_pkcs1_hash_len(hash_prefix))
> +	    rsassa_pkcs1_invalid_hash_len(dlen, hash_prefix))
>   		return -EINVAL;
>   
>   	/* RFC 8017 sec 8.2.2 step 2 - RSA verification */
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index 7d768f0..86126be 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -5540,6 +5540,12 @@ static int alg_test_null(const struct alg_test_desc *desc,
>   			.cipher = __VECS(fcrypt_pcbc_tv_template)
>   		}
>   	}, {
> +		.alg = "pkcs1(rsa,none)",
> +		.test = alg_test_sig,
> +		.suite = {
> +			.sig = __VECS(pkcs1_rsa_none_tv_template)
> +		}
> +	}, {
>   		.alg = "pkcs1(rsa,sha224)",
>   		.test = alg_test_null,
>   		.fips_allowed = 1,
> diff --git a/crypto/testmgr.h b/crypto/testmgr.h
> index 55aae18..d4c232a 100644
> --- a/crypto/testmgr.h
> +++ b/crypto/testmgr.h
> @@ -1983,6 +1983,61 @@ struct kpp_testvec {
>   };
>   
>   /*
> + * PKCS#1 RSA test vectors for hash algorithm "none"
> + * (i.e. the hash in "m" is not prepended by a Full Hash Prefix)
> + *
> + * Obtained from:
> + * https://vcsjones.dev/sometimes-valid-rsa-dotnet/
> + * https://gist.github.com/vcsjones/ab4c2327b53ed018eada76b75ef4fd99
> + */
> +static const struct sig_testvec pkcs1_rsa_none_tv_template[] = {
> +	{
> +	.key =
> +	"\x30\x82\x01\x0a\x02\x82\x01\x01\x00\xa2\x63\x0b\x39\x44\xb8\xbb"
> +	"\x23\xa7\x44\x49\xbb\x0e\xff\xa1\xf0\x61\x0a\x53\x93\xb0\x98\xdb"
> +	"\xad\x2c\x0f\x4a\xc5\x6e\xff\x86\x3c\x53\x55\x0f\x15\xce\x04\x3f"
> +	"\x2b\xfd\xa9\x96\x96\xd9\xbe\x61\x79\x0b\x5b\xc9\x4c\x86\x76\xe5"
> +	"\xe0\x43\x4b\x22\x95\xee\xc2\x2b\x43\xc1\x9f\xd8\x68\xb4\x8e\x40"
> +	"\x4f\xee\x85\x38\xb9\x11\xc5\x23\xf2\x64\x58\xf0\x15\x32\x6f\x4e"
> +	"\x57\xa1\xae\x88\xa4\x02\xd7\x2a\x1e\xcd\x4b\xe1\xdd\x63\xd5\x17"
> +	"\x89\x32\x5b\xb0\x5e\x99\x5a\xa8\x9d\x28\x50\x0e\x17\xee\x96\xdb"
> +	"\x61\x3b\x45\x51\x1d\xcf\x12\x56\x0b\x92\x47\xfc\xab\xae\xf6\x66"
> +	"\x3d\x47\xac\x70\x72\xe7\x92\xe7\x5f\xcd\x10\xb9\xc4\x83\x64\x94"
> +	"\x19\xbd\x25\x80\xe1\xe8\xd2\x22\xa5\xd0\xba\x02\x7a\xa1\x77\x93"
> +	"\x5b\x65\xc3\xee\x17\x74\xbc\x41\x86\x2a\xdc\x08\x4c\x8c\x92\x8c"
> +	"\x91\x2d\x9e\x77\x44\x1f\x68\xd6\xa8\x74\x77\xdb\x0e\x5b\x32\x8b"
> +	"\x56\x8b\x33\xbd\xd9\x63\xc8\x49\x9d\x3a\xc5\xc5\xea\x33\x0b\xd2"
> +	"\xf1\xa3\x1b\xf4\x8b\xbe\xd9\xb3\x57\x8b\x3b\xde\x04\xa7\x7a\x22"
> +	"\xb2\x24\xae\x2e\xc7\x70\xc5\xbe\x4e\x83\x26\x08\xfb\x0b\xbd\xa9"
> +	"\x4f\x99\x08\xe1\x10\x28\x72\xaa\xcd\x02\x03\x01\x00\x01",
> +	.key_len = 294,
> +	.m =
> +	"\x68\xb4\xf9\x26\x34\x31\x25\xdd\x26\x50\x13\x68\xc1\x99\x26\x71"
> +	"\x19\xa2\xde\x81",
> +	.m_size = 20,
> +	.c =
> +	"\x6a\xdb\x39\xe5\x63\xb3\x25\xde\x58\xca\xc3\xf1\x36\x9c\x0b\x36"
> +	"\xb7\xd6\x69\xf9\xba\xa6\x68\x14\x8c\x24\x52\xd3\x25\xa5\xf3\xad"
> +	"\xc9\x47\x44\xde\x06\xd8\x0f\x56\xca\x2d\xfb\x0f\xe9\x99\xe2\x9d"
> +	"\x8a\xe8\x7f\xfb\x9a\x99\x96\xf1\x2c\x4a\xe4\xc0\xae\x4d\x29\x47"
> +	"\x38\x96\x51\x2f\x6d\x8e\xb8\x88\xbd\x1a\x0a\x70\xbc\x23\x38\x67"
> +	"\x62\x22\x01\x23\x71\xe5\xbb\x95\xea\x6b\x8d\x31\x62\xbf\xf0\xc4"
> +	"\xb9\x46\xd6\x67\xfc\x4c\xe6\x1f\xd6\x5d\xf7\xa9\xad\x3a\xf1\xbf"
> +	"\xa2\xf9\x66\xde\xb6\x8e\xec\x8f\x81\x8d\x1e\x3a\x12\x27\x6a\xfc"
> +	"\xae\x92\x9f\xc3\x87\xc3\xba\x8d\x04\xb8\x8f\x0f\x61\x68\x9a\x96"
> +	"\x2c\x80\x2c\x32\x40\xde\x9d\xb9\x9b\xe2\xe4\x45\x2e\x91\x47\x5c"
> +	"\x47\xa4\x9d\x02\x57\x59\xf7\x75\x5d\x5f\x32\x82\x75\x5d\xe5\x78"
> +	"\xc9\x19\x61\x46\x06\x9d\xa5\x1d\xd6\x32\x48\x9a\xdb\x09\x29\x81"
> +	"\x14\x2e\xf0\x27\xe9\x37\x13\x74\xec\xa5\xcd\x67\x6b\x19\xf6\x88"
> +	"\xf0\xc2\x8b\xa8\x7f\x2f\x76\x5a\x3e\x0c\x47\x5d\xe8\x82\x50\x27"
> +	"\x40\xce\x27\x41\x45\xa0\xcf\xaa\x2f\xd3\xad\x3c\xbf\x73\xff\x93"
> +	"\xe3\x78\x49\xd9\xa9\x78\x22\x81\x9a\xe5\xe2\x94\xe9\x40\xab\xf1",
> +	.c_size = 256,
> +	.public_key_vec = true,
> +	},
> +};
> +
> +/*
>    * PKCS#1 RSA test vectors. Obtained from CAVS testing.
>    */
>   static const struct sig_testvec pkcs1_rsa_tv_template[] = {
> 


