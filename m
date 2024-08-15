Return-Path: <keyrings+bounces-1874-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4CD953A77
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 20:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5DA1F2497D
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 18:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EAA55898;
	Thu, 15 Aug 2024 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cgabVVzy"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AC47F6B
	for <keyrings@vger.kernel.org>; Thu, 15 Aug 2024 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723748387; cv=none; b=XwISb5YQxZ7r+vStxwngbjRLQ+3RCliKeJ91iJ41vdkZ/OIUt/F8DJkWXqRmR6rmimGGyZtMVhWyMU7S//bIUwoPGa1WBZr3gaeNHq8yLgKAxVPfvPBZt7Wv6MC6ts4u9C0CPD4R9Gyyj7ImjW+Ms9RqdIANDU1yXo3kHr40Htk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723748387; c=relaxed/simple;
	bh=lyA+JnNfskHBY97vbRYmP1QV5jfNC9rHWZ9Yl9XKFNI=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=cu66N80n2OAtqbTCnfq9X6vwCvwc3WgpR3d1KogGQC6xqMLJisrheDzXzCSazwjn4VbkFXyT1p88SzwyDOH3UW3r8S+pvwd4K4owSLOUrtEdwPl/oWQDdHTsorO6eyL9/dM39sJleOPoWWDCuaBTnWGAHJyNgoc0Uj9C75/M0wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cgabVVzy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723748384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=r5bsxDqYSg3RIqL1wvBO79oNunvdVoieaeihPpAUFUQ=;
	b=cgabVVzy6xaacSROng5lpkr6pVN/ojHgYh07XXLYNov3MvuydOpGIgfe9bZhGSRy0jNXOw
	je1Wg60sKh6mZi0k0HzavD8f2Otr1XDDT9LLiGqABMaL6OlZt32pZ3hqEZeNhX4QftOG36
	FjCUDApE/IIGCFsBqs+HzDUN8lqAdso=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-AAnF_HJPNDmNLzs45Xkflw-1; Thu,
 15 Aug 2024 14:59:38 -0400
X-MC-Unique: AAnF_HJPNDmNLzs45Xkflw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 522F01955F43;
	Thu, 15 Aug 2024 18:59:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 262C91955D4A;
	Thu, 15 Aug 2024 18:59:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
cc: dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
    keyrings@vger.kernel.org
Subject: PGP signature patches
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2493610.1723748374.1@warthog.procyon.org.uk>
Date: Thu, 15 Aug 2024 19:59:34 +0100
Message-ID: <2493611.1723748374@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Roberto,

I've found another use for the PGP patches: modern Lenovo laptops have an EFI
variable containing a list of allowed keys - but they're in PGP form, not
X.509.  So we're going to need a PGP parser to cope with that.

I would like to look at getting the patches into linux-next at least, aiming
at the next merge window.  Do you still have a reasonably up-to-dateish branch
with them on?

David


