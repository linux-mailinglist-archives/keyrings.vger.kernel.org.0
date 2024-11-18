Return-Path: <keyrings+bounces-2302-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 645ED9D0A70
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 08:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C9F281CF1
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 07:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B251414D28C;
	Mon, 18 Nov 2024 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVPgkl8c"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8205815C0;
	Mon, 18 Nov 2024 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731916612; cv=none; b=WAMVoNN4nY48OYBj6eHhoVZr6r9UYuVlv1PgL+ht5PBpZxYeGQV5iITEQhI9U+VFncyxmvGbjqpuXJtKFbiB3iBPw8k/2iXu9pFGPNSuxqVodNdul42lFMzXeAnTR1bmqFDhWoDi2peOpI0IOV91cu/str9lM5ry/HyRWk1Bpig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731916612; c=relaxed/simple;
	bh=XRS5Laoa/xEVbaSR8UV90xTLFrJMFDuLAOdrsO1+G8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=gNyUlGvY5de53VMfq+5Rx+NgUfi7NNW0ylPFrggJX2uja5GtjKVXMDbt+qHMTFUq8TElYKqxpj1KAYUrVkr7hn0eLS/T0jOq01Ay5auSG6HOw5rRBAdJr3jPEVOkweFKfx6uJwq2RXvg7KEnY25w5StpuYnTdlKbXB2Lpn758sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVPgkl8c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA203C4CECC;
	Mon, 18 Nov 2024 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731916612;
	bh=XRS5Laoa/xEVbaSR8UV90xTLFrJMFDuLAOdrsO1+G8c=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qVPgkl8cGGLCGk1AC/x2wcFuko6rzZtGgxyR2dBAsVcT7KlCIekG5iNzpV/l51XYj
	 7sWf2LwUBLYdCBLHuaqmiB7my51aOb8aD2B8SFapQTupeOzLcQrxlUZ8WC3qYgS35P
	 jOY/Znubgy+Of0t5LnSAoL9cnBbU3tDzDsDsOtrW8/w0nmANCCuywo1NGBGd7NdQT+
	 fCCHxluKcIvmUpRK5XMy8R3FFEz0A/0S0nRFfLwaWcbc6nA+lhDVjucOXdL2l7pL4W
	 JT7rn972MUURVL3a2V2oIHmTTMHnrFv4emtyRXjuzipBzG54APQ17oolUj5hQY+OId
	 6ycdRKZU4DSAw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 09:56:47 +0200
Message-Id: <D5P575JLB4XC.3EYK7NN905Z5Z@kernel.org>
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Eric Biggers" <ebiggers@google.com>, "Stefan
 Berger" <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>,
 "Tadeusz Struk" <tstruk@gigaio.com>, "David Howells" <dhowells@redhat.com>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
 <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org> <ZuKeHmeMRyXZHyTK@wunner.de>
 <D44DDHSNZNKO.2LVIDKUHA3LGX@kernel.org> <ZuMIaEktrP4j1s9l@wunner.de>
In-Reply-To: <ZuMIaEktrP4j1s9l@wunner.de>

On Thu Sep 12, 2024 at 6:27 PM EEST, Lukas Wunner wrote:
> On Thu, Sep 12, 2024 at 05:19:15PM +0300, Jarkko Sakkinen wrote:
> > I try to understand these in detail because I rebase later on my TPM2
> > ECDSA patches (series last updated in April) on top of this. I'll hold
> > with that for the sake of less possible conflicts with this larger
> > series.
> >=20
> > Many of the questions rised during the Spring about akcipher so now is
> > my chance to fill the dots by asking them here.
>
> I assume you're referring to:
> https://lore.kernel.org/all/20240528210823.28798-1-jarkko@kernel.org/

Returning to this as I started to update the series. Sorry if for
possible duplicates with my earelier response.

> Help me understand this:
> Once you import a private key to a TPM, can you get it out again?

No.

> Can you generate private keys on the TPM which cannot be retrieved?

Yes.

>
> It would be good if the cover letter or one of the commits in your
> series explained this.  Some of the commit messages are overly terse
> and consist of just two or three bullet points.

Yes.

I'm picking right now the use case where key is uploaded to the TPM
because:

1. The creation part is more complex as data flow starts from user
   space so it pretty much tests the edges also for a generated
   private key.
2. I can drop the code related to public key and add only signing
   operation, not signature verification.

My test script will along the lines of [1]. The new version of the
series is not yet fully working so also the test is due to change.
The idea is to get flow working where a normal public key can verify
a signature made by the TPM chip.

One area what I know probably might not be correct, is what I put
in the 'describe' callbacks:

static void tpm2_key_ecc_describe(const struct key *asymmetric_key,
				    struct seq_file *m)
{
	struct tpm2_key *key =3D asymmetric_key->payload.data[asym_crypto];

	if (!key) {
		pr_err("key missing");
		return;
	}

	seq_puts(m, "TPM2/ECDSA");
}

So any ideas what to put here are welcome (obviously).

[1]
#!/usr/bin/env bash

set -e

PRIMARY=3D0x81000001

function egress {
  keyctl clear @u
  tpm2_evictcontrol -C o -c $PRIMARY 2> /dev/null
  tpm2_getcap handles-transient
  tpm2_getcap handles-persistent
}
trap egress EXIT

openssl ecparam -name prime256v1 -genkey -noout -out ecc.pem
openssl pkcs8 -topk8 -inform PEM -outform DER -nocrypt -in ecc.pem -out ecc=
_pkcs8.der

tpm2_createprimary --hierarchy o -G ecc -c owner.txt
tpm2_evictcontrol -c owner.txt $PRIMARY

# EC parameters to TPM2 blob:
tpm2_import -C $PRIMARY -G ecc -i ecc.pem -u tpm2.pub -r tpm2.priv

# TPM2 blob to ASN.1:
tpm2_encodeobject -C $PRIMARY -u tpm2.pub -r tpm2.priv -o tpm2.pem
openssl asn1parse -inform pem -in tpm2.pem -noout -out tpm2.der

# Populate asymmetric keys:
tpm2_ecc_key=3D$(keyctl padd asymmetric "tpm_ecc" @u < tpm2.der)
kernel_ecc_key=3D$(keyctl padd asymmetric "kernel_ecc" @u < ecc_pkcs8.der)

echo "SECRET" > doc.txt

echo TPM2 ECC SIGN
keyctl pkey_sign "$tpm2_ecc_key" 0 doc.txt hash=3Dsha256 > doc.txt.sig

echo TPM2 VERIFY
keyctl pkey_verify "$kernel_ecc_key" 0 doc.txt doc.txt.sig hash=3Dsha256

BR, Jarkko

