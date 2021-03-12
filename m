Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EEE339A2E
	for <lists+keyrings@lfdr.de>; Sat, 13 Mar 2021 00:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbhCLXyO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 18:54:14 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55975 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235899AbhCLXx7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 18:53:59 -0500
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <dimitri.ledkov@canonical.com>)
        id 1lKrbS-00077F-7u
        for keyrings@vger.kernel.org; Fri, 12 Mar 2021 23:53:58 +0000
Received: by mail-wr1-f70.google.com with SMTP id h21so11750218wrc.19
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 15:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=7ZCZm1oAiUrgwSQnZnDLOJiP4+DsfLQzqupcIwXbELU=;
        b=k2yii0vsUgclj3ope6Mt0UYhUDwDc3K+IXHn1NPqIj3oHmwHxY+oC5+kde2l5Xfv1N
         Y94geDeQpQie782KPJSj9fyhDolyMhW5JdyKJPxkXrV/wCqJGlB2y9kJpSpP2IThuaqK
         TA5U1HwDBujcZCXmJ+dgRq5ju/Yl1Gr4NghnJYH5U7IdMvKDeWTYbfYoiYRcgoQFlYET
         2uo/5Z/jy3+voomGCvxXREDSbwS7/VkhyWFIp7rHt2b7NhheLs/WETTNFJDPEAACzCuM
         e4JCUuisX92rjXtCRYqwHJAQFEeIdqH6WH0karRSaaeNdyMuibFH+ZoVjPaA5wiqwcgs
         Prbg==
X-Gm-Message-State: AOAM5312xg1FzTXeX78aewIFsw5wUCfpZf7S3wd4dfGClEi3n+sdSPRc
        4g9YSNGctNEsBIFXno2/OuJb+SaO+6nuw14Pmgt5sQCGtimIkvyPJJnQQ2JuUi8ui2Aqs4NmXG8
        DeiS0vqkNbjZQO7Jfk2Yq9btlZDqMrh7cV8eN
X-Received: by 2002:a5d:6602:: with SMTP id n2mr16545572wru.262.1615593237075;
        Fri, 12 Mar 2021 15:53:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGXE6jQhAZ+V//927u6nMp5SR8npIGGiyqbB6+rvIDzIn2QXmFdXRd+GDjto+AigW+B+V9eQ==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr16545559wru.262.1615593236796;
        Fri, 12 Mar 2021 15:53:56 -0800 (PST)
Received: from ?IPv6:2a01:4b00:85fd:d700:32b0:795:72f:7832? ([2a01:4b00:85fd:d700:32b0:795:72f:7832])
        by smtp.gmail.com with ESMTPSA id n6sm11304469wrw.63.2021.03.12.15.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 15:53:56 -0800 (PST)
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     David Howells <dhowells@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
 <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk>
 <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com>
 <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Subject: Re: [PATCH 4/4] integrity: Load mokx variables into the blacklist
 keyring
Message-ID: <b10f51dc-b9d7-e84d-3a52-438ebd358a7d@canonical.com>
Date:   Fri, 12 Mar 2021 23:53:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gXb40WsqiDhPW5FJqKAHLdZ82XXr2FLWT"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gXb40WsqiDhPW5FJqKAHLdZ82XXr2FLWT
Content-Type: multipart/mixed; boundary="8zzh5UaugWrxeINg04AAMy3u0zIVsWadb";
 protected-headers="v1"
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: David Howells <dhowells@redhat.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?=
 <mic@digikod.net>, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <b10f51dc-b9d7-e84d-3a52-438ebd358a7d@canonical.com>
Subject: Re: [PATCH 4/4] integrity: Load mokx variables into the blacklist
 keyring
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
 <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk>
 <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com>
 <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>
In-Reply-To: <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>

--8zzh5UaugWrxeINg04AAMy3u0zIVsWadb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/03/2021 21:49, Eric Snowberg wrote:
>=20
>> On Mar 12, 2021, at 11:39 AM, Dimitri John Ledkov <dimitri.ledkov@cano=
nical.com> wrote:
>>
>> On 25/02/2021 20:59, David Howells wrote:
>>> From: Eric Snowberg <eric.snowberg@oracle.com>
>>>
>>> During boot the Secure Boot Forbidden Signature Database, dbx,
>>> is loaded into the blacklist keyring.  Systems booted with shim
>>> have an equivalent Forbidden Signature Database called mokx.
>>> Currently mokx is only used by shim and grub, the contents are
>>> ignored by the kernel.
>>>
>>> Add the ability to load mokx into the blacklist keyring during boot.
>>>
>>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>>> Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>=

>>> Signed-off-by: David Howells <dhowells@redhat.com>
>>> cc: Jarkko Sakkinen <jarkko@kernel.org>
>>> Link: https://lore.kernel.org/r/20210122181054.32635-5-eric.snowberg@=
oracle.com/ # v5
>>> Link: https://lore.kernel.org/r/c33c8e3839a41e9654f41cc92c7231104931b=
1d7.camel@HansenPartnership.com/
>>> ---
>>>
>>> security/integrity/platform_certs/load_uefi.c |   20 ++++++++++++++++=
++--
>>> 1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/security/integrity/platform_certs/load_uefi.c b/security=
/integrity/platform_certs/load_uefi.c
>>> index ee4b4c666854..f290f78c3f30 100644
>>> --- a/security/integrity/platform_certs/load_uefi.c
>>> +++ b/security/integrity/platform_certs/load_uefi.c
>>> @@ -132,8 +132,9 @@ static int __init load_moklist_certs(void)
>>> static int __init load_uefi_certs(void)
>>> {
>>> 	efi_guid_t secure_var =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
>>> -	void *db =3D NULL, *dbx =3D NULL;
>>> -	unsigned long dbsize =3D 0, dbxsize =3D 0;
>>> +	efi_guid_t mok_var =3D EFI_SHIM_LOCK_GUID;
>>> +	void *db =3D NULL, *dbx =3D NULL, *mokx =3D NULL;
>>> +	unsigned long dbsize =3D 0, dbxsize =3D 0, mokxsize =3D 0;
>>> 	efi_status_t status;
>>> 	int rc =3D 0;
>>>
>>> @@ -175,6 +176,21 @@ static int __init load_uefi_certs(void)
>>> 		kfree(dbx);
>>> 	}
>>>
>>> +	mokx =3D get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status)=
;
>>> +	if (!mokx) {
>>> +		if (status =3D=3D EFI_NOT_FOUND)
>>> +			pr_debug("mokx variable wasn't found\n");
>>> +		else
>>> +			pr_info("Couldn't get mokx list\n");
>>> +	} else {
>>> +		rc =3D parse_efi_signature_list("UEFI:MokListXRT",
>>> +					      mokx, mokxsize,
>>> +					      get_handler_for_dbx);
>>> +		if (rc)
>>> +			pr_err("Couldn't parse mokx signatures %d\n", rc);
>>> +		kfree(mokx);
>>> +	}
>>> +
>>
>>
>> My preference would be if the above hunk was moved into the
>> load_moklist_certs() function which is called just below. Such that
>> loading of MokListRT & MOkListXRT are done next to each other.
>>
>> And also implement loading the same way it is done for MokListRT -
>> specifically via the EFI MOKvar config table & then via a variable.
>>
>> See 726bd8965a5f112d9601f7ce68effa1e46e02bf2 otherwise large MokListXR=
T
>> will fail to parse.
>=20
> Is this support available from shim now?  Previously I thought only
> MOK could be loaded from the config table, not MOKx.
>=20

It is about to become available across all distributions with the next
shim as everyone is about to ship SBAT capable shims.

=46rom my system with the next shim & 5.10 kernel I have:

$ ls /sys/firmware/efi/mok-variables/
MokIgnoreDB  MokListRT  MokListXRT  MokSBStateRT  SbatRT

It's not just a single Mok variable, but _all_ mok variables are
available from the mok-table that are used to determine mok state.
Including whether or not db should be ignored, whether or not signature
verification is turned off, and what are the SBAT generation revocations
are, in addition to MokListRT & MokListXRT.

For example, kernel could gain further functionality to honor the user
choices and disable loading db controlled by MokIgnoreDB especially
since shim chooses to not consider db certificates & hashes as trust-wort=
hy.

Regards,

Dimitri.


--8zzh5UaugWrxeINg04AAMy3u0zIVsWadb--

--gXb40WsqiDhPW5FJqKAHLdZ82XXr2FLWT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7iQKBSojGtiSWEHXm47ISdXvcO0FAmBL/xIACgkQm47ISdXv
cO1Hew/+JJxsy8gCfVJE1ODcQKECvIstvSuJGFnmsIsqjZP5AnvmtteKUpO2JIO9
ASLPAJOmRbBh+y7at6D8g5fi/T1zsp9By+T+yk+XzmzKwdIiuQ9IzcAF8QDsXnro
N06N77bXnRNVaLxx0K4/ASLqLWru8S4S3Y0PbHSjd3k9DmYC73sXlMTgjWiNHToU
q+2Ykb94Iz1nKPCl8Z6J7qhL1oFU1BXesz7ZKcXaEdRwDvmHlVfRex8SU5ggYqHH
bPZ23qS3SU/Bh1ytTpGkSMTZmkaL2Cg6x9m4chKdZ1c9YTdv8yZjQtAgaWjCjX92
7Y8szmvsmBCntiwz9YdTQ5T54cJXZCc+LGAWEIa2EALQZK1ub4NdDEPTrlkd4Ny0
fTKfxbyxrWL/+pB9jiG8Q7+U9cpGJ7Fa/hfS0t07UGqtmW5WCgyjlhUKVMMsHum4
XbbXt/K8s8E9dRBxEN7tZtwOs97tkvnzGFhsVgAVz8LjG3XoY2qVRd48YbFk6kBy
4EKgJ6QpktuGPkfEc5ijtGNGMU+iYTcQZN13e57SGvcwDnINaBxfh/J4nDgmZAJ/
Z5yDqgUBu53UBmakzpyilYjMALWwacIt63s3hBWvl0+FcsEyldv1em2zSceShKz5
feaYEeDFROD9c8SHwy7oAi4lKKzUaqoLvkn25PSJxN/Jkm1ZY5M=
=oaZ7
-----END PGP SIGNATURE-----

--gXb40WsqiDhPW5FJqKAHLdZ82XXr2FLWT--
