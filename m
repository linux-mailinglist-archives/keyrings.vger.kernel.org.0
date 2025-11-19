Return-Path: <keyrings+bounces-3386-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297DC6FF49
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 17:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB13434EF59
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A177F2E8B81;
	Wed, 19 Nov 2025 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cfE2qX1Y"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88512F1FD2
	for <keyrings@vger.kernel.org>; Wed, 19 Nov 2025 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567643; cv=none; b=R/D8k06rEFD+RfNuIxMu7nKdQ8RhGvo+6hlzDnMtoDCVD+W04DvvA3FLUhC9APZeRm14UGAkPdvnrrNa3jX2jT+2r0mSRUOaD0WL4t4QwVdo0cHz6DZCe8I6xR4xme1jyMFnaVWJejazHsSP4vrSj60twtc9Zvb0WvEm5prQuFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567643; c=relaxed/simple;
	bh=/oIMzgf7hHSQdiEJEokZ3+qs4qppjSqEoaIMCJM2YTo=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ASUy/3Hf29nTrFO6Q4xJTBQkayyRY1hPznoajhTcOlJzMkUpoSzsYnIGelvzYmyk9qvP2Mz87dB0HBUxNLZhYcNU1asvNiUrL69TsINmRkWvVkcd2w89N2H5Wy352k26b2ZWV6LqXbsqjS9pdHJ8DePGZxEAn0R+Z5ucM+wcaII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cfE2qX1Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763567640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/oIMzgf7hHSQdiEJEokZ3+qs4qppjSqEoaIMCJM2YTo=;
	b=cfE2qX1Y2pe6EdC47tVGlQ0hbfkPX3NjRcvOyeO0+onY/azq1paBOvvKXh/OR8JyYJlWSY
	iVvH008dOJAh77v2WlsG0+mzeFeLAnmnlcewsMnsqIZeL5PpUZXNWTPTHyaKtuI9Ewrx2L
	CIfK6G8XMxd3KqBHIp3WBF9OWitahhk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-rVm3D4mQMuG6RYwES05_PA-1; Wed,
 19 Nov 2025 10:53:57 -0500
X-MC-Unique: rVm3D4mQMuG6RYwES05_PA-1
X-Mimecast-MFC-AGG-ID: rVm3D4mQMuG6RYwES05_PA_1763567636
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EA941956051;
	Wed, 19 Nov 2025 15:53:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72B5F1800451;
	Wed, 19 Nov 2025 15:53:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aKpV5fk5X-plntzk@kernel.org>
References: <aKpV5fk5X-plntzk@kernel.org> <20250822142215.2475014-1-dhowells@redhat.com> <20250822142215.2475014-3-dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] request-key: Fix mishandling of last line of config file
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2454651.1763567634.1@warthog.procyon.org.uk>
Date: Wed, 19 Nov 2025 15:53:54 +0000
Message-ID: <2454652.1763567634@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Just a hypothetical question. What if for spurious reasons the config
> file would have carriage returns?

isspace() considers them as whitespace, so they should be treated as trailing
spaces and ignored normally.

David


