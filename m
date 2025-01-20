Return-Path: <keyrings+bounces-2361-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C2DA169AD
	for <lists+keyrings@lfdr.de>; Mon, 20 Jan 2025 10:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2F5162E6F
	for <lists+keyrings@lfdr.de>; Mon, 20 Jan 2025 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F801ACEC2;
	Mon, 20 Jan 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0YkmZYQ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92B193425
	for <keyrings@vger.kernel.org>; Mon, 20 Jan 2025 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365684; cv=none; b=XAK1o5HWonb31SqTGxqUHUYwQpZDPcLek+UOOxYW54UmwWb/hzRHRY3rUboCdlvlHx9pMltohpsRxrbkqHff+sNsaUshY+fW059It7pw2zfGWNANuJ1Vk0WoirUnstu7C0DMkcxRAmhilbvChh0qbMAf2L9wXclEBx9UT9leE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365684; c=relaxed/simple;
	bh=u2HQiCL+u3gJ8mAykqLQuJvkHpp/IqMu+QM/A8KSWck=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=awXSYo4EH0gj6eqtaPeGddNxkbXCt4/IWWRK/jy69r27WJWBDJNvMJswqGtFempjDFNRb4LhYwsfHysbiaeR0XURH72EP6xDfzO5CPsjbjrJ0+LBZ+c98XUTLUw9Qq7IrDdKO86BvdQ9XGJpmwv1NwZWoEvAskuxfKs2sfwzLzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0YkmZYQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737365681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2AwYiuDf1j5uDju1TxVaOib/j90iLN/1cU+I3EHvD7c=;
	b=O0YkmZYQSt/TKuUdXO6rUTSyJofK3Mp0sKNbHyPPFfy4fPpFv2A/9E1Uh8hEPGna9dk0wX
	Dmn3B8Tk1LMaWzFVsY0m6cW+C8JnemcJPOTlo3GsvYebEw+fXhQKAoBA6dtQGyoIpMogA4
	0fY9HGDkSMSSpMHVNGs5cPHH2nQ5qP0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-LnePKWCkOQW1lKPkfGYpLg-1; Mon,
 20 Jan 2025 04:34:35 -0500
X-MC-Unique: LnePKWCkOQW1lKPkfGYpLg-1
X-Mimecast-MFC-AGG-ID: LnePKWCkOQW1lKPkfGYpLg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 570F41955DCD;
	Mon, 20 Jan 2025 09:34:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 76D9919560A3;
	Mon, 20 Jan 2025 09:34:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250112163059.467573-1-linux@treblig.org>
References: <20250112163059.467573-1-linux@treblig.org>
To: linux@treblig.org
Cc: dhowells@redhat.com, herbert@gondor.apana.org.au,
    davem@davemloft.net, keyrings@vger.kernel.org,
    linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: asymmetric_keys - Remove unused key_being_used_for[]
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <988300.1737365671.1@warthog.procyon.org.uk>
Date: Mon, 20 Jan 2025 09:34:31 +0000
Message-ID: <988301.1737365671@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

linux@treblig.org wrote:

> key_being_used_for[] is an unused array of textual names for
> the elements of the enum key_being_used_for.  It was added in 2015 by
> commit 99db44350672 ("PKCS#7: Appropriately restrict authenticated
> attributes and content type")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: David Howells <dhowells@redhat.com>


