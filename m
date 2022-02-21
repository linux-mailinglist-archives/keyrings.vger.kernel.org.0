Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302AD4BEBD6
	for <lists+keyrings@lfdr.de>; Mon, 21 Feb 2022 21:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbiBUU2V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Feb 2022 15:28:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233690AbiBUU2H (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Feb 2022 15:28:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ABB237C0
        for <keyrings@vger.kernel.org>; Mon, 21 Feb 2022 12:27:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3866FB8179C
        for <keyrings@vger.kernel.org>; Mon, 21 Feb 2022 20:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE76EC340F1;
        Mon, 21 Feb 2022 20:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645475261;
        bh=EgaKRKBGCD/Q7QZaO5qx03HaESs7EUaNHO7SsM01daw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XiDjWBLJMYaWUHN3aIE21hQkEe3d5Qbxb1AqlrAHqXQnfcRH2wthZRjh3VfHj5wkO
         iVwwA9qtbzWhf1KW/FbGUaDGJD/89iYQoa56rGRIxyB9k4mYJdZCwUdk1wfJRYCZIQ
         MxPrgWBv/onP0K+DM/RPI9uFyk0LvFLxs9RfKrWvbrqGbebKF697zbVVL5eHCFT3Yd
         0MG6XO7R42av1SfvpSYNMPHaDhXy+6TL6/pRETfH93QqYRGadj2gHeYJWbTNVhx5Si
         HLmQZHYUzfvQqdhhzL5eb6BxlmhIS0dqH38DPFwjfDIE1leM1tdYA1J4LeUqAD6uEM
         HkNgMcVix7dYA==
Date:   Mon, 21 Feb 2022 21:28:16 +0100
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Douglas Miller <dougmill@linux.vnet.ibm.com>
Cc:     keyrings@vger.kernel.org, gjoyce@ibm.com, dhowells@redhat.com
Subject: Re: [PATCH RESEND 1/1] keys: Allow access to
 key_type_lookup()/key_type_put() within kernel.
Message-ID: <YhP14Flme60pk7Pu@iki.fi>
References: <20220221144424.1339241-1-dougmill@linux.vnet.ibm.com>
 <20220221144424.1339241-2-dougmill@linux.vnet.ibm.com>
 <YhP1xQLJgQAT0r9j@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhP1xQLJgQAT0r9j@iki.fi>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Feb 21, 2022 at 09:27:57PM +0100, Jarkko Sakkinen wrote:
> On Mon, Feb 21, 2022 at 08:44:24AM -0600, Douglas Miller wrote:
> > Signed-off-by: Douglas Miller <dougmill@linux.vnet.ibm.com>
> > ---
> >  include/linux/key-type.h | 2 ++
> >  security/keys/key.c      | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/include/linux/key-type.h b/include/linux/key-type.h
> > index 7d985a1dfe4a..868a6fb368f3 100644
> > --- a/include/linux/key-type.h
> > +++ b/include/linux/key-type.h
> > @@ -165,6 +165,8 @@ extern struct key_type key_type_keyring;
> >  
> >  extern int register_key_type(struct key_type *ktype);
> >  extern void unregister_key_type(struct key_type *ktype);
> > +extern struct key_type *key_type_lookup(const char *type);
> > +extern void key_type_put(struct key_type *ktype);
> >  
> >  extern int key_payload_reserve(struct key *key, size_t datalen);
> >  extern int key_instantiate_and_link(struct key *key,
> > diff --git a/security/keys/key.c b/security/keys/key.c
> > index c45afdd1dfbb..3091fd6d65a7 100644
> > --- a/security/keys/key.c
> > +++ b/security/keys/key.c
> > @@ -719,6 +719,7 @@ struct key_type *key_type_lookup(const char *type)
> >  found_kernel_type:
> >  	return ktype;
> >  }
> > +EXPORT_SYMBOL(key_type_lookup);
> >  
> >  void key_set_timeout(struct key *key, unsigned timeout)
> >  {
> > @@ -744,6 +745,7 @@ void key_type_put(struct key_type *ktype)
> >  {
> >  	up_read(&key_types_sem);
> >  }
> > +EXPORT_SYMBOL(key_type_put);
> >  
> >  /*
> >   * Attempt to update an existing key.
> > -- 
> > 2.27.0
> > 
> 
> This should be included with the changes that actually require this.

I.e. planned changes do not count.

BR, Jarkko
