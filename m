Return-Path: <keyrings+bounces-1883-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DD95523D
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 23:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07CA01C2146F
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 21:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96C313B293;
	Fri, 16 Aug 2024 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VS814E0x"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF26026AFC
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723842621; cv=none; b=JQaSAsEALC8CPKXAe8W6f2za+UQE64+/D9Ute+jX/xoTk0MYhvP+L3XOZGbbcCKSp97HGDy3wQYmKvT82cWcNY/UkwtRdPezOQ/9rsJTg+Ix1U+DVkUsGfGEocPY+0H60wpPvFr2lpHKSDMEOVmVvy72Bdhm709gxt2DeUUKvWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723842621; c=relaxed/simple;
	bh=F/3cjECbAeiyBsSNDLlrgEJ8JdBdJEAfLudJblvV+wM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=BWs/l/C7weY+DZktBE8kLFNHx0YMmuBlLZKoGAGR9RwYtiK3wgV/sYAZr6dthbiH88fZpxvkMfydN8bx1z6ynHzbb76KK2r7NJh+ZiV2i7RMh2apvZvxndCEIyHhkzyiHmowC+CVtLAD0tTTROyBua42SuxzQ3h3P68uvRMjtmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VS814E0x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723842618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/3cjECbAeiyBsSNDLlrgEJ8JdBdJEAfLudJblvV+wM=;
	b=VS814E0xm/QNi85ojhC1s6l8+rcnv8c7gGgOeeEmbARxf3D7upsj73adJL8QGyHC2ZgZvh
	NvBRO/ZRQU6GwCcHIKptSFLdgcRk7vXh5hRuhPIGlme6F5vCMf403WuZZYbhiFR9JlDSDA
	HUbmVPk3cTJE0UVHZtUYuHZRiOxSw10=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-itlj7RUrNjC_r1nGuBnQUQ-1; Fri,
 16 Aug 2024 17:10:15 -0400
X-MC-Unique: itlj7RUrNjC_r1nGuBnQUQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 386C11955D4E;
	Fri, 16 Aug 2024 21:10:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B7B2219560A3;
	Fri, 16 Aug 2024 21:10:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ddc266b6f275438425b206a35760f827b7892c24.camel@huaweicloud.com>
References: <ddc266b6f275438425b206a35760f827b7892c24.camel@huaweicloud.com> <2493611.1723748374@warthog.procyon.org.uk>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
    keyrings@vger.kernel.org
Subject: Re: PGP signature patches
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3081108.1723842611.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2024 22:10:11 +0100
Message-ID: <3081109.1723842611@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

I've pulled your patches up to v6.11-rc3:

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/=
?h=3Dpgplib

David


