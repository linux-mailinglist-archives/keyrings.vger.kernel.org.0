Return-Path: <keyrings+bounces-2491-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA350A6984D
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 19:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C82F19C2558
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 18:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A48207A35;
	Wed, 19 Mar 2025 18:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrjV27DX"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1436B14AD29
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742410068; cv=none; b=mvaIN0luSbUnDoIhP5tz7uEl0p4fziUkg2aPMOMAHC/TJbor8o7d6k8X+GPeZS1YwUrhN1xN/+idClWMvclaUyVnu4Ce7L2vTRw7AcWaewGZ8bec+sHpeALXE2FHtZaST0KpEidx4qnf/of5yEF4+R5lwCE0uo5UF6XK8B/zwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742410068; c=relaxed/simple;
	bh=kwgmMX+huATDceu/THZ1fprQ+eIPlF2PskD6dnyPypk=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=NRxpVC02o6a5MMy3LjvvedUdR4xxPFns6u14mioRTjmb4ATigI5eQcc5yk6tV5fYFztNZID5sM8l8nwRZjlJ33b8/niN5NjukScTKkq4SeCkjQZ9O/c/HBSTlGPLJl4ti6I+4PsTme4WhMKjfNZxovYFzQL1EJrZfmQ23FiTEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrjV27DX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742410066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tf3n/iYiR/NPTBH5XOmmISHt5xliwaRGurO52DuYDo8=;
	b=WrjV27DXavqMs/ImlSXe7dJ9UAaP01qWJJhxdDrrvXSRJY9xrBYayou5ZR64LQPpMzV54F
	OelSK+/HvA86DrEuz6cc0TciK24G+TMZQ50W8ku2kwiPSa6sG2eUk8tfGK2m9sx5sWqtDh
	MwcGgn6BvosrHJartZKQjc/Pcf8Ov0Y=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-63KoS6t8NDSvzbZgicvKdA-1; Wed,
 19 Mar 2025 14:47:42 -0400
X-MC-Unique: 63KoS6t8NDSvzbZgicvKdA-1
X-Mimecast-MFC-AGG-ID: 63KoS6t8NDSvzbZgicvKdA_1742410060
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D4B31955E9E;
	Wed, 19 Mar 2025 18:47:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.61])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C09C1828AA2;
	Wed, 19 Mar 2025 18:47:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wgqidLD38wYUw-5Y6ztFdAvkX3P+Gv2=K+rpkFBG-bf7g@mail.gmail.com>
References: <CAHk-=wgqidLD38wYUw-5Y6ztFdAvkX3P+Gv2=K+rpkFBG-bf7g@mail.gmail.com> <2874581.1742399866@warthog.procyon.org.uk> <20250319163038.GD26879@redhat.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: dhowells@redhat.com, Oleg Nesterov <oleg@redhat.com>,
    Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>,
    Greg KH <gregkh@linuxfoundation.org>,
    Josh Drake <josh@delphoslabs.com>,
    Suraj Sonawane <surajsonawane0215@gmail.com>,
    keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
    security@kernel.org, stable@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] keys: Fix UAF in key_put()
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2883312.1742410054.1@warthog.procyon.org.uk>
Date: Wed, 19 Mar 2025 18:47:34 +0000
Message-ID: <2883313.1742410054@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Linus Torvalds <torvalds@linuxfoundation.org> wrote:

> We really should have "test_bit_acquire()" and "set_bit_release()".

I considered using test_bit_acquire() but, as you say, there's no
set_bit_release() as yet.  I could switch things to initialise the flag to set
on key creation and clear the flag instead.

David


