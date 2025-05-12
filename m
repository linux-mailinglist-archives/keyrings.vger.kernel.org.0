Return-Path: <keyrings+bounces-2710-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45103AB32F2
	for <lists+keyrings@lfdr.de>; Mon, 12 May 2025 11:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B7B17B84F
	for <lists+keyrings@lfdr.de>; Mon, 12 May 2025 09:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A1025B67A;
	Mon, 12 May 2025 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CouFx27X"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99025B661
	for <keyrings@vger.kernel.org>; Mon, 12 May 2025 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041574; cv=none; b=laUMxGuXmCB92MRCxn/jmI6SnZZC+vjKCft7DSFJEelFmDj11L851tP/4WfrJoHU5MdDPDqeYXfrmVKEGmMXUlzLKvXeUwAVecb5KDJxg0e2egnARGSQnG40T/r9ZRGbTBBOnYtzzx/IGwNQ7ioriCB6Kw5y1WZwOQkd0tenyBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041574; c=relaxed/simple;
	bh=YxLD1j4n3jsjoJWjaT3zn792WhB6FdopTXqDGpDpVcI=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=pzvd/jiu+UMJH+MloeDsZWmAk+zWNbMSEqk4tVq/MSA1CuONQUFB2hz0GgMRjPdMz7r63EJJ60UOLCZd8EMWACUL1omXIrtagt5x+kEK1YCjMI21a9t0pSHKDJTJyHfYe7L2CFZtvoI4BEIJw85bp9RUr+EjXc3IT8BTg7nA3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CouFx27X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747041571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R7ANbHDvc+a0P3LueAyyoaMPrtCdaSJ4PfO4ZIxUKOQ=;
	b=CouFx27XwZ6KCGwth7Nr8XYh6SQ6OR+M0Cpu6zHEvz+tW6dmv1nvxCPCFsq6+2pp83XQi+
	6P0CMCRJ25zslqv5UbHS/+ffTT1LoRapLmYKd4RZOx1c3EY+Cz1OwTQh4w+aMWwhnvPRu+
	hCpOCUkUvBtV0cS7Ymgx+mmi5wJ+TLc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-mu5ziLm7P4OARDt12UYFfg-1; Mon,
 12 May 2025 05:19:26 -0400
X-MC-Unique: mu5ziLm7P4OARDt12UYFfg-1
X-Mimecast-MFC-AGG-ID: mu5ziLm7P4OARDt12UYFfg_1747041564
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF0A118001CC;
	Mon, 12 May 2025 09:19:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.188])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3397F1800570;
	Mon, 12 May 2025 09:19:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aB3OsMWScE2I9DhG@gondor.apana.org.au>
References: <aB3OsMWScE2I9DhG@gondor.apana.org.au> <aBccz2nJs5Asg6cN@gondor.apana.org.au> <202505091721.245cbe78-lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: dhowells@redhat.com, kernel test robot <oliver.sang@intel.com>,
    oe-lkp@lists.linux.dev, lkp@intel.com, keyrings@vger.kernel.org,
    Jarkko Sakkinen <jarkko@kernel.org>, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    "David S.
 Miller" <davem@davemloft.net>,
    Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    James Bottomley <James.Bottomley@hansenpartnership.com>,
    Mimi Zohar <zohar@linux.ibm.com>, linux-crypto@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
    linux-security-module@vger.kernel.org
Subject: Re: [v3 PATCH] KEYS: Invert FINAL_PUT bit
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1960112.1747041554.1@warthog.procyon.org.uk>
Date: Mon, 12 May 2025 10:19:14 +0100
Message-ID: <1960113.1747041554@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Herbert Xu <herbert@gondor.apana.org.au> wrote:

> Invert the FINAL_PUT bit so that test_bit_acquire and clear_bit_unlock
> can be used instead of smp_mb.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: David Howells <dhowells@redhat.com>


