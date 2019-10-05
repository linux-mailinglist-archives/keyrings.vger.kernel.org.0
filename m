Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E13CCA2C
	for <lists+keyrings@lfdr.de>; Sat,  5 Oct 2019 15:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfJENrm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 5 Oct 2019 09:47:42 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33308 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfJENrm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 5 Oct 2019 09:47:42 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so9290991ljd.0
        for <keyrings@vger.kernel.org>; Sat, 05 Oct 2019 06:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=WGMQWE86TieFzP2Uzo8oP2WrGJoHgQVCU9fi9ws+t4g=;
        b=laWflpdS/VpWbIz0/NNWbcUeC7IiDwbZt0nfkHF3S8xl9uuL+D7YAjiD3I4ZKHklrG
         fCy3SBfNmj+wpQ6EF69NY3OZn2sPt7m/g1QlPDo6WNxmPQ6Ia6OHLMhfTxi45dMuRBtX
         KCc2bp90ve8FUqpsRVN0+YZ2+eoPbjJ2dvFgR2zv5BkusgbX6e5TNftJ66iKgiELpqAy
         hdlXgf3KFY2FQivWNITW+P3zAOFMFTbGNKDpuS/Y7S3q0Yd0NWrxPYskQr3CfhjZDOJv
         43mTqGQtcO1eljzZc9YUZM6SZAs9wQKc87+/6GkFcMlm2f8eb1RVkA3SMTT7XhL4tfQO
         Zm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to;
        bh=WGMQWE86TieFzP2Uzo8oP2WrGJoHgQVCU9fi9ws+t4g=;
        b=EVyNoSkuNDmLLmH18rKsoCz2qNH+zLgvrH0Bucbh2I0XXSoYREE0fbb4hqNY5g+FXq
         HeXAe+ZFw8JzxlS90svqkc8nU66KwIS480gNR5WtMnkwXwPzMcvWTU4hk+Cmf5OH13jQ
         td7nkEjLDUvEmOyqnC6tbumeasw8ZfJQ0A5l2vKKlbcRUaQoDau/4gruPf3Xq3phIz1C
         LapXk4GHPTud3OmY/CWQa5fUgiCnTu+7MYaFCER2q7jm3KcPL4bCzuCCGpDsuhSeAODt
         XHjlFtVenlmJvW7MXmCiaVSoDzR3/PTZn6O+drSMPhQ/6j9oLVYfIp24NB30fyo2AA33
         z5Xg==
X-Gm-Message-State: APjAAAXbX3eYIWQ1bpvnpP9yhxHBDuo4gaOD0cOrvgp6hw1YdPwicAeP
        e3uTw2OxDwoXc4ByOArU94xug9cy
X-Google-Smtp-Source: APXvYqwOfNy1jKZeGb4JcxO0YmMenTZoKEQYgjJQOtGVrnqlKojfJFcBBcCL3obofK7jmVNlCSSL0Q==
X-Received: by 2002:a2e:7c09:: with SMTP id x9mr13288170ljc.87.1570283258984;
        Sat, 05 Oct 2019 06:47:38 -0700 (PDT)
Received: from [10.14.234.161] (c83-253-121-161.bredband.comhem.se. [83.253.121.161])
        by smtp.gmail.com with ESMTPSA id c3sm1657717lfi.32.2019.10.05.06.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 06:47:37 -0700 (PDT)
Subject: Re: [PATCH] crypto: asymmetric_keys: select SYSTEM_DATA_VERIFICATION
From:   klondike <klondike@klondike.es>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org
References: <34dc7ee8-74f5-744e-a411-e36b462c4889@klondike.es>
Openpgp: preference=signencrypt
Autocrypt: addr=klondike@klondike.es; prefer-encrypt=mutual; keydata=
 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
 06YGsklPt1crzrnXeclT3uA=
Message-ID: <34b0f01f-13e6-86e1-5e44-a9987b304b69@klondike.es>
Date:   Sat, 5 Oct 2019 15:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <34dc7ee8-74f5-744e-a411-e36b462c4889@klondike.es>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="gIES5pIvLBRf5p1bpuDtJbw7OjyQcj5BK"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gIES5pIvLBRf5p1bpuDtJbw7OjyQcj5BK
Content-Type: multipart/mixed; boundary="ENq7tGuYopFBHD5QtTwk2k9P62gUTm29A";
 protected-headers="v1"
From: klondike <klondike@klondike.es>
To: David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Cc: Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org
Message-ID: <34b0f01f-13e6-86e1-5e44-a9987b304b69@klondike.es>
Subject: Re: [PATCH] crypto: asymmetric_keys: select SYSTEM_DATA_VERIFICATION
References: <34dc7ee8-74f5-744e-a411-e36b462c4889@klondike.es>
In-Reply-To: <34dc7ee8-74f5-744e-a411-e36b462c4889@klondike.es>

--ENq7tGuYopFBHD5QtTwk2k9P62gUTm29A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: sv-FI

El 5/10/19 a las 15:37, klondike escribi=C3=B3:
> SYSTEM_DATA_VERIFICATION is a non-visible symbol which is selected by i=
ts
> other users. PKCS7_TEST_KEY and SIGNED_PE_FILE_VERIFICATION both depend=
 on
> the symbol instead of selecting it which makes it impossible to choose
> these symbols unless another symbol selecting SYSTEM_DATA_VERIFICATION =
is
> already chosen.
>
> Replace their depends on SYSTEM_DATA_VERIFICATION menu attribute by a
> selects SYSTEM_DATA_VERIFICATION attribute so that the options can be
> efectively chosen by users.
>
> Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klon=
dike.es>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
>
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kc=
onfig
> index 1f1f004dc757..5940f343ab53 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -75,7 +75,7 @@ config PKCS7_MESSAGE_PARSER
> config PKCS7_TEST_KEY
> tristate "PKCS#7 testing key type"
> - depends on SYSTEM_DATA_VERIFICATION
> + select SYSTEM_DATA_VERIFICATION
> help
> This option provides a type of key that can be loaded up from a
> PKCS#7 message - provided the message is signed by a trusted key. If
> @@ -88,7 +88,7 @@ config PKCS7_TEST_KEY
> config SIGNED_PE_FILE_VERIFICATION
> bool "Support for PE file signature verification"
> depends on PKCS7_MESSAGE_PARSER=3Dy
> - depends on SYSTEM_DATA_VERIFICATION
> + select SYSTEM_DATA_VERIFICATION
> select CRYPTO_HASH
> select ASN1
> select OID_REGISTRY
>
Disregard the patch for now, I didn't notice the dependency loop. I'll tr=
y to get that fixed too.



--ENq7tGuYopFBHD5QtTwk2k9P62gUTm29A--

--gIES5pIvLBRf5p1bpuDtJbw7OjyQcj5BK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEDaSLWSPwfVgqfnPQ9L3S7+j/ePkFAl2YnvQACgkQ9L3S7+j/
ePlAERAAhVxirv4+KhqsZLpWRzMzC2EsbpoTR8Maf+N2bAnp6nJl908s90DOMrun
NnNVhhtztFPnwo2zd3GqHb6y82vbm94cf8lPy7hREa2kOxQ6ET9//EUEpw6oSB2C
IOR/qqcF3neioyBQZj0N1aJI3bQ6pWdUBA4+/35poXjg4D+M0rWsvc9RGpf09nEc
cuwRmYjuDaAL75TJV3FBXobk1Cg06GxRLtP8MyVujPbsgTJHJxSOZDg8xWdUC6ww
Asmo+RQ1dRU3JBzLzZaP9QMqPtQV0MyUpXgY/Uk8HgOH/SvR1ec3KMFlz+ZKRXtP
FnKhOKS5BtvAQYoYMypVdxNSQ6T9RvSSgt7OpfRQRw9ASAGqUWrsexc/yF6Edbkd
rL5Ado59H3YIqRqsHY7vaRzMUvk1TAFupGpi3iRnzJkQ4egCmKsOjTORTunEAP+Z
KM4cRfeTNMwkX5g43MCHbEQXX9Qp9mOF8125ibpxDTlfIRP7q2m7qD+8l4ojHTEW
vZ7yEHgMTzhEFPfP5ALXc0iI3/975XM3CGI/iQNVpU2dxOsMjd7hmbP6hgFoQT44
+tpB5Oxtf/hiHEOngC19NLsNao4vyw4g2YpM0AFscMkZYBjg9mg1gRKWdzb9eCcf
4MuJfOtsMTBalrfWUPd3arV9QOYbwnqSui8VSdq1FJjNaxVXC+Y=
=4XSb
-----END PGP SIGNATURE-----

--gIES5pIvLBRf5p1bpuDtJbw7OjyQcj5BK--
