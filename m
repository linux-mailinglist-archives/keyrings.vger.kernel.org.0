Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904AA2FEE74
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 16:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbhAUPXr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 Jan 2021 10:23:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:42968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732908AbhAUPXk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 21 Jan 2021 10:23:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAD0C238E3;
        Thu, 21 Jan 2021 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611242580;
        bh=xLw7NTs2Mo8vJTBcPRypwz7x+i3OMQSwSzHUDybsoAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g3LvAPBEWgio+fQxn44tXfHKoJWtqN6J6UW64j+RUIYE74zrnMGNKkBdl2P7INGlS
         KvUsAVe3woWFTBLnPDzNisH22BOwPTiaegQelJLUiFrB0YScu4TLaX3AH6AG99Bh4q
         CcywC2jm/+t4QUAD8QLTz+J2g0ej66oVFNL1bSXZG2Gwv04kRUzDFsbVBtm9q1K5xe
         rqfjVXn5/Rdwidl34TGyhFApYskIZv7WNLIPgfy8T02N9pI8KRHwo/Y6l4C1hnq2o6
         Xqdpct75gCaQXNKVB6vxkLDAMupuVOo68QOkgydcqL3wIkIC8/lKMcJ+VVrmn87s58
         PvUyAlAL5X9eA==
Date:   Thu, 21 Jan 2021 17:22:57 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v2] keys: X.509 public key issuer lookup without AKID
Message-ID: <YAmcURxlfK8TM5Kj@kernel.org>
References: <20210114204035.2046219-1-andrew.zaborowski@intel.com>
 <YAFQBT/pKw4PDenV@kernel.org>
 <CAOq732JD-M-L3BBDskMBw-5qp=wZjY=Sjm_q5WQNhCq61NM3Yw@mail.gmail.com>
 <YAeNa6vqLGLfTRbw@kernel.org>
 <CAOq732KJMWRED1Zz3ZR-7=KAJMKGseKA2r0a97prNFCbB1K+DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOq732KJMWRED1Zz3ZR-7=KAJMKGseKA2r0a97prNFCbB1K+DQ@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 21, 2021 at 12:31:59PM +0100, Andrew Zaborowski wrote:
> On Wed, 20 Jan 2021 at 02:57, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Fri, Jan 15, 2021 at 11:40:18AM +0100, Andrew Zaborowski wrote:
> > > Note: asymmetric_match_key_ids can be used as part of a generic key
> > > API query, or as part of a find_asymmetric_key call (only used in
> > > crypto/asymmetric_keys/ for trust verification and similar) but
> > > find_asymmetric_key will then perform an extra check.  In any case
> > > without more background I think it's preferable to minimize the
> > > matching logic changes, and even assuming that the logic could be
> > > improved it may be best to keep it as is because existing tools may
> > > rely on it.
> >
> > You could give a couple of usage examples, by using this cert
> >
> > https://letsencrypt.org/docs/certificates-for-localhost/
> >
> > That is good information to store in the commit log for future and
> > also works as a tested-by criteria.
> 
> Ok, resending the patch rebased on top of the BUG_ON fix (applied
> locally) and adding the command line example.
> 
> Best regards

Please make it a patch set then. Locally applied patches do not
count.

/Jarkko
