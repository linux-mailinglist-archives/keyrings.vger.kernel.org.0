Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3100E2F25A3
	for <lists+keyrings@lfdr.de>; Tue, 12 Jan 2021 02:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732583AbhALBl2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 11 Jan 2021 20:41:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:54944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727908AbhALBl1 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 11 Jan 2021 20:41:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C62022C7E;
        Tue, 12 Jan 2021 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610415646;
        bh=NCmuJPKcfAeVbFs+sFOl8s0Ha+YdTXHFtOfV5EHtKgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p83ugUiOpLDkI7j0ZsGpXi6luhIeGnXAPP4Bs+oPs4aMJ/NIV9bmi3hAODi6wEN/s
         +YlNXVzS7Eau+3Q/5ZSCGzW230Av6jKdp3iLU/pcleuN7suXhnVOUm0hknj4OaHxbH
         mC3hdNkauc7azSpW52Zv6UjaB5AM595wPh3jQRbCH9H+yTZB9y0jRee0SXqk4IHLxi
         G2u40AQJmd4mO4v6Ik8FV1SzvAqcFvQFBtjTochEyLtCSjschtB6Ytm0wGhdq4llU8
         iplSUw5aA8pS24OCBi1DHzIh8CkP0pM+3fYUZQf9MuCN0ubpHrumzvhR4Ll+Vb30TH
         soK5Ua1qjFIWg==
Date:   Tue, 12 Jan 2021 03:40:42 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH][RESEND#15] keys: Handle missing Authority Key Identifier
 X509 extension
Message-ID: <X/z+Gh54yOXsZieb@kernel.org>
References: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
 <X/qGVSXVoTeEks/j@kernel.org>
 <CAOq732LtM-_6LXw6F2RAB7NsJqEC_+1AHsCQ4h0qKZH1fKF3Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOq732LtM-_6LXw6F2RAB7NsJqEC_+1AHsCQ4h0qKZH1fKF3Ug@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jan 11, 2021 at 03:27:57PM +0100, Andrew Zaborowski wrote:
> Hi,
> 
> On Sun, 10 Jan 2021 at 05:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Mon, Jan 04, 2021 at 05:40:47PM +0100, Andrew Zaborowski wrote:
> > > In a self-signed certificate the subject and issuer are the same and so
> > > the Authority Key Identifier X.509 v3 extension is explicitly made
> > > optional in RFC5280 section 4.2.1.1.
> > > crypto/asymmetric_keys/x509_cert_parser.c can't handle this and makes
> > > (at least) the restrict.c functions refuse to work with certificates
> > > that don't include the AKID.  Fix this by filling in the missing
> > > cert->sig->auth_ids with the certificate's own IDs after parsing and
> > > determinig the certificate is self-signed.
> > >
> > > The asymmetric_key_generate_id return value is not checked because it's
> > > already succeeded once at this point.
> > >
> > > There are root X.509 v3 certificates in use where this is the case,
> > > mostly oldish ones.
> > >
> > > Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> > > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> >
> > I'll take active role with these.
> 
> Great!
> 
> >
> > I don't think that adding field data that does not exist is a great
> > idea.
> >
> > I think that a more sane way to fix this issue, would be to add field
> > 'self_signed' to 'struct public_key_signature', and remove the
> > equivalent field from 'struct x509_certificate'.
> 
> Ok, that's also an option.  I went for directly adding the
> cert->sig->auth_ids because the name ".auth_ids" only implies that it
> contains the signing authority's key IDs, which is something that we
> have and does exist in the input file.  The name doesn't imply that it
> should specifically be in the AKID extension.  Similarly
> x509_key_preparse even generates a key description even though a
> description is not part of the x509 format.
> 
> >
> > Minor updates are required to:
> >
> > - x509_check_for_self_signed()
> > - pkcs7_verify_sig_chain()
> >
> > Then you can use then new field to refine the check in
> > restrict_link_by_signature().
> 
> Ok.

I mean in common sense: kernel stores the information needed.
It just needs a bit of relocation.

/Jarkko
