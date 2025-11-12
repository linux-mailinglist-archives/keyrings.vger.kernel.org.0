Return-Path: <keyrings+bounces-3336-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33715C539DD
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 18:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F45563393
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 15:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66288346E51;
	Wed, 12 Nov 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RVh3oXuI"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B627A346E46
	for <keyrings@vger.kernel.org>; Wed, 12 Nov 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962773; cv=none; b=CdBkQgj0AUVmyF9nbCzv8u5xgJsudqnFWpqZxTooeUTTuB5Vt5uyaB+fJ4jCKhEbLTDm2WGjGZvM7mcCSQ3tIa4AbM1xgOMZJHRr0YOlGOozkZoxsUBxKPcrIAZ7B6huLOl9kPH7EV8eg8h5E8rRSk0ZRPSmi2PwR0E9GxPlyfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962773; c=relaxed/simple;
	bh=Tv4l3zPrGDFpoBXeNmLQlLdu4ZVj0stNIbHASZqyDpw=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Yp1cCK+pxlYwqgnxrxQC+gyy5ZBgzzKBKh5rZlDwj5oNNqzGltXbSLyNlKGmy6XeLn5tnp5uUA1vdSMpCqhArcPqtHbGZAXCBMGzEfbKmt5CRXPtGD0359MRb6XTPLshDb/11iKa5Fs/4x0+Fmb9DV+OGMQYpIueWQji3f6Dkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RVh3oXuI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762962770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pPuQ6wzpLvd7wqO+UJt3PBGw+LMCUM/C0EDaFguNkmI=;
	b=RVh3oXuI4J0DJscfGDwd0SpQFIOnspHytTRB7S2no5AIEMfVyJ7ELvicHnCMb6EW/qg1O/
	/M6H+olRBZfaIhE5njQssP/EyJnB/jspabfoRFGq4SEIDwkwWfLlRxfo3dWLCNmbATnOGp
	gS8gkmPFBqcMcXhp75hc7V08QIldbm8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-6-fpViEFOi2Nvz50tCuKCQ-1; Wed,
 12 Nov 2025 10:52:47 -0500
X-MC-Unique: 6-fpViEFOi2Nvz50tCuKCQ-1
X-Mimecast-MFC-AGG-ID: 6-fpViEFOi2Nvz50tCuKCQ_1762962765
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83B541956067;
	Wed, 12 Nov 2025 15:52:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.87])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF7BE19560A2;
	Wed, 12 Nov 2025 15:52:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0b18e4cd726c6d986e969a78bff0aaaf6affd3a0.camel@HansenPartnership.com>
References: <0b18e4cd726c6d986e969a78bff0aaaf6affd3a0.camel@HansenPartnership.com> <e624c242-b297-4bb7-a76a-cbb18b027472@suse.com> <20251111154923.978181-1-petr.pavlu@suse.com> <20251111154923.978181-3-petr.pavlu@suse.com> <922480ff44bda3b6ecfda1ae780c659644560f94.camel@HansenPartnership.com> <1234920.1762961817@warthog.procyon.org.uk>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: dhowells@redhat.com, Petr Pavlu <petr.pavlu@suse.com>,
    David Woodhouse <dwmw2@infradead.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sign-file: Remove support for signing with PKCS#7
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1235766.1762962760.1@warthog.procyon.org.uk>
Date: Wed, 12 Nov 2025 15:52:40 +0000
Message-ID: <1235767.1762962760@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> > We're looking at moving to ML-DSA, and the CMS support there is
> > slightly dodgy at the moment, so we need to hold off a bit on this
> > change.
> 
> How will removing PKCS7_sign, which can only do sha1 signatures affect
> that? Is the dodginess that the PKCS7_... API is better than CMS_...
> for PQS at the moment?  In which case we could pretty much do a rip and
> replace of the CMS_ API if necessary, but that would be a completely
> separate patch.

OpenSSL-3.5.1's ML-DSA support isn't completely right - in particular
CMS_NOATTR is not currently supported.  I believe there is a fix in the works
there, but I doubt it has made it to all the distributions yet.  I'm only
asking that we hold off a cycle; that will probably suffice.

David


