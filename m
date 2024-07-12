Return-Path: <keyrings+bounces-1736-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0B92F5F8
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2024 09:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4DE2817DC
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2024 07:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF42C38DCC;
	Fri, 12 Jul 2024 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fnnv04VU"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB21EAC7
	for <keyrings@vger.kernel.org>; Fri, 12 Jul 2024 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720768308; cv=none; b=Xx6UrvxD2drmSs5Isc5/j/Gx4k+lglg6bIqP6SqnBhK6AjjQp7Tr2fz37qNT7HdHmZOe0ftTyBbotibKsZq73sF4zjwBipYtAhEE4ANiOXRREdgNg+gZjmgts9XXzu+9VlcCksBz2fwSOw3hTaSnfDLUTkO9YdG2rznbCzr9Ao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720768308; c=relaxed/simple;
	bh=d3bGbQxdmtGnFYCN456kMPjz+j3MldMdmEnprdzEfVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=Jbd3ws5vWXrhGzqRJtNgfNJCMP12dwxEi2+0hoggkV7p33B5lda5SlA7atBovm20rNYlqOvQ/dZ1ey1TAgwJP4rBWSpvV8paanrorMvAiXM8zaftkS273rwW51FX4CFaqPpEZ8nwLXua5BI4kNp+YnMUlAWTbxjnjN9ETAsqAvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fnnv04VU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720768306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CuAjWFlcc5b0uJ1rZAYPcAUm08klty2b2sLm1pv2iG4=;
	b=Fnnv04VU9/w7sr7n9khBIfF5Rv220N9DUXAU7vU9n+1e0TDXQX7bZbxCBoshagAeYKAm+l
	nhlp/MYIRr2sdH+u2cJv+v6Wp2DHa1bOBDRqBB7Jwjvp1JmxuI66Yoq3bFEI6Mp5JOTRsp
	8CchIilOsQOLhfgriyR1Q+MlEnTAzVE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-9CAb64JxMky0py6PYuu_bg-1; Fri,
 12 Jul 2024 03:11:44 -0400
X-MC-Unique: 9CAb64JxMky0py6PYuu_bg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 780791956080;
	Fri, 12 Jul 2024 07:11:43 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.45.224.7])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 028A01955E85;
	Fri, 12 Jul 2024 07:11:40 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: dhowells@redhat.com,
	dwmw2@infradead.org,
	zxu@redhat.com,
	keyrings@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jstancek@redhat.com
Subject: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
Date: Fri, 12 Jul 2024 09:11:13 +0200
Message-Id: <cover.1720728319.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The ENGINE interface has its limitations and it has been superseded
by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
Some distros have started removing it from header files.

Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >= 3.

Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs11-0.4.12-4
and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and comparing that
the result is identical.

Jan Stancek (3):
  sign-file,extract-cert: move common SSL helper functions to a header
  sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
  sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3

 MAINTAINERS          |   1 +
 certs/Makefile       |   2 +-
 certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
 scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
 scripts/ssl-common.h |  32 ++++++++++
 5 files changed, 178 insertions(+), 129 deletions(-)
 create mode 100644 scripts/ssl-common.h

-- 
2.39.3


