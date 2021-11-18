Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293BA45571E
	for <lists+keyrings@lfdr.de>; Thu, 18 Nov 2021 09:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244690AbhKRIkH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 18 Nov 2021 03:40:07 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:35424 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244685AbhKRIkF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 18 Nov 2021 03:40:05 -0500
X-Greylist: delayed 1746 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Nov 2021 03:40:03 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637224622;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ijNQnxZZyiHDPPvMLObVJYsOGWzw+I4Y1islx1O7FKc=;
    b=d5ziZtc6YiMA5E+8lhDoPGk+bgn1ElDnLZxI/7Zr1oV4VrLBInSLIyvzVmeo3Aouu5
    VG7y3gJZi8wY5jSukWXnzciftyLYoG98Otnx394lrP90oyuac+Of+j3PL8yfIQT2gp4/
    TD0JtpCwAbxdtxVp2YUrBCg/C1q7ueuGjK+O+OegozjSdzTiymQjYsnH8GZLCLSjjM/H
    spQ/xTDtprqSrPbIYc29O3Vq+qiXcPzjjD3Vm0VJkU2+tqXQ4EuOQmnMq3jdOgIgazKq
    FE/+4X2LAf7vVUtNPt+ITWoMpOmB23hYA+kAxN2LuNXNnhRAU3I2AvdoELaQFbcUAJqO
    sXAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPbJvScPP/G"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAI8b1oht
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 18 Nov 2021 09:37:01 +0100 (CET)
From:   Stephan Mueller <smueller@chronox.de>
To:     Mat Martineau <mathew.j.martineau@linux.intel.com>
Cc:     herbert@gondor.apana.org.au, ebiggers@kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: Re: [PATCH v3 3/4] security: DH - remove dead code for zero padding
Date:   Thu, 18 Nov 2021 09:37:01 +0100
Message-ID: <6300797.NZM0BCWY22@tauon.chronox.de>
In-Reply-To: <f98dbf21-50d1-7847-18cb-2f5093a8ac8@linux.intel.com>
References: <2589009.vuYhMxLoTh@positron.chronox.de> <3323567.LZWGnKmheA@positron.chronox.de> <f98dbf21-50d1-7847-18cb-2f5093a8ac8@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Am Mittwoch, 17. November 2021, 22:28:46 CET schrieb Mat Martineau:

Hi Mat,

> On Mon, 15 Nov 2021, Stephan M=FCller wrote:
> > Remove the specific code that adds a zero padding that was intended
> > to be invoked when the DH operation result was smaller than the
> > modulus. However, this cannot occur any more these days because the
> > function mpi_write_to_sgl is used in the code path that calculates the
> > shared secret in dh_compute_value. This MPI service function guarantees
> > that leading zeros are introduced as needed to ensure the resulting data
> > is exactly as long as the modulus. This implies that the specific code
> > to add zero padding is dead code which can be safely removed.
> >=20
> > Signed-off-by: Stephan Mueller <smueller@chronox.de>
> > ---
> > security/keys/dh.c | 25 ++++---------------------
> > 1 file changed, 4 insertions(+), 21 deletions(-)
>=20
> Hi Stephan -
>=20
> Thanks for the cleanup!

Thank you for the review.
>=20
> Acked-by: Mat Martineau <mathew.j.martineau@linux.intel.com>

I have added your signature to the patch.

Ciao
Stephan


