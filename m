Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD8044B109
	for <lists+keyrings@lfdr.de>; Tue,  9 Nov 2021 17:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbhKIQWC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Nov 2021 11:22:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:51252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234118AbhKIQWC (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 9 Nov 2021 11:22:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71C7D6103C;
        Tue,  9 Nov 2021 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636474755;
        bh=xsHHubZQn2/PFXjBkkPhXz4T+xrWQHIO4yYZ7cvJyhY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=goK8LxYIjPA9bVDkDC2XyukL2Vl2Tz3GUmuY9UYtl/L1nZf9EntIHP+N8LEPKFv80
         HDS/wi0TZLTINiqtwjfo8yz7X47CjBEMQ/m9wcv3oedkQITdb269VNHc0CLmB34RIV
         uA3ZeCGDCGjwTRWymT2bS52rurRHg3xNBTvzWcnQShUpbp701cv40bHDAxZlDBeKa4
         7XrJfv3pv94K7udEFO2UzVIRLeYjaaSfCoPHIclJYxv2qfH/UQFJK3TQCDm+zVuQY2
         ykuWxp0K1B1vISzf9eljjm7wT6Xn4HDBEfCu8GcmmcLJme56hDMtIVdEP3dgIx4zqj
         WI7IF1XI7WvsA==
Message-ID: <7bb0319ced932e226270bfa9e54d1da7f404e389.camel@kernel.org>
Subject: Re: [PATCH v5] keys: X.509 public key issuer lookup without AKID
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>,
        keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Date:   Tue, 09 Nov 2021 18:19:13 +0200
In-Reply-To: <20211109151649.392192-1-andrew.zaborowski@intel.com>
References: <20211109151649.392192-1-andrew.zaborowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2021-11-09 at 16:16 +0100, Andrew Zaborowski wrote:
> There are non-root X.509 v3 certificates in use out there that contain
> no Authority Key Identifier extension (RFC5280 section 4.2.1.1).=C2=A0 Fo=
r
> trust verification purposes the kernel asymmetric key type keeps two
> struct asymmetric_key_id instances that the key can be looked up by,
> and another two to look up the key's issuer.=C2=A0 The x509 public key ty=
pe
> and the PKCS7 type generate them from the SKID and AKID extensions in
> the certificate.=C2=A0 In effect current code has no way to look up the
> issuer certificate for verification without the AKID.
>=20
> To remedy this, add a third asymmetric_key_id blob to the arrays in
> both asymmetric_key_id's (for certficate subject) and in the
> public_keys_signature's auth_ids (for issuer lookup), using just raw
> subject and issuer DNs from the certificate.=C2=A0 Adapt
> asymmetric_key_ids() and its callers to use the third ID for lookups
> when none of the other two are available.=C2=A0 Attempt to keep the logic
> intact when they are, to minimise behaviour changes.=C2=A0 Adapt the
> restrict functions' NULL-checks to include that ID too.=C2=A0 Do not modi=
fy
> the lookup logic in pkcs7_verify.c, the AKID extensions are still
> required there.
>=20
> Internally use a new "dn:" prefix to the search specifier string
> generated for the key lookup in find_asymmetric_key().=C2=A0 This tells
> asymmetric_key_match_preparse to only match the data against the raw
> DN in the third ID and shouldn't conflict with search specifiers
> already in use.
>=20
> In effect implement what (2) in the struct asymmetric_key_id comment
> (include/keys/asymmetric-type.h) is probably talking about already, so
> do not modify that comment.=C2=A0 It is also how "openssl verify" looks u=
p
> issuer certificates without the AKID available.=C2=A0 Lookups by the raw
> DN are unambiguous only provided that the CAs respect the condition in
> RFC5280 4.2.1.1 that the AKID may only be omitted if the CA uses
> a single signing key.
>=20
> The following is an example of two things that this change enables.
> A self-signed ceritficate is generated following the example from
> https://letsencrypt.org/docs/certificates-for-localhost/, and can be
> looked up by an identifier and verified against itself by linking to a
> restricted keyring -- both things not possible before due to the missing
> AKID extension:
>=20
> $ openssl req -x509 -out localhost.crt -outform DER -keyout localhost.key=
 \
> =C2=A0 -newkey rsa:2048 -nodes -sha256 \
> =C2=A0 -subj '/CN=3Dlocalhost' -extensions EXT -config <( \
> =C2=A0=C2=A0 echo -e "[dn]\nCN=3Dlocalhost\n[req]\ndistinguished_name =3D=
 dn\n[EXT]\n" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "subjectAltName=3D=
DNS:localhost\nkeyUsage=3DdigitalSignature\n" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "extendedKeyUsage=
=3DserverAuth")
> $ keyring=3D`keyctl newring test @u`
> $ trusted=3D`keyctl padd asymmetric trusted $keyring < localhost.crt`; \
> =C2=A0 echo $trusted
> 39726322
> $ keyctl search $keyring asymmetric dn:3112301006035504030c096c6f63616c68=
6f7374
> 39726322
> $ keyctl restrict_keyring $keyring asymmetric key_or_keyring:$trusted
> $ keyctl padd asymmetric verified $keyring < localhost.crt
>=20
> Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> Acked-by: David Howells <dhowells@redhat.com>

Thanks, I picked this up.

/Jarkko

