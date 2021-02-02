Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D73330C37C
	for <lists+keyrings@lfdr.de>; Tue,  2 Feb 2021 16:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbhBBPTm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 2 Feb 2021 10:19:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:41200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235415AbhBBPRr (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 2 Feb 2021 10:17:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3836764EBF;
        Tue,  2 Feb 2021 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612279025;
        bh=gsqH5R2MIBk8ennetSW+5uxOlY9Y3VrMrn7TTPDHofU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CFneDKyiNp/x1cpnR5unToS/CuwUXHXJEVCQdz92PdwdNubg8GGIf5DFIUJxv/cFX
         SUMlzfH3SqgpbjIf64QxC56MT+TDwD6gVrdhv5SSH9/CMHjS78KR7SPmVAGE+wqaU1
         Kp2LvNItkEyd3h4QFpvWVyPZEIAQHBxz4Iwp3R8oQXvgMP7Sa4zU6OImzZdgBGyZcu
         UyfBoeC1KXYczlJrb6ze/DeC52nRFQYCtNOyYMFfTOVI0GAB+9Z0jvKqroDMk8rxZw
         cJuZRND0porSFY2zcQKH9JPSANa9HIqHBeslgrZ3K7AOV4v5wBV9eIB2WfNU1FoYXM
         Iclmbsp1jEhoA==
Date:   Tue, 2 Feb 2021 17:16:58 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Stefan Berger <stefanb@linux.ibm.com>
Cc:     Stefan Berger <stefanb@linux.vnet.ibm.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        linux-crypto@vger.kernel.org, patrick@puiterwijk.org
Subject: Re: [PATCH v3 1/3] x509: Detect sm2 keys by their parameters OID
Message-ID: <YBls6paPlQ9L797n@kernel.org>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
 <20210127123350.817593-2-stefanb@linux.vnet.ibm.com>
 <689c44925d60238181390e775b52809e89e0b26a.camel@kernel.org>
 <e975bd1e-5256-ea8f-2247-fc362302e647@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e975bd1e-5256-ea8f-2247-fc362302e647@linux.ibm.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Jan 30, 2021 at 09:57:40PM -0500, Stefan Berger wrote:
> On 1/30/21 4:26 PM, Jarkko Sakkinen wrote:
> > On Wed, 2021-01-27 at 07:33 -0500, Stefan Berger wrote:
> > > From: Stefan Berger <stefanb@linux.ibm.com>
> > > 
> > > Detect whether a key is an sm2 type of key by its OID in the parameters
> > > array rather than assuming that everything under OID_id_ecPublicKey
> > > is sm2, which is not the case.
> > > 
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >   crypto/asymmetric_keys/x509_cert_parser.c | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > > index 52c9b455fc7d..4643fe5ed69a 100644
> > > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > > @@ -459,6 +459,7 @@ int x509_extract_key_data(void *context, size_t hdrlen,
> > >                            const void *value, size_t vlen)
> > >   {
> > >          struct x509_parse_context *ctx = context;
> > > +       enum OID oid;
> > >          ctx->key_algo = ctx->last_oid;
> > >          switch (ctx->last_oid) {
> > > @@ -470,7 +471,17 @@ int x509_extract_key_data(void *context, size_t hdrlen,
> > >                  ctx->cert->pub->pkey_algo = "ecrdsa";
> > >                  break;
> > >          case OID_id_ecPublicKey:
> > > -               ctx->cert->pub->pkey_algo = "sm2";
> > > +               if (ctx->params_size < 2)
> > Either a named constant, or at least a comment instead of just '2'.
> 
> 
> I will look at the 2 entries whether they contain the expected values:
> ASN1_OID and length
> 
> Thanks!
> 
>    Stefan

Just add inline comment that explains that.

/Jarkko
