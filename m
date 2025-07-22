Return-Path: <keyrings+bounces-2932-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B26BB0E446
	for <lists+keyrings@lfdr.de>; Tue, 22 Jul 2025 21:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2A51898B72
	for <lists+keyrings@lfdr.de>; Tue, 22 Jul 2025 19:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B408680C02;
	Tue, 22 Jul 2025 19:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WURZNqgz"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015027C879
	for <keyrings@vger.kernel.org>; Tue, 22 Jul 2025 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753212761; cv=none; b=LMdwhYGbEe06xkkI73ycalLhM8EiiHPjQNwQanLeXwLQfcPgyNChtGyjsjkQTXpkFVH++qLKmwIM1vkoqHHnDO3N1ev714ql6v/DKIrhvZVCUUu3A3HbOc5GbBaY59z+z+WK6P6xIS27ONpeqBTY0bLq8LEEWNDkxx6UxsXdsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753212761; c=relaxed/simple;
	bh=3KyfJlUkLCRwp+f2YqsX8H+p99rIZ92dwERoQcjA3dw=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=LZOXmQZF9/gp0Q8hHLasaFNN2STEti5/IUlK12LPG36Ly5zn+ddHvBc/8Uat3HvaGgUm+762ixxngTM53zm2nlHo9jpl6gW7nvGnFj5d30rMgvMu2daJ91Ji+ImOSCZ/scyfKLaPDpXIj/GjePE/EjlH2Pq0x7QRBZJJmZn+9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WURZNqgz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753212758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXAQrQlK5kLwu3DV4bl7R9Dm3tLz30sH5JZ7+WxgTGk=;
	b=WURZNqgzsj0KHEUzAqz5WrFY/ENjw5JTPUUx3aNtSq33XjoRAp3IURYEaAKpuljuHhzBoF
	qcZWlLYdGYhsxxxN8q964/XK9Amb0AJScdWdhCrWcK+T25k5dL+yZZSDkHVAsKTAxd7Uvn
	VunmcvKE1wrmUA3UFJEMjVHpSP4Amww=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-hVwe5aZwMPika7Dzi9OwrQ-1; Tue,
 22 Jul 2025 15:32:35 -0400
X-MC-Unique: hVwe5aZwMPika7Dzi9OwrQ-1
X-Mimecast-MFC-AGG-ID: hVwe5aZwMPika7Dzi9OwrQ_1753212754
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEA4019560B4;
	Tue, 22 Jul 2025 19:32:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.8])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 23F0619560AD;
	Tue, 22 Jul 2025 19:32:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250718234541.3087-1-dannyhu@arista.com>
References: <20250718234541.3087-1-dannyhu@arista.com>
To: Danny Hu <dannyhu@arista.com>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org, dwmw2@infradead.org
Subject: Re: [PATCH 1/2] sign-file: Fix memory leaks in the sign-file tool
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <188740.1753212750.1@warthog.procyon.org.uk>
Date: Tue, 22 Jul 2025 20:32:30 +0100
Message-ID: <188741.1753212750@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Danny Hu <dannyhu@arista.com> wrote:

> 3. Ensuring that any structs which have been allocated are freed
> with their respective free functions.

Why?  exit() will clean that up.

David


