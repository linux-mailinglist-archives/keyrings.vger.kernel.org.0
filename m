Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906AB2FC73C
	for <lists+keyrings@lfdr.de>; Wed, 20 Jan 2021 02:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731669AbhATBzw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 19 Jan 2021 20:55:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:55130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731242AbhATBzg (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 19 Jan 2021 20:55:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE6D22472;
        Wed, 20 Jan 2021 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611107695;
        bh=2f5OhbUOpbabH+Q9xfpEc2YvBgOCFoFZXokKL5Lqx9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JtGpZk2+/SuS4cU4Gl/5Y/ZjDczESwF4ku9D0DO4/4ACivGvwOK0nqg1ZtcRapbo3
         ZIVoz8Kq11soMYsq8VP4Alq1FNqPVUf7Fnocm7hrXmk6NSIkkABF/f2caYxtk2Hc2f
         HJIeNANEWy4Velf3Mc2unja28grExf8pPGU0RhWOCp6EOS/O0wD9Y/t/wfyuFMX3/n
         998AbCvjLa/A1rQtS4j0jltLLpnbvHRT7gCQpH3+Yx6PJ3g23AuZ7j7aw2vjzYuvu6
         b/RFKTR5ELpDcUOr6nxZiTsRAsFqKgYjCYe1ObYdRYZ5IzhF8AY+RM9LKV338PI8BW
         jnBaDq53q+Ydw==
Date:   Wed, 20 Jan 2021 03:54:51 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v2] keys: X.509 public key issuer lookup without AKID
Message-ID: <YAeNa6vqLGLfTRbw@kernel.org>
References: <20210114204035.2046219-1-andrew.zaborowski@intel.com>
 <YAFQBT/pKw4PDenV@kernel.org>
 <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jan 15, 2021 at 11:40:18AM +0100, Andrew Zaborowski wrote:
> On Fri, 15 Jan 2021 at 09:20, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Thu, Jan 14, 2021 at 09:40:35PM +0100, Andrew Zaborowski wrote:
> > > @@ -183,8 +193,8 @@ bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
> > >  EXPORT_SYMBOL_GPL(asymmetric_key_id_partial);
> > >
> > >  /**
> > > - * asymmetric_match_key_ids - Search asymmetric key IDs
> > > - * @kids: The list of key IDs to check
> > > + * asymmetric_match_key_ids - Search asymmetric key IDs 1 & 2
> > > + * @kids: The pair of key IDs to check
> > >   * @match_id: The key ID we're looking for
> > >   * @match: The match function to use
> > >   */
> > > @@ -198,7 +208,7 @@ static bool asymmetric_match_key_ids(
> > >
> > >       if (!kids || !match_id)
> > >               return false;
> > > -     for (i = 0; i < ARRAY_SIZE(kids->id); i++)
> > > +     for (i = 0; i < 2; i++)
> > >               if (match(kids->id[i], match_id))
> > >                       return true;
> > >       return false;
> >
> > Why are key ID 2 and key ID 3 handled differently? They are both
> > optional.
> 
> This is to minimise the impact of having a new ID added.  I guess the
> danger is that it could add ambiguity in the lookup, i.e. a different
> key could be returned for an existing search query.

Right I do get that. It could potentially break some scripts.

> 
> There's a specific logic in how ID 1 and 2 interact documented as
> follows in restrict.c:
> 
>                         * The first auth_id is the preferred id, and
>                         * the second is the fallback. If only one
>                         * auth_id is present, it may match against
>                         * either signer_id. If two auth_ids are
>                         * present, the first auth_id must match one
>                         * signer_id and the second auth_id must match
>                         * the second signer_id.
> 
> I'm not sure what the use case motivates this.  For the
> x509_public_key subtype you'd expect that ID 1 in the signature
> matches subject ID 1 of the issuer and ID 2 matches ID 2.  Most of the
> time both will be present for a CA certificate.
> 
> I imagine restrict.c only tries to mirror the logic that was already
> implemented in find_asymmetric_key when the restrict functions were
> added.
> 
> For ID 2, only ever filled in by the x509_public_key subtype (right
> now), we only have any use for it being matched against the issuer's
> ID 2.
> 
> Note: asymmetric_match_key_ids can be used as part of a generic key
> API query, or as part of a find_asymmetric_key call (only used in
> crypto/asymmetric_keys/ for trust verification and similar) but
> find_asymmetric_key will then perform an extra check.  In any case
> without more background I think it's preferable to minimize the
> matching logic changes, and even assuming that the logic could be
> improved it may be best to keep it as is because existing tools may
> rely on it.

You could give a couple of usage examples, by using this cert

https://letsencrypt.org/docs/certificates-for-localhost/

That is good information to store in the commit log for future and
also works as a tested-by criteria.

/Jarkko
