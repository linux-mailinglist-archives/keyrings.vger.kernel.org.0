Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CEB2F4A5A
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 12:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbhAMLhi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 06:37:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31143 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728393AbhAMLhh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jan 2021 06:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610537771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pQcSb6CyS4Rcj5w1L4KFo4VX77Uj3QkqX6PSofKeGPI=;
        b=FevGkXsNuJvSV0XZ71icVHZMER0FsTiOoaCgJ5v3jm157yIowC0VCGjNCCbos/NvOCqCie
        j82nrJhZ9i6KPqrzpxAUdNXjKYCFFSaP52Z8iwUtyQm5hGFZkdX+o4SkB8l9yj9JAGyx7W
        QGRBlaGs2HouzRr2AQbqHUT5qz5RD/I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-3_0i-zhuN6CjjEgnFELtbg-1; Wed, 13 Jan 2021 06:36:10 -0500
X-MC-Unique: 3_0i-zhuN6CjjEgnFELtbg-1
Received: by mail-wr1-f70.google.com with SMTP id u29so832505wru.6
        for <keyrings@vger.kernel.org>; Wed, 13 Jan 2021 03:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=pQcSb6CyS4Rcj5w1L4KFo4VX77Uj3QkqX6PSofKeGPI=;
        b=Xqq++gEJuKla7NoAgByv3KskJf2c1TnTDU0hvfsEBfXNXTBHvOpY40omdb7JnGJO58
         1dEefmfeFswQeCEKT8ZPn6zfuMHPa9MUm09j/xuFc1DPgvOSKUSgk/OrARcUhQm5IXgN
         HjMOCw7HM2sdkOnZn2fSehUDRjucrW4bSLL5gzSXjAitHGmecdkcaHfbq453lSXnPY5e
         vvoWUf50W75tMxkBMbzpqapLSgnFoSO/vexkdB3azVA1X6alB00iWxN54mPVIkGaS+5P
         bPgJkXTRVRUsFMY2znrxinEzlGVEUmeNLAXMbZ17UYZy/0HPMLcqvBVhJwPh578tyAOg
         //9Q==
X-Gm-Message-State: AOAM531AsZ3iNizSc9sMsuxqIxAYXnbjkRyDmMYipvhhz8uTRdwAajN1
        eK7/8B44W6+RXY0OQRwVP/B0X17iE5N50tCS5BeIJPwRikMl04zZWf7qcXbGsLaOv7/w9w5K4Ln
        hDy1G5gdtCN3YBJFG64Q=
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr1795407wme.41.1610537768794;
        Wed, 13 Jan 2021 03:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS14vUOEEQ/bzWnoAQ2ltyWpCLjwA+Z3r9kH8HEWajdFCUX904JSU013CXi5oc1xfSAEvgHA==
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr1795384wme.41.1610537768581;
        Wed, 13 Jan 2021 03:36:08 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id r20sm2460567wmh.15.2021.01.13.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 03:36:08 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id A504C18032B; Wed, 13 Jan 2021 12:36:07 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Howells <dhowells@redhat.com>
Cc:     dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] crypto: public_key: check that pkey_algo is non-NULL
 before passing it to strcmp()
In-Reply-To: <2648795.1610536273@warthog.procyon.org.uk>
References: <20210112161044.3101-1-toke@redhat.com>
 <2648795.1610536273@warthog.procyon.org.uk>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 13 Jan 2021 12:36:07 +0100
Message-ID: <875z419ihk.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Howells <dhowells@redhat.com> writes:

> I'm intending to use Tianjia's patch.

Yeah, sorry for missing that.

> Would you like to add a Reviewed-by?

Sure:

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

and also, if you like:

Tested-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

