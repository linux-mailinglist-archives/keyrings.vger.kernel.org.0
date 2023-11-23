Return-Path: <keyrings+bounces-146-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC87F55AC
	for <lists+keyrings@lfdr.de>; Thu, 23 Nov 2023 01:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94745B20D36
	for <lists+keyrings@lfdr.de>; Thu, 23 Nov 2023 00:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8640710E9;
	Thu, 23 Nov 2023 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=benboeckel.net header.i=@benboeckel.net header.b="e0hsgplA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e25QCN4i"
X-Original-To: keyrings@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447FA18D
	for <keyrings@vger.kernel.org>; Wed, 22 Nov 2023 16:53:48 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 399315C007D;
	Wed, 22 Nov 2023 19:53:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 22 Nov 2023 19:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1700700824; x=1700787224; bh=HOq93W3M+1IvNOCOMEdNVb7Ln
	RfO6RnR7DLtnUG4LnA=; b=e0hsgplAcWHGU8kAcCD9imwJ/Lp+ziDGeG1i+ECIl
	VEHaScAM8J8bIYD2CnKJr/6n6/cDK1rmptr1DdRs+WWJMw6K4KB2fIQZ/PG4nj79
	ZLw/dmi+KMDHJJXkmP8ZTVzZCjqNYEZqlyaCmdLuwU0fe9hIGCC6RX4yBlL0AVli
	A3mQJ2kXXIsoKg8v1yVdb7BdrtUIae0VsdO+pfulal6D7gZ5QYbT3MSYlQ+UNz2f
	lPXdOl1q+wSxeu2Vm0bRIxfZlrXKj1GR4RjOCEcO5vhSujU1gTQ+4+9LryiaHhED
	1/1UdgFJw4f93YjOCFNNYMBF+0ortwKoRNHp1SNmj3RhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700700824; x=1700787224; bh=HOq93W3M+1IvNOCOMEdNVb7LnRfO6RnR7DL
	tnUG4LnA=; b=e25QCN4iz/pd8jZh4T+tstK4L8b5cObG5t0DRtZEFqjlT4GNcE1
	PIyBepX7Y92tKLvcSJxqvseMWeWCcXs0wB71UNKT/A1z7wwdl4PCmjkPfLbs2XfY
	Tvhk2RGtj1klWv91OcW7lX6CytaUc068QiW+FV1WjICrzZz7H5lwHENsCEaYUsdB
	PmqOc66CsbboTFOFsS/QgE8umklsEbkayRVzoZFozdGby+K2rNlo7CrIoj+eYofi
	Lx2bmoHm/MLH2R5v1d7IzZzepXGQknjH/Jk0TOhlTc3euhqSXaUHkvKVQ2ASLzfo
	8rlLFbMXzxacF4FnpgNcz8IDqDzWrjOwL1g==
X-ME-Sender: <xms:mKJeZWJDO3gowj0k0Fa7qWX-oCYBsyWXS7iRyng5cCI2Qdb7tn8wHQ>
    <xme:mKJeZeLYE9KWwew4pCaw75Qo3glmIMCzMdzJZ_SBlVCB768ZUZjUgTNrDb2e9P8w3
    khJizt9kj6HZ4PgSMU>
X-ME-Received: <xmr:mKJeZWu8BisSRMcOMamwspEgXusMrFAJmgPnOfhhQ_oalw0ASj13Qas_uD6NTLSv5QPiL6DQ-3pdDgIg-liKaC5JCBJXcTFhbIvy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomhepuegv
    nhcuuehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeiheehvdeufeeuteeihedtheeliefhueekhfduveelhfdtheegheefvdfg
    tddvjeenucffohhmrghinhepghhithhlrggsrdgtohhmpdhkvghrnhgvlhdrohhrghdpkh
    hithifrghrvgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:mKJeZbbHrSAeZyHCPPu9E1TjL73iPD0mYO4L5g83UDeQtkHCNGMgkw>
    <xmx:mKJeZdZQdzdWcH1r1xHdHsF7f3OLeuPrRVTyicTk-io1AUVmZ5SQhQ>
    <xmx:mKJeZXBLnGpkQ6QbfyfOZ5nZQhCbekeSaEHLN1MNkjrbY3wXUkAweg>
    <xmx:mKJeZczTFSjOA-STYwDaVDkvE4lnraT3l0nl0b_ZRVFFV30MoTW8ZQ>
Feedback-ID: iffc1478b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Nov 2023 19:53:43 -0500 (EST)
Date: Wed, 22 Nov 2023 19:53:42 -0500
From: Ben Boeckel <me@benboeckel.net>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: GitLab repo for keyrings
Message-ID: <ZV6ilnhiE5tQs3RK@farprobe>
References: <ZV5bs6azAPM2UIMq@farprobe>
 <268530.1700676155@warthog.procyon.org.uk>
 <271142.1700684889@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <271142.1700684889@warthog.procyon.org.uk>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Wed, Nov 22, 2023 at 20:28:09 +0000, David Howells wrote:
> Ben Boeckel <me@benboeckel.net> wrote:
> 
> > > I'm intending to move keyrings to GitLab for its upstream repo:
> > > 
> > > 	https://gitlab.com/linux-afs/keyutils
> > 
> > Thanks for the notice. Is the patch submission workflow going to add
> > merge requests via the GitLab instance? If so, will the list be notified
> > of activity on them?
> 
> Hmmm...  I wonder if I can make gitlab do that automatically.

I don't see anything on my (unpaid) account at least under project
integrations. Closest that seems useful is a webhook delivery
service…needs something to reflect that to email though. Maybe something
kernel.org would be willing to host (once developed)? For listening to
and categorizing webhooks, we use this project:

    https://gitlab.kitware.com/utils/webhook-listen

which turns them into JSON files on disk that can then be used as a work
queue at least. (We split it up because it lets us lifecycle the daemon
handling events independently from the webhook receiver; I recommend
that for email reflection as well.)

Another alternative is setting up a gitlab.com account that receives
notifications and forwards/subscribes using the ML address.

--Ben

