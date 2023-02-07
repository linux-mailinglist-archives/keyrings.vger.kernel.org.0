Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C32B68E482
	for <lists+keyrings@lfdr.de>; Wed,  8 Feb 2023 00:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjBGXmN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Feb 2023 18:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjBGXmM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Feb 2023 18:42:12 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6926313DC1;
        Tue,  7 Feb 2023 15:42:11 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so223086wmb.4;
        Tue, 07 Feb 2023 15:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Oczk0+ogYjdsnNbRwxcvOuXWBKWHXwmN7O1Cm229PE=;
        b=EX4y2DD1zIolILRK3QVA/n0GulSp8Mhy2nBkYppBduN7dv+Mh1zfvN8hl7rOdQlP3N
         9ArtGoCz0EzUDfGkr/PzteOROpHYhldXe4Zs0Rr8hIrOf5t1lpOGnsVNblFPBhBLIOI7
         4jzHJ11UBeFgr3a7hv3vftDLQ+mr8PLw+czeKwXnqrGsicTQzkRhHpp7Basa9FMYoM91
         qizJXhsLsAeD/ku8Sx/uEoIRtFAUtHkQ85yBIgIZ7HhHoUXK7paP+66F52PRS0EPE3r4
         A47YbPGx4oL/94a+t2GXjTRsoK77GamRELVr+zjpkbSSk/3lIbYFcwxufYEepjWlfKAd
         94mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Oczk0+ogYjdsnNbRwxcvOuXWBKWHXwmN7O1Cm229PE=;
        b=xboQtSSavk9bzlG+P1zYbMQoDOTj9DdzMMVe00rPLahCxvoZb/TFSdlknIx3jV0dTh
         xyN/Fjrz2WBw1w4cRTd5fWwAlLeMO4EDf//qVW+SFPrv4gq7YPkueBX3Kdk3qla1G2ED
         23iYYMHjVPbsA+joOJU9HkHZrAUpfjkfa8dq0Ia6wK60bZ5CzOq3yU3XpW9bpT7IP3Ia
         lO3D75jgDoLiFVFoODmm5/mHSpWly4RNKmvxz6wN/1wOhEyWDrMJtHdPwd39tPNrCW+k
         GQABfItkHvllmwfOTvJWEolDygwe5ke/5KZQ1OGdWB+uyDW5X9DmC1kIH9CgzbzltKh2
         amNw==
X-Gm-Message-State: AO0yUKUL5aGaO3Q+bjsBxh9izdL6o5fU+kRJ+FQjEaKEWOtzR3vAm9Rj
        wx1BVYgkSxLuvbFcRgnsV/c=
X-Google-Smtp-Source: AK7set/OrU27cxpFrU7sY1FvyMFX4uT/9hhTB02nQTZJH3TTJNUMr74aUgqZ1xRSCkafhGYhqCKAOg==
X-Received: by 2002:a05:600c:331c:b0:3dc:5ab8:7d74 with SMTP id q28-20020a05600c331c00b003dc5ab87d74mr4616491wmp.3.1675813329925;
        Tue, 07 Feb 2023 15:42:09 -0800 (PST)
Received: from [192.168.0.160] ([170.253.36.171])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003de664d4c14sm221267wmq.36.2023.02.07.15.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 15:42:09 -0800 (PST)
Message-ID: <de6514d4-e8d2-0f87-8610-a5c3393caf50@gmail.com>
Date:   Wed, 8 Feb 2023 00:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] persistent-keyring.7: wfix
Content-Language: en-US
To:     Jakub Wilk <jwilk@jwilk.net>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, keyrings@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Helge Kreutzmann <debian@helgefjell.de>
References: <20230207214004.6013-1-jwilk@jwilk.net>
From:   Alejandro Colomar <alx.manpages@gmail.com>
In-Reply-To: <20230207214004.6013-1-jwilk@jwilk.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hfVbLx4a40AUJm0gJoE0Ndke"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hfVbLx4a40AUJm0gJoE0Ndke
Content-Type: multipart/mixed; boundary="------------kTmmKv2VrQZqa7DCfEDbAkoi";
 protected-headers="v1"
From: Alejandro Colomar <alx.manpages@gmail.com>
To: Jakub Wilk <jwilk@jwilk.net>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, keyrings@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Helge Kreutzmann <debian@helgefjell.de>
Message-ID: <de6514d4-e8d2-0f87-8610-a5c3393caf50@gmail.com>
Subject: Re: [PATCH] persistent-keyring.7: wfix
References: <20230207214004.6013-1-jwilk@jwilk.net>
In-Reply-To: <20230207214004.6013-1-jwilk@jwilk.net>

--------------kTmmKv2VrQZqa7DCfEDbAkoi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jakub!

On 2/7/23 22:40, Jakub Wilk wrote:
> Reported-by: Helge Kreutzmann <debian@helgefjell.de>
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Thanks for the patch!  Applied.

Cheers,

Alex

> ---
>=20
> I have no idea what I'm doing, but the original text was confusing,
> and changing "key" to "keyring" seems consistent with other
> documentation (keyrings.7, keyctl_get_persistent.3).
>=20
>  man7/persistent-keyring.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/persistent-keyring.7 b/man7/persistent-keyring.7
> index 2a7fe49c2..bf3e33ef5 100644
> --- a/man7/persistent-keyring.7
> +++ b/man7/persistent-keyring.7
> @@ -33,7 +33,7 @@ operation, it will be automatically created.
>  Each time the
>  .BR keyctl_get_persistent (3)
>  operation is performed,
> -the persistent key's expiration timer is reset to the value in:
> +the persistent keyring's expiration timer is reset to the value in:
>  .PP
>  .in +4n
>  .EX
> @@ -44,7 +44,7 @@ the persistent key's expiration timer is reset to the=
 value in:
>  Should the timeout be reached,
>  the persistent keyring will be removed and
>  everything it pins can then be garbage collected.
> -The key will then be re-created on a subsequent call to
> +The keyring will then be re-created on a subsequent call to
>  .BR keyctl_get_persistent (3).
>  .PP
>  The persistent keyring is not directly searched by

--=20
<http://www.alejandro-colomar.es/>
GPG key fingerprint: A9348594CE31283A826FBDD8D57633D441E25BB5

--------------kTmmKv2VrQZqa7DCfEDbAkoi--

--------------hfVbLx4a40AUJm0gJoE0Ndke
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmPi4dAACgkQnowa+77/
2zKLhg/9FQy/g3+oRwSJtq4pIPK91z1FcYclbfZdpExBLNd2qOtcPmB64xj3i776
tRHbox0k2bJllQLwk9Lxm/dhLd/eDKmKjCyWPqQdbUUKmkLcOHuiZTfK3oD2FA/x
68iYYA5hZ88zvXhYIC3UqwWYOTbHY3ebJKgYaVav++7n87XajOkWmmH/HjDBJhSw
/TXpoZ+RIGCV1B+xT91n7pHJsSwyY6dQT8Ud7qHblRlq6AF/379N5V8AksgKTIpI
vohKv6iRWBcVq9CCR7pTws1+mWUzH4dRIlCD3lXiifqrdi7gWE1yTtsD9OHtbM1/
Tjq5MZZfImhi3pOIibzhraQCZ4PC0HxXrQarGSViOvcDaXJidvjSEtUQGZkX2C5f
CC7H3VcThoaI5L6YG+y2LvTFyG/lu2cykRXH5S/MlAqVnmZDw+2RbLbafcOxeYMj
/2o5+VGi9JXAzlXS+V0vbvIaGSOX1FPW61p7zy0ucOML1Xd+LkBWx3Kv0ZlW+1Zg
M10jkCAnHsgsNYPRbs4Oc/PYUkD4fEPDpdrggCSHI/K6saULug+MoNuORsvp4/sV
qBqczOacBd4CnMxrq/Hh1tgw/Qir4qc0nn77F1NCfmrW0o7wwPsB0qOoeBLwfnm5
WZIChmhoi8tsh2XN8RtMKeDL/HMU57dRQOC1xxJfFmVOMswrUaw=
=R+T3
-----END PGP SIGNATURE-----

--------------hfVbLx4a40AUJm0gJoE0Ndke--
