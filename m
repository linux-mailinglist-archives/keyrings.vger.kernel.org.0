Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2E52F592B
	for <lists+keyrings@lfdr.de>; Thu, 14 Jan 2021 04:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbhANDUd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 22:20:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:54668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727205AbhANDUc (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 13 Jan 2021 22:20:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D52F235FA;
        Thu, 14 Jan 2021 03:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610594391;
        bh=ApG4U9pcAAIaVvM5BjUkDNI5byyAa/fSOjF5OmS3ylM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iaQRg4O4qO58/zcqlzkZCHSW8RRi5wXssfe3Kq6gQbm7YEuOyxkolWpXcL982KNd1
         3H7cnOqAwK57OOXAOXteZHg9yJhAbMyzYsBqy71961TWk/0jly50iYDi89qeuKtqRD
         wNbSP3m6eLbvVGLIitEfzC5cGwBWeKF7DFEQiCZJzinuYUsQeTyGu5vNf2XSFzVGV1
         hQBNugWmDgRis5TiHonuvRZtkvFLjiCdQnHVXuYmal9q88OiB777u9OIBTUYR9Oilu
         s6hAx3z9TPYc73pt6sxwWlkMPqOZIxG8C4OtDHtwdEH9RAYnuk2uU5mN31jyRYH2wg
         Rq2mE6G6U1mTA==
Date:   Thu, 14 Jan 2021 05:19:47 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH][RESEND#15] keys: Handle missing Authority Key Identifier
 X509 extension
Message-ID: <X/+4U/rAyi+g0sRQ@kernel.org>
References: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
 <X/qGVSXVoTeEks/j@kernel.org>
 <CAOq732LtM-_6LXw6F2RAB7NsJqEC_+1AHsCQ4h0qKZH1fKF3Ug@mail.gmail.com>
 <X/z+Gh54yOXsZieb@kernel.org>
 <CAOq732LXcYQ2TpqunHzL0ZYy77X=BAJOotTvh--zf=UD9qdCnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOq732LXcYQ2TpqunHzL0ZYy77X=BAJOotTvh--zf=UD9qdCnw@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 13, 2021 at 03:31:04PM +0100, Andrew Zaborowski wrote:
> On Tue, 12 Jan 2021 at 02:41, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Mon, Jan 11, 2021 at 03:27:57PM +0100, Andrew Zaborowski wrote:
> > > On Sun, 10 Jan 2021 at 05:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > > I think that a more sane way to fix this issue, would be to add field
> > > > 'self_signed' to 'struct public_key_signature', and remove the
> > > > equivalent field from 'struct x509_certificate'.
> > >
> > > Ok, that's also an option.  I went for directly adding the
> > > cert->sig->auth_ids because the name ".auth_ids" only implies that it
> > > contains the signing authority's key IDs, which is something that we
> > > have and does exist in the input file.  The name doesn't imply that it
> > > should specifically be in the AKID extension.  Similarly
> > > x509_key_preparse even generates a key description even though a
> > > description is not part of the x509 format.
> > >
> > > >
> > > > Minor updates are required to:
> > > >
> > > > - x509_check_for_self_signed()
> > > > - pkcs7_verify_sig_chain()
> > > >
> > > > Then you can use then new field to refine the check in
> > > > restrict_link_by_signature().
> 
> I decided to try supporting key lookups without the AKID extension
> first, as I proposed in
> https://marc.info/?l=linux-keyrings&m=158621913606374&w=2 , because
> this would make the new sig->self_signed field obsolete.  It's a just
> slightly bigger change but fixes verification for a bigger set of
> certificates that are in use.
> 
> If there are arguments against it then I'm going to send a patch to
> add a sig->self_signed as you suggested.
> 
> Many thanks

OK, I'll check that one then. Thank you.

/Jarkko
