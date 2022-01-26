Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7718A49CC2D
	for <lists+keyrings@lfdr.de>; Wed, 26 Jan 2022 15:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242082AbiAZOUA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 26 Jan 2022 09:20:00 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:42992 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242054AbiAZOT5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 26 Jan 2022 09:19:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 912E36176E;
        Wed, 26 Jan 2022 14:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7A4C340E3;
        Wed, 26 Jan 2022 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643206797;
        bh=FqinbAFljmS1BrUJKlURNVARsMPDLlraVwuwo/Gq/X0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MpgrwS/pGdYN10Ow80s17Zr6/z8KWnPDKfJczlIaDq2zX1Qy8sVbcy67tU3JRN3kp
         WTzYgW3GGGcy14h2yTnW54NPINQWNIZpZOJeV4HBl25EEbEXoGaZvLIOGA65EcequX
         mM7f+iNunyvacqkPMDjSXnEIeeXWHQFFuV3nCz43Gkt04KQmx/5EMAGuhUyQB774Z/
         Xqn9Iwupj7HP0K/zyn2lMAHEFfXCuo9LhwOq9rQoudSfAzJOKPmBT9UG1lWxIHdPkj
         K77ExpjILhVdkE2x+6lx1ThVinOwW1eWQ1r1N5bc2lEisusIWW3hjzl76iNbESEaZr
         3Q+60a2KrjVHQ==
Date:   Wed, 26 Jan 2022 16:19:36 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 0/4] KEYS: x509: various cleanups
Message-ID: <YfFYeBEHniqv0DAy@iki.fi>
References: <20220119005436.119072-1-ebiggers@kernel.org>
 <YfFX2mJtauudkaaB@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfFX2mJtauudkaaB@iki.fi>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 26, 2022 at 04:17:01PM +0200, Jarkko Sakkinen wrote:
> On Tue, Jan 18, 2022 at 04:54:32PM -0800, Eric Biggers wrote:
> > This series cleans up a few things in the X.509 certificate parser.
> > 
> > Changed v1 => v2:
> >   - Renamed label in patch 3
> >   - Added Acked-by's
> > 
> > Eric Biggers (4):
> >   KEYS: x509: clearly distinguish between key and signature algorithms
> >   KEYS: x509: remove unused fields
> >   KEYS: x509: remove never-set ->unsupported_key flag
> >   KEYS: x509: remove dead code that set ->unsupported_sig
> > 
> >  crypto/asymmetric_keys/pkcs7_verify.c     |  7 ++---
> >  crypto/asymmetric_keys/x509.asn1          |  2 +-
> >  crypto/asymmetric_keys/x509_cert_parser.c | 34 ++++++++++++-----------
> >  crypto/asymmetric_keys/x509_parser.h      |  1 -
> >  crypto/asymmetric_keys/x509_public_key.c  | 18 ------------
> >  5 files changed, 21 insertions(+), 41 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> 
> I'll apply these (with ackd -> reviewed).

Done

BR, Jarkko
